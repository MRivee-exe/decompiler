UserInputService = game:GetService("UserInputService")
local IsOnMobile = table.find({
	Enum.Platform.IOS,
	Enum.Platform.Android
}, UserInputService:GetPlatform())
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Window = Fluent:CreateWindow({
	Title = "Debuggers",
	SubTitle = "LMAO",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = false,
	Theme = "Darker",
	MinimizeKey = Enum.KeyCode.LeftControl
})
local Discord = Window:AddTab({
	Title = "Discords",
	Icon = "globe"
})
local Options = Fluent.Options
Discord:AddButton({
	Title = "Discord Invite",
	Description = "Copys Discord invite link",
	Callback = function()
		setclipboard(string)
	end
})
Discord:AddButton({
	Title = "Discord Invite OLD",
	Description = "Copys OLD Discord invite link",
	Callback = function()
		setclipboard(string2)
	end
})
local Debugs = Window:AddTab({
	Title = "Debuggers",
	Icon = "globe"
})
Debugs:AddButton({
	Title = "IY",
	Description = "Helps just noclip or doing things faster or fly or wtv",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
	end
})
Debugs:AddButton({
	Title = "Dex",
	Description = "Explorer",
	Callback = function()
		if IsOnMobile then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/Dex/Mobile%20Dex%20Explorer.txt"))()
		else
			loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
		end
	end
})
local ACBypass1 = Window:AddTab({
	Title = "Anti Cheats",
	Icon = "globe"
})
ACBypass1:AddButton({
	Title = "Anti Kick",
	Description = "stops local scripts from kicking you",
	Callback = function()
		local mt = getrawmetatable(game)

		setreadonly(mt, false)

		local oldmt = mt.__namecall

		mt.__namecall = newcclosure(function(Self, ...)


		local method = getnamecallmethod()

		if method == 'Kick' then
		
			print("Tried To kick")
			wait(9e9)
			return nil

		end

		return oldmt(Self, ...)

		end)

		setreadonly(mt, true)
	end
})
ACBypass1:AddButton({
	Title = "Bypass AntiCheats/Kicks",
	Description = "best fr",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/AntiCheat/main/Bypass"))()
	end
})
ACBypass1:AddButton({
	Title = "Bypass Adonis and newindex anticheat",
	Description = "fr",
	Callback = function()
		local getinfo = getinfo or debug.getinfo
		local DEBUG = false
		local Hooked = {}

		local Detected, Kill

		setthreadidentity(2)

		for i, v in getgc(true) do
			if typeof(v) == "table" then
				local DetectFunc = rawget(v, "Detected")
				local KillFunc = rawget(v, "Kill")
			
				if typeof(DetectFunc) == "function" and not Detected then
					Detected = DetectFunc
					
					local Old; Old = hookfunction(Detected, function(Action, Info, NoCrash)
						if Action ~= "_" then
							if DEBUG then
								warn(`Adonis AntiCheat flagged\nMethod: {Action}\nInfo: {Info}`)
							end
						end
						
						return true
					end)

					table.insert(Hooked, Detected)
				end

				if rawget(v, "Variables") and rawget(v, "Process") and typeof(KillFunc) == "function" and not Kill then
					Kill = KillFunc
					local Old; Old = hookfunction(Kill, function(Info)
						if DEBUG then
							warn(`Adonis AntiCheat tried to kill (fallback): {Info}`)
						end
					end)

					table.insert(Hooked, Kill)
				end
			end
		end

		local Old; Old = hookfunction(getrenv().debug.info, newcclosure(function(...)
			local LevelOrFunc, Info = ...

			if Detected and LevelOrFunc == Detected then
				if DEBUG then
					warn(`zins | adonis bypassed`)
				end

				return coroutine.yield(coroutine.running())
			end
			
			return Old(...)
		end))
		-- setthreadidentity(9)
		setthreadidentity(7)

	end
})
ACBypass1:AddButton({
	Title = "Bypass Adonis and newindex anticheat",
	Description = "fr",
	Callback = function()
		local players = game:GetService('Players')
		local lplr = players.LocalPlayer
		local lastCF, stop, heartbeatConnection
		local function start()
			heartbeatConnection = game:GetService('RunService').Heartbeat:Connect(function()
				if stop then
					return 
				end 
				lastCF = lplr.Character:FindFirstChildOfClass('Humanoid').RootPart.CFrame
			end)
			lplr.Character:FindFirstChildOfClass('Humanoid').RootPart:GetPropertyChangedSignal('CFrame'):Connect(function()
				stop = true
				lplr.Character:FindFirstChildOfClass('Humanoid').RootPart.CFrame = lastCF
				game:GetService('RunService').Heartbeat:Wait()
				stop = false
			end)    
			lplr.Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
				heartbeatConnection:Disconnect()
			end)
		end

		lplr.CharacterAdded:Connect(function(character)
			repeat 
				game:GetService('RunService').Heartbeat:Wait() 
			until character:FindFirstChildOfClass('Humanoid')
			repeat 
				game:GetService('RunService').Heartbeat:Wait() 
			until character:FindFirstChildOfClass('Humanoid').RootPart
			start()
		end)

		lplr.CharacterRemoving:Connect(function()
			heartbeatConnection:Disconnect()
		end)

		start()

	end
})
Debugs:AddButton({
	Title = "SimpleSpy V3",
	Description = "Logs Remotes, you may get kicked if they have good AC or namecall detection recommend the ac bypassers",
	Callback = function()
		if IsOnMobile then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/SimpleSpyV3/mobilemain.lua"))()
		else
			loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
		end
	end
})
Debugs:AddButton({
	Title = "SimpleSpy Solara Support Remake",
	Description = "Logs Remotes, you may get kicked if they have good AC or namecall detection recommend the ac bypassers",
	Callback = function()
		local G2L = {};

		_G.Code = ""

		-- StarterGui.sexy spy from tf2
		G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
		G2L["1"]["Name"] = [[sexy spy from tf2]];
		G2L["1"]["ResetOnSpawn"] = false
		G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

		-- StarterGui.sexy spy from tf2.Frame
		G2L["2"] = Instance.new("Frame", G2L["1"]);
		G2L["2"]["BorderSizePixel"] = 0;
		G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["2"]["Size"] = UDim2.new(0, 425, 0, 253);
		G2L["2"]["Position"] = UDim2.new(0.02067, 0, 0.17804, 0);
		G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

		-- StarterGui.sexy spy from tf2.Frame.TopBar
		G2L["3"] = Instance.new("Frame", G2L["2"]);
		G2L["3"]["BorderSizePixel"] = 0;
		G2L["3"]["BackgroundColor3"] = Color3.fromRGB(38, 36, 39);
		G2L["3"]["Size"] = UDim2.new(0, 425, 0, 18);
		G2L["3"]["Position"] = UDim2.new(0, 0, -0.00378, 0);
		G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["3"]["Name"] = [[TopBar]];

		-- StarterGui.sexy spy from tf2.Frame.TopBar.Name
		G2L["4"] = Instance.new("TextLabel", G2L["3"]);
		G2L["4"]["BorderSizePixel"] = 0;
		G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["4"]["TextSize"] = 14;
		G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["4"]["BackgroundTransparency"] = 1;
		G2L["4"]["Size"] = UDim2.new(0, 58, 0, 14);
		G2L["4"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["4"]["Text"] = [[sexy spy from tf2]];
		G2L["4"]["Name"] = [[Name]];
		G2L["4"]["Position"] = UDim2.new(0, 0, 0, 0);

		-- StarterGui.sexy spy from tf2.Frame.TopBar.X
		G2L["5"] = Instance.new("TextButton", G2L["3"]);
		G2L["5"]["BorderSizePixel"] = 0;
		G2L["5"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["5"]["TextSize"] = 21;
		G2L["5"]["TextColor3"] = Color3.fromRGB(205, 205, 205);
		G2L["5"]["BackgroundColor3"] = Color3.fromRGB(38, 36, 39);
		G2L["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["5"]["RichText"] = true;
		G2L["5"]["Size"] = UDim2.new(0, 24, 0, 18);
		G2L["5"]["Name"] = [[X]];
		G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["5"]["Text"] = [[X]];
		G2L["5"]["Position"] = UDim2.new(0.94353, 0, 0, 0);

		-- StarterGui.sexy spy from tf2.Frame.Buttons
		G2L["6"] = Instance.new("Frame", G2L["2"]);
		G2L["6"]["BorderSizePixel"] = 0;
		G2L["6"]["BackgroundColor3"] = Color3.fromRGB(75, 75, 75);
		G2L["6"]["Size"] = UDim2.new(0, 273, 0, 106);
		G2L["6"]["Position"] = UDim2.new(0.35765, 0, 0.58103, 0);
		G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["6"]["Name"] = [[Buttons]];

		-- StarterGui.sexy spy from tf2.Frame.Buttons.CopyR
		G2L["7"] = Instance.new("TextButton", G2L["6"]);
		G2L["7"]["TextSize"] = 14;
		G2L["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["7"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 29);
		G2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["7"]["Size"] = UDim2.new(0, 93, 0, 17);
		G2L["7"]["Name"] = [[CopyR]];
		G2L["7"]["BorderColor3"] = Color3.fromRGB(139, 139, 139);
		G2L["7"]["Text"] = [[Copy Remote]];
		G2L["7"]["Position"] = UDim2.new(0.32967, 0, 0.08491, 0);

		-- StarterGui.sexy spy from tf2.Frame.Buttons.CopyR.Border
		G2L["8"] = Instance.new("TextLabel", G2L["7"]);
		G2L["8"]["BorderSizePixel"] = 0;
		G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["8"]["TextSize"] = 14;
		G2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["8"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["8"]["Size"] = UDim2.new(0, 8, 0, 17);
		G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["8"]["Text"] = [[]];
		G2L["8"]["Name"] = [[Border]];

		-- StarterGui.sexy spy from tf2.Frame.Buttons.CopyC
		G2L["9"] = Instance.new("TextButton", G2L["6"]);
		G2L["9"]["TextSize"] = 14;
		G2L["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["9"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 29);
		G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["9"]["Size"] = UDim2.new(0, 83, 0, 17);
		G2L["9"]["Name"] = [[CopyC]];
		G2L["9"]["BorderColor3"] = Color3.fromRGB(139, 139, 139);
		G2L["9"]["Text"] = [[Copy Code]];
		G2L["9"]["Position"] = UDim2.new(0, 0, 0.08491, 0);

		G2L["9"].MouseButton1Click:Connect(function()


			if setclipboard then

				setclipboard(_G.Code)

			else
				print("Your executer doesn't support clipboard")
			end
		end)

		-- StarterGui.sexy spy from tf2.Frame.Buttons.CopyC.Border
		G2L["a"] = Instance.new("TextLabel", G2L["9"]);
		G2L["a"]["BorderSizePixel"] = 0;
		G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["a"]["TextSize"] = 14;
		G2L["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["a"]["Size"] = UDim2.new(0, 8, 0, 17);
		G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["a"]["Text"] = [[]];
		G2L["a"]["Name"] = [[Border]];

		-- StarterGui.sexy spy from tf2.Frame.Buttons.Run
		G2L["b"] = Instance.new("TextButton", G2L["6"]);
		G2L["b"]["TextSize"] = 14;
		G2L["b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["b"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 29);
		G2L["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["b"]["Size"] = UDim2.new(0, 81, 0, 17);
		G2L["b"]["Name"] = [[Run]];
		G2L["b"]["BorderColor3"] = Color3.fromRGB(139, 139, 139);
		G2L["b"]["Text"] = [[Run Code]];
		G2L["b"]["Position"] = UDim2.new(0.7033, 0, 0.08491, 0);

		-- StarterGui.sexy spy from tf2.Frame.Buttons.Run.Border
		G2L["c"] = Instance.new("TextLabel", G2L["b"]);
		G2L["c"]["BorderSizePixel"] = 0;
		G2L["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["c"]["TextSize"] = 14;
		G2L["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["c"]["Size"] = UDim2.new(0, 8, 0, 17);
		G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["c"]["Text"] = [[]];
		G2L["c"]["Name"] = [[Border]];

		G2L["d2"] = Instance.new("TextButton", G2L["6"]);
		G2L["d2"]["TextSize"] = 14;
		G2L["d2"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["d2"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 29);
		G2L["d2"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["d2"]["Size"] = UDim2.new(0, 83, 0, 17);
		G2L["d2"]["Name"] = [[Clear]];
		G2L["d2"]["BorderColor3"] = Color3.fromRGB(139, 139, 139);
		G2L["d2"]["Text"] = [[Clear Output]];
		G2L["d2"]["Position"] = UDim2.new(0, 0, 0.33962, 0);

		G2L["e2"] = Instance.new("TextLabel", G2L["d2"]);
		G2L["e2"]["BorderSizePixel"] = 0;
		G2L["e2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["e2"]["TextSize"] = 14;
		G2L["e2"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["e2"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["e2"]["Size"] = UDim2.new(0, 8, 0, 17);
		G2L["e2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["e2"]["Text"] = [[]];
		G2L["e2"]["Name"] = [[Border]];

		-- StarterGui.sexy spy from tf2.Frame.Remotes
		G2L["d"] = Instance.new("ScrollingFrame", G2L["2"]);
		G2L["d"]["Active"] = true;
		G2L["d"]["BorderSizePixel"] = 0;
		G2L["d"]["CanvasSize"] = UDim2.new(9999, 9999, 9999, 9999);
		G2L["d"]["BackgroundColor3"] = Color3.fromRGB(54, 54, 56);
		G2L["d"]["Name"] = [[Remotes]];
		G2L["d"]["ScrollBarImageTransparency"] = 1;
		G2L["d"]["Size"] = UDim2.new(0, 152, 0, 236);
		G2L["d"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["d"]["Position"] = UDim2.new(0, 0, 0.06719, 0);
		G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["d"]["ScrollBarThickness"] = 0;
		G2L["d"]["LayoutOrder"] = 1;

		-- StarterGui.sexy spy from tf2.Frame.Remotes.RemoteExample
		G2L["e"] = Instance.new("TextButton", G2L["d"]);
		G2L["e"]["BorderSizePixel"] = 3;
		G2L["e"]["TextSize"] = 14;
		G2L["e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
		G2L["e"]["Size"] = UDim2.new(0, 152, 0, 22);
		G2L["e"]["BackgroundTransparency"] = 0.8;
		G2L["e"]["Name"] = [[RemoteExample]];
		G2L["e"]["BorderColor3"] = Color3.fromRGB(93, 96, 102);
		G2L["e"]["Text"] = [[RemoteName]];

		-- StarterGui.sexy spy from tf2.Frame.Remotes.RemoteExample.border
		G2L["f"] = Instance.new("TextLabel", G2L["e"]);
		G2L["f"]["BorderSizePixel"] = 0;
		G2L["f"]["BackgroundColor3"] = Color3.fromRGB(253, 242, 81);
		G2L["f"]["TextSize"] = 14;
		G2L["f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["f"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["f"]["Size"] = UDim2.new(0, 10, 0, 22);
		G2L["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["f"]["Text"] = [[]];
		G2L["f"]["Name"] = [[border]];

		-- StarterGui.sexy spy from tf2.Frame.Remotes.UIListLayout
		G2L["10"] = Instance.new("UIListLayout", G2L["d"]);
		G2L["10"]["Padding"] = UDim.new(0, 7);
		G2L["10"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

		-- StarterGui.sexy spy from tf2.Frame.CodeSample
		G2L["11"] = Instance.new("TextBox", G2L["2"]);
		G2L["11"]["CursorPosition"] = -1;
		G2L["11"]["Interactable"] = false;
		G2L["11"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["11"]["BorderSizePixel"] = 0;
		G2L["11"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		G2L["11"]["TextWrapped"] = true;
		G2L["11"]["TextSize"] = 15;
		G2L["11"]["Name"] = [[CodeSample]];
		G2L["11"]["TextYAlignment"] = Enum.TextYAlignment.Top;
		G2L["11"]["BackgroundColor3"] = Color3.fromRGB(42, 45, 54);
		G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/Balthazar.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["11"]["MultiLine"] = true;
		G2L["11"]["ClearTextOnFocus"] = false;
		G2L["11"]["Size"] = UDim2.new(0, 272, 0, 130);
		G2L["11"]["Position"] = UDim2.new(0.35784, 0, 0.06719, 0);
		G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["11"]["Text"] = [[]];

		-- StarterGui.sexy spy from tf2.Frame.Drag
		G2L["12"] = Instance.new("LocalScript", G2L["2"]);
		G2L["12"]["Name"] = [[Drag]];

		-- StarterGui.sexy spy from tf2.Frame.Main
		G2L["13"] = Instance.new("LocalScript", G2L["2"]);
		G2L["13"]["Name"] = [[Main]];

		-- StarterGui.sexy spy from tf2.Frame.Drag
		local function C_12()
			local script = G2L["12"];
			local frame = script.Parent
			local UserInputService = game:GetService("UserInputService")

			local dragging
			local dragInput
			local dragStart
			local startPos

			local function update(input)
				local delta = input.Position - dragStart
				frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			end

			frame.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					dragStart = input.Position
					startPos = frame.Position

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end)

			frame.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)

			UserInputService.InputChanged:Connect(function(input)
				if input == dragInput and dragging then
					update(input)
				end
			end)

		end;
		task.spawn(C_12);
		-- StarterGui.sexy spy from tf2.Frame.Main
		local function C_13()
			local script = G2L["13"];
			local TweenService = game:GetService("TweenService")

			local MainFrame = script.Parent
			local TopBar = MainFrame.TopBar

			local function Close()

				MainFrame.Parent:Destroy()

			end

			local function SetupButtons()

				TopBar.X.MouseEnter:Connect(function()
					TweenService:Create(TopBar.X, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(170, 0, 0)}):Play()
				end)

				TopBar.X.MouseLeave:Connect(function()
					TweenService:Create(TopBar.X, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(37, 35, 38)}):Play()
				end)

				TopBar.X.MouseButton1Click:Connect(function()
					Close()
				end)

				MainFrame.Buttons.Clear.MouseButton1Click:Connect(function()

					for _,v in pairs(MainFrame.Remotes:GetChildren()) do
						if v:IsA("TextButton") then
							v:Destroy()
						end
					end

				end)

			end

			local function Init()

				-- Close Function

				SetupButtons()

			end

			Init()
		end;
		task.spawn(C_13);

		local function getPathToInstance(instance)
			local path = {}
			local current = instance
			while current and current ~= game do
				local name = current.Name
				if name:sub(1, 4) == "Game" then
					name = "game" .. name:sub(5)
				end
				table.insert(path, 1, name)
				current = current.Parent
			end
			return table.concat(path, ".")
		end

		local function formatValue(value)
			if typeof(value) == "string" then
				return string.format("%q", value)
			elseif typeof(value) == "number" then
				return tostring(value)
			elseif typeof(value) == "boolean" then
				return value and "true" or "false"
			elseif typeof(value) == "Instance" then
				return getPathToInstance(value)
			else
				return string.format("%q", tostring(value))
			end
		end

		local function Format(args)
			local formattedArgs = {}
			for i, arg in ipairs(args) do
				formattedArgs[i] = string.format("[%d] = %s", i, formatValue(arg))
			end
			return formattedArgs
		end
		local tabelhell = nil
		tabelhell = function(newtonbar, depth)
			local value = "{"
			local deeper = ""
			for i=1,depth do
				deeper = deeper .. "	"
			end
			local passes = 0
			for name, value2 in pairs(newtonbar) do
				if type(value2) == "string" then value2 = '"' .. value2 .. '"' end
				if type(value2) == "table" then value2 = tabelhell(value2, depth+1) end
				local ender = ",\n"
				passes += 1
				if passes == #newtonbar then
					ender = ""
				end
				if not tonumber(name) then
					name = '"' .. name .. '"'
				end
				value = value .. deeper .. '[' .. name .. '] = ' .. tostring(value2) .. ender
			end
			value = value .. "\n}"
			return value
		end

		local function handleRemote(remote)
			local path = {}
			local current = remote
			while current and current.Parent ~= game do
				local name = current.Name
				if name:sub(1, 4) == "Game" then
					name = "game" .. name:sub(5)
				end
				table.insert(path, 1, name)
				current = current.Parent
			end
			local fullPath = table.concat(path, ".")

			if remote:IsA("RemoteEvent") then
				remote.OnClientEvent:Connect(function(...)
					local args = {...}
					local argsString = ""
					local passes = 0
					for name, value in pairs(args) do
						local value = value
						local newtonbar = value
						if type(value) == "string" then value = '"' .. value .. '"' end
						if type(newtonbar) == "table" then
							value = tablehell(newtonbar, 2)
						end
						if type(value) == "userdata" then value = value:GetFullName() end
						local ender = ","
						passes += 1
						if passes == #newtonbar then
							ender = ""
						end
						if not tonumber(name) then
							name = '"' .. name .. '"'
						end
						argsString = argsString .. '\n	[' .. name .. '] = ' .. tostring(value) .. ender
					end
					G2L["yu"] = G2L["e"]:Clone()
					G2L["yu"]["Name"] = remote.Name
					G2L["yu"]["Text"] = remote.Name
					G2L["yu"]["Parent"] = G2L["d"]
					G2L["yu"].MouseButton1Click:Connect(function()

						_G.Code = string.format([[local args = {
		%s
		}
		%s:FireServer(unpack(args))
		]], argsString, fullPath)

						G2L["11"]["Text"] = _G.Code
					end)
				end)
			elseif remote:IsA("RemoteFunction") then
				remote.OnClientInvoke = function(...)
					local args = {...}
					local argsString = ""
					local passes = 0
					for name, value in pairs(args) do
						local value = value
						local newtonbar = value
						if type(value) == "string" then value = '"' .. value .. '"' end
						if type(value) == "userdata" then value = value:GetFullName() end
						if type(newtonbar) == "table" then
							value = tablehell(newtonbar, 2)
						end
						local ender = ","
						passes += 1
						if passes == #newtonbar then
							ender = ""
						end
						if not tonumber(name) then
							name = '"' .. name .. '"'
						end
						argsString = argsString .. '\n	[' .. name .. '] = ' .. tostring(value) .. ender
					end

					G2L["yu2"] = G2L["e"]:Clone()
					G2L["yu2"]["Name"] = remote.Name
					G2L["yu2"]["Text"] = remote.Name
					G2L["yu2"]["Parent"] = G2L["d"]
					G2L["yu2"].MouseButton1Click:Connect(function()
						_G.Code = string.format([[local args = {
		%s
		}
		%s:InvokeServer(unpack(args))
		]], argsString, fullPath)
					end)

					return ...
				end
			end
		end

		local function wrapRemotes(folder)
			for _, obj in ipairs(folder:GetDescendants()) do
				if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
					handleRemote(obj)
				end
			end
			folder.DescendantAdded:Connect(function(descendant)
				if descendant:IsA("RemoteEvent") or descendant:IsA("RemoteFunction") then
					handleRemote(descendant)
				end
			end)
		end

		local folders = {
			game.ReplicatedStorage,
			game.StarterGui,
			game.StarterPack,
			game.StarterPlayer
		}

		for _, folder in ipairs(folders) do
			wrapRemotes(folder)
			folder.DescendantAdded:Connect(function(descendant)
				if descendant:IsA("RemoteEvent") or descendant:IsA("RemoteFunction") then
					handleRemote(descendant)
				end
			end)
		end

		return G2L["1"], require;

	end
})
Debugs:AddButton({
	Title = "Hydroxide",
	Description = "Ultimate Debugging, you may get kicked if they have good AC or namecall detection recommend the ac bypassers",
	Callback = function()
		local owner = "Upbolt"
		local branch = "revision"
		local function webImport(file)
			return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
		end
		webImport("init")
		webImport("ui/main")
	end
})
Debugs:AddButton({
	Title = "HttpSpy",
	Description = "Checks for Http request or post",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Httpspy/main/httpspy.txt"))()
	end
})
Debugs:AddButton({
	Title = "Game Tool Giver",
	Description = "A GUI that gives you tools found in the game by putting it in your backpack.",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gametoolgiver.lua"))()
	end
})
Debugs:AddButton({
	Title = "Game Tool Equipper",
	Description = "A GUI that equips the tool found in the game.",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gametoolequipper.lua"))()
	end
})
Debugs:AddButton({
	Title = "Game UI/Frame Viewer",
	Description = "A GUI that allows you to toggle and see hidden guis found in the game.",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gameuigiver.lua"))()
	end
})
Debugs:AddInput("FE Spam Sound (AC6 Sound Exploit)",{
	Title = "GUI Stealer",
	Default = "Put name of gui u want to convert must be screengui",
	Placeholder = "Put name of gui u want to convert must be screengui",
	Numeric = false, -- Only allows numbers
	Finished = false, -- Only calls callback when you press enter
	Callback = function(Value)
		local UIPath
		for i,v in pairs(game:GetDescendants()) do
			if v.Name == Value and v:IsA("ScreenGui") then
				UIPath = v
			end
		end
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/debugnation/main/decompilers%20and%20debugging/guistealer.txt"))()
	end
})
Debugs:AddButton({
	Title = "Game Fire RemoteEvent FireServer() GUI",
	Description = "A GUI that when clicked calls FireServer() to the found RemoteEvent in the game.",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gameremotefireserver.lua"))()
	end
})
Debugs:AddButton({
	Title = "Game Fire RemoteEvent InvokeClient() GUI",
	Description = "A GUI that when clicked calls InvokeClient() to the found RemoteEvent in the game.",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gameremoteinvokeclient.lua"))()
	end
})
Debugs:AddButton({
	Title = "Game Fire RemoteEvent InvokeServer() GUI",
	Description = "A GUI that when clicked calls InvokeServer() to the found RemoteEvent in the game.",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gameinvokeserver.lua"))()
	end
})
Debugs:AddButton({
	Title = "animation logger",
	Description = "A GUI that when local player does a animation it logs it",
	Callback = function()
		--This script made by WaveStorag and ChatGPT
		local gui = Instance.new("ScreenGui")
		gui.Parent = game:GetService("CoreGui")

		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(0.3, 0, 0.4, 0)
		frame.Position = UDim2.new(0.35, 0, 0.3, 0)
		frame.BackgroundColor3 = Color3.new(0, 0, 0)
		frame.BorderSizePixel = 0  -- Remove border
		frame.Parent = gui

		frame.Draggable = true
		frame.Active = true

		local topBar = Instance.new("Frame")
		topBar.Size = UDim2.new(1, 0, 0, 30)
		topBar.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
		topBar.BorderSizePixel = 0  -- Remove border
		topBar.Parent = frame

		local titleLabel = Instance.new("TextLabel")
		titleLabel.Size = UDim2.new(1, -380, 1, 0)
		titleLabel.Position = UDim2.new(0, 0, 0, 0)
		titleLabel.BackgroundTransparency = 1
		titleLabel.Text = "Animation Logger"
		titleLabel.Font = Enum.Font.SourceSans
		titleLabel.TextColor3 = Color3.new(1, 1, 1)
		titleLabel.TextSize = 20
		titleLabel.Parent = topBar

		local clearButton = Instance.new("TextButton")
		clearButton.Size = UDim2.new(0, 60, 0, 30)
		clearButton.Position = UDim2.new(1, -140, 0, 0)
		clearButton.BackgroundColor3 = Color3.new(1, 0, 0)
		clearButton.Text = "Clear All"
		clearButton.TextColor3 = Color3.new(1, 1, 1)
		clearButton.TextSize = 19
		clearButton.Font = Enum.Font.SourceSans
		clearButton.BackgroundTransparency = 1
		clearButton.Parent = topBar

		local scrollFrame = Instance.new("ScrollingFrame")
		scrollFrame.Size = UDim2.new(1, 0, 1, -30)
		scrollFrame.Position = UDim2.new(0, 0, 0, 30)
		scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		scrollFrame.ScrollBarThickness = 10
		scrollFrame.Parent = frame
		scrollFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)

		local logLayout = Instance.new("UIListLayout")
		logLayout.Parent = scrollFrame
		logLayout.SortOrder = Enum.SortOrder.LayoutOrder

		local loggedAnimations = {}

		local function logAnimation(animationName, animationId)
			if loggedAnimations[animationId] then
				return -- Animation already logged, exit function
			end
			loggedAnimations[animationId] = true -- Mark animation as logged
			local logEntry = Instance.new("TextButton")
			logEntry.Size = UDim2.new(1, -10, 0, 60) -- Increased height to accommodate both name and ID
			logEntry.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
			logEntry.Text = string.format("%s\nAnimation ID: %s", animationName, animationId) -- Display animation name and ID
			logEntry.TextWrapped = true -- Wrap text to fit within button
			logEntry.Font = Enum.Font.SourceSans
			logEntry.TextColor3 = Color3.new(1, 1, 1)
			logEntry.TextSize = 18
			logEntry.Parent = scrollFrame
			logEntry.MouseButton1Click:Connect(function()
				setclipboard(animationId)
			end)
			scrollFrame.CanvasSize = UDim2.new(0, 0, 0, logLayout.AbsoluteContentSize.Y)
		end

		logLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			scrollFrame.CanvasSize = UDim2.new(0, 0, 0, logLayout.AbsoluteContentSize.Y)
		end)

		local function onAnimationPlayed(animationTrack)
			local animation = animationTrack.Animation
			if animation then
				local animationId = animation.AnimationId
				local animationName = animation.Name or "Unknown Animation"
				logAnimation(animationName, animationId)
			end
		end

		local function trackPlayerAnimations()
			local player = game:GetService("Players").LocalPlayer
			local character = player.Character or player.CharacterAdded:Wait()
			local humanoid = character:WaitForChild("Humanoid")
			humanoid.AnimationPlayed:Connect(onAnimationPlayed)
		end

		trackPlayerAnimations()

		clearButton.MouseButton1Click:Connect(function()
			for _, child in ipairs(scrollFrame:GetChildren()) do
				if child:IsA("TextButton") then
					child:Destroy()
				end
			end
			loggedAnimations = {}
			scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		end)

		local xButton = Instance.new("TextButton")
		xButton.Size = UDim2.new(0, 30, 0, 30)
		xButton.Position = UDim2.new(1, -30, 0, 0)
		xButton.BackgroundColor3 = Color3.new(1, 0, 0)
		xButton.Text = "X"
		xButton.TextColor3 = Color3.new(1, 1, 1)
		xButton.TextSize = 24
		xButton.Font = Enum.Font.SourceSans
		xButton.BackgroundTransparency = 1
		xButton.Parent = topBar

		xButton.MouseButton1Click:Connect(function()
			gui:Destroy()
		end)

		local minimizeButton = Instance.new("TextButton")
		minimizeButton.Size = UDim2.new(0, 30, 0, 30)
		minimizeButton.Position = UDim2.new(1, -60, 0, 0)
		minimizeButton.BackgroundColor3 = Color3.new(0, 0, 1)
		minimizeButton.Text = "–"
		minimizeButton.TextColor3 = Color3.new(1, 1, 1)
		minimizeButton.TextSize = 24
		minimizeButton.Font = Enum.Font.SourceSans
		minimizeButton.BackgroundTransparency = 1
		minimizeButton.Parent = topBar

		-- Functionality to minimize/maximize the GUI when minimize button is clicked
		local isMinimized = false
		local originalSize = frame.Size
		minimizeButton.MouseButton1Click:Connect(function()
			isMinimized = not isMinimized
			if isMinimized then
				minimizeButton.Text = "+"
				frame.Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 30) -- Minimized size
				scrollFrame.Visible = false
			else
				minimizeButton.Text = "–"
				frame.Size = originalSize -- Restore to original size
				scrollFrame.Visible = true
			end
		end)
	end
})
Debugs:AddButton({
	Title = "audio logger",
	Description = "A GUI that when audio is played it logs it",
	Callback = function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/infyiff/backup/main/audiologger.lua'),true))()
	end
})
Debugs:AddButton({
	Title = "Game Subplace viewer",
	Description = "A GUI that shows all the subplaces of the current game and game ids",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/subplaceviewer.txt"))()
	end
})
Debugs:AddButton({
	Title = "Mobile Console Viewer",
	Description = "view console on mobile",
	Callback = function()
		local console = loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/debugnation/main/decompilers%20and%20debugging/Console%20UI.lua"))()
		local ui = console:load()
	end
})
Debugs:AddButton({
	Title = "Game saver",
	Description = "uses executor saveinstance()",
	Callback = function()
		saveinstance()
	end
})
Debugs:AddButton({
	Title = "Game saver 2",
	Description = "uses executor saveplace()",
	Callback = function()
		saveplace({FileName = "SkyHubSavedGame"})
	end
})
Debugs:AddButton({
	Title = "Game saver 3",
	Description = "uses online or script or sum saveinstance() DONT NEED SAVE INSTANCE",
	Callback = function()
		if saveinstance then
			getgenv().saveinstance = nil
		end
		loadstring(game:HttpGet("https://github.com/MuhXd/Roblox-mobile-script/blob/main/Arecus-X-Neo/Saveinstance.lua?raw=true"))();
	end
})
Debugs:AddButton({
	Title = "Xanes Model Recreator",
	Description = "copys link to scriptbloxpage",
	Callback = function()
		setclipboard("https://scriptblox.com/script/Universal-Script-Xanes-Model-Recreator-9892")

	end
})
local Settings = Window:AddTab({
	Title = "Settings",
	Icon = "settings"
})
InterfaceManager:BuildInterfaceSection(Settings)

SaveManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({
	'TextboxIdentifier'
})
SaveManager:SetFolder("Debuggers/Configs")

local Config = Window:AddTab({
	Title = "Config",
	Icon = "settings"
})
SaveManager:BuildConfigSection(Config)

SaveManager:LoadAutoloadConfig()
Window:SelectTab(1)
