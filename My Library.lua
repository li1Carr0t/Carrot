-- GlassUI iOS26 Loadstring-ready
local GlassUI = {}
GlassUI.__index = GlassUI

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

-- Theme Glass iOS26
local Theme = {
    Background = Color3.fromRGB(240,240,245),
    Primary = Color3.fromRGB(10,132,255),
    Text = Color3.fromRGB(0,0,0),
    ToggleOn = Color3.fromRGB(48,209,88),
    ToggleOff = Color3.fromRGB(142,142,147),
    GlassAlpha = 0.4 -- ความโปร่งใส
}

local function create(class,parent,props)
    local obj = Instance.new(class)
    if props then
        for i,v in pairs(props) do obj[i]=v end
    end
    obj.Parent = parent
    return obj
end

-- Function สร้าง Glass Frame
local function createGlassFrame(parent,size,pos)
    local frame = create("Frame", parent, {
        Size = size,
        Position = pos,
        BackgroundColor3 = Theme.Background,
        BackgroundTransparency = 1
    })
    create("UICorner", frame) -- โค้งขอบ
    local bg = create("Frame", frame, {
        Size = UDim2.new(1,0,1,0),
        BackgroundColor3 = Theme.Background,
        BackgroundTransparency = 1
    })
    create("UICorner", bg)
    return frame
end

-- สร้าง Hub
function GlassUI:Init(title)
    local hub = {}
    hub.Window = create("ScreenGui", Players.LocalPlayer:WaitForChild("PlayerGui"), {Name=title, ResetOnSpawn=false})
    hub.MainFrame = createGlassFrame(hub.Window, UDim2.new(0,450,0,350), UDim2.new(0.5,-225,0.5,-175))
    
    hub.Title = create("TextLabel", hub.MainFrame,{
        Text = title,
        Size = UDim2.new(1,0,0,50),
        BackgroundTransparency = 1,
        TextColor3 = Theme.Text,
        Font = Enum.Font.GothamBold,
        TextSize = 24
    })
    
    hub.TabFrame = create("Frame", hub.MainFrame,{
        Size = UDim2.new(1,0,1,-50),
        Position = UDim2.new(0,0,0,50),
        BackgroundTransparency = 1
    })
    
    hub.Tabs = {}
    setmetatable(hub,{__index=GlassUI.TabHub})
    return hub
end

GlassUI.TabHub = {}

function GlassUI.TabHub:CreateTab(name)
    local tab = {}
    tab.Content = create("ScrollingFrame", self.TabFrame,{
        Size = UDim2.new(1,0,1,0),
        BackgroundTransparency = 1,
        CanvasSize = UDim2.new(0,0,0,0)
    })
    tab.Layout = create("UIListLayout", tab.Content,{Padding=UDim.new(0,8)})
    table.insert(self.Tabs, tab)
    return setmetatable(tab,{__index=GlassUI.Tab})
end

GlassUI.Tab = {}

-- ปุ่มแบบ {Title="", Callback=function() end} + Glass Style
function GlassUI.Tab:Button(options)
    local btn = create("TextButton", self.Content,{
        Text = options.Title or "Button",
        Size = UDim2.new(1, -20, 0, 40),
        BackgroundColor3 = Theme.Primary,
        BackgroundTransparency = 0.4, -- Glass
        TextColor3 = Color3.new(1,1,1),
        Font = Enum.Font.GothamBold,
        TextSize = 18
    })
    create("UICorner", btn) -- ขอบโค้ง
    btn.MouseButton1Click:Connect(function()
        if options.Callback then options.Callback() end
    end)
    return btn
end

-- Toggle แบบ Glass
function GlassUI.Tab:Toggle(title,default,callback)
    local frame = create("Frame", self.Content,{Size=UDim2.new(1,0,0,30), BackgroundTransparency=1})
    local label = create("TextLabel", frame,{
        Text=title, Size=UDim2.new(0.8,0,1,0),
        BackgroundTransparency=1, TextColor3=Theme.Text,
        Font=Enum.Font.Gotham, TextSize=16, TextXAlignment=Enum.TextXAlignment.Left
    })
    local toggle = create("TextButton", frame,{
        Size=UDim2.new(0,30,0,30), Position=UDim2.new(0.85,0,0,0),
        BackgroundColor3=default and Theme.ToggleOn or Theme.ToggleOff, Text=""
    })
    create("UICorner", toggle)
    toggle.MouseButton1Click:Connect(function()
        toggle.BackgroundColor3 = toggle.BackgroundColor3==Theme.ToggleOn and Theme.ToggleOff or Theme.ToggleOn
        callback(toggle.BackgroundColor3==Theme.ToggleOn)
    end)
    return toggle
end

-- Slider แบบ Glass
function GlassUI.Tab:Slider(title,min,max,default,callback)
    local frame = create("Frame", self.Content,{Size=UDim2.new(1,0,0,50), BackgroundTransparency=1})
    local label = create("TextLabel", frame,{
        Text=title.." : "..default, Size=UDim2.new(1,0,0,20),
        BackgroundTransparency=1, TextColor3=Theme.Text,
        Font=Enum.Font.Gotham, TextSize=14
    })
    local bg = create("Frame", frame,{
        Size=UDim2.new(1,0,0,10), Position=UDim2.new(0,0,0,25),
        BackgroundColor3 = Theme.ToggleOff, ClipsDescendants=true
    })
    create("UICorner", bg)
    local fill = create("Frame", bg,{Size=UDim2.new((default-min)/(max-min),0,1,0), BackgroundColor3=Theme.Primary})
    create("UICorner", fill)
    
    local dragging=false
    bg.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 then dragging=true end
    end)
    bg.InputEnded:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false end
    end)
    bg.InputChanged:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseMovement and dragging then
            local mx=input.Position.X-bg.AbsolutePosition.X
            local p=math.clamp(mx/bg.AbsoluteSize.X,0,1)
            fill.Size=UDim2.new(p,0,1,0)
            local val=math.floor(min+p*(max-min))
            label.Text=title.." : "..val
            callback(val)
        end
    end)
end

-- Paragraph
function GlassUI.Tab:Paragraph(text)
    return create("TextLabel", self.Content,{
        Text=text, Size=UDim2.new(1,0,0,40),
        BackgroundTransparency=1, TextColor3=Theme.Text,
        Font=Enum.Font.Gotham, TextSize=14, TextWrapped=true
    })
end

return GlassUI
