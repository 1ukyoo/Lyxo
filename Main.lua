local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Transitions = require(script.Parent.Parent.Modules:WaitForChild("Transitions"))
local SideBar = script.Parent.Parent.Parent.Interface.MainDivider.SideBarDivider.SideBar
local Tabs = script.Parent.Parent.Parent.Interface.MainDivider.Tabs
local TweenService = game:GetService("TweenService")
local CurrentPage = Tabs.DashboardTab
local IsBusy = true
local CurrentSelected = script:WaitForChild("CurrentSelected")
local function createTweenInfo(params)
	params = params or {}
	return TweenInfo.new(
		params.duration or 1,
		params.easingStyle or Enum.EasingStyle.Linear,
		params.easingDirection or Enum.EasingDirection.InOut,
		params.repeatCount or 0,
		params.reverses or false,
		params.delayTime or 0
	)
end

Transitions.Hover(SideBar.HomeButton,
	function()
		local targetObject = SideBar.HomeButton
		local tweenParams = {
			duration = 0.45,
			easingStyle = Enum.EasingStyle.Quad,
		}

		local hoverTween = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Size = UDim2.new(0.519, 0, 0.069, 0) })
		hoverTween:Play()
		local ClickEffect = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Rotation = 360 } )
		local ClickEffect2 = TweenService:Create(script.Parent.Parent.Parent.Interface.MainDivider.SideBarDivider.SideBar.DashboardButtonSelected.UIGradient, createTweenInfo(tweenParams), { Offset = Vector2.new(1, 0) } )

		targetObject.MouseButton1Down:Connect(function()
			if not IsBusy then
				IsBusy = true

				if targetObject.Name == "HomeButton" and CurrentPage ~= Tabs.DashboardTab and ClickEffect2 then
					print(`Test PlayersButton`)
					Transitions.NextPage(CurrentPage, Tabs.DashboardTab)
					CurrentPage = Tabs.DashboardTab

					if CurrentSelected.Value and CurrentSelected.Value.UIGradient and CurrentSelected.Value.UIGradient.Offset == Vector2.new(1, 0) then
						local DissapearSelected = TweenService:Create(CurrentSelected.Value.UIGradient, createTweenInfo(tweenParams), { Offset = Vector2.new(0, 0) })
					end

					ClickEffect:Play()
					CurrentSelected.Value = script.Parent.Parent.Parent.Interface.MainDivider.SideBarDivider.SideBar.DashboardButtonSelected
					print(`Changed Value: {CurrentSelected.Value}`)
					ClickEffect2:Play()
					ClickEffect.Completed:Connect(function()
						targetObject.Rotation = 0
						IsBusy  = false 
					end)
				end
			end
		end)
	end,
	function()
		local targetObject = SideBar.HomeButton
		local tweenParams = {
			duration = 0.45,
			easingStyle = Enum.EasingStyle.Quad,
		}

		local leaveTween = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Size = UDim2.new(0.478, 0, 0.064, 0) })
		leaveTween:Play()
	end
)		

Transitions.Hover(SideBar.LogsButton,
	function()
		local targetObject = SideBar.LogsButton
		local tweenParams = {
			duration = 0.45,
			easingStyle = Enum.EasingStyle.Quad,
		}

		local hoverTween = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Size = UDim2.new(0.519, 0, 0.069, 0) })
		hoverTween:Play()
		local ClickEffect = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Rotation = 360 } )
		local ClickEffect2 = TweenService:Create(script.Parent.Parent.Parent.Interface.MainDivider.SideBarDivider.SideBar.LogsButtonSelected.UIGradient, createTweenInfo(tweenParams), { Offset = Vector2.new(1, 0) } )

		targetObject.MouseButton1Down:Connect(function()
			if not IsBusy then
				IsBusy = true

				if targetObject.Name == "LogsButton" and CurrentPage ~= Tabs.LogsTab and ClickEffect2 then
					print(`Test LogsButton`)
					Transitions.NextPage(CurrentPage, Tabs.LogsTab)
					CurrentPage = Tabs.LogsTab

					if CurrentSelected.Value and CurrentSelected.Value.UIGradient and CurrentSelected.Value.UIGradient.Offset == Vector2.new(1, 0) then
						local DissapearSelected = TweenService:Create(CurrentSelected.Value.UIGradient, createTweenInfo(tweenParams), { Offset = Vector2.new(0, 0) })
					end

					ClickEffect:Play()
					CurrentSelected.Value = script.Parent.Parent.Parent.Interface.MainDivider.SideBarDivider.SideBar.LogsButtonSelected
					print(`Changed Value: {CurrentSelected.Value}`)
					ClickEffect2:Play()
					ClickEffect.Completed:Connect(function()
						targetObject.Rotation = 0
						IsBusy  = false 
					end)
				end
			end
		end)
	end,
	function()
		local targetObject = SideBar.LogsButton
		local tweenParams = {
			duration = 0.45,
			easingStyle = Enum.EasingStyle.Quad,
		}

		local leaveTween = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Size = UDim2.new(0.478, 0, 0.064, 0) })
		leaveTween:Play()
	end
)		

Transitions.Hover(SideBar.PlayersButton,
	function()
		local targetObject = SideBar.PlayersButton
		local tweenParams = {
			duration = 0.45,
			easingStyle = Enum.EasingStyle.Quad,
		}

		local hoverTween = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Size = UDim2.new(0.519, 0, 0.069, 0) })
		hoverTween:Play()
		local ClickEffect = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Rotation = 360 } )
		local ClickEffect2 = TweenService:Create(script.Parent.Parent.Parent.Interface.MainDivider.SideBarDivider.SideBar.PlayersButtonSelected.UIGradient, createTweenInfo(tweenParams), { Offset = Vector2.new(1, 0) } )

		targetObject.MouseButton1Down:Connect(function()
			if not IsBusy then
				IsBusy = true

				if targetObject.Name == "PlayersButton" and CurrentPage ~= Tabs.PlayersManagementTab and ClickEffect2 then
					print(`Test PlayersButton`)
					Transitions.NextPage(CurrentPage, Tabs.PlayersManagementTab)
					CurrentPage = Tabs.PlayersManagementTab

					if CurrentSelected.Value and CurrentSelected.Value.UIGradient and CurrentSelected.Value.UIGradient.Offset == Vector2.new(1, 0) then
						local DissapearSelected = TweenService:Create(CurrentSelected.Value.UIGradient, createTweenInfo(tweenParams), { Offset = Vector2.new(0, 0) })
					end

					ClickEffect:Play()
					CurrentSelected.Value = script.Parent.Parent.Parent.Interface.MainDivider.SideBarDivider.SideBar.PlayersButtonSelected
					print(`Changed Value: {CurrentSelected.Value}`)
					ClickEffect2:Play()
					ClickEffect.Completed:Connect(function()
						targetObject.Rotation = 0
						IsBusy  = false 
					end)
				end
			end
		end)
	end,
	function()
		local targetObject = SideBar.PlayersButton
		local tweenParams = {
			duration = 0.45,
			easingStyle = Enum.EasingStyle.Quad,
		}

		local leaveTween = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Size = UDim2.new(0.478, 0, 0.064, 0) })
		leaveTween:Play()
	end
)									

Transitions.Hover(SideBar.StatsButton,
	function()
		local targetObject = SideBar.StatsButton
		local tweenParams = {
			duration = 0.45,
			easingStyle = Enum.EasingStyle.Quad,
		}

		local hoverTween = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Size = UDim2.new(0.519, 0, 0.069, 0) })
		hoverTween:Play()
		local ClickEffect = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Rotation = 360 } )
		local ClickEffect2 = TweenService:Create(script.Parent.Parent.Parent.Interface.MainDivider.SideBarDivider.SideBar.StatsButtonSelected.UIGradient, createTweenInfo(tweenParams), { Offset = Vector2.new(1, 0) } )

		targetObject.MouseButton1Down:Connect(function()
			if not IsBusy then
				IsBusy = true

				if targetObject.Name == "StatsButton" and CurrentPage ~= Tabs.StatsTab and ClickEffect2 then
					print(`Test StatsButton`)
					Transitions.NextPage(CurrentPage, Tabs.StatsTab)
					CurrentPage = Tabs.StatsTab

					if CurrentSelected.Value and CurrentSelected.Value.UIGradient and CurrentSelected.Value.UIGradient.Offset == Vector2.new(1, 0) then
						local DissapearSelected = TweenService:Create(CurrentSelected.Value.UIGradient, createTweenInfo(tweenParams), { Offset = Vector2.new(0, 0) })
					end

					ClickEffect:Play()
					CurrentSelected.Value = script.Parent.Parent.Parent.Interface.MainDivider.SideBarDivider.SideBar.StatsButtonSelected
					print(`Changed Value: {CurrentSelected.Value}`)
					ClickEffect2:Play()
					ClickEffect.Completed:Connect(function()
						targetObject.Rotation = 0
						IsBusy  = false 
					end)
				end
			end
		end)
	end,
	function()
		local targetObject = SideBar.StatsButton
		local tweenParams = {
			duration = 0.45,
			easingStyle = Enum.EasingStyle.Quad,
		}

		local leaveTween = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Size = UDim2.new(0.478, 0, 0.064, 0) })
		leaveTween:Play()
	end
)		




--[[
Transitions.Hover(SideBar.SettingsButton,
	function()
		local targetObject = SideBar.SettingsButton
		local tweenParams = {
			duration = 0.45,
			easingStyle = Enum.EasingStyle.Quad,
		}

		local hoverTween = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Size = UDim2.new(0.519, 0, 0.069, 0) })
		hoverTween:Play()
		local ClickEffect = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Rotation = 360 } )
		local ClickEffect2 = TweenService:Create(script.Parent.Parent.Parent.Interface.MainDivider.SideBarDivider.SideBar.SettingsButtonSelected.UIGradient, createTweenInfo(tweenParams), { Offset = Vector2.new(1, 0) } )

		targetObject.MouseButton1Down:Connect(function()
			IsBusy = true
			if IsBusy and targetObject.Name == "StatsButton" and CurrentPage ~= Tabs.StatsTab and ClickEffect2 then
				if CurrentSelected.Value and CurrentSelected.Value.UIGradient and CurrentSelected.Value.UIGradient.Offset == Vector2.new(1, 0) then
					local DissapearSelected = TweenService:Create(CurrentSelected.Value.UIGradient, createTweenInfo(tweenParams), { Offset = Vector2.new(0, 0) })
				end
				ClickEffect:Play()
				CurrentSelected.Value = script.Parent.Parent.Parent.Interface.MainDivider.SideBarDivider.SideBar.StatsButtonSelected
				print(`Changed Value: {CurrentSelected.Value}`)
				ClickEffect2:Play()
				ClickEffect.Completed:Connect(function()
					targetObject.Rotation = 0
				end)
			end
		end)
	end,
	function()
		local targetObject = SideBar.SettingsButton
		local tweenParams = {
			duration = 0.45,
			easingStyle = Enum.EasingStyle.Quad,
		}

		local leaveTween = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Size = UDim2.new(0.478, 0, 0.064, 0) })
		leaveTween:Play()
	end
)

Transitions.Hover(SideBar.MenuButton,
	function()
		local targetObject = SideBar.MenuButton
		local tweenParams = {
			duration = 0.45,
			easingStyle = Enum.EasingStyle.Quad,
		}

		local hoverTween = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Size = UDim2.new(0.519, 0, 0.069, 0) })
		hoverTween:Play()
		local ClickEffect = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Rotation = 360 } )
		local ClickEffect2 = TweenService:Create(script.Parent.Parent.Parent.Interface.MainDivider.SideBarDivider.SideBar.MenuButtonSelected.UIGradient, createTweenInfo(tweenParams), { Offset = Vector2.new(1, 0) } )

		targetObject.MouseButton1Down:Connect(function()
			IsBusy = true
			if IsBusy and targetObject.Name == "MenuButton" and CurrentPage ~= Tabs.StatsTab and ClickEffect2 then
				Transitions.NextPage(CurrentPage, Tabs.StatsTab)
				CurrentPage = Tabs.StatsTab

				if CurrentSelected.Value and CurrentSelected.Value.UIGradient and CurrentSelected.Value.UIGradient.Offset == Vector2.new(1, 0) then
					local DissapearSelected = TweenService:Create(CurrentSelected.Value.UIGradient, createTweenInfo(tweenParams), { Offset = Vector2.new(0, 0) })
				end
				ClickEffect:Play()
				CurrentSelected.Value = script.Parent.Parent.Parent.Interface.MainDivider.SideBarDivider.SideBar.StatsButtonSelected
				print(`Changed Value: {CurrentSelected.Value}`)
				ClickEffect2:Play()
				ClickEffect.Completed:Connect(function()
					targetObject.Rotation = 0
				end)
			end
			IsBusy = false
		end)
	end,
	function()
		local targetObject = SideBar.MenuButton
		local tweenParams = {
			duration = 0.45,
			easingStyle = Enum.EasingStyle.Quad,
		}

		local leaveTween = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Size = UDim2.new(0.478, 0, 0.064, 0) })
		leaveTween:Play()
	end
)

Transitions.Hover(SideBar.CloseButton,
	function()
		local targetObject = SideBar.CloseButton
		local tweenParams = {
			duration = 0.45,
			easingStyle = Enum.EasingStyle.Quad,
		}

		local hoverTween = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Size = UDim2.new(0.519, 0, 0.069, 0) })
		hoverTween:Play()
		local ClickEffect = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Rotation = 360 } )
		local ClickEffect2 = TweenService:Create(script.Parent.Parent.Parent.Interface.MainDivider.SideBarDivider.SideBar.CloseButtonSelected.UIGradient, createTweenInfo(tweenParams), { Offset = Vector2.new(1, 0) } )

		targetObject.MouseButton1Down:Connect(function()
			IsBusy = true
			if IsBusy and targetObject.Name == "StatsButton" and CurrentPage ~= Tabs.StatsTab and ClickEffect2 then
				Transitions.NextPage(CurrentPage, Tabs.StatsTab)
				CurrentPage = Tabs.StatsTab

				if CurrentSelected.Value and CurrentSelected.Value.UIGradient and CurrentSelected.Value.UIGradient.Offset == Vector2.new(1, 0) then
					local DissapearSelected = TweenService:Create(CurrentSelected.Value.UIGradient, createTweenInfo(tweenParams), { Offset = Vector2.new(0, 0) })
				end
				ClickEffect:Play()
				CurrentSelected.Value = script.Parent.Parent.Parent.Interface.MainDivider.SideBarDivider.SideBar.StatsButtonSelected
				print(`Changed Value: {CurrentSelected.Value}`)
				ClickEffect2:Play()
				ClickEffect.Completed:Connect(function()
					targetObject.Rotation = 0
				end)
			end
			IsBusy = false
		end)
	end,
	function()
		local targetObject = SideBar.CloseButton
		local tweenParams = {
			duration = 0.45,
			easingStyle = Enum.EasingStyle.Quad,
		}

		local leaveTween = TweenService:Create(targetObject, createTweenInfo(tweenParams), { Size = UDim2.new(0.478, 0, 0.064, 0) })
		leaveTween:Play()
	end
)
--]]
