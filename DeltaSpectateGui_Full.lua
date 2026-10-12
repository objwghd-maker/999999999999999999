local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeltaSpectateGui"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 220, 0, 300)
MainFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 150, 255)
UIStroke.Thickness = 1.5
UIStroke.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -95, 0, 35)
Title.Position = UDim2.new(0, 5, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "PLAYER SPECTATE"
Title.TextColor3 = Color3.fromRGB(0, 200, 255)
Title.TextSize = 14
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 25, 0, 25)
ToggleButton.Position = UDim2.new(1, -30, 0, 5)
ToggleButton.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
ToggleButton.Text = "-"
ToggleButton.TextColor3 = Color3.fromRGB(0, 200, 255)
ToggleButton.TextSize = 16
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Parent = MainFrame

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 6)
ToggleCorner.Parent = ToggleButton

local SaveButton = Instance.new("TextButton")
SaveButton.Name = "SaveButton"
SaveButton.Size = UDim2.new(0, 25, 0, 25)
SaveButton.Position = UDim2.new(1, -55, 0, 5)
SaveButton.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
SaveButton.Text = "💻"
SaveButton.TextSize = 14
SaveButton.Font = Enum.Font.Gotham
SaveButton.Parent = MainFrame

local SaveCorner = Instance.new("UICorner")
SaveCorner.CornerRadius = UDim.new(0, 6)
SaveCorner.Parent = SaveButton

local TeleportButton = Instance.new("TextButton")
TeleportButton.Name = "TeleportButton"
TeleportButton.Size = UDim2.new(0, 25, 0, 25)
TeleportButton.Position = UDim2.new(1, -80, 0, 5)
TeleportButton.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
TeleportButton.Text = "🤖"
TeleportButton.TextSize = 14
TeleportButton.Font = Enum.Font.Gotham
TeleportButton.Parent = MainFrame

local TeleportCorner = Instance.new("UICorner")
TeleportCorner.CornerRadius = UDim.new(0, 6)
TeleportCorner.Parent = TeleportButton

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, -20, 1, -85)
ScrollingFrame.Position = UDim2.new(0, 10, 0, 40)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarThickness = 4
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 150, 255)
ScrollingFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollingFrame

local ResetButton = Instance.new("TextButton")
ResetButton.Name = "ResetButton"
ResetButton.Size = UDim2.new(1, -20, 0, 30)
ResetButton.Position = UDim2.new(0, 10, 1, -40)
ResetButton.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
ResetButton.Text = "กลับมาที่ตัวเอง (Reset View)"
ResetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ResetButton.TextSize = 12
ResetButton.Font = Enum.Font.GothamBold
ResetButton.Parent = MainFrame

local ResetCorner = Instance.new("UICorner")
ResetCorner.CornerRadius = UDim.new(0, 6)
ResetCorner.Parent = ResetButton

local ConfirmFrame = Instance.new("Frame")
ConfirmFrame.Name = "ConfirmFrame"
ConfirmFrame.Size = UDim2.new(1, 0, 1, -35)
ConfirmFrame.Position = UDim2.new(0, 0, 0, 35)
ConfirmFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
ConfirmFrame.BorderSizePixel = 0
ConfirmFrame.Visible = false
ConfirmFrame.ZIndex = 10
ConfirmFrame.Parent = MainFrame

local ConfirmCorner = Instance.new("UICorner")
ConfirmCorner.CornerRadius = UDim.new(0, 8)
ConfirmCorner.Parent = ConfirmFrame

local ConfirmText = Instance.new("TextLabel")
ConfirmText.Size = UDim2.new(1, -20, 0, 60)
ConfirmText.Position = UDim2.new(0, 10, 0, 30)
ConfirmText.BackgroundTransparency = 1
ConfirmText.Text = "ต้องการเซฟตำแหน่ง\nตรงนี้หรือไม่?"
ConfirmText.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfirmText.TextSize = 13
ConfirmText.Font = Enum.Font.GothamBold
ConfirmText.TextWrapped = true
ConfirmText.ZIndex = 11
ConfirmText.Parent = ConfirmFrame

local YesButton = Instance.new("TextButton")
YesButton.Size = UDim2.new(0, 75, 0, 32)
YesButton.Position = UDim2.new(0.5, -80, 1, -60)
YesButton.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
YesButton.Text = "ใช่"
YesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
YesButton.TextSize = 13
YesButton.Font = Enum.Font.GothamBold
YesButton.ZIndex = 11
YesButton.Parent = ConfirmFrame

local YesCorner = Instance.new("UICorner")
YesCorner.CornerRadius = UDim.new(0, 6)
YesCorner.Parent = YesButton

local NoButton = Instance.new("TextButton")
NoButton.Size = UDim2.new(0, 75, 0, 32)
NoButton.Position = UDim2.new(0.5, 5, 1, -60)
NoButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
NoButton.Text = "ไม่"
NoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
NoButton.TextSize = 13
NoButton.Font = Enum.Font.GothamBold
NoButton.ZIndex = 11
NoButton.Parent = ConfirmFrame

local NoCorner = Instance.new("UICorner")
NoCorner.CornerRadius = UDim.new(0, 6)
NoCorner.Parent = NoButton

local isMinimized = false
local savedPosition = nil
local activeSpectatingPlayer = nil
local markedPlayers = {}
local playerButtons = {}
local holdStates = {}
local DOUBLE_TAP_TIME = 0.6
local HOLD_DURATION = 3

local function destroyTrackingVisuals(data)
    if not data then
        return
    end

    for _, key in ipairs({"beam", "localAttachment", "targetAttachment", "highlight", "headInfo"}) do
        local object = data[key]
        if object then
            pcall(function()
                object:Destroy()
            end)
            data[key] = nil
        end
    end

    data.visualCharacter = nil
end

local function removeMark(player)
    local data = markedPlayers[player]
    if data then
        destroyTrackingVisuals(data)
        markedPlayers[player] = nil
    end

    local button = playerButtons[player]
    if button and button.Parent then
        button.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end

local function createTrackingVisuals(player, data)
    local character = player.Character
    local myCharacter = LocalPlayer.Character

    if not character or not myCharacter then
        return
    end

    local targetHead = character:FindFirstChild("Head")
    local targetRoot = character:FindFirstChild("HumanoidRootPart")
    local myRoot = myCharacter:FindFirstChild("HumanoidRootPart")

    if not targetHead or not targetRoot or not myRoot then
        return
    end

    if data.visualCharacter == character and data.beam and data.beam.Parent and data.highlight and data.highlight.Parent then
        return
    end

    destroyTrackingVisuals(data)
    data.visualCharacter = character

    local localAttachment = Instance.new("Attachment")
    localAttachment.Name = "DeltaTrackLocal"
    localAttachment.Parent = myRoot
    data.localAttachment = localAttachment

    local targetAttachment = Instance.new("Attachment")
    targetAttachment.Name = "DeltaTrackTarget"
    targetAttachment.Parent = targetRoot
    data.targetAttachment = targetAttachment

    local beam = Instance.new("Beam")
    beam.Name = "DeltaPlayerTrackingBeam"
    beam.Attachment0 = localAttachment
    beam.Attachment1 = targetAttachment
    beam.FaceCamera = true
    beam.LightEmission = 1
    beam.LightInfluence = 0
    beam.Width0 = 0.12
    beam.Width1 = 0.12
    beam.Color = ColorSequence.new(Color3.fromRGB(255, 40, 40))
    beam.Transparency = NumberSequence.new(0.08)
    beam.Parent = myRoot
    data.beam = beam

    local highlight = Instance.new("Highlight")
    highlight.Name = "DeltaPlayerTrackingHighlight"
    highlight.Adornee = character
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillColor = Color3.fromRGB(255, 25, 25)
    highlight.OutlineColor = Color3.fromRGB(255, 100, 100)
    highlight.FillTransparency = 0.45
    highlight.OutlineTransparency = 0
    highlight.Parent = character
    data.highlight = highlight

    local headInfo = Instance.new("BillboardGui")
    headInfo.Name = "DeltaPlayerTrackingInfo"
    headInfo.Adornee = targetHead
    headInfo.Size = UDim2.new(0, 220, 0, 54)
    headInfo.StudsOffset = Vector3.new(0, 2.7, 0)
    headInfo.AlwaysOnTop = true
    headInfo.MaxDistance = 100000
    headInfo.Parent = ScreenGui
    data.headInfo = headInfo

    local infoLabel = Instance.new("TextLabel")
    infoLabel.Name = "InfoLabel"
    infoLabel.Size = UDim2.new(1, 0, 1, 0)
    infoLabel.BackgroundTransparency = 1
    infoLabel.TextColor3 = Color3.fromRGB(255, 65, 65)
    infoLabel.TextStrokeTransparency = 0.15
    infoLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    infoLabel.TextSize = 13
    infoLabel.Font = Enum.Font.GothamBold
    infoLabel.TextWrapped = true
    infoLabel.Parent = headInfo
    data.infoLabel = infoLabel
end

local function updateMarkedPlayer(player, data)
    if not player.Parent then
        removeMark(player)
        return
    end

    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local targetRoot = character and character:FindFirstChild("HumanoidRootPart")
    local myCharacter = LocalPlayer.Character
    local myRoot = myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")

    local button = playerButtons[player]
    if button and button.Parent then
        button.TextColor3 = Color3.fromRGB(255, 45, 45)
    end

    if not character or not humanoid or not targetRoot or not myRoot then
        destroyTrackingVisuals(data)
        return
    end

    createTrackingVisuals(player, data)

    if data.beam then
        local hue = (os.clock() * 0.12) % 1
        local color = Color3.fromHSV(hue, 1, 1)
        data.beam.Color = ColorSequence.new(color)
        data.beam.Width0 = 0.1 + math.abs(math.sin(os.clock() * 3)) * 0.06
        data.beam.Width1 = data.beam.Width0
    end

    if data.highlight then
        local color = Color3.fromHSV((os.clock() * 0.12) % 1, 1, 1)
        data.highlight.FillColor = color
        data.highlight.OutlineColor = color
    end

    if data.infoLabel then
        local distance = (myRoot.Position - targetRoot.Position).Magnitude
        data.infoLabel.Text = string.format(
            "%s\n@%s | HP: %d/%d | ระยะ: %d studs",
            player.DisplayName,
            player.Name,
            math.floor(humanoid.Health + 0.5),
            math.floor(humanoid.MaxHealth + 0.5),
            math.floor(distance + 0.5)
        )
        data.infoLabel.TextColor3 = Color3.fromHSV((os.clock() * 0.12) % 1, 1, 1)
    end
end

local function updateActiveBarColor()
    for player, button in pairs(playerButtons) do
        if button and button.Parent then
            if markedPlayers[player] then
                button.TextColor3 = Color3.fromRGB(255, 45, 45)
            elseif activeSpectatingPlayer == player then
                button.TextColor3 = Color3.fromRGB(0, 200, 255)
            else
                button.TextColor3 = Color3.fromRGB(200, 200, 200)
            end

            if activeSpectatingPlayer == player then
                button.BackgroundColor3 = Color3.fromRGB(35, 55, 65)
            else
                button.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
            end
        end
    end
end

local function teleportToPlayerFront(targetPlayer)
    local myChar = LocalPlayer.Character
    local targetChar = targetPlayer.Character

    if myChar and myChar:FindFirstChild("HumanoidRootPart") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
        local targetHRP = targetChar.HumanoidRootPart
        local myHRP = myChar.HumanoidRootPart
        local frontCFrame = targetHRP.CFrame * CFrame.new(0, 0, -3.5) * CFrame.Angles(0, math.pi, 0)
        myHRP.CFrame = frontCFrame
    end
end

local function updatePlayerList()
    for _, child in pairs(ScrollingFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end

    table.clear(playerButtons)

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local ItemFrame = Instance.new("Frame")
            ItemFrame.Name = player.Name
            ItemFrame.Size = UDim2.new(1, -5, 0, 30)
            ItemFrame.BackgroundTransparency = 1
            ItemFrame.Parent = ScrollingFrame

            local AvatarImage = Instance.new("ImageLabel")
            AvatarImage.Name = "AvatarImage"
            AvatarImage.Size = UDim2.new(0, 26, 0, 26)
            AvatarImage.Position = UDim2.new(0, 2, 0.5, -13)
            AvatarImage.BackgroundTransparency = 1
            AvatarImage.Parent = ItemFrame

            local AvatarCorner = Instance.new("UICorner")
            AvatarCorner.CornerRadius = UDim.new(1, 0)
            AvatarCorner.Parent = AvatarImage

            task.spawn(function()
                local success, thumbnail = pcall(function()
                    return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                end)
                if success and AvatarImage.Parent then
                    AvatarImage.Image = thumbnail
                end
            end)

            local PlayerButton = Instance.new("TextButton")
            PlayerButton.Name = "PlayerButton"
            PlayerButton.Size = UDim2.new(1, -67, 1, 0)
            PlayerButton.Position = UDim2.new(0, 32, 0, 0)
            PlayerButton.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
            PlayerButton.Text = player.DisplayName .. " (@" .. player.Name .. ")"
            PlayerButton.TextColor3 = Color3.fromRGB(200, 200, 200)
            PlayerButton.TextSize = 11
            PlayerButton.Font = Enum.Font.Gotham
            PlayerButton.Parent = ItemFrame
            playerButtons[player] = PlayerButton

            local BtnCorner = Instance.new("UICorner")
            BtnCorner.CornerRadius = UDim.new(0, 4)
            BtnCorner.Parent = PlayerButton

            local TpButton = Instance.new("TextButton")
            TpButton.Name = "TpButton"
            TpButton.Size = UDim2.new(0, 30, 1, 0)
            TpButton.Position = UDim2.new(1, -30, 0, 0)
            TpButton.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            TpButton.Text = "☄️"
            TpButton.TextSize = 14
            TpButton.Parent = ItemFrame

            local TpCorner = Instance.new("UICorner")
            TpCorner.CornerRadius = UDim.new(0, 4)
            TpCorner.Parent = TpButton

            local pressState = {
                isDown = false,
                held = false,
                startedAt = 0,
                generation = 0,
                lastTap = 0
            }
            holdStates[player] = pressState

            PlayerButton.InputBegan:Connect(function(input)
                if input.UserInputType ~= Enum.UserInputType.MouseButton1
                    and input.UserInputType ~= Enum.UserInputType.Touch then
                    return
                end

                pressState.isDown = true
                pressState.held = false
                pressState.startedAt = os.clock()
                pressState.generation += 1
                local generation = pressState.generation

                task.delay(HOLD_DURATION, function()
                    if not PlayerButton.Parent or not pressState.isDown or pressState.generation ~= generation then
                        return
                    end

                    if os.clock() - pressState.startedAt >= HOLD_DURATION then
                        pressState.held = true

                        if not markedPlayers[player] then
                            markedPlayers[player] = {}
                        end

                        updateMarkedPlayer(player, markedPlayers[player])
                        updateActiveBarColor()
                    end
                end)
            end)

            PlayerButton.InputEnded:Connect(function(input)
                if input.UserInputType ~= Enum.UserInputType.MouseButton1
                    and input.UserInputType ~= Enum.UserInputType.Touch then
                    return
                end

                pressState.isDown = false
                pressState.generation += 1

                if pressState.held then
                    pressState.held = false
                    pressState.lastTap = 0
                    return
                end

                if markedPlayers[player] then
                    local now = os.clock()
                    if now - pressState.lastTap <= DOUBLE_TAP_TIME then
                        removeMark(player)
                        pressState.lastTap = 0
                    else
                        pressState.lastTap = now
                    end
                    updateActiveBarColor()
                    return
                end

                activeSpectatingPlayer = player
                Title.Text = "ส่อง: " .. player.DisplayName
                updateActiveBarColor()
            end)

            TpButton.MouseButton1Click:Connect(function()
                teleportToPlayerFront(player)
            end)
        end
    end

    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
    updateActiveBarColor()

    for player, data in pairs(markedPlayers) do
        updateMarkedPlayer(player, data)
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    ScrollingFrame.Visible = false
    ResetButton.Visible = false
    ConfirmFrame.Visible = false

    if isMinimized then
        ToggleButton.Text = "+"
        MainFrame:TweenSize(
            UDim2.new(0, 220, 0, 35),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quart,
            0.2,
            true
        )
    else
        ToggleButton.Text = "-"
        MainFrame:TweenSize(
            UDim2.new(0, 220, 0, 300),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quart,
            0.2,
            true,
            function(status)
                if status == Enum.TweenStatus.Completed and not isMinimized then
                    ScrollingFrame.Visible = true
                    ResetButton.Visible = true
                end
            end
        )
    end
end)

SaveButton.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        if savedPosition == nil then
            savedPosition = char.HumanoidRootPart.CFrame
            Title.Text = "บันทึกตำแหน่งแล้ว"
        else
            ConfirmFrame.Visible = true
        end
    end
end)

YesButton.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        savedPosition = char.HumanoidRootPart.CFrame
        Title.Text = "บันทึกตำแหน่งใหม่แล้ว"
    end
    ConfirmFrame.Visible = false
end)

NoButton.MouseButton1Click:Connect(function()
    ConfirmFrame.Visible = false
end)

TeleportButton.MouseButton1Click:Connect(function()
    if savedPosition then
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = savedPosition
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if activeSpectatingPlayer then
        if activeSpectatingPlayer.Character and activeSpectatingPlayer.Character:FindFirstChild("Humanoid") then
            Camera.CameraSubject = activeSpectatingPlayer.Character.Humanoid
            if activeSpectatingPlayer.Character:FindFirstChild("HumanoidRootPart") then
                pcall(function()
                    LocalPlayer:RequestStreamAroundAsync(activeSpectatingPlayer.Character.HumanoidRootPart.Position)
                end)
            end
        else
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                Camera.CameraSubject = LocalPlayer.Character.Humanoid
            end
        end
    else
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            if Camera.CameraSubject ~= LocalPlayer.Character.Humanoid then
                Camera.CameraSubject = LocalPlayer.Character.Humanoid
            end
        end
    end

    for player, data in pairs(markedPlayers) do
        updateMarkedPlayer(player, data)
    end
end)

Players.PlayerAdded:Connect(updatePlayerList)

Players.PlayerRemoving:Connect(function(player)
    if activeSpectatingPlayer == player then
        activeSpectatingPlayer = nil
        Title.Text = "PLAYER SPECTATE"
    end

    removeMark(player)
    playerButtons[player] = nil
    holdStates[player] = nil
    updatePlayerList()
end)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    for player, data in pairs(markedPlayers) do
        destroyTrackingVisuals(data)
    end
end)

ResetButton.MouseButton1Click:Connect(function()
    activeSpectatingPlayer = nil
    Title.Text = "PLAYER SPECTATE"
    updateActiveBarColor()
end)

updatePlayerList()
