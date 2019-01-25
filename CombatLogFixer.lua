-- Author      : Ville
-- Create Date : 25/01/2019
-- Updated	   : 25/01/2019

function OnLoad()
  this:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
  this:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
  
  logTime = GetTime()
  castTime = GetTime()
  
end

function OnEvent()
  if event == "UNIT_SPELLCAST_SUCCEEDED" then
    castTime = GetTime()
    checkTime()
  end

  if event == "COMBAT_LOG_EVENT_UNFILTERED" then
    logTime = GetTime()
  end
end

function checkTime()
  if castTime - logTime > 1 then
    CombatLogClearEntries()
  end
end
