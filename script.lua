-- // 1. Configuration
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
}

-- // 2. UI Setup
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Autogen Interface",
   LoadingTitle = "Autogen Suite",
   LoadingSubtitle = "Raw Link Logic Applied",
   ConfigurationSaving = { Enabled = true, FolderName = "AutogenConfig", FileName = "Main" },
   KeySystem = false,
})

local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateButton({
   Name = "EXECUTE AUTO-PUZZLE",
   Callback = function()
      -- THIS IS THE CORRECT RAW LINK FOR THE REPO YOU SENT
      local rawUrl = "https://raw.githubusercontent.com/xavianr465-gif/script.lua/main/script.lua"
      
      local success, result = pcall(function()
          return game:HttpGet(rawUrl)
      end)
      
      if success and result and not result:find("404") then
          local run, err = loadstring(result)
          if run then
              run()
              Rayfield:Notify({Title = "Success", Content = "Script fetched and running!", Duration = 5})
          else
              -- This error means the code INSIDE your script.lua file on GitHub has a typo
              Rayfield:Notify({Title = "Internal Error", Content = "The code on GitHub is broken.", Duration = 10})
              warn("Lua Error: " .. tostring(err))
          end
      else
          -- If it still says this, your repo is likely PRIVATE
          Rayfield:Notify({Title = "Fetch Failed", Content = "Ensure your GitHub Repo is PUBLIC.", Duration = 10})
      end
   end,
})

Rayfield:Notify({Title = "Ready", Content = "Tap Execute to Begin", Duration = 3})
