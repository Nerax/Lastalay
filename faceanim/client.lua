
local anims = { 
  "mood_injured_1",
  "shocked_1",
  "mood_knockout_1",
  "mood_aiming_1",
  "mood_drunk_1",
  "smoking_hold_1",
  "mood_sleeping_1",
  "mood_stressed_1",
  "mood_drivefast_1",
  "mood_happy_1",
  "mood_angry_1",
  "electrocuted_1",
  "pain_5",
  "effort_1",
  "mood_smug_1",
  "mood_sulk_1"
}

local current = 0

Citizen.CreateThread(function()
  while true do
    Wait(1)
    
    if IsControlJustPressed(0, 168) then -- Z
      current = current + 1
      if current > #anims then current = 0 end
      
      if current == 0 then
        ClearFacialIdleAnimOverride(PlayerPedId())
      else
        Citizen.InvokeNative(0xFFC24B988B938B38, PlayerPedId(), anims[current], 0)
      end
    end
    
  end
end)