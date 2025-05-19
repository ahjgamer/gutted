-- Remove existing GUI if present
if game.CoreGui:FindFirstChild("HealthGui") then
    game.CoreGui.HealthGui:Destroy()
end

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HealthGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.CoreGui

-- Create main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 220, 0, 100)
mainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Title label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Text = "Health Booster"
titleLabel.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 18
titleLabel.Parent = mainFrame

-- Minimize button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -30, 0, 0)
minimizeButton.Text = "-"
minimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.Font = Enum.Font.SourceSans
minimizeButton.TextSize = 20
minimizeButton.Parent = mainFrame

-- Increase Health button
local increaseHealthButton = Instance.new("TextButton")
increaseHealthButton.Size = UDim2.new(1, -20, 0, 40)
increaseHealthButton.Position = UDim2.new(0, 10, 0, 40)
increaseHealthButton.Text = "Increase Health"
increaseHealthButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
increaseHealthButton.TextColor3 = Color3.fromRGB(255, 255, 255)
increaseHealthButton.Font = Enum.Font.SourceSans
increaseHealthButton.TextSize = 18
increaseHealthButton.Parent = mainFrame

-- Minimize functionality
local minimized = false
minimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    for _, obj in pairs(mainFrame:GetChildren()) do
        if obj ~= titleLabel and obj ~= minimizeButton then
            obj.Visible = not minimized
        end
    end
end)

-- Increase Health functionality
increaseHealthButton.MouseButton1Click:Connect(function()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.MaxHealth = 5000
        humanoid.Health = 5000
    end
end)
