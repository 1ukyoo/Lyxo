local Mouse = require(script.Parent:WaitForChild("Mouse"))
local TweenService = game:GetService("TweenService")

local Transitions = {}

function Transitions.Hover(guiObject, onEnterCallback, onLeaveCallback)
	local MouseEnter, MouseLeave = Mouse.MouseEnterLeaveEvent(guiObject)

	MouseEnter:Connect(function()
		if onEnterCallback then
			onEnterCallback()
		end
	end)

	MouseLeave:Connect(function()
		if onLeaveCallback then
			onLeaveCallback()
		end
	end)
end

function Transitions.NextPage(CurrentPage, NextPage)
	local function createTweenInfo(params)
		params = params or {}
		return TweenInfo.new(
			params.duration or 0.5,
			params.easingStyle or Enum.EasingStyle.Quint,
			params.easingDirection or Enum.EasingDirection.Out
		)
	end

	local rotateOutTween = TweenService:Create(CurrentPage, createTweenInfo(), { Rotation = 90 })
	local scaleOutTween = TweenService:Create(CurrentPage, createTweenInfo(), { Size = UDim2.new(1, 0, 0, 0) })
	local fadeOutTween = TweenService:Create(CurrentPage, createTweenInfo(), { BackgroundTransparency = 1 })

	local rotateInTween = TweenService:Create(NextPage, createTweenInfo(), { Rotation = 0 })
	local scaleInTween = TweenService:Create(NextPage, createTweenInfo(), { Size = UDim2.new(NextPage.Size.X.Scale, 0, 1, 0) })
	local fadeInTween = TweenService:Create(NextPage, createTweenInfo(), { BackgroundTransparency = 1 })

	rotateOutTween:Play()
	scaleOutTween:Play()
	fadeOutTween:Play()

	rotateOutTween.Completed:Wait()
	scaleOutTween.Completed:Wait()
	fadeOutTween.Completed:Wait()

	CurrentPage.Visible = false

	NextPage.Visible = true
	NextPage.Rotation = -90
	NextPage.Size = UDim2.new(1, 0, 0, 0)
	NextPage.BackgroundTransparency = 1

	rotateInTween:Play()
	scaleInTween:Play()
	fadeInTween:Play()
end

return Transitions
