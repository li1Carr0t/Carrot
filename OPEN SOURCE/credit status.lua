-- Open Source By x2SAXZRLzzz

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CreditDisplay"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "CreditFrame"
MainFrame.AnchorPoint = Vector2.new(0, 1)           
MainFrame.Position = UDim2.new(0, 12, 1, -12)        
MainFrame.Size = UDim2.new(0, 130, 0, 36)            
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.BackgroundTransparency = 0.60              
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(60, 60, 80)
UIStroke.Transparency = 0.75
UIStroke.Thickness = 1
UIStroke.Parent = MainFrame

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 15))
}
UIGradient.Rotation = 90
UIGradient.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 0.5),
    NumberSequenceKeypoint.new(1, 0.7)
}
UIGradient.Parent = MainFrame

local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Name = "Icon"
ImageLabel.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel.Position = UDim2.new(0, 8, 0.5, 0)
ImageLabel.Size = UDim2.new(0, 24, 0, 24)            
ImageLabel.BackgroundTransparency = 1
ImageLabel.Image = "rbxassetid://105562817859596" -- LOGO
ImageLabel.ImageColor3 = Color3.fromRGB(200, 200, 255)
ImageLabel.ImageTransparency = 0.15
ImageLabel.ScaleType = Enum.ScaleType.Fit
ImageLabel.Parent = MainFrame

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(1, 0)
IconCorner.Parent = ImageLabel

local TextLabel = Instance.new("TextLabel")
TextLabel.Name = "CreditText"
TextLabel.AnchorPoint = Vector2.new(0, 0.5)
TextLabel.Position = UDim2.new(0, 40, 0.5, 0)
TextLabel.Size = UDim2.new(1, -45, 0, 18)
TextLabel.BackgroundTransparency = 1
TextLabel.FontFace = Font.new("rbxasset://fonts/families/PressStart2P.json")
TextLabel.Text = "by 840Hz" -- CREDIT
TextLabel.TextColor3 = Color3.fromRGB(160, 160, 200)
TextLabel.TextSize = 10                              
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.TextTransparency = 0.30                    
TextLabel.Parent = MainFrame
