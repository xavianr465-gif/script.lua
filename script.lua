-- // 1. Global Settings
getgenv().autogenSettings = {
    PUZZLES_BEFORE_REJOIN = 15,
    PLAYERS_BEFORE_START = 3,
    MAXIMUM_TIMER_SECONDS = 120,
    MINIMUM_TIMER_SECONDS = 3,
    RECENT_SERVER_BLOCKLIST_LENGTH = 5,
    PLAYER_TIMER_CHECK = 1,
    SWAP_ON_MS4 = true,
    SKIP_LAST_PUZZLE = false,
    DISABLE_RENDERING = false,
    AUTO_HIDE_ABILITY = true,
    RUN_ONLY_WHEN_COOLKIDD = false,
    WEBHOOK = "",
}

-- // 2. UI Setup
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Autogen Suite | Mobile",
   LoadingTitle = "Loading Script...",
   LoadingSubtitle = "by xavianr465",
   ConfigurationSaving = { Enabled = true, FolderName = "Autogen", FileName = "Config" },
   KeySystem = false,
})

-- // 3. Main Tab
local MainTab = Window:CreateTab("Automation", 4483362458)

MainTab:CreateSection("Main Controls")

MainTab:CreateButton({
   Name = "EXECUTE AUTO-PUZZLE",
   Callback = function()
      -- This is the exact RAW link needed for your specific repo
      local scriptUrl = "https://raw.githubusercontent.com/xavianr465-gif/script.lua/main/script.lua"
      
      local success, result = pcall(function()
          return game:HttpGet(scriptUrl)
      end)
      
      if success and result and not result:find("404") then
          -- This runs the code from your GitHub
          local run, err = loadstring(result)
          if run then
              run()
              Rayfield:Notify({Title = "Success", Content = "Script Executed!", Duration = 5})
          else
              Rayfield:Notify({Title = "Error", Content = "Lua error in GitHub file.", Duration = 5})
          end
      else
          -- This is the "Not Found" error you keep seeing
          Rayfield:Notify({Title = "Fetch Failed", Content = "Could not find script.lua. Check GitHub visibility.", Duration = 10})
      end
   end,
})

-- // 4. Settings Tab
local SettingsTab = Window:CreateTab("Settings", 4483362458)

SettingsTab:CreateToggle({
   Name = "Disable Rendering",
   CurrentValue = false,
   Callback = function(Value)
      getgenv().autogenSettings.DISABLE_RENDERING = Value
   end,
})

Rayfield:Notify({Title = "Ready", Content = "Interface Loaded Successfully", Duration = 3})
