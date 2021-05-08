--Variables
gsWorkspace = game:GetService("Workspace")
LP = game.Players.LocalPlayer

--Spawn
game.ReplicatedStorage.Remotes.SpawnSpider:InvokeServer()

--Fix Camera
gsWorkspace.CurrentCamera:Destroy()
wait(0.1)
game:GetService("Workspace").CurrentCamera.CameraSubject = LP.Character.Humanoid
game:GetService("Workspace").CurrentCamera.CameraType = "Custom"
LP.CameraMinZoomDistance = 0.5
LP.CameraMaxZoomDistance = 400
LP.CameraMode = "Classic"

--Fix HUD
wait(1)
LP.PlayerGui.Menu.Enabled = false
LP.PlayerGui.Stats.Enabled = true