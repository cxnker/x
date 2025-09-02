local Http = game:GetService("HttpService")
local TS = game:GetService("TeleportService")

local _place = game.PlaceId
local _servers = "https://games.roblox.com/v1/games/".._place.."/servers/Public?sortOrder=Asc&limit=100"
function ListServers(cursor)
   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
   return Http:JSONDecode(Raw)
end

local Server, Next; repeat
   local Servers = ListServers(Next)
   Server = Servers.data[1]
   Next = Servers.nextPageCursor
until Server

TS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)