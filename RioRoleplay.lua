repeat game:GetService("RunService").Heartbeat:Wait() until game:GetService("Players").LocalPlayer and game:GetService("CoreGui")

if game:GetService("CoreGui"):FindFirstChild("MobileUserInterface") then script:Destroy() return end

local LocalPlayerServiceReference, RunServiceGameReference, CoreGuiServiceReference = game:GetService("Players").LocalPlayer, game:GetService("RunService"), game:GetService("CoreGui")
local MobileUserInterfaceMainContainer, MobileToggleButtonImageElement, MobileToggleButtonCornerRadius = Instance.new("ScreenGui"), Instance.new("ImageButton"), Instance.new("UICorner")
local FieldOfViewCircleContainerFrame, FieldOfViewCircleCornerRadius, FieldOfViewCircleStrokeElement = Instance.new("Frame"), Instance.new("UICorner"), Instance.new("UIStroke")

MobileUserInterfaceMainContainer.Name, MobileUserInterfaceMainContainer.Parent, MobileUserInterfaceMainContainer.ZIndexBehavior, MobileUserInterfaceMainContainer.IgnoreGuiInset = "MobileUserInterface", CoreGuiServiceReference, Enum.ZIndexBehavior.Sibling, true
MobileToggleButtonImageElement.Parent, MobileToggleButtonImageElement.BackgroundColor3, MobileToggleButtonImageElement.BackgroundTransparency, MobileToggleButtonImageElement.Position, MobileToggleButtonImageElement.Size, MobileToggleButtonImageElement.Image, MobileToggleButtonImageElement.Draggable, MobileToggleButtonImageElement.Transparency = MobileUserInterfaceMainContainer, Color3.fromRGB(105,105,105), 0.8, UDim2.new(0.9,0,0.1,0), UDim2.new(0,65,0,65), "rbxassetid://8271386457", true, 1
MobileToggleButtonCornerRadius.CornerRadius, MobileToggleButtonCornerRadius.Parent = UDim.new(0,200), MobileToggleButtonImageElement
FieldOfViewCircleContainerFrame.Parent, FieldOfViewCircleContainerFrame.AnchorPoint, FieldOfViewCircleContainerFrame.Position, FieldOfViewCircleContainerFrame.Size, FieldOfViewCircleContainerFrame.BackgroundColor3, FieldOfViewCircleContainerFrame.BackgroundTransparency, FieldOfViewCircleContainerFrame.Visible = MobileUserInterfaceMainContainer, Vector2.new(0.5,0.5), UDim2.new(0.5,0,0.5,0), UDim2.new(0,220,0,220), Color3.fromRGB(255,255,255), 1, false
FieldOfViewCircleCornerRadius.CornerRadius, FieldOfViewCircleCornerRadius.Parent = UDim.new(1,0), FieldOfViewCircleContainerFrame
FieldOfViewCircleStrokeElement.Color, FieldOfViewCircleStrokeElement.Thickness, FieldOfViewCircleStrokeElement.Transparency, FieldOfViewCircleStrokeElement.Parent = Color3.fromRGB(255,255,255), 1, 0, FieldOfViewCircleContainerFrame

local FluentLibraryLoadSuccessStatus, FluentLibraryMainInterfaceObject = pcall(function() return loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))() end)
if not FluentLibraryLoadSuccessStatus or not FluentLibraryMainInterfaceObject then MobileUserInterfaceMainContainer:Destroy() script:Destroy() return end

local PrimaryDashboardMainWindowInstance = FluentLibraryMainInterfaceObject:CreateWindow({Title = "Ryder Hub", SubTitle = "Rio Roleplay", TabWidth = 160, Size = UDim2.fromOffset(550,330), Acrylic = false, Theme = "Dark", MinimizeKey = Enum.KeyCode.LeftControl})
PrimaryDashboardMainWindowInstance:Minimize()
MobileToggleButtonImageElement.MouseButton1Click:Connect(function() PrimaryDashboardMainWindowInstance.Root.Visible = not PrimaryDashboardMainWindowInstance.Root.Visible end)

local HomeTabMainContainerReference = PrimaryDashboardMainWindowInstance:AddTab({Title = "Home", Icon = "home"})
local WorldFunctionalitiesSection, PlayersFunctionalitiesSection, AimbotFunctionalitiesSection = HomeTabMainContainerReference:AddSection("World Functions"), HomeTabMainContainerReference:AddSection("Players Functions"), HomeTabMainContainerReference:AddSection("Aimbot Functions")
local StealingFrameFunctionalityEnabled, CurrentAimbotModeSelectedValue, AimbotUniversalFunctionalityEnabled, RemoveCooldownsAlreadyExecutedFlag, CurrentAimbotTargetBodyPart = true, "Humanized", false, false, nil

WorldFunctionalitiesSection:AddButton({Title = "Remove Cooldowns Interaction", Description = "Removes hold duration from all interaction prompts. Unique Execution!", Callback = function() 
    if RemoveCooldownsAlreadyExecutedFlag then return end
    RemoveCooldownsAlreadyExecutedFlag = true
    for _, ProximityPromptInstanceElement in pairs(workspace:GetDescendants()) do 
        if ProximityPromptInstanceElement:IsA("ProximityPrompt") and ProximityPromptInstanceElement.HoldDuration > 0 then ProximityPromptInstanceElement.HoldDuration = 0 end
    end
end})

local StealingFrameToggleControlElement = PlayersFunctionalitiesSection:AddToggle("StealingFrameToggle", {Title = "Stealing Frame", Default = true})
StealingFrameToggleControlElement:OnChanged(function(ToggleStateValue) StealingFrameFunctionalityEnabled = ToggleStateValue end)

local AimbotModeDropdownControlElement = AimbotFunctionalitiesSection:AddDropdown("AimbotModeDropdown", {Title = "Aimbot Mode", Values = {"Humanized", "Maximum"}, Default = 1})
AimbotModeDropdownControlElement:OnChanged(function(SelectedModeValue) CurrentAimbotModeSelectedValue = SelectedModeValue end)

local AimbotUniversalToggleControlElement = AimbotFunctionalitiesSection:AddToggle("AimbotUniversalToggle", {Title = "Aimbot Universal", Default = false})
AimbotUniversalToggleControlElement:OnChanged(function(ToggleStateValue) AimbotUniversalFunctionalityEnabled = ToggleStateValue end)

local RenderSteppedConnectionForTwoDimensionalLogic = RunServiceGameReference.RenderStepped:Connect(function(DeltaTimeFrameValue) 
    if not AimbotUniversalFunctionalityEnabled then 
        FieldOfViewCircleContainerFrame.Visible = false 
        CurrentAimbotTargetBodyPart = nil
        return 
    end
    
    FieldOfViewCircleContainerFrame.Visible = true
    
    local LocalCharacter = LocalPlayerServiceReference.Character
    if not LocalCharacter then 
        CurrentAimbotTargetBodyPart = nil
        FieldOfViewCircleStrokeElement.Color = Color3.fromRGB(255, 255, 255)
        return 
    end
    
    local EquippedTool = LocalCharacter:FindFirstChildOfClass("Tool")
    if not EquippedTool then 
        CurrentAimbotTargetBodyPart = nil
        FieldOfViewCircleStrokeElement.Color = Color3.fromRGB(255, 255, 255)
        return 
    end
    
    local ToolName = EquippedTool.Name
    if ToolName == "Celular" or ToolName == "Lixo" then
        CurrentAimbotTargetBodyPart = nil
        FieldOfViewCircleStrokeElement.Color = Color3.fromRGB(255, 255, 255)
        return
    end
    
    local CurrentCameraInstance = workspace.CurrentCamera
    if not CurrentCameraInstance then return end
    
    local MouseLocationVector = CurrentCameraInstance.ViewportSize / 2
    local FieldOfViewRadiusValue = 110
    local ClosestTargetDistance = math.huge
    local ClosestTargetCharacterInstance = nil
    local ClosestTargetBodyPartInstance = nil
    
    for _, PlayerInstanceElement in pairs(game:GetService("Players"):GetPlayers()) do
        if PlayerInstanceElement == LocalPlayerServiceReference then continue end
        
        local TargetCharacterModel = PlayerInstanceElement.Character
        if not TargetCharacterModel then continue end
        
        local TargetHumanoidRootPart = TargetCharacterModel:FindFirstChild("HumanoidRootPart")
        if not TargetHumanoidRootPart then continue end
        
        local TargetHumanoidInstance = TargetCharacterModel:FindFirstChildOfClass("Humanoid")
        if not TargetHumanoidInstance then continue end
        if TargetHumanoidInstance.Health <= 0 then continue end
        if TargetHumanoidInstance.Sit then continue end
        
        local LocalHumanoidRootPart = LocalCharacter:FindFirstChild("HumanoidRootPart")
        if not LocalHumanoidRootPart then continue end
        
        local DistanceToTargetValue = (TargetHumanoidRootPart.Position - LocalHumanoidRootPart.Position).Magnitude
        if DistanceToTargetValue > 200 then continue end
        
        local TargetHeadPart = TargetCharacterModel:FindFirstChild("Head")
        local TargetTorsoPart = TargetCharacterModel:FindFirstChild("UpperTorso") or TargetCharacterModel:FindFirstChild("Torso")
        local PriorityBodyPart = TargetHeadPart or TargetTorsoPart
        if not PriorityBodyPart then continue end
        
        local RaycastOriginPosition = CurrentCameraInstance.CFrame.Position
        local RaycastDirectionVector = (PriorityBodyPart.Position - RaycastOriginPosition).Unit * DistanceToTargetValue
        local RaycastParametersInstance = RaycastParams.new()
        RaycastParametersInstance.FilterDescendantsInstances = {LocalCharacter, TargetCharacterModel}
        RaycastParametersInstance.FilterType = Enum.RaycastFilterType.Exclude
        
        local RaycastResultData = workspace:Raycast(RaycastOriginPosition, RaycastDirectionVector, RaycastParametersInstance)
        if RaycastResultData then continue end
        
        local ScreenPositionVector, IsOnScreenBoolean = CurrentCameraInstance:WorldToViewportPoint(PriorityBodyPart.Position)
        if not IsOnScreenBoolean then continue end
        
        local DistanceFromCenterValue = (Vector2.new(ScreenPositionVector.X, ScreenPositionVector.Y) - MouseLocationVector).Magnitude
        if DistanceFromCenterValue > FieldOfViewRadiusValue then continue end
        
        if DistanceFromCenterValue < ClosestTargetDistance then
            ClosestTargetDistance = DistanceFromCenterValue
            ClosestTargetCharacterInstance = TargetCharacterModel
            ClosestTargetBodyPartInstance = PriorityBodyPart
        end
    end
    
    if not ClosestTargetCharacterInstance then
        FieldOfViewCircleStrokeElement.Color = Color3.fromRGB(255, 255, 255)
        CurrentAimbotTargetBodyPart = nil
        return
    end
    
    FieldOfViewCircleStrokeElement.Color = Color3.fromRGB(255, 0, 0)
    CurrentAimbotTargetBodyPart = ClosestTargetBodyPartInstance
    
    if not CurrentAimbotTargetBodyPart then return end
    
    local TargetPositionVector = CurrentAimbotTargetBodyPart.Position
    if not TargetPositionVector then return end
    
    local CameraLookVector = CurrentCameraInstance.CFrame.LookVector
    local DirectionToTargetVector = (TargetPositionVector - CurrentCameraInstance.CFrame.Position).Unit
    
    if CurrentAimbotModeSelectedValue == "Maximum" then
        CurrentCameraInstance.CFrame = CFrame.new(CurrentCameraInstance.CFrame.Position, TargetPositionVector)
        return
    end
    
    if CurrentAimbotModeSelectedValue == "Humanized" then
        local RandomSmoothnessValue = math.random(55, 80) / 100
        local SmoothedDirectionVector = CameraLookVector:Lerp(DirectionToTargetVector, RandomSmoothnessValue)
        CurrentCameraInstance.CFrame = CFrame.new(CurrentCameraInstance.CFrame.Position, CurrentCameraInstance.CFrame.Position + SmoothedDirectionVector)
        return
    end
end)

local HeartbeatConnectionForThreeDimensionalLogic = RunServiceGameReference.Heartbeat:Connect(function(DeltaTimeFrameValue)
    if not RemoveCooldownsAlreadyExecutedFlag then return end
end)

game.DescendantAdded:Connect(function(DescendantInstanceElement)
    if not RemoveCooldownsAlreadyExecutedFlag then return end
    if not DescendantInstanceElement:IsA("ProximityPrompt") then return end
    if DescendantInstanceElement.HoldDuration <= 0 then return end
    
    local IsInWorkspace = DescendantInstanceElement:IsDescendantOf(workspace)
    if not IsInWorkspace then return end
    
    DescendantInstanceElement.HoldDuration = 0
end)

PrimaryDashboardMainWindowInstance.Root.Destroying:Connect(function() 
    if RenderSteppedConnectionForTwoDimensionalLogic then RenderSteppedConnectionForTwoDimensionalLogic:Disconnect() end 
    if HeartbeatConnectionForThreeDimensionalLogic then HeartbeatConnectionForThreeDimensionalLogic:Disconnect() end 
    MobileUserInterfaceMainContainer:Destroy() 
    script:Destroy() 
end)

PrimaryDashboardMainWindowInstance:SelectTab(1)
