local Moon = {
['8'] = "http://www.roblox.com/asset/?id=9709149431", -- 🌕
['7'] = "http://www.roblox.com/asset/?id=9709149052", -- 🌖
['6'] = "http://www.roblox.com/asset/?id=9709143733", -- 🌗
['5'] = "http://www.roblox.com/asset/?id=9709150401", -- 🌘
['4'] = "http://www.roblox.com/asset/?id=9709135895",  -- 🌑
['3'] = "http://www.roblox.com/asset/?id=9709139597", -- 🌒
['2'] = "http://www.roblox.com/asset/?id=9709150086", -- 🌓
['1'] = "http://www.roblox.com/asset/?id=9709149680", -- 🌔
};
for i,v in pairs(Moon) do
	if game:GetService("Lighting").Sky.MoonTextureId == v then
		MoonPercent = i / 8 * 100
	end
end

for i,v in pairs(game.Players:GetPlayers()) do
	PlayersMin = i
end

if game:GetService("Lighting").Sky.MoonTextureId == Moon['1'] then
	MoonIcon = '🌔'
elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['2'] then
	MoonIcon = '🌓'
elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['3'] then
	MoonIcon = '🌒'
elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['4'] then
	MoonIcon = '🌑'
elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['5'] then
	MoonIcon = '🌘'
elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['6'] then
	MoonIcon = '🌗'
elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['7'] then
	MoonIcon = '🌖'
elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['8'] then
	MoonIcon = '🌕'
end
if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
	MirageMessage = '```Mirage is spawing : ✔```'
else
	MirageMessage = '```Mirage isn\'t spawn : ❌```'
end

MoonMessage = '```'..tostring(MoonPercent..'%'..' : '..MoonIcon)..'```'
JoinServer = 'game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,'..tostring(game.JobId)..')'
print('\n'..MoonMessage..'\n'..MirageMessage..'\n'..JoinServer)

local url = "https://discord.com/api/webhooks/1191676717761310790/E9q0KaWKGDQ0MDV3sGlxfBHYo9wY0OfXCllAHAxMHM1LwIf4gEZpcGd-vFb_qZCUcERY" -- ur webhook url
local data = {
	["username"] = 'Mirage & Moon Webhook', -- Webhook name here
	['content'] = '@everyone', -- ping everyone if you want to ping role use this <@&1007291553074647132> 
	["avatar_url"] = "", -- ur discord logo url
	["embeds"] = {
		{
			["description"] = "**__Moon and Mirage Webhook__**",
			["color"] = tonumber(0xff0000), -- color id		
			["type"] = "rich",
			["fields"] =  {
				{
					["name"] = "[👥] Players Active",
					["value"] = '```'..tostring(PlayersMin)..'/12```'
				},
				{
					["name"] = "[📃] JobID",
					["value"] = '```'..tostring(game.JobId)..'```'
				},
				{
					["name"] = "[📁] Join Server",
					["value"] = '```'..JoinServer..'```',
				},
				{
					["name"] = "[🕑] Moon Check",
					["value"] = MoonMessage,
					["inline"] = true
				},
				{
					["name"] = "[🌲] Mirage Check",
					["value"] = MirageMessage,
					["inline"] = true
				}
			},
			["footer"] = {
				["text"] = "Webhook By Npg", -- you can remove this but it will hurt
			},
			["timestamp"] = DateTime.now():ToIsoDate(),
		}
	},
}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {["content-type"] = "application/json"}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
