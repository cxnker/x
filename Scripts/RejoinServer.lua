Players = game:GetService("Players")
TS = game:GetService("TeleportService")
if #Players:GetPlayers() <= 1 then
Players.LocalPlayer:kick("Rejoining...")
wait()
TS:Teleport(game.PlaceId, Players.LocalPlayer)
else
TS:TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
end