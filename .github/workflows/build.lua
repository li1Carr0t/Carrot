--[[
   Development Build #19
   Made by 840Hz (li1Carr0t)
]]--

local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "PerformanceOverlay"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 180, 0, 90) -- Frame Scale
frame.Position = UDim2.new(1, -185, 0, -50)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.45
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Corner & Stroke
local corner = Instance.new("UICorner")
local stroke = Instance.new("UIStroke")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

stroke.Color = Color3.fromRGB(0, 0, 0)
stroke.Thickness = 1.5
stroke.Parent = frame

-- Shadow
local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 12, 1, 12)
shadow.Position = UDim2.new(0, -6, 0, -6)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.7
shadow.Parent = frame
shadow.ZIndex = 0
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)

-- TextLabel For Stats
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, -16, 1, -16)
label.Position = UDim2.new(0, 8, 0, 8)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Font = Enum.Font.Code
label.TextSize = 14 -- Text Scale
label.TextXAlignment = Enum.TextXAlignment.Left
label.TextYAlignment = Enum.TextYAlignment.Top
label.Text = "Loading performance..."
label.Parent = frame

-- Padding in Label
local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 3)
padding.PaddingBottom = UDim.new(0, 3)
padding.PaddingLeft = UDim.new(0, 4)
padding.PaddingRight = UDim.new(0, 4)
padding.Parent = label

-- Function Get Ping, Memory
local function getPing()
    return math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
end

local function getMemory()
    return math.floor(Stats:GetTotalMemoryUsageMb())
end

local acc = 0

-- Tween Overlay when run script
local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tweenGoal = {Position = UDim2.new(1, -185, 0, -50)}

frame.Position = UDim2.new(1, 0, 0, -50)
TweenService:Create(frame, tweenInfo, tweenGoal):Play()

-- Update Every 3 Second
RunService.RenderStepped:Connect(function(dt)
    acc += dt
    if acc >= 0.3 then
        acc = 0
        local fps = math.floor(1 / dt)
        local ping = getPing()
        local mem = getMemory()

        label.Text = string.format(
            "[ PERFORMANCE STATS ]\nFPS  : %03d\nPING : %03d ms\nMEM  : %04d MB",
            fps, ping, mem
        )
    end
end)
