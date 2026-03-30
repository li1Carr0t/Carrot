local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/li1Carr0t/Carrot/refs/heads/main/Library/main%20library.lua"))()
local Windown = library.Create({
    Title = "Lunar Hub | Premium", Logo = 107584891022178,
    CornerRadius = 2, UISize = {
        X = 600,
        Y = 400
    },UIColor = {
        ['Shadow'] = Color3.fromRGB(40, 69, 71),
        ['MainBackground'] = Color3.fromRGB(40, 69, 71),
        ['Background2'] = Color3.fromRGB(47, 83, 83),
        ['ToggleO'] = Color3.fromRGB(57, 90, 91),
        ['TapButtonColor'] = Color3.fromRGB(100, 136, 131),
        ['DropDownSelect'] = Color3.fromRGB(61, 90, 87),
        ['TextColor'] = Color3.fromRGB(133, 150, 150)
    }
})










local Tap1 = Windown.CreateTap({
	Title = "Main",
	Icon = 15169955786
})

local mainnnn = Tap1.CreatePage({
	Side = "Left"
})

	mainnnn.CreateLable({
		Name = " | Main | "
	})

	mainnnn.CreateButton({
		Name = "Fast Eat Chip",
		Dis = "Equip Chip First",
		Callback = function(v)
		while true do
		wait()
		local args = {
    			[1] = game:GetService("Players").LocalPlayer.Character.Chips
		}
		game:GetService("ReplicatedStorage").Events.Eat:FireServer(unpack(args))
		end
	end,
	})
