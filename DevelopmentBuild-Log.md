# Nightly Builds Log 📄
> [!TIP]
> Do you want to download Nightly builds?    
> **download here [Actions](https://github.com/li1Carr0t/Carrot/actions)**

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
