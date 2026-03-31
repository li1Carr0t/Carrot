
_G.Webhook = "https://discord.com/api/webhooks/xxxxx-zzzzzz"

-- // Var & Service
local Player = game.Players.LocalPlayer
local UserId = Player.UserId
local UIS = game:GetService("UserInputService")

-- // JobId
local JobId = game.JobId

-- // NameMap
local NameMap = "`" .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. "`\n"

-- // Rank
local Rank = "👤 • Free"

-- // Time
local OSTime = os.time()
local Time = os.date("!*t", OSTime)

-- // Check Device
local Device = "Unknown"
if UIS.TouchEnabled and not UIS.KeyboardEnabled then
    Device = "📱 Mobile"
elseif UIS.KeyboardEnabled and not UIS.TouchEnabled then
    Device = "💻 PC"
elseif UIS.GamepadEnabled then
    Device = "🎮 Console"
end

-- // Executor Check
local Executor = identifyexecutor() or "Unknown"

-- // Profile & Avatar
local Avatar = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
Avatar = game:GetService("HttpService"):JSONDecode(Avatar).data[1]
local Avatar = Avatar.imageUrl

local ProfileCharacter = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
ProfileCharacter = game:GetService("HttpService"):JSONDecode(ProfileCharacter).data[1]
local CharacterImage = ProfileCharacter.imageUrl

-- // Config Embed
local Embed = {
    title = "🍀 Test Notify 🛠",
    color = 5763719,

    author = {
        name = "made by 840Hz",
        icon_url = "https://cdn.rafled.com/anime-icons/images/kbwmRYVapUoi1s8wu53U6oI37HQntC8w.jpg",
        url = "https://github.com/li1Carr0t/Carrot"
    },

    thumbnail = {
        url = Avatar -- รูปเล็กมุมขวา
    },

    image = {
        url = "https://c4.wallpaperflare.com/wallpaper/118/736/916/gawr-gura-hololive-blue-eyes-white-hair-hd-wallpaper-preview.jpg"
    },

    fields = {
        {
            name = "👤 Name",
            value = "`" .. Player.Name .. "`\n",
            inline = true
        },
        {
			name = "🪪 DisplayName",
            value = "`" .. Player.DisplayName .. "`",
            inline = true
        },
        {
            name = "🆔 UserId",
            value = "`" .. tostring(UserId) .. "`\n",
            inline = true
        },
        {
            name = "💻 Device",
            value = "`" .. Device .. "`\n",
            inline = true
        },
        {
            name = "🎮 Game",
            value = NameMap,
            inline = true
        },
        {
            name = "🌐 JobId",
            value = "`" .. JobId .. "`",
            inline = true
        },
        {
			name = "🎖 Rank",
            value = Rank,
            inline = true
        },
        {
			name = "⚡️ Executor",
            value = "`" .. Executor .. "`",
            inline = true
        },
        {
            name = "🕒 Time (UTC)",
            value = "`" .. os.date("!%Y-%m-%d %H:%M:%S") .. "`\n",
            inline = false
        }
    },

    timestamp = string.format(
        "%d-%02d-%02dT%02d:%02d:%02dZ",
        Time.year, Time.month, Time.day,
        Time.hour, Time.min, Time.sec
    )
}




-- // *===*   Run Webhook   *===* \\ --
(syn and syn.request or http_request)({
    Url = _G.Webhook,
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = game:GetService("HttpService"):JSONEncode({
        username = "User : " .. game.Players.LocalPlayer.Name .. " • 🍀",
        avatar_url = CharacterImage,
        --content = Content,
        embeds = {Embed}
    })
})
