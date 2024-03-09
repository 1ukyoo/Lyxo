local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local CurrentItems = {}

local function IsInFrame(v)
	local X, Y = Players.LocalPlayer:GetMouse().X, Players.LocalPlayer:GetMouse().Y

	return X > v.AbsolutePosition.X and Y > v.AbsolutePosition.Y and X < v.AbsolutePosition.X + v.AbsoluteSize.X and Y < v.AbsolutePosition.Y + v.AbsoluteSize.Y
end

local function CheckMouseExited(Object)
	if not Object.MouseIsInFrame and Object.MouseWasIn then
		Object.MouseWasIn = false
		Object.LeaveEvent:Fire()
	end
end

local function CheckMouseEntered(Object)
	if Object.MouseIsInFrame and not Object.MouseWasIn then
		Object.MouseWasIn = true
		Object.EnteredEvent:Fire()
	end
end

RunService.Heartbeat:Connect(function()
	for _, Object in pairs(CurrentItems) do
		Object.MouseIsInFrame = IsInFrame(Object.UIObj)
		CheckMouseExited(Object)
	end

	for _, Object in pairs(CurrentItems) do
		CheckMouseEntered(Object)
	end
end)

local module = {}

function module.MouseEnterLeaveEvent(UIObj)
	if CurrentItems[UIObj] then
		return CurrentItems[UIObj].EnteredEvent.Event, CurrentItems[UIObj].LeaveEvent.Event
	end     

	local newObj = {
		UIObj = UIObj,
		EnteredEvent = Instance.new("BindableEvent"),
		LeaveEvent = Instance.new("BindableEvent"),
		MouseWasIn = false,
	}

	CurrentItems[UIObj] = newObj

	UIObj.AncestryChanged:Connect(function()
		if not UIObj.Parent then
			newObj.EnteredEvent:Destroy()    
			newObj.LeaveEvent:Destroy()    
			CurrentItems[UIObj] = nil
		end
	end)

	return newObj.EnteredEvent.Event, newObj.LeaveEvent.Event
end

return module
