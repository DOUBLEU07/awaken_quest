ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
local temData = {}

function getIden(playerID)
    local xPlayer = ESX.GetPlayerFromId(playerID)
    return xPlayer.getIdentifier()
end

RegisterNetEvent('awaken_quest:addQuest')
AddEventHandler('awaken_quest:addQuest',function(data)
    local iden = getIden(source)
    temData[iden] = {}
    for i = 1, #data do
        temData[iden][data[i].name] = {
            count = data[i].count,
            max = data[i].max,
            success = data[i].success,
            label = data[i].label
        }
    end
end)

RegisterNetEvent('awaken_quest:questSuccess')
AddEventHandler('awaken_quest:questSuccess',function()
    print("DONE")
end)

RegisterNetEvent('awaken_quest:done')
AddEventHandler('awaken_quest:done',function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem("quest_success",1)

    if Config.ItemBonus ~= nil then
        for k,v in pairs(Config.ItemBonus) do
            if math.random(1, 100) <= v.Percent then
                xPlayer.addInventoryItem(v.ItemName, v.ItemCount)

                local sendToDiscord = '' .. xPlayer.name .. "ทำเควสสำเร็จได้รับ " .. v.ItemName .. ' จำนวน ' .. v.ItemCount .. ''
                TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'BonusQuest', sendToDiscord, source, '^3')
            end
        end
    end
end)