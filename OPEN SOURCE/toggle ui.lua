-- Made by 840Hz

local ToggleUI = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")
local BackgroundImage = Instance.new("ImageLabel")
local ToggleButtonHUI = Instance.new("UICorner")

ToggleUI.Name = "ToggleUI"
ToggleUI.Parent = game.CoreGui
ToggleUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ToggleUI
ToggleButton.BackgroundColor3 = Color3.fromRGB(23, 212, 224)
ToggleButton.BackgroundTransparency = 1  -- Make background transparent
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ToggleButton.Size = UDim2.new(0, 50, 0, 50) -- Size Ui
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.Text = ""  
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14.000
ToggleButton.Draggable = true


BackgroundImage.Name = "BackgroundImage"
BackgroundImage.Parent = ToggleButton
BackgroundImage.BackgroundTransparency = 1
BackgroundImage.Size = UDim2.new(1, 0, 1, 0)  -- Cover the entire ToggleButton
BackgroundImage.Image = "rbxassetid://133284807364330"  -- Update the image ID
BackgroundImage.ImageColor3 = Color3.fromRGB(255, 255, 255)  -- Set image color if needed

ToggleButtonHUI.Parent = ToggleButton
ToggleButtonHUI.CornerRadius = UDim.new(0, 10)  -- Adjust corner radius if needed

local BackgroundImageHUI = Instance.new("UICorner")
BackgroundImageHUI.CornerRadius = UDim.new(0, 10)  -- Same radius as ToggleButton
BackgroundImageHUI.Parent = BackgroundImage

ToggleButton.MouseButton1Click:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
end)