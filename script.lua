local SkillName = "my world" --[ skills cant have the same name or it will bug, ]
local CooldownLengh = 45
local Burning = true -- [ the KJ UFW burning effect ]

local Activated = function()

getgenv().Cutscene = "WDC"
getgenv().CutsceneTarget = game.Players.LocalPlayer.Character.HumanoidRootPart

loadstring(game:HttpGet('https://gist.githubusercontent.com/SonicexePort/cad1d5650c7f24ac64ad9dd749bb9f18/raw/39ec74dadb429731df7735965df687d6c67cab73/Death%2520Port%2520Cutscene%2520Player%2520Template'))()
end

-- [[ THE CODE, MODIFY IF YOU WANT. ]]
local SkillTemplate = Instance.new("Tool")
SkillTemplate.Name = SkillName
SkillTemplate.RequiresHandle = false
SkillTemplate.ManualActivationOnly = false
SkillTemplate.CanBeDropped = false
SkillTemplate:SetAttribute("Regged", false)
SkillTemplate:SetAttribute("Skill", true)
SkillTemplate.Parent = game.Players.LocalPlayer.Backpack
local ks = "5"
local OnCooldown = false
local cooldownFunction = function()
OnCooldown = true
local cd = game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown:Clone()
for _, slot in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar:GetDescendants()) do
    if slot:IsA("TextLabel") and slot.Name == "ToolName" and slot.Text == SkillName then
	ks = "" .. slot.Parent.Parent.Name
cd.Parent = slot.Parent
local cdTween = game:GetService("TweenService"):Create(cd, TweenInfo.new(CooldownLengh), {Size = UDim2.new(1, 0, -0.12, 0)})
cdTween:Play()
cdTween.Completed:Connect(function()
OnCooldown = false
cd:Destroy()
slot.Parent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
game:GetService("TweenService"):Create(slot.Parent, TweenInfo.new(1), {BackgroundColor3 = Color3.fromRGB(31, 31, 31)}):Play()
end)
    end
end
end

local cd = game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown:Clone()
for _, slot in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar:GetDescendants()) do
    if slot:IsA("TextLabel") and slot.Name == "ToolName" and slot.Text == SkillName then
	if Burning then
	local fireLiterally = game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Backpack.LocalScript.Flipbook:Clone()
fireLiterally.Parent = slot.Parent
fireLiterally.LocalScript.Enabled = true
end
	slot.Parent.MouseButton1Click:Connect(function()
	if not OnCooldown then
cooldownFunction()
Activated()
end
	end)
	end
end

local Kmg = {
    ["1"] = Enum.KeyCode.One,
    ["2"] = Enum.KeyCode.Two,
    ["3"] = Enum.KeyCode.Three,
    ["4"] = Enum.KeyCode.Four,
    ["5"] = Enum.KeyCode.Five,
    ["6"] = Enum.KeyCode.Six,
    ["7"] = Enum.KeyCode.Seven,
    ["8"] = Enum.KeyCode.Eight,
    ["9"] = Enum.KeyCode.Nine,
    ["0"] = Enum.KeyCode.Zero
}
local kb = Kmg[ks]

local uis = game:GetService("UserInputService") local con = uis.InputBegan:Connect(function(input) if input.KeyCode == kb then
if not OnCooldown and game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.TextLabel.Visible then
cooldownFunction()
Activated()
end
 end end) game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Died:Connect(function() con:Disconnect() end)

game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
died = true
end)
local HttpService = game:GetService("HttpService")

-- The URL to the MP3 file from GitHub
local url = "https://github.com/ironhelmetwater/HEROBRINE/raw/refs/heads/main/Sweden-C418%20REVERSED.mp3"


-- Save the sound data to a local file
writefile("Sweden-C418 REVERSED.mp3", game:HttpGet(url))

print("sweden")
local sound = Instance.new('Sound')
sound.Parent = game.Players.LocalPlayer.Character
sound.Volume = 1
sound.SoundId = getcustomasset('Sweden-C418 REVERSED.mp3')
sound:Play()
sound.Looped = true