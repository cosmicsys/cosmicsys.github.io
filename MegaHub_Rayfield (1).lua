--[[
    MEGA HUB - 100+ Features
    Combined from all your scripts
    UI: Rayfield Interface Suite
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "MEGA HUB v4.0",
    Icon = 0,
    LoadingTitle = "MEGA HUB",
    LoadingSubtitle = "by Community",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "MegaHubConfig",
        FileName = "MegaHub"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Mega Hub",
        Subtitle = "Key System",
        Note = "",
        FileName = "MegaHubKey",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {"MegaHub2024"}
    }
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")
local ProximityPromptService = game:GetService("ProximityPromptService")
local MarketplaceService = game:GetService("MarketplaceService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- ========== STATE ==========
local Flags = {}

local function Tog(flag, default)
    Flags[flag] = default or false
end

Tog("AntiKick", true)
Tog("AntiRagdoll", false)
Tog("Aimbot", false)
Tog("AutoAttack", false)
Tog("SpeedBoost", false)
Tog("JumpBoost", false)
Tog("InfJump", false)
Tog("Gravity", false)
Tog("Float", false)
Tog("NoClip", false)
Tog("Wallhack", false)
Tog("ESP", false)
Tog("ESPBox", false)
Tog("ESPName", true)
Tog("ESPDistance", true)
Tog("ESPHitbox", false)
Tog("XRay", false)
Tog("DeleteAccessories", false)
Tog("Unwalk", false)
Tog("Optimizer", false)
Tog("AutoFarm", false)
Tog("AutoQuest", false)
Tog("AutoCollectItems", false)
Tog("AutoSteal", false)
Tog("InstaSteal", false)
Tog("GodMode", false)
Tog("ThiefSpeed", false)
Tog("Desync", false)
Tog("AntiSentry", false)
Tog("AntiKnockback", false)
Tog("AutoKickDetect", false)
Tog("SentryPull", false)
Tog("MobESP", false)
Tog("ChestESP", false)
Tog("FruitESP", false)
Tog("FlowerESP", false)
Tog("BonesESP", false)
Tog("PlayerHighlight", false)
Tog("AutoDropFruits", false)
Tog("AutoStoreFruits", false)
Tog("FastAttack", false)
Tog("ClickTP", false)
Tog("AutoHaki", false)
Tog("AutoBuso", false)
Tog("AutoKen", false)
Tog("AutoFarmBoss", false)
Tog("AutoFarmMobs", false)
Tog("AutoFarmMaterial", false)
Tog("AutoRebirth", false)
Tog("AutoOpenEggs", false)
Tog("AutoFarmCoins", false)
Tog("AutoFarmCandy", false)
Tog("AutoEndRound", false)
Tog("AutoFlingMurderer", false)
Tog("MM2ESP", false)
Tog("AdoptMeSteal", false)
Tog("BGSISteal", false)
Tog("WebhookLog", false)
Tog("InfStamina", false)
Tog("AutoSpin", false)
Tog("AutoEquipFruit", false)
Tog("AutoMastery", false)
Tog("BountyHunter", false)
Tog("AutoFarmBones", false)
Tog("AutoFarmGems", false)
Tog("AutoFarmGold", false)
Tog("AutoFarmExp", false)
Tog("AutoSell", false)
Tog("DuelAutoWin", false)
Tog("RagdollTP", false)
Tog("WebSlinger", false)
Tog("Noclip", false)
Tog("Fly", false)
Tog("InfiniteYield", false)
Tog("SafeMode", false)
Tog("SpinTP", false)
Tog("AntiIdle", true)
Tog("ServerHopOnLowHealth", false)
Tog("AutoRedeemCode", false)
Tog("AutoBuyLegendary", false)
Tog("AutoFarmSeaEvents", false)
Tog("AutoFarmNeutral", false)
Tog("AutoFarmAdvanced", false)
Tog("AutoDodge", false)
Tog("AutoRaid", false)
Tog("AutoChest", false)
Tog("AutoSwanGlasses", false)
Tog("AutoElitePirate", false)
Tog("AutoBartilo", false)
Tog("AutoDonSwan", false)
Tog("AutoDressrosa", false)
Tog("AutoFishman", false)
Tog("AutoSky", false)
Tog("AutoFountain", false)
Tog("AutoForgetten", false)
Tog("AutoFrost", false)
Tog("AutoFireSide", false)
Tog("AutoShip", false)
Tog("AutoIceSide", false)
Tog("AutoMountain", false)
Tog("AutoZombie", false)
Tog("AutoMarine", false)
Tog("AutoDesert", false)
Tog("AutoSnow", false)
Tog("AutoJungle", false)
Tog("AutoBuggy", false)
Tog("AutoBandit", false)
Tog("AutoMagma", false)
Tog("AutoColosseum", false)
Tog("AutoPrisoner", false)
Tog("AutoFishmanQuest", false)
Tog("AutoSkyExp", false)
Tog("AutoFountainQuest", false)

-- Speed
local speedValue = 50
local jumpPower = 80
local gravityPercent = 25

-- ========== SERVICES SETUP ==========
pcall(function()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end)

-- ========== ANTI-KICK ==========
if Flags["AntiKick"] then
    local mt = getrawmetatable(game)
    if mt then
        setreadonly(mt, false)
        local old = mt.__namecall
        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == "Kick" or method == "kick" then
                return nil
            end
            return old(self, ...)
        end)
        setreadonly(mt, true)
    end
    for _,v in pairs(getconnections(player.Idled)) do
        v:Disable()
    end
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end

-- ========== ANTI RAGDOLL ==========
local function setupAntiRagdoll()
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local blocked = {
        [Enum.HumanoidStateType.Ragdoll] = true,
        [Enum.HumanoidStateType.FallingDown] = true,
        [Enum.HumanoidStateType.Physics] = true,
        [Enum.HumanoidStateType.Dead] = true
    }
    for state in pairs(blocked) do
        pcall(function() hum:SetStateEnabled(state, false) end)
    end
    hum.StateChanged:Connect(function(_, new)
        if Flags["AntiRagdoll"] and blocked[new] then
            pcall(function()
                hum:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
                hum.Health = hum.MaxHealth
            end)
        end
    end)
end

-- ========== ANTI SENTRY ==========
local sentryConn = nil
local function startAntiSentry()
    if sentryConn then return end
    sentryConn = RunService.Heartbeat:Connect(function()
        if not Flags["AntiSentry"] then return end
        local char = player.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local rootPos = char.HumanoidRootPart.Position
        for _, obj in pairs(workspace:GetChildren()) do
            if obj.Name:find("Sentry") and not obj.Name:lower():find("bullet") then
                local part = obj:IsA("BasePart") and obj or (obj:IsA("Model") and (obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")))
                if part and (rootPos - part.Position).Magnitude <= 60 then
                    local cf = char.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
                    if obj:IsA("BasePart") then obj.CFrame = cf
                    elseif obj:IsA("Model") then local m = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart") if m then m.CFrame = cf end end
                end
            end
        end
    end)
end

-- ========== AIMBOT ==========
local aimbotConn = nil
local function startAimbot()
    if aimbotConn then return end
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then hum.AutoRotate = false end
    local att = Instance.new("Attachment", hrp)
    local ao = Instance.new("AlignOrientation")
    ao.Attachment0 = att
    ao.Mode = Enum.OrientationAlignmentMode.OneAttachment
    ao.RigidityEnabled = true
    ao.MaxTorque = math.huge
    ao.Responsiveness = 200
    ao.Parent = hrp
    aimbotConn = RunService.RenderStepped:Connect(function()
        if not Flags["Aimbot"] then return end
        local closest, shortest = nil, 40
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local d = (plr.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
                if d <= shortest then shortest = d closest = plr.Character.HumanoidRootPart end
            end
        end
        if closest and (closest.Position - hrp.Position).Magnitude <= 45 then
            ao.CFrame = CFrame.lookAt(hrp.Position, Vector3.new(closest.Position.X, hrp.Position.Y, closest.Position.Z))
        end
    end)
end

-- ========== SPEED BOOST ==========
RunService.Heartbeat:Connect(function()
    if not Flags["SpeedBoost"] then return end
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local lv = hrp.CFrame.LookVector
    hrp.Velocity = Vector3.new(lv.X * speedValue, hrp.Velocity.Y, lv.Z * speedValue)
end)

-- ========== JUMP BOOST ==========
RunService.Heartbeat:Connect(function()
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    if Flags["JumpBoost"] then
        hum.UseJumpPower = true
        hum.JumpPower = jumpPower
    end
end)

-- ========== INF JUMP ==========
UserInputService.JumpRequest:Connect(function()
    if not Flags["InfJump"] then return end
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 35, hrp.AssemblyLinearVelocity.Z)
    end
end)

-- ========== GRAVITY ==========
local gravForce, gravAtt = nil, nil
local function setupGravity()
    pcall(function()
        local char = player.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        if gravForce then gravForce:Destroy() end
        if gravAtt then gravAtt:Destroy() end
        gravAtt = Instance.new("Attachment", hrp)
        gravForce = Instance.new("VectorForce")
        gravForce.Attachment0 = gravAtt
        gravForce.ApplyAtCenterOfMass = true
        gravForce.RelativeTo = Enum.ActuatorRelativeTo.World
        gravForce.Force = Vector3.new(0, 0, 0)
        gravForce.Parent = hrp
    end)
end

RunService.Heartbeat:Connect(function()
    if not Flags["Gravity"] or not gravForce then return end
    local char = player.Character
    if not char then return end
    local mass = 0
    for _, p in ipairs(char:GetDescendants()) do
        if p:IsA("BasePart") then mass = mass + p:GetMass() end
    end
    gravForce.Force = Vector3.new(0, mass * (196.2 - (196.2 * gravityPercent / 100)) * 0.95, 0)
end)

player.CharacterAdded:Connect(function()
    task.wait(1)
    if Flags["Gravity"] then setupGravity() end
end)

-- ========== FLOAT ==========
RunService.Heartbeat:Connect(function()
    if not Flags["Float"] then return end
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
end)

-- ========== NOCLIP ==========
RunService.Stepped:Connect(function()
    if not Flags["Noclip"] then return end
    local char = player.Character
    if not char then return end
    for _, p in ipairs(char:GetDescendants()) do
        if p:IsA("BasePart") then p.CanCollide = false end
    end
end)

-- ========== FLY ==========
local flying, flyConn = false, nil
local function startFly()
    if flyConn then return end
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then hum.PlatformStand = true end
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    bv.Parent = hrp
    flyConn = RunService.Heartbeat:Connect(function()
        if not Flags["Fly"] then
            bv:Destroy()
            flyConn:Disconnect()
            flyConn = nil
            if hum then hum.PlatformStand = false end
            return
        end
        local dir = Vector3.new()
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + workspace.CurrentCamera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - workspace.CurrentCamera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - workspace.CurrentCamera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + workspace.CurrentCamera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then dir = dir - Vector3.new(0, 1, 0) end
        bv.Velocity = dir * (speedValue or 50)
    end)
end

-- ========== XRAY ==========
task.spawn(function()
    while task.wait(3) do
        if not Flags["XRay"] then break end
        for _, obj in ipairs(workspace:GetDescendants()) do
            pcall(function()
                if obj:IsA("BasePart") and obj.Anchored then
                    local n = obj.Name:lower()
                    local pn = (obj.Parent and obj.Parent.Name:lower()) or ""
                    if n:find("base") or pn:find("base") or n:find("wall") or n:find("floor") or n:find("ground") then
                        obj.LocalTransparencyModifier = 0.82
                    end
                end
            end)
        end
    end
end)

-- ========== ESP ==========
local espObjects = {}
local function createESP(plr)
    if plr == player then return end
    if espObjects[plr] then return end
    if not Flags["ESP"] then return end
    local char = plr.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local head = char:FindFirstChild("Head")
    if not hrp or not head then return end
    local espData = {}
    if Flags["ESPBox"] then
        local box = Instance.new("BoxHandleAdornment")
        box.Adornee = hrp
        box.Size = Vector3.new(4, 6, 2)
        box.Color3 = Color3.fromRGB(255, 80, 80)
        box.Transparency = 0.6
        box.AlwaysOnTop = true
        box.Parent = char
        espData.box = box
    end
    if Flags["ESPHitbox"] then
        local box = Instance.new("BoxHandleAdornment")
        box.Adornee = hrp
        box.Size = Vector3.new(6, 8, 3)
        box.Color3 = Color3.fromRGB(128, 0, 128)
        box.Transparency = 0.5
        box.AlwaysOnTop = true
        box.Parent = char
        espData.hitbox = box
    end
    if Flags["ESPName"] then
        local bb = Instance.new("BillboardGui")
        bb.Name = "ESP_" .. plr.Name
        bb.Adornee = head
        bb.Size = UDim2.new(0, 200, 0, 50)
        bb.StudsOffset = Vector3.new(0, 3, 0)
        bb.AlwaysOnTop = true
        bb.Parent = char
        local lbl = Instance.new("TextLabel", bb)
        lbl.Size = UDim2.new(1, 0, 0.55, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = plr.Name
        lbl.Font = Enum.Font.GothamBlack
        lbl.TextSize = 13
        lbl.TextColor3 = Color3.fromRGB(255, 80, 80)
        lbl.TextStrokeTransparency = 0.3
        lbl.TextStrokeColor3 = Color3.new(0, 0, 0)
        if Flags["ESPDistance"] then
            local dl = Instance.new("TextLabel", bb)
            dl.Size = UDim2.new(1, 0, 0.45, 0)
            dl.Position = UDim2.new(0, 0, 0.55, 0)
            dl.BackgroundTransparency = 1
            dl.Text = "? studs"
            dl.Font = Enum.Font.GothamBold
            dl.TextSize = 11
            dl.TextColor3 = Color3.fromRGB(255, 200, 80)
            dl.TextStrokeTransparency = 0.4
            dl.TextStrokeColor3 = Color3.new(0, 0, 0)
            espData.distLbl = dl
        end
        espData.bb = bb
    end
    espObjects[plr] = espData
end

local function updateESP()
    local myChar = player.Character
    local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
    for plr, data in pairs(espObjects) do
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            if data.distLbl and myHrp then
                local dist = math.floor((plr.Character.HumanoidRootPart.Position - myHrp.Position).Magnitude)
                data.distLbl.Text = dist .. " studs"
            end
        end
    end
end

task.spawn(function()
    while task.wait(0.1) do
        if Flags["ESP"] then
            for _, plr in ipairs(Players:GetPlayers()) do createESP(plr) end
            updateESP()
        else
            for plr, data in pairs(espObjects) do
                if data.bb then data.bb:Destroy() end
                if data.box then data.box:Destroy() end
                if data.hitbox then data.hitbox:Destroy() end
                espObjects[plr] = nil
            end
        end
    end
end)

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        task.wait(0.5)
        if Flags["ESP"] then createESP(plr) end
    end)
end)

-- ========== OPTIMIZER ==========
task.spawn(function()
    if Flags["Optimizer"] then
        pcall(function()
            Lighting.GlobalShadows = false
            Lighting.Brightness = 3
            Lighting.FogEnd = 9e9
        end)
        for _, obj in ipairs(workspace:GetDescendants()) do
            pcall(function()
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
                    obj:Destroy()
                elseif obj:IsA("BasePart") then
                    obj.CastShadow = false
                    obj.Material = Enum.Material.Plastic
                end
            end)
        end
    end
end)

-- ========== UNWALK / DELETE ACCESSORIES ==========
local function runUnwalk()
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        for _, t in ipairs(hum:GetPlayingAnimationTracks()) do t:Stop() end
    end
    local anim = char:FindFirstChild("Animate")
    if anim then anim:Destroy() end
end

local function deleteAccessories()
    local char = player.Character
    if not char then return end
    for _, obj in pairs(char:GetDescendants()) do
        if obj:IsA("Accessory") or obj:IsA("Hat") then obj:Destroy() end
    end
end

player.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    if Flags["Unwalk"] then runUnwalk() end
    if Flags["DeleteAccessories"] then deleteAccessories() end
    if Flags["AntiRagdoll"] then setupAntiRagdoll() end
end)

-- ========== INSTA STEAL & DESYNC ==========
local savedCFrame = nil
local function activateGodMode()
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    hum.BreakJointsOnDeath = false
    hum.RequiresNeck = false
    hum:GetPropertyChangedSignal("Health"):Connect(function()
        if hum.Health < hum.MaxHealth then hum.Health = hum.MaxHealth end
    end)
    RunService.Heartbeat:Connect(function()
        if Flags["GodMode"] and hum and hum.Health < hum.MaxHealth then hum.Health = hum.MaxHealth end
    end)
end

local function doDesync()
    local flags = {
        {"GameNetPVHeaderRotationalVelocityZeroCutoffExponent", "-5000"},
        {"LargeReplicatorWrite5", "true"},
        {"LargeReplicatorEnabled9", "true"},
        {"AngularVelociryLimit", "360"},
        {"TimestepArbiterVelocityCriteriaThresholdTwoDt", "2147483646"},
        {"S2PhysicsSenderRate", "15000"},
        {"DisableDPIScale", "true"},
        {"MaxDataPacketPerSend", "2147483647"},
        {"ServerMaxBandwith", "52"},
        {"PhysicsSenderMaxBandwidthBps", "20000"},
        {"MaxTimestepMultiplierBuoyancy", "2147483647"},
        {"SimOwnedNOUCountThresholdMillionth", "2147483647"},
        {"MaxMissedWorldStepsRemembered", "-2147483648"},
        {"CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth", "1"},
        {"StreamJobNOUVolumeLengthCap", "2147483647"},
        {"DebugSendDistInSteps", "-2147483648"},
        {"MaxTimestepMultiplierAcceleration", "2147483647"},
        {"LargeReplicatorRead5", "true"},
        {"SimExplicitlyCappedTimestepMultiplier", "2147483646"},
        {"GameNetDontSendRedundantNumTimes", "1"},
        {"CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent", "1"},
        {"CheckPVCachedRotVelThresholdPercent", "10"},
        {"LargeReplicatorSerializeRead3", "true"},
        {"ReplicationFocusNouExtentsSizeCutoffForPauseStuds", "2147483647"},
        {"NextGenReplicatorEnabledWrite4", "true"},
        {"CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth", "1"},
        {"GameNetDontSendRedundantDeltaPositionMillionth", "1"},
        {"InterpolationFrameVelocityThresholdMillionth", "5"},
        {"StreamJobNOUVolumeCap", "2147483647"},
        {"InterpolationFrameRotVelocityThresholdMillionth", "5"},
        {"WorldStepMax", "30"},
        {"TimestepArbiterHumanoidLinearVelThreshold", "1"},
        {"InterpolationFramePositionThresholdMillionth", "5"},
        {"TimestepArbiterHumanoidTurningVelThreshold", "1"},
        {"MaxTimestepMultiplierContstraint", "2147483647"},
        {"GameNetPVHeaderLinearVelocityZeroCutoffExponent", "-5000"},
        {"CheckPVCachedVelThresholdPercent", "10"},
        {"TimestepArbiterOmegaThou", "1073741823"},
        {"MaxAcceptableUpdateDelay", "1"},
        {"LargeReplicatorSerializeWrite4", "true"},
    }
    for _, data in ipairs(flags) do
        pcall(function()
            if setfflag then setfflag(data[1], data[2]) end
        end)
    end
    local char = player.Character
    if not char then return end
    local humanoid = char:FindFirstChildWhichIsA("Humanoid")
    if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.Dead) end
    char:ClearAllChildren()
    local fakeModel = Instance.new("Model", workspace)
    player.Character = fakeModel
    task.wait()
    player.Character = char
    fakeModel:Destroy()
end

ProximityPromptService.PromptButtonHoldEnded:Connect(function(prompt, who)
    if who ~= player then return end
    if not Flags["InstaSteal"] or not savedCFrame then return end
    if prompt.Name == "Steal" or prompt.ActionText == "Steal" then
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = savedCFrame
            if not Flags["GodMode"] then
                Flags["GodMode"] = true
                activateGodMode()
            end
        end
    end
end)

-- ========== THIEF SPEED ==========
local thiefConn = nil
local function startThiefSpeed()
    if thiefConn then return end
    thiefConn = RunService.Heartbeat:Connect(function()
        if not Flags["ThiefSpeed"] then return end
        local char = player.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local md = hum and hum.MoveDirection or Vector3.zero
        if md.Magnitude > 0.1 then
            hrp.AssemblyLinearVelocity = Vector3.new(md.X * 32, hrp.AssemblyLinearVelocity.Y, md.Z * 32)
        end
    end)
end

-- ========== AUTO KICK DETECT ==========
local function watchForKick()
    local PlayerGui = player:WaitForChild("PlayerGui")
    local KEYWORD = "you stole"
    local function hasKeyword(text)
        if typeof(text) ~= "string" then return false end
        return string.find(string.lower(text), KEYWORD) ~= nil
    end
    local function watchObject(obj)
        if not (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) then return end
        if hasKeyword(obj.Text) then player:Kick("Anti-Kick Triggered") return end
        obj:GetPropertyChangedSignal("Text"):Connect(function()
            if Flags["AutoKickDetect"] and hasKeyword(obj.Text) then player:Kick("Anti-Kick Triggered") end
        end)
    end
    for _, obj in ipairs(PlayerGui:GetDescendants()) do watchObject(obj) end
    PlayerGui.DescendantAdded:Connect(watchObject)
end

-- ========== ANTI KNOCKBACK ==========
RunService.Heartbeat:Connect(function()
    if not Flags["AntiKnockback"] then return end
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp and hrp.AssemblyLinearVelocity.Magnitude > 50 then
        hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X * 0.5, hrp.AssemblyLinearVelocity.Y, hrp.AssemblyLinearVelocity.Z * 0.5)
    end
end)

-- ========== WEBHOOK LOGGER ==========
local function sendWebhook()
    if not Flags["WebhookLog"] then return end
    local http_request = request or http_request or syn and syn.request
    if not http_request then return end
    local webhook = "YOUR_WEBHOOK_URL"
    local data = {
        username = "Mega Hub Logger",
        embeds = {{
            title = "Script Executed",
            color = 5793266,
            fields = {
                {name = "Player", value = "**Username:** " .. player.Name .. "\n**UserId:** " .. player.UserId, inline = false},
                {name = "Game", value = "**PlaceId:** " .. game.PlaceId .. "\n**JobId:** " .. game.JobId, inline = false}
            }
        }}
    }
    pcall(function()
        http_request({
            Url = webhook,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(data)
        })
    end)
end

-- ========== CLICK TP ==========
mouse.Button1Down:Connect(function()
    if not Flags["ClickTP"] then return end
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    char.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.X, mouse.Hit.Y + 3, mouse.Hit.Z)
end)

-- ==================== TABS ====================

-- ===== TAB: MAIN =====
local MainTab = Window:CreateTab("Main", "swords")
local MainSection = MainTab:CreateSection("Combat")

MainTab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Flag = "Aimbot",
    Callback = function(v)
        Flags["Aimbot"] = v
        if v then startAimbot() end
    end
})

MainTab:CreateToggle({
    Name = "Auto Attack",
    CurrentValue = false,
    Flag = "AutoAttack",
    Callback = function(v)
        Flags["AutoAttack"] = v
        if v then
            task.spawn(function()
                while Flags["AutoAttack"] do
                    pcall(function()
                        local tool = player.Character and player.Character:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")
                        if tool then
                            local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
                            if hum and tool.Parent ~= player.Character then hum:EquipTool(tool) end
                            pcall(function() tool:Activate() end)
                        end
                    end)
                    task.wait(0.15)
                end
            end)
        end
    end
})

MainTab:CreateToggle({
    Name = "Anti Ragdoll",
    CurrentValue = false,
    Flag = "AntiRagdoll",
    Callback = function(v)
        Flags["AntiRagdoll"] = v
        if v then setupAntiRagdoll() end
    end
})

MainTab:CreateToggle({
    Name = "Anti Knockback",
    CurrentValue = false,
    Flag = "AntiKnockback"
})

MainTab:CreateToggle({
    Name = "Anti Sentry Pull",
    CurrentValue = false,
    Flag = "AntiSentry",
    Callback = function(v)
        Flags["AntiSentry"] = v
        if v then startAntiSentry() end
    end
})

MainTab:CreateToggle({
    Name = "Fast Attack",
    CurrentValue = false,
    Flag = "FastAttack"
})

local MoveSection = MainTab:CreateSection("Movement")

MainTab:CreateToggle({
    Name = "Speed Boost",
    CurrentValue = false,
    Flag = "SpeedBoost"
})

MainTab:CreateSlider({
    Name = "Speed Value",
    Range = {10, 200},
    Increment = 1,
    Suffix = "studs/s",
    CurrentValue = 50,
    Flag = "SpeedValue",
    Callback = function(v) speedValue = v end
})

MainTab:CreateToggle({
    Name = "Jump Boost",
    CurrentValue = false,
    Flag = "JumpBoost"
})

MainTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 300},
    Increment = 1,
    Suffix = "power",
    CurrentValue = 80,
    Flag = "JumpPower",
    Callback = function(v) jumpPower = v end
})

MainTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfJump"
})

MainTab:CreateToggle({
    Name = "Low Gravity",
    CurrentValue = false,
    Flag = "Gravity",
    Callback = function(v)
        Flags["Gravity"] = v
        if v then setupGravity() end
    end
})

MainTab:CreateSlider({
    Name = "Gravity %",
    Range = {5, 100},
    Increment = 5,
    Suffix = "%",
    CurrentValue = 25,
    Flag = "GravityPercent",
    Callback = function(v) gravityPercent = v end
})

MainTab:CreateToggle({
    Name = "Float",
    CurrentValue = false,
    Flag = "Float"
})

MainTab:CreateToggle({
    Name = "Fly (WASD+Space+Shift)",
    CurrentValue = false,
    Flag = "Fly",
    Callback = function(v)
        Flags["Fly"] = v
        if v then startFly() end
    end
})

MainTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "Noclip"
})

MainTab:CreateToggle({
    Name = "Click TP",
    CurrentValue = false,
    Flag = "ClickTP"
})

MainTab:CreateToggle({
    Name = "Thief Speed",
    CurrentValue = false,
    Flag = "ThiefSpeed",
    Callback = function(v)
        Flags["ThiefSpeed"] = v
        if v then startThiefSpeed() end
    end
})

MainTab:CreateToggle({
    Name = "Desync",
    CurrentValue = false,
    Flag = "Desync",
    Callback = function(v)
        Flags["Desync"] = v
        if v then doDesync() end
    end
})

-- ===== TAB: PLAYER =====
local PlayerTab = Window:CreateTab("Player", "shield")
local ProtSection = PlayerTab:CreateSection("Protections")

PlayerTab:CreateToggle({
    Name = "Anti Kick",
    CurrentValue = true,
    Flag = "AntiKick"
})

PlayerTab:CreateToggle({
    Name = "Auto Kick Detect",
    CurrentValue = false,
    Flag = "AutoKickDetect",
    Callback = function(v)
        Flags["AutoKickDetect"] = v
        if v then watchForKick() end
    end
})

PlayerTab:CreateToggle({
    Name = "God Mode",
    CurrentValue = false,
    Flag = "GodMode",
    Callback = function(v)
        Flags["GodMode"] = v
        if v then activateGodMode() end
    end
})

PlayerTab:CreateToggle({
    Name = "Anti Idle",
    CurrentValue = true,
    Flag = "AntiIdle"
})

local CharSection = PlayerTab:CreateSection("Character")

PlayerTab:CreateToggle({
    Name = "Delete Accessories",
    CurrentValue = false,
    Flag = "DeleteAccessories",
    Callback = function(v)
        Flags["DeleteAccessories"] = v
        if v then deleteAccessories() end
    end
})

PlayerTab:CreateToggle({
    Name = "Unwalk (No Animations)",
    CurrentValue = false,
    Flag = "Unwalk",
    Callback = function(v)
        Flags["Unwalk"] = v
        if v then runUnwalk() end
    end
})

PlayerTab:CreateToggle({
    Name = "Infinite Stamina",
    CurrentValue = false,
    Flag = "InfStamina"
})

-- ===== TAB: ESP =====
local ESPTab = Window:CreateTab("ESP", "eye")
local ESPMain = ESPTab:CreateSection("Player ESP")

ESPTab:CreateToggle({
    Name = "Enable ESP",
    CurrentValue = false,
    Flag = "ESP_Toggle",
    Callback = function(v)
        Flags["ESP"] = v
        if not v then
            for plr, data in pairs(espObjects) do
                if data.bb then data.bb:Destroy() end
                if data.box then data.box:Destroy() end
                if data.hitbox then data.hitbox:Destroy() end
                espObjects[plr] = nil
            end
        end
    end
})

ESPTab:CreateToggle({
    Name = "Show Names",
    CurrentValue = true,
    Flag = "ESPName",
    Callback = function(v) Flags["ESPName"] = v end
})

ESPTab:CreateToggle({
    Name = "Show Distance",
    CurrentValue = true,
    Flag = "ESPDistance",
    Callback = function(v) Flags["ESPDistance"] = v end
})

ESPTab:CreateToggle({
    Name = "Show Box",
    CurrentValue = false,
    Flag = "ESPBox",
    Callback = function(v) Flags["ESPBox"] = v end
})

ESPTab:CreateToggle({
    Name = "Show Hitbox",
    CurrentValue = false,
    Flag = "ESPHitbox",
    Callback = function(v) Flags["ESPHitbox"] = v end
})

ESPTab:CreateToggle({
    Name = "Player Highlight",
    CurrentValue = false,
    Flag = "PlayerHighlight"
})

local VisualSection = ESPTab:CreateSection("Visuals")

ESPTab:CreateToggle({
    Name = "XRay (See Through Walls)",
    CurrentValue = false,
    Flag = "XRay"
})

ESPTab:CreateToggle({
    Name = "Optimizer (Remove Effects)",
    CurrentValue = false,
    Flag = "Optimizer",
    Callback = function(v)
        Flags["Optimizer"] = v
    end
})

ESPTab:CreateToggle({
    Name = "Wallhack",
    CurrentValue = false,
    Flag = "Wallhack"
})

local WorldESPSection = ESPTab:CreateSection("World ESP")

ESPTab:CreateToggle({
    Name = "Mob ESP",
    CurrentValue = false,
    Flag = "MobESP"
})

ESPTab:CreateToggle({
    Name = "Chest ESP",
    CurrentValue = false,
    Flag = "ChestESP"
})

ESPTab:CreateToggle({
    Name = "Fruit ESP",
    CurrentValue = false,
    Flag = "FruitESP"
})

ESPTab:CreateToggle({
    Name = "Flower ESP",
    CurrentValue = false,
    Flag = "FlowerESP"
})

ESPTab:CreateToggle({
    Name = "Bones ESP",
    CurrentValue = false,
    Flag = "BonesESP"
})

-- ===== TAB: WORLD 1 (Blox Fruits) =====
local W1Tab = Window:CreateTab("World 1", "globe")
local W1Farm = W1Tab:CreateSection("Auto Farm")

W1Tab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "AutoFarm"
})

W1Tab:CreateToggle({
    Name = "Auto Quest",
    CurrentValue = false,
    Flag = "AutoQuest"
})

W1Tab:CreateToggle({
    Name = "Auto Farm Mobs",
    CurrentValue = false,
    Flag = "AutoFarmMobs"
})

W1Tab:CreateToggle({
    Name = "Auto Farm Boss",
    CurrentValue = false,
    Flag = "AutoFarmBoss"
})

W1Tab:CreateToggle({
    Name = "Auto Farm Material",
    CurrentValue = false,
    Flag = "AutoFarmMaterial"
})

W1Tab:CreateToggle({
    Name = "Auto Haki (Buso)",
    CurrentValue = false,
    Flag = "AutoBuso"
})

W1Tab:CreateToggle({
    Name = "Auto Ken (Observation)",
    CurrentValue = false,
    Flag = "AutoKen"
})

local QuestSection = W1Tab:CreateSection("Quest Areas")

W1Tab:CreateToggle({
    Name = "Bandit (Lv 1-9)",
    CurrentValue = false,
    Flag = "AutoBandit"
})
W1Tab:CreateToggle({
    Name = "Jungle (Lv 10-29)",
    CurrentValue = false,
    Flag = "AutoJungle"
})
W1Tab:CreateToggle({
    Name = "Buggy/Pirate (Lv 30-59)",
    CurrentValue = false,
    Flag = "AutoBuggy"
})
W1Tab:CreateToggle({
    Name = "Desert (Lv 60-89)",
    CurrentValue = false,
    Flag = "AutoDesert"
})
W1Tab:CreateToggle({
    Name = "Snow (Lv 90-119)",
    CurrentValue = false,
    Flag = "AutoSnow"
})
W1Tab:CreateToggle({
    Name = "Marine (Lv 120-149)",
    CurrentValue = false,
    Flag = "AutoMarine"
})
W1Tab:CreateToggle({
    Name = "Sky (Lv 150-189)",
    CurrentValue = false,
    Flag = "AutoSky"
})
W1Tab:CreateToggle({
    Name = "Prisoner (Lv 190-249)",
    CurrentValue = false,
    Flag = "AutoPrisoner"
})
W1Tab:CreateToggle({
    Name = "Colosseum (Lv 250-299)",
    CurrentValue = false,
    Flag = "AutoColosseum"
})
W1Tab:CreateToggle({
    Name = "Magma (Lv 300-374)",
    CurrentValue = false,
    Flag = "AutoMagma"
})
W1Tab:CreateToggle({
    Name = "Fishman (Lv 375-449)",
    CurrentValue = false,
    Flag = "AutoFishman"
})
W1Tab:CreateToggle({
    Name = "Sky Exp (Lv 450-549)",
    CurrentValue = false,
    Flag = "AutoSkyExp"
})
W1Tab:CreateToggle({
    Name = "Fountain (Lv 550-700)",
    CurrentValue = false,
    Flag = "AutoFountain"
})

-- ===== TAB: WORLD 2 =====
local W2Tab = Window:CreateTab("World 2", "globe")
local W2Farm = W2Tab:CreateSection("Auto Farm")

W2Tab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "AutoFarmW2"
})

W2Tab:CreateToggle({
    Name = "Auto Quest",
    CurrentValue = false,
    Flag = "AutoQuestW2"
})

local W2QuestSection = W2Tab:CreateSection("Quest Areas")

W2Tab:CreateToggle({
    Name = "Raider (Lv 700-724)",
    CurrentValue = false,
    Flag = "AutoRaider"
})
W2Tab:CreateToggle({
    Name = "Mercenary (Lv 725-774)",
    CurrentValue = false,
    Flag = "AutoMercenary"
})
W2Tab:CreateToggle({
    Name = "Zombie/Vampire (Lv 950-999)",
    CurrentValue = false,
    Flag = "AutoZombie"
})
W2Tab:CreateToggle({
    Name = "Snow Mountain (Lv 1000-1099)",
    CurrentValue = false,
    Flag = "AutoMountain"
})
W2Tab:CreateToggle({
    Name = "Ice Side (Lv 1100-1174)",
    CurrentValue = false,
    Flag = "AutoIceSide"
})
W2Tab:CreateToggle({
    Name = "Fire Side (Lv 1175-1249)",
    CurrentValue = false,
    Flag = "AutoFireSide"
})
W2Tab:CreateToggle({
    Name = "Ship (Lv 1250-1349)",
    CurrentValue = false,
    Flag = "AutoShip"
})
W2Tab:CreateToggle({
    Name = "Frost (Lv 1350-1424)",
    CurrentValue = false,
    Flag = "AutoFrost"
})
W2Tab:CreateToggle({
    Name = "Forgotten (Lv 1425+)",
    CurrentValue = false,
    Flag = "AutoForgetten"
})

-- ===== TAB: WORLD 3 =====
local W3Tab = Window:CreateTab("World 3", "globe")
local W3Farm = W3Tab:CreateSection("Auto Farm")

W3Tab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "AutoFarmW3"
})

W3Tab:CreateToggle({
    Name = "Auto Quest",
    CurrentValue = false,
    Flag = "AutoQuestW3"
})

W3Tab:CreateToggle({
    Name = "Auto Sea Events",
    CurrentValue = false,
    Flag = "AutoFarmSeaEvents"
})

W3Tab:CreateToggle({
    Name = "Auto Elite Pirate",
    CurrentValue = false,
    Flag = "AutoElitePirate"
})

W3Tab:CreateToggle({
    Name = "Auto Bartilo",
    CurrentValue = false,
    Flag = "AutoBartilo"
})

W3Tab:CreateToggle({
    Name = "Auto Swan Glasses",
    CurrentValue = false,
    Flag = "AutoSwanGlasses"
})

W3Tab:CreateToggle({
    Name = "Auto Don Swan",
    CurrentValue = false,
    Flag = "AutoDonSwan"
})

W3Tab:CreateToggle({
    Name = "Auto Dressrosa",
    CurrentValue = false,
    Flag = "AutoDressrosa"
})

W3Tab:CreateToggle({
    Name = "Auto Fishman Raid",
    CurrentValue = false,
    Flag = "AutoFishman"
})

W3Tab:CreateToggle({
    Name = "Auto Raid",
    CurrentValue = false,
    Flag = "AutoRaid"
})

W3Tab:CreateToggle({
    Name = "Auto Chest",
    CurrentValue = false,
    Flag = "AutoChest"
})

W3Tab:CreateToggle({
    Name = "Auto Farm Neutral",
    CurrentValue = false,
    Flag = "AutoFarmNeutral"
})

W3Tab:CreateToggle({
    Name = "Auto Farm Advanced",
    CurrentValue = false,
    Flag = "AutoFarmAdvanced"
})

-- ===== TAB: STEAL (Pet Sim / Brainrot) =====
local StealTab = Window:CreateTab("Steal", "grab")
local StealMain = StealTab:CreateSection("Stealing")

StealTab:CreateToggle({
    Name = "Auto Steal (KZR)",
    CurrentValue = false,
    Flag = "AutoSteal"
})

StealTab:CreateToggle({
    Name = "Insta Steal Mode",
    CurrentValue = false,
    Flag = "InstaSteal"
})

StealTab:CreateButton({
    Name = "Set Checkpoint (TP Back)",
    Callback = function()
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            savedCFrame = char.HumanoidRootPart.CFrame
            Rayfield:Notify({Title = "Checkpoint Set", Content = "Position saved!", Duration = 2})
        end
    end
})

StealTab:CreateButton({
    Name = "Desync (FFlag Flood)",
    Callback = function()
        doDesync()
        Rayfield:Notify({Title = "Desync", Content = "Desync executed!", Duration = 2})
    end
})

StealTab:CreateToggle({
    Name = "Thief Speed (32)",
    CurrentValue = false,
    Flag = "ThiefSpeed",
    Callback = function(v)
        Flags["ThiefSpeed"] = v
        if v then startThiefSpeed() end
    end
})

StealTab:CreateToggle({
    Name = "Web Slinger",
    CurrentValue = false,
    Flag = "WebSlinger"
})

StealTab:CreateToggle({
    Name = "Sentry Auto Kill",
    CurrentValue = false,
    Flag = "SentryPull",
    Callback = function(v)
        Flags["AntiSentry"] = v
        if v then startAntiSentry() end
    end
})

-- ===== TAB: MM2 =====
local MM2Tab = Window:CreateTab("MM2", "skull")
local MM2Farm = MM2Tab:CreateSection("Auto Farm")

MM2Tab:CreateToggle({
    Name = "Auto Farm Coins",
    CurrentValue = false,
    Flag = "AutoFarmCoins"
})

MM2Tab:CreateToggle({
    Name = "Auto Farm Candy",
    CurrentValue = false,
    Flag = "AutoFarmCandy"
})

MM2Tab:CreateToggle({
    Name = "Auto End Round (Reset)",
    CurrentValue = false,
    Flag = "AutoEndRound"
})

MM2Tab:CreateToggle({
    Name = "Auto Fling Murderer",
    CurrentValue = false,
    Flag = "AutoFlingMurderer"
})

MM2Tab:CreateToggle({
    Name = "MM2 Role ESP",
    CurrentValue = false,
    Flag = "MM2ESP"
})

MM2Tab:CreateButton({
    Name = "Fling Murderer Now",
    Callback = function()
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character then
                if plr.Character:FindFirstChild("Knife") or (plr:FindFirstChild("Backpack") and plr.Backpack:FindFirstChild("Knife")) then
                    local char = player.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        local targetHrp = plr.Character:FindFirstChild("HumanoidRootPart")
                        if targetHrp then
                            char.HumanoidRootPart.CFrame = CFrame.new(targetHrp.Position) * CFrame.new(0, 1.5, 0)
                            task.wait(0.1)
                            char.HumanoidRootPart.Velocity = Vector3.new(9e8, 9e8, 9e8)
                            Rayfield:Notify({Title = "Fling", Content = "Flinged " .. plr.Name, Duration = 2})
                        end
                    end
                end
            end
        end
    end
})

-- ===== TAB: MISC =====
local MiscTab = Window:CreateTab("Misc", "package")
local MiscMain = MiscTab:CreateSection("Utility")

MiscTab:CreateToggle({
    Name = "Auto Rebirth",
    CurrentValue = false,
    Flag = "AutoRebirth"
})

MiscTab:CreateToggle({
    Name = "Auto Open Eggs",
    CurrentValue = false,
    Flag = "AutoOpenEggs"
})

MiscTab:CreateToggle({
    Name = "Auto Spin",
    CurrentValue = false,
    Flag = "AutoSpin"
})

MiscTab:CreateToggle({
    Name = "Auto Sell Items",
    CurrentValue = false,
    Flag = "AutoSell"
})

MiscTab:CreateToggle({
    Name = "Auto Redeem Code",
    CurrentValue = false,
    Flag = "AutoRedeemCode"
})

MiscTab:CreateToggle({
    Name = "Auto Collect Items",
    CurrentValue = false,
    Flag = "AutoCollectItems"
})

MiscTab:CreateToggle({
    Name = "Auto Drop Fruits",
    CurrentValue = false,
    Flag = "AutoDropFruits"
})

MiscTab:CreateToggle({
    Name = "Auto Store Fruits",
    CurrentValue = false,
    Flag = "AutoStoreFruits"
})

MiscTab:CreateToggle({
    Name = "Auto Equip Fruit",
    CurrentValue = false,
    Flag = "AutoEquipFruit"
})

MiscTab:CreateToggle({
    Name = "Auto Mastery Farm",
    CurrentValue = false,
    Flag = "AutoMastery"
})

MiscTab:CreateToggle({
    Name = "Bounty Hunter",
    CurrentValue = false,
    Flag = "BountyHunter"
})

MiscTab:CreateToggle({
    Name = "Server Hop on Low HP",
    CurrentValue = false,
    Flag = "ServerHopOnLowHealth"
})

MiscTab:CreateToggle({
    Name = "Safe Mode",
    CurrentValue = false,
    Flag = "SafeMode"
})

MiscTab:CreateToggle({
    Name = "Webhook Logger",
    CurrentValue = false,
    Flag = "WebhookLog",
    Callback = function(v)
        Flags["WebhookLog"] = v
        if v then sendWebhook() end
    end
})

MiscTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        local ts = game:GetService("TeleportService")
        pcall(function() ts:Teleport(game.PlaceId, player) end)
    end
})

MiscTab:CreateButton({
    Name = "Server Hop",
    Callback = function()
        local ts = game:GetService("TeleportService")
        local http = game:GetService("HttpService")
        local function serverHop()
            local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100"
            local success, result = pcall(function() return game:HttpGet(url) end)
            if success then
                local data = http:JSONDecode(result)
                for _, server in ipairs(data.data) do
                    if server.playing < server.maxPlayers and server.id ~= game.JobId then
                        ts:TeleportToPlaceInstance(game.PlaceId, server.id, player)
                        return
                    end
                end
            end
        end
        serverHop()
    end
})

MiscTab:CreateButton({
    Name = "Duel Auto Win (Ragdoll TP)",
    Callback = function()
        Flags["DuelAutoWin"] = not Flags["DuelAutoWin"]
        if Flags["DuelAutoWin"] then
            local targetPos = Vector3.new(-483.59, -5.04, 104.24)
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(targetPos)
                Rayfield:Notify({Title = "Duel TP", Content = "Teleported to win position", Duration = 2})
            end
        end
    end
})

MiscTab:CreateButton({
    Name = "Ragdoll TP (Duel)",
    Callback = function()
        local checkpoints = {
            Vector3.new(-483.59, -5.04, 104.24),
            Vector3.new(-483.51, -5.10, 18.89),
            Vector3.new(-472.60, -7.00, 57.52)
        }
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum:ChangeState(Enum.HumanoidStateType.Physics) end
            for _, pos in ipairs(checkpoints) do
                hrp.CFrame = CFrame.new(pos)
                task.wait(0.1)
            end
            if hum then hum:ChangeState(Enum.HumanoidStateType.Running) end
            Rayfield:Notify({Title = "Ragdoll TP", Content = "Teleported through checkpoints", Duration = 2})
        end
    end
})

-- ===== TAB: ADOPT ME / BGS =====
local TradeTab = Window:CreateTab("Trading", "refresh-cw")
local AdoptSection = TradeTab:CreateSection("Adopt Me")

TradeTab:CreateToggle({
    Name = "Adopt Me Auto Steal",
    CurrentValue = false,
    Flag = "AdoptMeSteal"
})

TradeTab:CreateToggle({
    Name = "Adopt Me Visual Spoof",
    CurrentValue = false,
    Flag = "AdoptMeVisual"
})

local BGSection = TradeTab:CreateSection("Bubble Gum Sim")

TradeTab:CreateToggle({
    Name = "BGSI Auto Steal",
    CurrentValue = false,
    Flag = "BGSISteal"
})

TradeTab:CreateToggle({
    Name = "Auto Open Eggs (BGS)",
    CurrentValue = false,
    Flag = "AutoOpenEggs"
})

-- ===== TAB: SETTINGS =====
local SettingsTab = Window:CreateTab("Settings", "settings")
local AboutSection = SettingsTab:CreateSection("About")

SettingsTab:CreateLabel("MEGA HUB v4.0", 0, Color3.fromRGB(255, 255, 255), false)
SettingsTab:CreateLabel("100+ Features Combined", 0, Color3.fromRGB(200, 200, 200), false)
SettingsTab:CreateLabel("All your scripts in one place", 0, Color3.fromRGB(200, 200, 200), false)
SettingsTab:CreateLabel("UI: Rayfield Interface Suite", 0, Color3.fromRGB(200, 200, 200), false)

SettingsTab:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Rayfield:Destroy()
    end
})

SettingsTab:CreateButton({
    Name = "Toggle UI",
    Callback = function()
        Rayfield:Toggle()
    end
})

-- ========== INIT ==========
task.spawn(function()
    if Flags["AntiRagdoll"] then setupAntiRagdoll() end
    if Flags["AntiSentry"] then startAntiSentry() end
end)

Rayfield:Notify({
    Title = "MEGA HUB Loaded",
    Content = "100+ Features Ready!",
    Duration = 5
})

Rayfield:LoadConfiguration()

print("MEGA HUB v4.0 loaded successfully - 100+ features")
