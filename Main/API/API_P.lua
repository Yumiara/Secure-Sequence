if not PlaceId then return game:GetService("Players").LocalPlayer:Kick("Missing PlaceId, Report bug to TTJY"); end;
if not GameId then return game:GetService("Players").LocalPlayer:Kick("Missing GameId, Report bug to TTJY"); end;

local idx = nil;

if GameId == 2294168059 then
    idx = "2294168059";
    if not getgenv().Risk then
    return game:GetService("Players").LocalPlayer:Kick("Anti Cheat has updated, do not use until further notice.");
    end
end;

if not idx then
    return game:GetService("Players").LocalPlayer:Kick("Missing IDX, Report bug to TTJY");
end;

return loadScriptFromCache("https://raw.githubusercontent.com/Yumiara/Secure-Sequence/refs/heads/main/Main/API/API_K.lua", "API_K", false, 600, true);
