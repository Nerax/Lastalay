RegisterServerEvent('facepalm:getSurrenderStatus')
AddEventHandler('facepalm:getSurrenderStatus', function(event,targetID)
	TriggerClientEvent("facepalm:getSurrenderStatusPlayer",targetID,event,source)
end)

RegisterServerEvent('facepalm:sendSurrenderStatus')
AddEventHandler('facepalm:sendSurrenderStatus', function(event,targetID,facepalm)
	TriggerClientEvent(event,targetID,facepalm)
end)

RegisterServerEvent('facepalm:reSendSurrenderStatus')
AddEventHandler('facepalm:reSendSurrenderStatus', function(event,targetID,facepalm)
	TriggerClientEvent(event,targetID,facepalm)
end)