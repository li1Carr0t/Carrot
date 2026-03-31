-- Config
local GKey = "Test111" -- Key Here
local TextLabelText1 = "Key System" -- Name Hub
local TextLabelText2 = "Carrot Premium" -- Name Hub
local TextFontAll = "FredokaOne" -- Font

-- If key correct run this script
local executeScript = print("Test")--loadstring(game:HttpGet("your raw script here"))()

-- Tween Service
local TweenService = game:GetService("TweenService")

-- Create Gui
local KeySystem = Instance.new("ScreenGui")
local KeyMain = Instance.new("Frame")
local KeyEnter = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UICorner_2 = Instance.new("UICorner")
local Text1 = Instance.new("TextLabel")
local Text2 = Instance.new("TextLabel")

-- Ui KeySystem
KeySystem.Name = "KeySystem"
KeySystem.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
KeySystem.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Ui KeyMain
KeyMain.Name = "KeyMain"
KeyMain.Parent = KeySystem
KeyMain.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
KeyMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
KeyMain.BorderSizePixel = 0.65
KeyMain.Position = UDim2.new(0.37667945, 0, 0.385529906, 0)
KeyMain.Size = UDim2.new(0, 324, 0, 133)  -- ขนานของ Ui
KeyMain.Active = true
KeyMain.Draggable = true -- Ui can drag

-- Ui KeyEnter
KeyEnter.Name = "KeyEnter"
KeyEnter.Parent = KeyMain
KeyEnter.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
KeyEnter.BorderColor3 = Color3.fromRGB(0, 0, 0)
KeyEnter.BorderSizePixel = 0
KeyEnter.Position = UDim2.new(0.191307724, 0, 0.651018858, 0)
KeyEnter.Size = UDim2.new(0, 200, 0, 38)
KeyEnter.Font = Enum.Font[TextFontAll]
KeyEnter.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
KeyEnter.PlaceholderText = "Enter You Key Here!"  -- Change Textbox
KeyEnter.Text = ""
KeyEnter.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyEnter.TextSize = 14.000
KeyEnter.TextStrokeTransparency = 0.000
KeyEnter.TextWrapped = true

UICorner.CornerRadius = UDim.new(0, 22)
UICorner.Parent = KeyEnter

UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 2
UIStroke.Transparency = 0
UIStroke.Parent = KeyMain

UICorner_2.CornerRadius = UDim.new(0, 22)
UICorner_2.Parent = KeyMain

-- Text1
Text1.Name = "Text1"
Text1.Parent = KeyMain
Text1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text1.BackgroundTransparency = 1.000
Text1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Text1.BorderSizePixel = 0
Text1.Position = UDim2.new(0, 0, 0.05511811, 0)
Text1.Size = UDim2.new(0, 324, 0, 27)
Text1.Font = Enum.Font[TextFontAll]
Text1.Text = ".:*+ " .. TextLabelText1 .. " +*:."
Text1.TextColor3 = Color3.fromRGB(255, 255, 255)
Text1.TextScaled = true
Text1.TextSize = 14.000
Text1.TextStrokeTransparency = 0.000
Text1.TextWrapped = true

-- Text2
Text2.Name = "Text2"
Text2.Parent = KeyMain
Text2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text2.BackgroundTransparency = 1.000
Text2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Text2.BorderSizePixel = 0
Text2.Position = UDim2.new(0, 0, 0.352554679, 0)
Text2.Size = UDim2.new(0, 324, 0, 27)
Text2.Font = Enum.Font[TextFontAll]
Text2.Text = TextLabelText2
Text2.TextColor3 = Color3.fromRGB(255, 255, 255)
Text2.TextScaled = true
Text2.TextSize = 14.000
Text2.TextStrokeTransparency = 0.000
Text2.TextWrapped = true

-- Transparency Ui & Text
KeyMain.BackgroundTransparency = 1
Text1.TextTransparency = 1
Text2.TextTransparency = 1
KeyEnter.BackgroundTransparency = 1

-- Function Tweak when open key system
local fadeInInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local KeyMainGoalsFadeIn = { BackgroundTransparency = 0 }
local KeyMainTweenFadeIn = TweenService:Create(KeyMain, fadeInInfo, KeyMainGoalsFadeIn)

local textGoalsFadeIn = { TextTransparency = 0 }
local Text1TweenFadeIn = TweenService:Create(Text1, fadeInInfo, textGoalsFadeIn)
local Text2TweenFadeIn = TweenService:Create(Text2, fadeInInfo, textGoalsFadeIn)

local KeyEnterGoalsFadeIn = { BackgroundTransparency = 0.75 }
local KeyEnterTweenFadeIn = TweenService:Create(KeyEnter, fadeInInfo, KeyEnterGoalsFadeIn)

-- Call Tweak Function
KeyMainTweenFadeIn:Play()
Text1TweenFadeIn:Play()
Text2TweenFadeIn:Play()
KeyEnterTweenFadeIn:Play()

-- Check Key
local function checkKey()
    local feedbackTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local feedbackTween

    if KeyEnter.Text == GKey then -- If correct key
    	game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = TextLabelText2, 
			Text = "Correct Key!", 
			Icon = ""
		})
        KeySystem:Destroy()
    
    else  -- If wrong key
    	game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = TextLabelText2, 
			Text = "Wrong Key!", 
			Icon = ""
		})
        wait(1)
        game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = TextLabelText2, 
			Text = "Buy Key For 1$/Mouth", 
			Icon = ""
		})
        feedbackTween = TweenService:Create(KeyEnter, feedbackTweenInfo, {BorderColor3 = Color3.new(1, 0, 0)})
        feedbackTween:Play()

        feedbackTween.Completed:Connect(function()
            KeyEnter.BorderColor3 = Color3.new(0, 0, 0)
        end)

        wait(1)
    end
end

KeyEnter.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        checkKey()
    end
end)

function Rainbow()
	return Color3.fromHSV((tick() % 5) / 5, 1, 1)
end

game:GetService("RunService").RenderStepped:Connect(function()
	UIStroke.Color = Rainbow()
    Text1.TextColor3 = Rainbow()
end)
