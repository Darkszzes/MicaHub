repeat game:GetService("RunService").Heartbeat:Wait() until game:GetService("Players").LocalPlayer and game:GetService("CoreGui") and not game:GetService("CoreGui"):FindFirstChild("MobileUserInterface")
local LocalPlayerServiceReference,RunServiceGameReference,CoreGuiServiceReference=game:GetService("Players").LocalPlayer,game:GetService("RunService"),game:GetService("CoreGui")
local MobileUserInterfaceMainContainer,MobileToggleButtonImageElement,MobileToggleButtonCornerRadius=Instance.new("ScreenGui"),Instance.new("ImageButton"),Instance.new("UICorner")
local FieldOfViewCircleContainerFrame,FieldOfViewCircleCornerRadius,FieldOfViewCircleStrokeElement=Instance.new("Frame"),Instance.new("UICorner"),Instance.new("UIStroke")
MobileUserInterfaceMainContainer.Name,MobileUserInterfaceMainContainer.Parent,MobileUserInterfaceMainContainer.ZIndexBehavior,MobileUserInterfaceMainContainer.IgnoreGuiInset="MobileUserInterface",CoreGuiServiceReference,Enum.ZIndexBehavior.Sibling,true
MobileToggleButtonImageElement.Parent,MobileToggleButtonImageElement.BackgroundColor3,MobileToggleButtonImageElement.BackgroundTransparency,MobileToggleButtonImageElement.Position,MobileToggleButtonImageElement.Size,MobileToggleButtonImageElement.Image,MobileToggleButtonImageElement.Draggable,MobileToggleButtonImageElement.Transparency=MobileUserInterfaceMainContainer,Color3.fromRGB(105,105,105),0.8,UDim2.new(0.899999976,6,0.100000001,22),UDim2.new(0,65,0,65),"rbxassetid://8271386457",true,1
MobileToggleButtonCornerRadius.CornerRadius,MobileToggleButtonCornerRadius.Parent=UDim.new(0,200),MobileToggleButtonImageElement
FieldOfViewCircleContainerFrame.Parent,FieldOfViewCircleContainerFrame.AnchorPoint,FieldOfViewCircleContainerFrame.Position,FieldOfViewCircleContainerFrame.Size,FieldOfViewCircleContainerFrame.BackgroundColor3,FieldOfViewCircleContainerFrame.BackgroundTransparency,FieldOfViewCircleContainerFrame.Visible=MobileUserInterfaceMainContainer,Vector2.new(0.5,0.5),UDim2.new(0.5,0,0.5,0),UDim2.new(0,180,0,180),Color3.fromRGB(255,255,255),1,false
FieldOfViewCircleCornerRadius.CornerRadius,FieldOfViewCircleCornerRadius.Parent=UDim.new(1,0),FieldOfViewCircleContainerFrame
FieldOfViewCircleStrokeElement.Color,FieldOfViewCircleStrokeElement.Thickness,FieldOfViewCircleStrokeElement.Transparency,FieldOfViewCircleStrokeElement.Parent=Color3.fromRGB(255,255,255),1,0,FieldOfViewCircleContainerFrame

local FluentLibraryLoadSuccessStatus,FluentLibraryMainInterfaceObject=pcall(function()return loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()end)
if not FluentLibraryLoadSuccessStatus or not FluentLibraryMainInterfaceObject then MobileUserInterfaceMainContainer:Destroy()script:Destroy()return end
local PrimaryDashboardMainWindowInstance=FluentLibraryMainInterfaceObject:CreateWindow({Title="Ryder Hub",SubTitle="Rio Roleplay",TabWidth=160,Size=UDim2.fromOffset(550,330),Acrylic=false,Theme="Darker",MinimizeKey=Enum.KeyCode.LeftControl})
local GeneralTabMainContainerReference=PrimaryDashboardMainWindowInstance:AddTab({Title="General",Icon="globe"})
local AuthorInformationSectionReference,WorldFunctionalitiesSectionReference,WorkFunctionalitiesSectionReference,AimbotFunctionalitiesSectionReference,PlayersFunctionalitiesSectionReference,OptionalFunctionalitiesSectionReference=GeneralTabMainContainerReference:AddSection("Author Information"),GeneralTabMainContainerReference:AddSection("World Functions"),GeneralTabMainContainerReference:AddSection("Work Functions"),GeneralTabMainContainerReference:AddSection("Aimbot Functions"),GeneralTabMainContainerReference:AddSection("Players Functions"),GeneralTabMainContainerReference:AddSection("Optional Functions")
local CurrentAimbotModeSelectedValue,AimbotUniversalFunctionalityEnabledState,RemoveCooldownsInteractionAlreadyExecutedFlag,CurrentAimbotTargetBodyPartReference,AntiAfkUniversalFunctionalityEnabledState,LastThreeDimensionalLoopExecutionTimestampValue,SelectedJobDropdownCurrentValue,AutomaticFarmingUniversalFunctionalityEnabledState,ShowPlayerLinesUniversalFunctionalityEnabledState,PlayerLineESPStorageTable,PlayerCircleESPStorageTable,PlayerTextESPStorageTable,NoClipUniversalFunctionalityEnabledState,StealingInteractionUniversalFunctionalityEnabledState,ReduceGameGraphsInteractionAlreadyExecutedFlag,IgnoreTeamModeUniversalFunctionalityEnabledState="Humanized",false,false,nil,true,0,"Lixeiro",false,false,{},{},{},false,false,false,true
local MobileToggleButtonConnectionReference=MobileToggleButtonImageElement.MouseButton1Click:Connect(function()PrimaryDashboardMainWindowInstance.Root.Visible=not PrimaryDashboardMainWindowInstance.Root.Visible end)
PrimaryDashboardMainWindowInstance:Minimize()

AuthorInformationSectionReference:AddButton({Title="Copy Discord Link",Callback=function()
    Setclipboard("https://discord.gg/Bmvdw7mezT")
end})

WorldFunctionalitiesSectionReference:AddButton({Title="Removing Cooldown Prompts",Callback=function()
    if RemoveCooldownsInteractionAlreadyExecutedFlag then return end RemoveCooldownsInteractionAlreadyExecutedFlag=true
    for _,ProximityPromptInstanceElementReference in pairs(workspace:GetDescendants())do if ProximityPromptInstanceElementReference:IsA("ProximityPrompt")and ProximityPromptInstanceElementReference.HoldDuration>0 then ProximityPromptInstanceElementReference.HoldDuration=0 end end
end})

local NoClipUniversalToggleControlElementReference=WorldFunctionalitiesSectionReference:AddToggle("NoClipUniversalToggle",{Title="NoClip Fe Universal",Default=false})
NoClipUniversalToggleControlElementReference:OnChanged(function(ToggleStateValueParameter)NoClipUniversalFunctionalityEnabledState=ToggleStateValueParameter end)

local SelectJobDropdownControlElementReference=WorkFunctionalitiesSectionReference:AddDropdown("SelectJobDropdown",{Title="Select Job",Values={"Lixeiro","Ifood"},Default=1})
SelectJobDropdownControlElementReference:OnChanged(function(SelectedJobDropdownValueParameter)SelectedJobDropdownCurrentValue=SelectedJobDropdownValueParameter end)

local AutomaticFarmingUniversalToggleControlElementReference=WorkFunctionalitiesSectionReference:AddToggle("AutomaticFarmingUniversalToggle",{Title="Automatic Farming Universal",Default=false})
AutomaticFarmingUniversalToggleControlElementReference:OnChanged(function(ToggleStateValueParameter)AutomaticFarmingUniversalFunctionalityEnabledState=ToggleStateValueParameter end)

OptionalFunctionalitiesSectionReference:AddButton({Title="Reduce Game Graphs",Callback=function()
    if ReduceGameGraphsInteractionAlreadyExecutedFlag then return end ReduceGameGraphsInteractionAlreadyExecutedFlag=true
    for _,PartInstanceElementReference in pairs(workspace:GetDescendants())do if PartInstanceElementReference:IsA("BasePart")then PartInstanceElementReference.Material=Enum.Material.Plastic end end
    for _,DescendantInstanceReference in pairs(workspace:GetDescendants())do
        if DescendantInstanceReference:IsA("Texture")or DescendantInstanceReference:IsA("Decal")then pcall(function()DescendantInstanceReference.Transparency=1 DescendantInstanceReference.Parent=nil end)end
        if DescendantInstanceReference:IsA("PostEffect")or DescendantInstanceReference:IsA("BlurEffect")or DescendantInstanceReference:IsA("BloomEffect")or DescendantInstanceReference:IsA("DepthOfFieldEffect")or DescendantInstanceReference:IsA("SunRaysEffect")or DescendantInstanceReference:IsA("ColorCorrectionEffect")then DescendantInstanceReference.Enabled=false DescendantInstanceReference:GetPropertyChangedSignal("Enabled"):Connect(function()DescendantInstanceReference.Enabled=false end)end
    end
    local LightingServiceReference=game:GetService("Lighting")
    LightingServiceReference.GlobalShadows,LightingServiceReference.FogEnd=false,100000
    LightingServiceReference:GetPropertyChangedSignal("GlobalShadows"):Connect(function()LightingServiceReference.GlobalShadows=false end)
    for _,LightingChildReference in pairs(LightingServiceReference:GetChildren())do
        if LightingChildReference:IsA("Atmosphere")or LightingChildReference:IsA("Sky")or LightingChildReference:IsA("Clouds")then pcall(function()LightingChildReference:Destroy()end)end
        if LightingChildReference:IsA("SunRaysEffect")or LightingChildReference:IsA("BloomEffect")or LightingChildReference:IsA("BlurEffect")or LightingChildReference:IsA("ColorCorrectionEffect")or LightingChildReference:IsA("DepthOfFieldEffect")then LightingChildReference.Enabled=false LightingChildReference:GetPropertyChangedSignal("Enabled"):Connect(function()LightingChildReference.Enabled=false end)end
    end
end})

local AntiAfkUniversalToggleControlElementReference=OptionalFunctionalitiesSectionReference:AddToggle("AntiAfkUniversalToggle",{Title="Anti Afk Universal",Default=true})
AntiAfkUniversalToggleControlElementReference:OnChanged(function(ToggleStateValueParameter)AntiAfkUniversalFunctionalityEnabledState=ToggleStateValueParameter end)

local AimbotModeDropdownControlElementReference=AimbotFunctionalitiesSectionReference:AddDropdown("AimbotModeDropdown",{Title="Aimbot Mode",Values={"Humanized","Maximum"},Default=1})
AimbotModeDropdownControlElementReference:OnChanged(function(SelectedModeValueParameter)CurrentAimbotModeSelectedValue=SelectedModeValueParameter end)

local IgnoreTeamModeUniversalToggleControlElementReference=AimbotFunctionalitiesSectionReference:AddToggle("IgnoreTeamModeUniversalToggle",{Title="Ignore Team Mode",Default=true})
IgnoreTeamModeUniversalToggleControlElementReference:OnChanged(function(ToggleStateValueParameter)IgnoreTeamModeUniversalFunctionalityEnabledState=ToggleStateValueParameter end)

local AimbotUniversalToggleControlElementReference=AimbotFunctionalitiesSectionReference:AddToggle("AimbotUniversalToggle",{Title="Aimbot Universal",Default=false})
AimbotUniversalToggleControlElementReference:OnChanged(function(ToggleStateValueParameter)AimbotUniversalFunctionalityEnabledState=ToggleStateValueParameter end)

local ShowPlayerLinesUniversalToggleControlElementReference=PlayersFunctionalitiesSectionReference:AddToggle("ShowPlayerLinesUniversalToggle",{Title="Esp Players Universal",Default=false})
ShowPlayerLinesUniversalToggleControlElementReference:OnChanged(function(ToggleStateValueParameter)ShowPlayerLinesUniversalFunctionalityEnabledState=ToggleStateValueParameter end)

local StealingInteractionUniversalToggleControlElementReference=PlayersFunctionalitiesSectionReference:AddToggle("StealingInteractionUniversalToggle",{Title="Stealing Interaction Universal",Default=false})
StealingInteractionUniversalToggleControlElementReference:OnChanged(function(ToggleStateValueParameter)StealingInteractionUniversalFunctionalityEnabledState=ToggleStateValueParameter end)

local RenderSteppedConnectionForTwoDimensionalLogicReference=RunServiceGameReference.RenderStepped:Connect(function(DeltaTimeFrameValueParameter)
    if NoClipUniversalFunctionalityEnabledState then
        local LocalCharacterModelReference=LocalPlayerServiceReference.Character
        if LocalCharacterModelReference then
            for _,PartInstanceReference in pairs(LocalCharacterModelReference:GetDescendants())do
                if PartInstanceReference:IsA("BasePart")and PartInstanceReference.Name~="HumanoidRootPart"then PartInstanceReference.CanCollide=false end
            end
        end
    end
    
    if ShowPlayerLinesUniversalFunctionalityEnabledState then
        local CurrentCameraInstanceReference=workspace.CurrentCamera if not CurrentCameraInstanceReference then return end
        local ScreenBottomCenterPositionVectorValue=Vector2.new(CurrentCameraInstanceReference.ViewportSize.X/2,CurrentCameraInstanceReference.ViewportSize.Y)
        for PlayerUserIdKey,ExistingLineDrawingObjectReference in pairs(PlayerLineESPStorageTable)do local PlayerFoundBooleanState=false
            for _,PlayerInstanceElementReference in pairs(game:GetService("Players"):GetPlayers())do if PlayerInstanceElementReference.UserId==PlayerUserIdKey then PlayerFoundBooleanState=true break end end
            if not PlayerFoundBooleanState then if ExistingLineDrawingObjectReference then ExistingLineDrawingObjectReference:Remove()end PlayerLineESPStorageTable[PlayerUserIdKey]=nil end
        end
        for PlayerUserIdKey,ExistingCircleDrawingObjectReference in pairs(PlayerCircleESPStorageTable)do local PlayerFoundBooleanState=false
            for _,PlayerInstanceElementReference in pairs(game:GetService("Players"):GetPlayers())do if PlayerInstanceElementReference.UserId==PlayerUserIdKey then PlayerFoundBooleanState=true break end end
            if not PlayerFoundBooleanState then if ExistingCircleDrawingObjectReference then ExistingCircleDrawingObjectReference:Remove()end PlayerCircleESPStorageTable[PlayerUserIdKey]=nil end
        end
        for PlayerUserIdKey,ExistingTextDrawingObjectReference in pairs(PlayerTextESPStorageTable)do local PlayerFoundBooleanState=false
            for _,PlayerInstanceElementReference in pairs(game:GetService("Players"):GetPlayers())do if PlayerInstanceElementReference.UserId==PlayerUserIdKey then PlayerFoundBooleanState=true break end end
            if not PlayerFoundBooleanState then if ExistingTextDrawingObjectReference then ExistingTextDrawingObjectReference:Remove()end PlayerTextESPStorageTable[PlayerUserIdKey]=nil end
        end
        for _,PlayerInstanceElementReference in pairs(game:GetService("Players"):GetPlayers())do if PlayerInstanceElementReference==LocalPlayerServiceReference then continue end
            local PlayerUserIdValue=PlayerInstanceElementReference.UserId if not PlayerUserIdValue then continue end
            local TargetCharacterModelReference=PlayerInstanceElementReference.Character
            if not TargetCharacterModelReference then local ExistingLineDrawingObjectReference=PlayerLineESPStorageTable[PlayerUserIdValue]if ExistingLineDrawingObjectReference then ExistingLineDrawingObjectReference:Remove()PlayerLineESPStorageTable[PlayerUserIdValue]=nil end local ExistingCircleDrawingObjectReference=PlayerCircleESPStorageTable[PlayerUserIdValue]if ExistingCircleDrawingObjectReference then ExistingCircleDrawingObjectReference:Remove()PlayerCircleESPStorageTable[PlayerUserIdValue]=nil end local ExistingTextDrawingObjectReference=PlayerTextESPStorageTable[PlayerUserIdValue]if ExistingTextDrawingObjectReference then ExistingTextDrawingObjectReference:Remove()PlayerTextESPStorageTable[PlayerUserIdValue]=nil end continue end
            local TargetHumanoidRootPartReference=TargetCharacterModelReference:FindFirstChild("HumanoidRootPart")
            local TargetTorsoPartReference=TargetCharacterModelReference:FindFirstChild("UpperTorso")or TargetCharacterModelReference:FindFirstChild("Torso")
            local TargetHumanoidInstanceReference=TargetCharacterModelReference:FindFirstChildOfClass("Humanoid")
            if not TargetTorsoPartReference or not TargetHumanoidRootPartReference then local ExistingLineDrawingObjectReference=PlayerLineESPStorageTable[PlayerUserIdValue]if ExistingLineDrawingObjectReference then ExistingLineDrawingObjectReference:Remove()PlayerLineESPStorageTable[PlayerUserIdValue]=nil end local ExistingCircleDrawingObjectReference=PlayerCircleESPStorageTable[PlayerUserIdValue]if ExistingCircleDrawingObjectReference then ExistingCircleDrawingObjectReference:Remove()PlayerCircleESPStorageTable[PlayerUserIdValue]=nil end local ExistingTextDrawingObjectReference=PlayerTextESPStorageTable[PlayerUserIdValue]if ExistingTextDrawingObjectReference then ExistingTextDrawingObjectReference:Remove()PlayerTextESPStorageTable[PlayerUserIdValue]=nil end continue end
            local LocalCharacterModelReference,DistanceToTargetCalculatedValue=LocalPlayerServiceReference.Character,0
            if LocalCharacterModelReference then local LocalHumanoidRootPartReference=LocalCharacterModelReference:FindFirstChild("HumanoidRootPart")if LocalHumanoidRootPartReference then DistanceToTargetCalculatedValue=(TargetHumanoidRootPartReference.Position-LocalHumanoidRootPartReference.Position).Magnitude if DistanceToTargetCalculatedValue>500 then local ExistingLineDrawingObjectReference=PlayerLineESPStorageTable[PlayerUserIdValue]if ExistingLineDrawingObjectReference then ExistingLineDrawingObjectReference:Remove()PlayerLineESPStorageTable[PlayerUserIdValue]=nil end local ExistingCircleDrawingObjectReference=PlayerCircleESPStorageTable[PlayerUserIdValue]if ExistingCircleDrawingObjectReference then ExistingCircleDrawingObjectReference:Remove()PlayerCircleESPStorageTable[PlayerUserIdValue]=nil end local ExistingTextDrawingObjectReference=PlayerTextESPStorageTable[PlayerUserIdValue]if ExistingTextDrawingObjectReference then ExistingTextDrawingObjectReference:Remove()PlayerTextESPStorageTable[PlayerUserIdValue]=nil end continue end end end
            local TargetTorsoScreenPositionVectorValue,IsTargetOnScreenBooleanState=CurrentCameraInstanceReference:WorldToViewportPoint(TargetTorsoPartReference.Position)
            if not IsTargetOnScreenBooleanState then local ExistingLineDrawingObjectReference=PlayerLineESPStorageTable[PlayerUserIdValue]if ExistingLineDrawingObjectReference then ExistingLineDrawingObjectReference:Remove()PlayerLineESPStorageTable[PlayerUserIdValue]=nil end local ExistingCircleDrawingObjectReference=PlayerCircleESPStorageTable[PlayerUserIdValue]if ExistingCircleDrawingObjectReference then ExistingCircleDrawingObjectReference:Remove()PlayerCircleESPStorageTable[PlayerUserIdValue]=nil end local ExistingTextDrawingObjectReference=PlayerTextESPStorageTable[PlayerUserIdValue]if ExistingTextDrawingObjectReference then ExistingTextDrawingObjectReference:Remove()PlayerTextESPStorageTable[PlayerUserIdValue]=nil end continue end
            local ESPColorValue,CurrentHealthValue=Color3.new(0,0.5,1),100
            if TargetHumanoidInstanceReference then 
                CurrentHealthValue=math.floor(TargetHumanoidInstanceReference.Health)
                if TargetHumanoidInstanceReference.Health<=0 then ESPColorValue=Color3.new(1,1,1)
                elseif LocalPlayerServiceReference:IsFriendsWith(PlayerInstanceElementReference.UserId)or(PlayerInstanceElementReference.Team and PlayerInstanceElementReference.Team==LocalPlayerServiceReference.Team)then ESPColorValue=Color3.new(0,1,0)
                else local EquippedToolInstanceReference=TargetCharacterModelReference:FindFirstChildOfClass("Tool")if EquippedToolInstanceReference then ESPColorValue=Color3.new(1,0,0)end end
            end
            local CurrentLineDrawingObjectReference=PlayerLineESPStorageTable[PlayerUserIdValue]
            if not CurrentLineDrawingObjectReference then CurrentLineDrawingObjectReference=Drawing.new("Line")CurrentLineDrawingObjectReference.Thickness,CurrentLineDrawingObjectReference.Transparency,CurrentLineDrawingObjectReference.Visible=1,1,true PlayerLineESPStorageTable[PlayerUserIdValue]=CurrentLineDrawingObjectReference end
            CurrentLineDrawingObjectReference.Color=ESPColorValue
            CurrentLineDrawingObjectReference.From,CurrentLineDrawingObjectReference.To=ScreenBottomCenterPositionVectorValue,Vector2.new(TargetTorsoScreenPositionVectorValue.X,TargetTorsoScreenPositionVectorValue.Y)
            local CurrentCircleDrawingObjectReference=PlayerCircleESPStorageTable[PlayerUserIdValue]
            if not CurrentCircleDrawingObjectReference then CurrentCircleDrawingObjectReference=Drawing.new("Circle")CurrentCircleDrawingObjectReference.Radius,CurrentCircleDrawingObjectReference.Thickness,CurrentCircleDrawingObjectReference.Filled,CurrentCircleDrawingObjectReference.Transparency,CurrentCircleDrawingObjectReference.Visible=2,1,false,1,true PlayerCircleESPStorageTable[PlayerUserIdValue]=CurrentCircleDrawingObjectReference end
            CurrentCircleDrawingObjectReference.Color=ESPColorValue
            CurrentCircleDrawingObjectReference.Position=Vector2.new(TargetTorsoScreenPositionVectorValue.X,TargetTorsoScreenPositio
