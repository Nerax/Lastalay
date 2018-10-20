facepalm = false

function getSurrenderStatus()
	return facepalm
end

RegisterNetEvent('facepalm:getSurrenderStatusPlayer')
AddEventHandler('facepalm:getSurrenderStatusPlayer',function(event,source)
		if facepalm then
			TriggerServerEvent("facepalm:reSendSurrenderStatus",event,source,true)
		else
			TriggerServerEvent("facepalm:reSendSurrenderStatus",event,source,false)
		end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local lPed = GetPlayerPed(-1)
		RequestAnimDict("anim@mp_player_intupperface_palm")
		if not IsPedInAnyVehicle(lPed, false) and not IsPedSwimming(lPed) and not IsPedShooting(lPed) and not IsPedClimbing(lPed) and not IsPedCuffed(lPed) and not IsPedDiving(lPed) and not IsPedFalling(lPed) and not IsPedJumping(lPed) and not IsPedJumpingOutOfVehicle(lPed) and IsPedOnFoot(lPed) and not IsPedRunning(lPed) and not IsPedUsingAnyScenario(lPed) and not IsPedInParachuteFreeFall(lPed) then
			if IsControlPressed(1, 82) then
				if DoesEntityExist(lPed) then
					SetCurrentPedWeapon(lPed, 0xA2719263, true)
					Citizen.CreateThread(function()
						RequestAnimDict("anim@mp_player_intupperface_palm")
						while not HasAnimDictLoaded("anim@mp_player_intupperface_palm") do
							Citizen.Wait(100)
						end

						if not facepalm then
							facepalm = true
							TaskPlayAnim(lPed, "anim@mp_player_intupperface_palm", "idle_a", 8.0, 8.0, -1, 49, 0, 0, 0, 0)
						end   
					end)
				end
			end
		end
		if IsControlReleased(1, 82) then
			if DoesEntityExist(lPed) then
				Citizen.CreateThread(function()
					RequestAnimDict("anim@mp_player_intupperface_palm")
					while not HasAnimDictLoaded("anim@mp_player_intupperface_palm") do
						Citizen.Wait(100)
					end

					if facepalm then
						facepalm = false
						ClearPedSecondaryTask(lPed)
					end
				end)
			end
		end
	end
end)