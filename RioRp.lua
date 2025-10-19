local PlayersService,RunService,Workspace,TweenService,UserInputService=game:GetService("Players"),game:GetService("RunService"),game:GetService("Workspace"),game:GetService("TweenService"),game:GetService("UserInputService")
local LocalPlayer,Camera=PlayersService.LocalPlayer,Workspace.CurrentCamera
local AimbotFeatureToggleActiveState=true
local AimbotCircleScreenGui=Instance.new("ScreenGui")
AimbotCircleScreenGui.Name,AimbotCircleScreenGui.ResetOnSpawn,AimbotCircleScreenGui.IgnoreGuiInset,AimbotCircleScreenGui.Parent="AimbotCircleVisualizationInterface",false,true,LocalPlayer:WaitForChild("PlayerGui")
local AimbotCircleFrame=Instance.new("Frame")
AimbotCircleFrame.Size,AimbotCircleFrame.Position,AimbotCircleFrame.AnchorPoint,AimbotCircleFrame.BackgroundTransparency,AimbotCircleFrame.BorderSizePixel,AimbotCircleFrame.Parent=UDim2.new(0,100,0,100),UDim2.new(.5,0,.5,0),Vector2.new(.5,.5),1,0,AimbotCircleScreenGui
local CircleCorner=Instance.new("UICorner")CircleCorner.CornerRadius,CircleCorner.Parent=UDim.new(1,0),AimbotCircleFrame
local CircleStroke=Instance.new("UIStroke")CircleStroke.Color,CircleStroke.Thickness,CircleStroke.Transparency,CircleStroke.LineJoinMode,CircleStroke.Parent=Color3.fromRGB(255,255,255),4,.3,Enum.LineJoinMode.Round,AimbotCircleFrame
local CurrentTargetedPlayer,CircleRadiusPixels,MaximumAimbotRangeStuds=nil,50,120
local RaycastConfiguration=RaycastParams.new()RaycastConfiguration.FilterType,RaycastConfiguration.IgnoreWater=Enum.RaycastFilterType.Blacklist,true
local MiniPanelScreenGui=Instance.new("ScreenGui")
MiniPanelScreenGui.Name,MiniPanelScreenGui.ResetOnSpawn,MiniPanelScreenGui.ZIndexBehavior,MiniPanelScreenGui.Enabled,MiniPanelScreenGui.Parent="MiniPanel_Aimbot",false,Enum.ZIndexBehavior.Sibling,true,LocalPlayer:WaitForChild("PlayerGui")
local MiniPanelContainerFrame=Instance.new("Frame")
MiniPanelContainerFrame.Name,MiniPanelContainerFrame.Size,MiniPanelContainerFrame.Position,MiniPanelContainerFrame.BackgroundColor3,MiniPanelContainerFrame.BorderSizePixel,MiniPanelContainerFrame.AnchorPoint,MiniPanelContainerFrame.Active,MiniPanelContainerFrame.Parent="MiniPanelContainer",UDim2.new(0,150,0,95),UDim2.new(0.5,220,0.5,0),Color3.fromRGB(35,35,40),0,Vector2.new(0.5,0.5),true,MiniPanelScreenGui
local MiniPanelBorderFrame=Instance.new("Frame")
MiniPanelBorderFrame.Name,MiniPanelBorderFrame.Size,MiniPanelBorderFrame.Position,MiniPanelBorderFrame.AnchorPoint,MiniPanelBorderFrame.BackgroundColor3,MiniPanelBorderFrame.BorderSizePixel,MiniPanelBorderFrame.ZIndex,MiniPanelBorderFrame.Parent="Border",UDim2.new(1,6,1,6),UDim2.new(0.5,0,0.5,0),Vector2.new(0.5,0.5),Color3.fromRGB(25,25,30),0,0,MiniPanelContainerFrame
local MiniPanelBorderUICorner=Instance.new("UICorner")MiniPanelBorderUICorner.CornerRadius,MiniPanelBorderUICorner.Parent=UDim.new(0,14),MiniPanelBorderFrame
local MiniPanelContainerUICorner=Instance.new("UICorner")MiniPanelContainerUICorner.CornerRadius,MiniPanelContainerUICorner.Parent=UDim.new(0,12),MiniPanelContainerFrame
local MiniPanelTitleTextLabel=Instance.new("TextLabel")
MiniPanelTitleTextLabel.Text,MiniPanelTitleTextLabel.Size,MiniPanelTitleTextLabel.Position,MiniPanelTitleTextLabel.BackgroundTransparency,MiniPanelTitleTextLabel.TextColor3,MiniPanelTitleTextLabel.Font,MiniPanelTitleTextLabel.TextSize,MiniPanelTitleTextLabel.TextXAlignment,MiniPanelTitleTextLabel.Parent="Aimbot",UDim2.new(1,-20,0,30),UDim2.new(0,10,0,10),1,Color3.fromRGB(255,255,255),Enum.Font.GothamBold,14,Enum.TextXAlignment.Left,MiniPanelContainerFrame
local MiniPanelToggleButtonFrame=Instance.new("Frame")
MiniPanelToggleButtonFrame.Name,MiniPanelToggleButtonFrame.Size,MiniPanelToggleButtonFrame.Position,MiniPanelToggleButtonFrame.BackgroundColor3,MiniPanelToggleButtonFrame.BorderSizePixel,MiniPanelToggleButtonFrame.Parent="ToggleButton",UDim2.new(1,-20,0,35),UDim2.new(0,10,0,50),Color3.fromRGB(220,80,80),0,MiniPanelContainerFrame
local MiniPanelToggleUICorner=Instance.new("UICorner")MiniPanelToggleUICorner.CornerRadius,MiniPanelToggleUICorner.Parent=UDim.new(0,8),MiniPanelToggleButtonFrame
local MiniPanelToggleClickButton=Instance.new("TextButton")MiniPanelToggleClickButton.Size,MiniPanelToggleClickButton.BackgroundTransparency,MiniPanelToggleClickButton.Text,MiniPanelToggleClickButton.Parent=UDim2.new(1,0,1,0),1,"",MiniPanelToggleButtonFrame
local MiniPanelToggleTitleLabel=Instance.new("TextLabel")
MiniPanelToggleTitleLabel.Text,MiniPanelToggleTitleLabel.Size,MiniPanelToggleTitleLabel.Position,MiniPanelToggleTitleLabel.BackgroundTransparency,MiniPanelToggleTitleLabel.TextColor3,MiniPanelToggleTitleLabel.Font,MiniPanelToggleTitleLabel.TextSize,MiniPanelToggleTitleLabel.Parent="toggle",UDim2.new(1,0,1,0),UDim2.new(0,0,0,0),1,Color3.fromRGB(255,255,255),Enum.Font.GothamBold,14,MiniPanelToggleButtonFrame
MiniPanelToggleClickButton.MouseButton1Click:Connect(function()
	AimbotFeatureToggleActiveState=not AimbotFeatureToggleActiveState
	TweenService:Create(MiniPanelToggleButtonFrame,TweenInfo.new(0.3,Enum.EasingStyle.Quad),{BackgroundColor3=AimbotFeatureToggleActiveState and Color3.fromRGB(220,80,80)or Color3.fromRGB(45,45,55)}):Play()
end)
local MiniPanelDragStartPosition,MiniPanelFrameStartPosition
MiniPanelContainerFrame.InputBegan:Connect(function(InputObjectReceived)
	if InputObjectReceived.UserInputType==Enum.UserInputType.MouseButton1 or InputObjectReceived.UserInputType==Enum.UserInputType.Touch then MiniPanelDragStartPosition,MiniPanelFrameStartPosition=InputObjectReceived.Position,MiniPanelContainerFrame.Position
		local MiniPanelDragEndConnection MiniPanelDragEndConnection=InputObjectReceived.Changed:Connect(function()
			if InputObjectReceived.UserInputState==Enum.UserInputState.End then MiniPanelDragStartPosition=nil MiniPanelDragEndConnection:Disconnect()end end)end end)
UserInputService.InputChanged:Connect(function(InputObjectReceived)
	if MiniPanelDragStartPosition and(InputObjectReceived.UserInputType==Enum.UserInputType.MouseMovement or InputObjectReceived.UserInputType==Enum.UserInputType.Touch)then local CurrentMousePositionDeltaVector=InputObjectReceived.Position-MiniPanelDragStartPosition
		MiniPanelContainerFrame.Position=UDim2.new(MiniPanelFrameStartPosition.X.Scale,MiniPanelFrameStartPosition.X.Offset+CurrentMousePositionDeltaVector.X,MiniPanelFrameStartPosition.Y.Scale,MiniPanelFrameStartPosition.Y.Offset+CurrentMousePositionDeltaVector.Y)end end)
RunService.RenderStepped:Connect(function()
	if not AimbotFeatureToggleActiveState then CurrentTargetedPlayer=nil AimbotCircleScreenGui.Enabled=false return end
	AimbotCircleScreenGui.Enabled=true local LocalCharacter=LocalPlayer.Character local LocalTorso=LocalCharacter and(LocalCharacter:FindFirstChild("Torso")or LocalCharacter:FindFirstChild("HumanoidRootPart"))
	if not LocalTorso then return end RaycastConfiguration.FilterDescendantsInstances={LocalCharacter}
	local ClosestPlayer,ShortestDistance,OptimalAimPart=nil,math.huge,nil local ScreenCenter=Vector2.new(Camera.ViewportSize.X*.5,Camera.ViewportSize.Y*.5)
	for _,PlayerInstance in ipairs(PlayersService:GetPlayers())do if PlayerInstance~=LocalPlayer and not PlayerInstance:IsFriendsWith(LocalPlayer.UserId)then local Character=PlayerInstance.Character
			if Character and Character.Parent then local Humanoid=Character:FindFirstChildOfClass("Humanoid")local TargetTorso=Character:FindFirstChild("Torso")or Character:FindFirstChild("HumanoidRootPart")
				if Humanoid and Humanoid.Health>0 and Humanoid.Sit==false and TargetTorso then local Distance=(LocalTorso.Position-TargetTorso.Position).Magnitude
					if Distance<=MaximumAimbotRangeStuds then for _,PartName in ipairs({"Head","Torso"})do local TargetPart=Character:FindFirstChild(PartName)
							if TargetPart then local ScreenPosition,IsOnScreen=Camera:WorldToViewportPoint(TargetPart.Position)
								if IsOnScreen and(Vector2.new(ScreenPosition.X,ScreenPosition.Y)-ScreenCenter).Magnitude<=CircleRadiusPixels then local RaycastResult=Workspace:Raycast(Camera.CFrame.Position,TargetPart.Position-Camera.CFrame.Position,RaycastConfiguration)
									if not RaycastResult or(RaycastResult.Instance.Parent and RaycastResult.Instance.Parent:FindFirstChildOfClass("Humanoid"))then
										if Distance<ShortestDistance then ShortestDistance,ClosestPlayer,OptimalAimPart=Distance,PlayerInstance,TargetPart break end end end end end end end end end end
	if CurrentTargetedPlayer and ClosestPlayer then local CurrentCharacter=CurrentTargetedPlayer.Character
		if CurrentCharacter and CurrentCharacter.Parent then local CurrentTorso=CurrentCharacter:FindFirstChild("Torso")or CurrentCharacter:FindFirstChild("HumanoidRootPart")
			if CurrentTorso and(LocalTorso.Position-CurrentTorso.Position).Magnitude>=ShortestDistance then CurrentTargetedPlayer=ClosestPlayer end
		else CurrentTargetedPlayer=ClosestPlayer end else CurrentTargetedPlayer=ClosestPlayer end
	if CurrentTargetedPlayer and OptimalAimPart then Camera.CFrame=CFrame.new(Camera.CFrame.Position,OptimalAimPart.Position)CircleStroke.Color=Color3.fromRGB(255,85,85)
	else CircleStroke.Color=Color3.fromRGB(255,255,255)end
end)
