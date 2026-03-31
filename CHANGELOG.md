# ChangeLog

## v1.0.1
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
