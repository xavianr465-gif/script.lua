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
   Name = "Autogen Interface",
   LoadingTitle = "Autogen Suite",
   LoadingSubtitle = "GitHub Fix Applied",
   ConfigurationSaving = { Enabled = true, FolderName = "AutogenConfig", FileName = "Settings" },
   KeySystem = false,
})

local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateButton({
   Name = "EXECUTE AUTO-PUZZLE",
   Callback = function()
      -- This link specifically looks for the NEW file you are about to create
      local scriptUrl = "https://raw.githubusercontent.com/xavianr465-gif/script.lua/main/script.lua"
      
      local success, result = pcall(function()
          return game:HttpGet(scriptUrl)
      end)
      
      if success and result and not result:find("404") then
          local run, err = loadstring(result)
          if run then
              run()
              Rayfield:Notify({Title = "Success", Content = "Script is running!", Duration = 5})
          else
              -- This will trigger if the code inside your script.lua file has a typo
              Rayfield:Notify({Title = "Script Error", Content = "The code in your GitHub file is broken.", Duration = 8})
          end
      else
          Rayfield:Notify({Title = "Fetch Failed", Content = "Did you create the 'script.lua' file yet?", Duration = 10})
      end
   end,
})

Rayfield:Notify({Title = "Loaded", Content = "Ready for execution", Duration = 3})
