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
}

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Autogen Interface",
   LoadingTitle = "Autogen Suite",
   LoadingSubtitle = "Connection Fixed",
   ConfigurationSaving = { Enabled = true, FolderName = "AutogenConfig", FileName = "Settings" },
   KeySystem = false,
})

local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateButton({
   Name = "EXECUTE (GITHUB PATH)",
   Callback = function()
      -- This path is very specific. If your branch is not named "main", it fails.
      local url = "https://raw.githubusercontent.com/xavianr465-gif/script.lua/main/script.lua"
      local success, result = pcall(function() return game:HttpGet(url) end)
      
      if success and not result:find("404") then
          loadstring(result)()
          Rayfield:Notify({Title = "Success", Content = "Running from GitHub", Duration = 5})
      else
          Rayfield:Notify({Title = "Fetch Failed", Content = "GitHub link invalid. Try the Pastebin button.", Duration = 10})
      end
   end,
})

MainTab:CreateButton({
   Name = "EXECUTE (PASTEBIN PATH)",
   Callback = function()
      -- Pastebin is usually more stable for mobile executors
      local url = "https://pastebin.com/raw/UMuqMbzP"
      local success, result = pcall(function() return game:HttpGet(url) end)
      
      if success and not result:find("404") then
          loadstring(result)()
          Rayfield:Notify({Title = "Success", Content = "Running from Pastebin", Duration = 5})
      else
          Rayfield:Notify({Title = "Fetch Failed", Content = "Pastebin is down or link is dead.", Duration = 10})
      end
   end,
})
