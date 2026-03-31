# 🗂 Releases Log
![Verifed](https://img.shields.io/badge/Verify%20Log-6699ff?logo=verizon&logoColor=white)
![Release](https://img.shields.io/badge/Release%20Version-6666ff?logo=files&logoColor=white)

> [!TIP]
> Do you want to download Release?    
> **download here [Releases](https://github.com/li1Carr0t/Carrot/releases)**

## Webhook Discord v1.0.2 (Beta)
**⚡️ Function**
> - Custom Webhook Name
> - Show Username
> - Show DisplayName
> - UserId
> - Device
> - Name Map
> - JodId
> - Rank ( Access )
> - Executor
> - Time
```lua
_G.Webhook = "https://discord.com/api/webhooks/xxxxxxxx-yyyyyyyyyyyy"  -- Url Here
```

---

## Key System 1.0.1
> [+] Add Rainbow Color 🌈    
> [+] Add UIStroke 🔧    
> [+] Add UIStroke2 🔧    
> [+] Change Text2 TextColor to Rainbow 🌈    
> [+] Change Placeholder Color to Black ⚫️    
> [+] Change Textbox TextColor to Black ⚫️    
> [+] Change CornerRadius 22 > 8 🔹      

```lua
-- *.+  Key System  +.* --

-- // Create UIStroke2
local UIStroke = Instance.new("UIStroke")
local UIStroke2 = Instance.new("UIStroke")

-- // Change CornerRadius 22 > 8
UICorner.CornerRadius = UDim.new(0, 8)

-- // Settings UIStroke
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 2
UIStroke.Transparency = 0
UIStroke.Parent = KeyMain

-- // Settings UIStroke2
UIStroke2.Color = Color3.fromRGB(255, 255, 255)
UIStroke2.Thickness = 2
UIStroke2.Transparency = 0
UIStroke2.Parent = KeyEnter

-- // Change Placeholder Color
KeyEnter.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)

-- // Change Textbox TextColor
KeyEnter.TextColor3 = Color3.fromRGB(0, 0, 0)

-- // Rainbow Function
function Rainbow()
	return Color3.fromHSV((tick() % 5) / 5, 1, 1)
end

-- // Loop
game:GetService("RunService").RenderStepped:Connect(function()
	UIStroke.Color = Rainbow()
    UIStroke2.Color = Rainbow()
    Text1.TextColor3 = Rainbow()
    Text2.TextColor3 = Rainbow()
end)
```

---

## Credit Status v1.0.1
**Update by @li1Carr0t**     
> [+] Add Rainbow Color 🌈    
> [+] Add Config 📄     
> [*] Fix Some Bugs 🐞      
```lua
-- *.+  Credit Status  +.* --

-- // Config
local LogoHub = "rbxassetid://105562817859596"
local Credit = "by 840Hz"

-- // Set Variable
ImageLabel.Image = LogoHub
TextLabel.Text = Credit

-- // Change Transparency 0.75 > 0.65
UIStroke.Transparency = 0.65

-- // Function Rainbow
function Rainbow()
	return Color3.fromHSV((tick() % 5) / 5, 1, 1)
end

-- // Loop
game:GetService("RunService").RenderStepped:Connect(function()
	TextLabel.TextColor3 = Rainbow()
    UIStroke.Color = Rainbow()
end)
```
