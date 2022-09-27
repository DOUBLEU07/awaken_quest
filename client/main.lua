local ESX = nil
local hasQuest = false
local isDead = false
local needquest = {}
local ServerEvent = {}
local PlayerData = {}
local successquest = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
		Citizen.Wait(0)
	end
	Citizen.Wait(5000)
	PlayerData.job = ESX.GetPlayerData().job
	-- loadBlips()
	LoadNPC()
end)

RegisterNetEvent('awaken_quest:loaded')
AddEventHandler('awaken_quest:loaded',function(save)
	if save then
		Question(save)
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob',function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function(xPlayer)
	PlayerData.job = xPlayer.job
end)

function loadBlips()
	local cfg_npc = Config["npc"]
	local npcquestion = cfg_npc["question"]
	local npcCoord = cfg_npc["question"]["coord"]
	local blip = AddBlipForCoord(npcCoord)
	SetBlipHighDetail(blip, true)
	SetBlipSprite(blip, 47)
	SetBlipScale(blip, 1.2)
	SetBlipColour(blip, 1)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('<font face="font4thai">จุดรับเควส</font>')
	EndTextCommandSetBlipName(blip)
end

function LoadNPC()
	local cfg_npc = Config["npc"]
	for k, v in pairs(cfg_npc) do
		Citizen.CreateThread(function()
			local npcHash = GetHashKey(v["model"])
			RequestModel(npcHash)
			while not HasModelLoaded(npcHash) do
				Citizen.Wait(1)
			end
			local ped = CreatePed(4, npcHash, v["coord"], v["heading"], false, true)
			v["onCreate"](ped)
		end)
	end
end

RegisterNetEvent("awaken_quest:addsuccessquest")
AddEventHandler("awaken_quest:addsuccessquest",function(namequest, _count)
	if needquest ~= nil then
		for k, v in pairs(needquest) do
			if v["name"] == namequest then
				if not v["success"] then
					v["count"] = v["count"] + _count
					if v["count"] >= v["max"] then
						v["success"] = true
						if hasQuest then
							TriggerServerEvent('awaken_quest:update', namequest, _count)
						end
						Citizen.Wait(1000)
						TriggerServerEvent('awaken_quest:questSuccess', namequest, v["max"])
						successquest = successquest + 1
						print(successquest)
						local sendToDiscord = '' .. GetPlayerName(PlayerId()) .. ' ทำเควส ' .. v["name"] .. ' สำเร็จ ' 
						TriggerServerEvent('azael_dc-serverlogs:sendToDiscord', 'QuestSuccess', sendToDiscord, GetPlayerServerId(PlayerId()), '^7')
					
					end
					break
				end
			end
		end
		
		SendNUIMessage({
			loadquest = true,
			needitem = needquest
		})
		
	end
end)

RegisterNetEvent("awaken_quest:Success")
AddEventHandler("awaken_quest:Success",function()
	needquest = {}
	hasQuest = false
	SendNUIMessage({
		hidemenu = true
	})
end)

local isShow = false
RegisterCommand("showquest", function()
    isShow = not isShow
    if isShow then
        SendNUIMessage({
            showmenu = true
		})
		else
        SendNUIMessage({
            hidemenu = true
		})
	end
end)

Citizen.CreateThread(function()
	while true do
		local SleepThread = 1000
		local player = PlayerPedId()
		local pedCoords = GetEntityCoords(player)
		local cfg_npc = Config["npc"]
		local npcquestion = cfg_npc["question"]
		local npcCoord = cfg_npc["question"]["coord"]
		if GetDistanceBetweenCoords(pedCoords, npcCoord.x, npcCoord.y, npcCoord.z, false) < 2 then
			SleepThread = 1
			if hasQuest then
				-- DrawText3D("<font face ='font4thai'>คุณได้รับเควศไปแล้วหน่ะ", npcCoord.x, npcCoord.y, npcCoord.z + 0.3)
				-- DrawText3D("<font face ='font4thai'>~g~เช็คข้อมูลเควสได้โดยพิม",npcCoord.x, npcCoord.y, npcCoord.z + 0.15)
				DrawText3D("เปิดปิดเมนู ~r~/showquest",npcCoord.x, npcCoord.y, npcCoord.z + 1.0)
			else
				DrawText3D("Press [~g~E~s~] to get QUEST",npcCoord.x, npcCoord.y, npcCoord.z + 1.0)
			end
			if IsControlJustReleased(0, 38) and not hasQuest then
				Question()
			end
		end
		Citizen.Wait(SleepThread)
	end
end)

Citizen.CreateThread(function()
	while true do
		local SleepThread = 1000
		local successquestion = Config.npc.succession
		local successCoords = successquestion.coord
		local player = PlayerPedId()
		local pedCoords = GetEntityCoords(player)
		if GetDistanceBetweenCoords(pedCoords, successCoords.x, successCoords.y, successCoords.z, false) < 2 then
			SleepThread = 1
			DrawText3D("Press [~g~E~s~] to send QUEST",successCoords.x, successCoords.y, successCoords.z)
			if IsControlJustReleased(0, 38) and hasQuest and successquest == 5 then
				SuccessQuestion()
			end
		end
		Citizen.Wait(SleepThread)
	end
end)

function SuccessQuestion()
	TriggerEvent('awaken_quest:Success')
	TriggerServerEvent('awaken_quest:done')
	successquest = 0
end

function Question(saves)
	
	local random = math.random(Config["RandomQuest"][1], Config["RandomQuest"][2])
	
	if saves then
		
		local questList = {}
		
		for k, v in pairs(saves) do
			local data = {
				name = k
			}
			
			for key, value in pairs(v) do
				data[key] = value
			end
			
			table.insert(questList, data)
		end
		
		for i = 1, #questList do
			needquest[i] = questList[i]
		end
		
		random = #needquest
		
		else
		
		for i = 1, random, 1 do
			local randomquest = Config["listquest"]["unemployed"][math.random(#Config["listquest"]["unemployed"])]
			
			local jobs = {
				police = Config["listquest"]["police"],
				ambulance = Config["listquest"]["ambulance"],
				concil = Config["listquest"]["concil"],
				rsk = Config["listquest"]["rsk"],
				cl = Config["listquest"]["cl"],
				xten = Config["listquest"]["xten"],
				neko = Config["listquest"]["neko"],
				mds = Config["listquest"]["mds"],
				stx = Config["listquest"]["stx"],
			}
			
			if jobs[ESX.GetPlayerData().job.name] then
				randomquest = jobs[ESX.GetPlayerData().job.name][math.random(#jobs[ESX.GetPlayerData().job.name])]
			end
			
			local chk = false
			
			for k, v in ipairs(needquest) do
				if v.name == randomquest.name then
					chk = true
					break
				end
			end
			
			if not chk then
				needquest[i] = {
					name = randomquest.name,
					label = randomquest.label,
					count = 0,
					success = false,
					max = math.random(randomquest.amount[1], randomquest.amount[2])
				}
				else
				break
			end
			
		end
		
	end
	if random ~= #needquest then
		Question()
		else
		hasQuest = true
		SendNUIMessage({
			showmenu = true
		})
		SendNUIMessage({
			loadquest = true,
			needitem = needquest
		})
		TriggerServerEvent('awaken_quest:addQuest', needquest)
	end
end

exports('GetQuest',function()
	return hasQuest
end)	

RegisterFontFile('font4thai') 

DrawText3D = function(text, x, y, z)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
    local xxxx = RegisterFontId('font4thai')
	local scale = 0.45
   
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(xxxx)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 700
	end
end