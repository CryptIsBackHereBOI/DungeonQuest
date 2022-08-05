local plr = game.Players.LocalPlayer

game:GetService("Players").LocalPlayer.Idled:connect(function()
	local vu = game:GetService("VirtualUser")
	vu:CaptureController()
	vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)


balls = hookmetamethod(game, "__namecall", function(...) 

	if getnamecallmethod() == "Kick" then
		print("Stopped kick")
		return "gay"
	end

	return balls(...)
end)

function tween(position)
    Distance = (position.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance / 50, Enum.EasingStyle.Linear),
        {CFrame = position}
    ):Play()
end --end for tweenteleport



local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Dungeon Quest - SUPER INSTA KILL", "DarkTheme")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Made By SomeDudeMakeUHappy#3321")
Section:NewLabel("SELECT FARMING MDTHOD FIRST")

Section:NewDropdown("Farming Method", "DropdownInf", {"Above", "Under"}, function(c)
   if c == "Above" then
    getgenv().MethodFarm = CFrame.Angles(math.rad(90), 0, 0) + Vector3.new(0, -7, 0)
    if c == "Under" then
    getgenv().MethodFarm = CFrame.Angles(math.rad(-90), 0, 0) + Vector3.new(0, 7, 0)
end
   end
end)


Section:NewToggle("Start AutoFarm", "ToggleInfo", function(state)
    getgenv().StartAutoFarm = state
    spawn(function()
        game:GetService("RunService").Heartbeat:Connect(function()
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and getgenv().StartAutoFarm then
                setfflag("HumanoidParallelRemoveNoPhysics", "False")
                setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
                game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
            end
        end)
    end)
     
    
    
    --AUTOFARM
     spawn(function()
        while task.wait() do 
            if  getgenv().StartAutoFarm == true then
             for i,v in pairs(game:GetService("Workspace").dungeon:GetDescendants()) do 
                 if v:IsA('Model') and v:FindFirstChild("Humanoid") and  v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0  then
                  tween(v.HumanoidRootPart.CFrame *  getgenv().MethodFarm)
                 end
                end 
            else
                wait()
                break
            end
        end
    end)
end)

Section:NewToggle("Auto Start The Game", "ToggleInfo", function(state)
    getgenv().AutoStart = state
    spawn(function()
        while task.wait() do 
            if  getgenv().AutoStart == true then
    game:GetService("ReplicatedStorage").remotes.changeStartValue:FireServer()
            else
               wait()
               break
            end
           end
       end)
end)

Section:NewToggle("Auto DestroyNameTag", "ToggleInfo", function(state)
    getgenv().DestroyNameTag = state
    spawn(function()
        while task.wait() do 
            if  getgenv().DestroyNameTag == true then
                game.Players.LocalPlayer.Character.playerNameplate.Enabled = false
            else
                wait()
                break
            end
        end
    end)
end)

Section:NewToggle("Auto AutoM1", "ToggleInfo", function(state)
    getgenv().AutoM1 = state
    --M1
spawn(function()
    while task.wait() do 
        if  getgenv().AutoM1 == true then
            local weapon = game:GetService("Players").LocalPlayer.weaponEquipped.Value
game:GetService("Players").LocalPlayer.Character:FindFirstChild(weapon).swing:FireServer()
else
    wait()
    break
end
end
end)
end)

Section:NewToggle("Auto Use Skills", "ToggleInfo", function(state)

getgenv().AutoUseSkill  = state
local function SkillUse(valuexxx)
	game:GetService("VirtualInputManager"):SendKeyEvent(true,valuexxx,false,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart)
	wait()
	game:GetService("VirtualInputManager"):SendKeyEvent(false,valuexxx,false,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart)
end

spawn(function()
    while task.wait() do 
        if  getgenv().AutoUseSkill == true then
SkillUse("Q")
SkillUse("E")
else
    wait()
    break
end
end
end)

end)
Section:NewToggle("Start Insta Kill", "ToggleInfo", function(state)

getgenv().InstaKill  = state
spawn(function()
    while task.wait() do 
        if  getgenv().InstaKill == true then
            for i,v in pairs(game:GetService("Workspace").dungeon:GetDescendants()) do 
                if v:IsA('Model') and v:FindFirstChild("Humanoid") and  v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v:FindFirstChild("enemyNameplate") then
          v.Humanoid.RigType = "R6"
                end
               end 
else
    wait()
    break
end
end
end)
end)
