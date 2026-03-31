# Nightly Builds Log 📄
![Verifed](https://img.shields.io/badge/Verify%20Log-6699ff?logo=verizon&logoColor=white)
![InDev](https://img.shields.io/badge/In-Development-009900?logo=devdotto&logoColor=white)
> [!TIP]
> Do you want to download Nightly builds?    
> **download here [Actions](https://github.com/li1Carr0t/Carrot/actions)**

## Build #18
> [+] Add Webhook Discord 👾    
> `https://github.com/li1Carr0t/Carrot/blob/main/.github/workflows/build.lua`

---

## Build #17
> [+] Change Text2 TextColor to Rainbow 🌈    
> [+] Change Placeholder Color to Black ⚫️    
> [+] Change Textbox TextColor to Black ⚫️    
> [+] Change CornerRadius 22 > 8 🔹    
> [+] Add UIStroke2 🔧    

```lua
-- *.+  Key System  +.* --

-- // Create UIStroke2
local UIStroke2 = Instance.new("UIStroke")

-- // Change CornerRadius 22 > 8
UICorner.CornerRadius = UDim.new(0, 8)

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
    UIStroke2.Color = Rainbow()
    Text2.TextColor3 = Rainbow()
```

---

## Build #16
> [+] Add Rainbow Color 🌈    
> [+] Add UIStroke 🔧    
> [*] Fix some bugs 🐞

```lua
-- *.+  Key System  +.* --

-- // Create UIStroke
local UIStroke = Instance.new("UIStroke")

-- // Settings UIStroke
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 2
UIStroke.Transparency = 0
UIStroke.Parent = KeyMain

-- // Function Rainbow 
function Rainbow()
	return Color3.fromHSV((tick() % 5) / 5, 1, 1)
end

-- // Loop
game:GetService("RunService").RenderStepped:Connect(function()
	UIStroke.Color = Rainbow()
    Text1.TextColor3 = Rainbow()
end)
```
