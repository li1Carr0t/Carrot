-- Made by 840Hz

getgenv().Key = "KEY-1000-0000"

local KeyList = {
    "KEY-1000-0000",
    "KEY-2837-8469",
    "KEY-1037-4749"
}

local HwidList = {
    "jOdhicoJek",
    "testTestTest"
}

local MySelfHwid = game:GetService("RbxAnalyticsService"):GetClientId() 

if table.find(HwidList, MySelfHwid) and table.find(KeyList, getgenv().Key) then -- Have Hwid & Key
    print("Script")
elseif not table.find(HwidList, MySelfHwid) and table.find(KeyList, getgenv().Key) then -- Have Key
    print("Hwid Not Found")
elseif table.find(HwidList, MySelfHwid) and not table.find(KeyList, getgenv().Key) then -- Check Hwid
    print("Key Not Found")
elseif not table.find(HwidList, MySelfHwid) and not table.find(KeyList, getgenv().Key) then -- Not Have Hwid & Key
    print("Whitelist Not Found")
end
