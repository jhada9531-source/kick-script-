local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local PlayerList = Instance.new("ScrollingFrame")
local KickButton = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")

-- Properties
ScreenGui.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -150)
MainFrame.Size = UDim2.new(0, 200, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

PlayerList.Name = "PlayerList"
PlayerList.Parent = MainFrame
PlayerList.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
PlayerList.Position = UDim2.new(0, 10, 0, 10)
PlayerList.Size = UDim2.new(0, 180, 0, 230)
PlayerList.CanvasSize = UDim2.new(0, 0, 10, 0)

UIListLayout.Parent = PlayerList
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

KickButton.Name = "KickButton"
KickButton.Parent = MainFrame
KickButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
KickButton.Position = UDim2.new(0, 10, 0, 250)
KickButton.Size = UDim2.new(0, 180, 0, 40)
KickButton.Text = "KICK"
KickButton.TextColor3 = Color3.fromRGB(255, 255, 255)
KickButton.TextSize = 18

local selectedPlayer = nil

-- Function to refresh list
local function updateList()
    for _, child in pairs(PlayerList:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    for _, player in pairs(game.Players:GetPlayers()) do
        local btn = Instance.new("TextButton")
        btn.Parent = PlayerList
        btn.Size = UDim2.new(1, 0, 0, 30)
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        btn.Text = player.Name
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        btn.MouseButton1Click:Connect(function()
            for _, v in pairs(PlayerList:GetChildren()) do
                if v:IsA("TextButton") then v.BackgroundColor3 = Color3.fromRGB(40, 40, 40) end
            end
            btn.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green selection
            selectedPlayer = player
        end)
    end
end

game.Players.PlayerAdded:Connect(updateList)
game.Players.PlayerRemoving:Connect(updateList)
updateList()

KickButton.MouseButton1Click:Connect(function()
    if selectedPlayer then
        -- The kick message you requested
        selectedPlayer:Kick("تم طردك من قبل المشرف Rip_dark")
    end
end)

