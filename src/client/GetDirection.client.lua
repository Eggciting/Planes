local AirplaneNoseRemote : any = game.ReplicatedStorage:WaitForChild("AirplaneNoseRemote")
local RunService : any = game:GetService("RunService")
local AirplaneNose : any = workspace.AirplaneNose
local ImageLabel : any = script.Parent
local store : any = {}

RunService.RenderStepped:Connect(
	function ()
		-- not smoothe yet
		table.insert(store, AirplaneNose.Position) -- clamp in server
		for i in pairs (store) do
			if (store[i] ~= nil) then
				local clampedStoredValue : number = math.clamp(store[i].Y, 90, 180)
				ImageLabel.Rotation = store[i].Y
			else
				return;
			end
		end
	end
)