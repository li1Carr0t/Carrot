-- Made by quq0255
-- Translate to Eng by 840Hz

-- Service
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local background = Instance.new("Frame")
background.Size = UDim2.new(2, 0, 2, 0)  -- Background Scale
background.Position = UDim2.new(-0.5, 0, -0.5, 0)  -- Position
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Color Background
background.BorderSizePixel = 0
background.Visible = false  -- Toggle Background
background.Parent = screenGui

-- Create Profile Player
local profileImageLabel = Instance.new("ImageLabel")
profileImageLabel.Size = UDim2.new(0.15, 0, 0.15, 0)  -- Profile Scale
profileImageLabel.Position = UDim2.new(0.425, 0, 0.05, 0)  -- Position
profileImageLabel.BackgroundTransparency = 1
profileImageLabel.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. tostring(Players.LocalPlayer.UserId) .. "&width=420&height=420&format=png"  -- ใช้ URL สำหรับโปรไฟล์
profileImageLabel.Visible = false
profileImageLabel.Parent = screenGui

-- Create UICorner
local profileUICorner = Instance.new("UICorner")
profileUICorner.CornerRadius = UDim.new(0.5, 0)  -- Corner Scale
profileUICorner.Parent = profileImageLabel

-- Create TextLabel Username (Center)
local nameLabel = Instance.new("TextLabel")
nameLabel.Size = UDim2.new(0.5, 0, 0.1, 0)  -- TextLabel Scale
nameLabel.Position = UDim2.new(0.25, 0, 0.2, 0)  -- Position
nameLabel.Text = "Name: " .. Players.LocalPlayer.Name
nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
nameLabel.Font = Enum.Font.GothamBold
nameLabel.TextSize = 36  -- Text Scale
nameLabel.BackgroundTransparency = 1
nameLabel.Visible = false
nameLabel.Parent = screenGui

-- Create TextLabel FPS
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(0.5, 0, 0.1, 0)  -- TextLabel Scale
fpsLabel.Position = UDim2.new(0.25, 0, 0.35, 0)  -- Position
fpsLabel.Text = "FPS: 0"
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.Font = Enum.Font.Gotham
fpsLabel.TextSize = 28  -- Text Scale
fpsLabel.BackgroundTransparency = 1
fpsLabel.Visible = false
fpsLabel.Parent = screenGui

-- Create TextLabel Time
local timeLabel = Instance.new("TextLabel")
timeLabel.Size = UDim2.new(0.5, 0, 0.1, 0)  -- TextLabel Scale
timeLabel.Position = UDim2.new(0.25, 0, 0.5, 0)  -- Position
timeLabel.Text = "Time: 00:00:00"
timeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
timeLabel.Font = Enum.Font.Gotham
timeLabel.TextSize = 28  -- Text Scale
timeLabel.BackgroundTransparency = 1
timeLabel.Visible = false
timeLabel.Parent = screenGui

-- Variable FPS & Time
local lastFpsUpdate = tick()
local frameCount = 0
local fps = 0
local startTime = tick()

-- Function Toggle UI
local function toggleBackground()
    background.Visible = not background.Visible

    -- Toggle Profile, Username, FPS & Time
    profileImageLabel.Visible = background.Visible
    nameLabel.Visible = background.Visible
    fpsLabel.Visible = background.Visible
    timeLabel.Visible = background.Visible
end

-- Create Toggle KaGaHUBToggleUI
local KaGaHUBScreen = Instance.new("ScreenGui")
local KaGaHUBToggleUI = Instance.new("TextButton")
local KaGaHUBCornerUI = Instance.new("UICorner")
local KaGaHUBImageUI = Instance.new("ImageLabel")

KaGaHUBScreen.Name = "KaGaHUBScreen"
KaGaHUBScreen.Parent = game.CoreGui
KaGaHUBScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

KaGaHUBToggleUI.Name = "KaGaHUBToggleUI"
KaGaHUBToggleUI.Parent = KaGaHUBScreen
KaGaHUBToggleUI.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
KaGaHUBToggleUI.BorderSizePixel = 0
KaGaHUBToggleUI.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
KaGaHUBToggleUI.Size = UDim2.new(0, 50, 0, 50)
KaGaHUBToggleUI.Font = Enum.Font.SourceSans
KaGaHUBToggleUI.Text = ""
KaGaHUBToggleUI.TextColor3 = Color3.fromRGB(0, 0, 0)
KaGaHUBToggleUI.TextSize = 14.000
KaGaHUBToggleUI.Draggable = true
KaGaHUBToggleUI.MouseButton1Click:Connect(function()
    toggleBackground()  -- Call Function toggleBackground()
end)

KaGaHUBCornerUI.Name = "KaGaHUBCornerUI"
KaGaHUBCornerUI.Parent = KaGaHUBToggleUI

KaGaHUBImageUI.Name = "MODILEMAGE"
KaGaHUBImageUI.Parent = KaGaHUBToggleUI
KaGaHUBImageUI.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
KaGaHUBImageUI.BackgroundTransparency = 1.000
KaGaHUBImageUI.BorderSizePixel = 0
KaGaHUBImageUI.Position = UDim2.new(0.0, 0, 0.0, 0)
KaGaHUBImageUI.Size = UDim2.new(0, 50, 0, 50)
KaGaHUBImageUI.Image = "rbxassetid://124878620153229" -- can change

-- Calculate FPS & Time
RunService.RenderStepped:Connect(function()
    local now = tick()

    -- Calculate FPS ( Realtime )
    frameCount = frameCount + 1
    if now - lastFpsUpdate >= 1 then
        fps = frameCount
        fpsLabel.Text = "FPS: " .. tostring(fps)
        frameCount = 0
        lastFpsUpdate = now
    end

    -- Calculate Time ( Per second )
    local elapsedTime = now - startTime
    local minutes = math.floor(elapsedTime / 60)
    local seconds = math.floor(elapsedTime % 60)
    timeLabel.Text = string.format("Time: %02d:%02d", minutes, seconds)
end)
