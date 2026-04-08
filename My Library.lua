-- GlassUI Loadstring-ready v1.0
-- ไม่ต้อง ModuleScript, ใช้ได้กับทุก executor

local GlassUI = {}
GlassUI.__index = GlassUI

local Players = game:GetService("Players")
local Theme = {
    Background = Color3.fromRGB(240,240,245),
    Primary = Color3.fromRGB(10,132,255),
    Text = Color3.fromRGB(0,0,0),
    ToggleOn = Color3.fromRGB(48,209,88),
    ToggleOff = Color3.fromRGB(142,142,147)
}

local function create(class,parent,props)
    local obj = Instance.new(class)
    if props then for i,v in pairs(props) do obj[i]=v end end
    obj.Parent = parent
    return obj
end

-- สร้าง Hub
function GlassUI:Init(title)
    local hub = {}
    hub.Window = create("ScreenGui", Players.LocalPlayer:WaitForChild("PlayerGui"), {Name=title, ResetOnSpawn=false})
    hub.MainFrame = create("Frame", hub.Window,{
        Size=UDim2.new(0,400,0,300),
        Position=UDim2.new(0.5,-200,0.5,-150),
        BackgroundColor3=Theme.Background,
        BorderSizePixel=0
    })
    hub.Title = create("TextLabel", hub.MainFrame,{
        Text=title, Size=UDim2.new(1,0,0,40),
        BackgroundTransparency=1, TextColor3=Theme.Text,
        Font=Enum.Font.GothamBold, TextSize=22
    })
    hub.TabFrame = create("Frame", hub.MainFrame,{
        Size=UDim2.new(1,0,1,-40),
        Position=UDim2.new(0,0,0,40),
        BackgroundTransparency=1
    })
    hub.Tabs = {}
    setmetatable(hub,{__index=GlassUI.TabHub})
    return hub
end

GlassUI.TabHub = {}

function GlassUI.TabHub:CreateTab(name)
    local tab = {}
    tab.Content = create("ScrollingFrame", self.TabFrame,{
        Size=UDim2.new(1,0,1,0),
        BackgroundTransparency=1,
        CanvasSize=UDim2.new(0,0,0,0)
    })
    tab.Layout = create("UIListLayout", tab.Content,{Padding=UDim.new(0,5)})
    table.insert(self.Tabs, tab)
    return setmetatable(tab,{__index=GlassUI.Tab})
end

GlassUI.Tab = {}

function GlassUI.Tab:Button(text,callback)
    local btn = create("TextButton", self.Content,{
        Text=text, Size=UDim2.new(1,-10,0,30),
        BackgroundColor3=Theme.Primary, TextColor3=Color3.new(1,1,1),
        Font=Enum.Font.Gotham, TextSize=18
    })
    btn.MouseButton1Click:Connect(callback)
    return btn
end

function GlassUI.Tab:Toggle(text,default,callback)
    local frame = create("Frame", self.Content,{Size=UDim2.new(1,0,0,30), BackgroundTransparency=1})
    local label = create("TextLabel", frame,{
        Text=text, Size=UDim2.new(0.8,0,1,0),
        BackgroundTransparency=1, TextColor3=Theme.Text,
        Font=Enum.Font.Gotham, TextSize=16, TextXAlignment=Enum.TextXAlignment.Left
    })
    local toggle = create("TextButton", frame,{
        Size=UDim2.new(0,30,0,30), Position=UDim2.new(0.85,0,0,0),
        BackgroundColor3=default and Theme.ToggleOn or Theme.ToggleOff, Text=""
    })
    toggle.MouseButton1Click:Connect(function()
        toggle.BackgroundColor3 = toggle.BackgroundColor3==Theme.ToggleOn and Theme.ToggleOff or Theme.ToggleOn
        callback(toggle.BackgroundColor3==Theme.ToggleOn)
    end)
    return toggle
end

function GlassUI.Tab:Slider(text,min,max,default,callback)
    local frame = create("Frame", self.Content,{Size=UDim2.new(1,0,0,50), BackgroundTransparency=1})
    local label = create("TextLabel", frame,{
        Text=text.." : "..default, Size=UDim2.new(1,0,0,20),
        BackgroundTransparency=1, TextColor3=Theme.Text,
        Font=Enum.Font.Gotham, TextSize=14
    })
    local bg = create("Frame", frame,{
        Size=UDim2.new(1,0,0,10), Position=UDim2.new(0,0,0,25),
        BackgroundColor3=Theme.ToggleOff, ClipsDescendants=true
    })
    local fill = create("Frame", bg,{Size=UDim2.new((default-min)/(max-min),0,1,0), BackgroundColor3=Theme.Primary})
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
            label.Text=text.." : "..val
            callback(val)
        end
    end)
end

function GlassUI.Tab:Paragraph(text)
    return create("TextLabel", self.Content,{
        Text=text, Size=UDim2.new(1,0,0,40),
        BackgroundTransparency=1, TextColor3=Theme.Text,
        Font=Enum.Font.Gotham, TextSize=14, TextWrapped=true
    })
end

-- คืนค่า Library สำหรับใช้ทันที
return GlassUI
