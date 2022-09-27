Config = {}

Config["RandomQuest"] = {5,5}

Config.npc = {
    question = {
        coord = vector3(-355.1700134277344, -971.1300048828124, 30.98999977111816),
        heading = 340.67,
        model = 'mp_m_shopkeep_01',
        onCreate = function(ped)
            RequestAnimDict("mini@strip_club@idles@bouncer@base")
            while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
                Citizen.Wait(1)
			end
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            TaskPlayAnim(ped, "mini@strip_club@idles@bouncer@base", "base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
		end
	},
    succession = {
        coord = vector3(-361.4200134277344, -961.1599731445312, 30.98999977111816),
        heading = 239.1,
        model = 'mp_m_shopkeep_01',
        onCreate = function(ped)
            RequestAnimDict("mini@strip_club@idles@bouncer@base")
            while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
                Citizen.Wait(1)
			end
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            TaskPlayAnim(ped, "mini@strip_club@idles@bouncer@base", "base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
		end
	}
}

Config.ItemBonus = {   -- ไอเท็มโบนัส
		{
			ItemName = "bubble",  -- ชื่อไอเท็ม
			ItemCount = 10,  
			Percent = 100   -- เปอร์เซ็น
		},
		{
			ItemName = "gold_bar",  -- ชื่อไอเท็ม
			ItemCount = 1,  
			Percent = 50   -- เปอร์เซ็น
		},
		{
			ItemName = "diamond",  -- ชื่อไอเท็ม
			ItemCount = 1,  
			Percent = 50   -- เปอร์เซ็น
		},
		{
			ItemName = "ruby",  -- ชื่อไอเท็ม
			ItemCount = 1,  
			Percent = 50   -- เปอร์เซ็น
		},
		{
			ItemName = "space_stone",  -- ชื่อไอเท็ม
			ItemCount = 1,  
			Percent = 40   -- เปอร์เซ็น
		},
		{
			ItemName = "power_stone",  -- ชื่อไอเท็ม
			ItemCount = 1,  
			Percent = 40   -- เปอร์เซ็น
		},
		{
			ItemName = "fixkit",  -- ชื่อไอเท็ม
			ItemCount = 1,  
			Percent = 30   -- เปอร์เซ็น
		},
		{
			ItemName = "gacha_event",  -- ชื่อไอเท็ม
			ItemCount = 1,  
			Percent = 25   -- เปอร์เซ็น
		},
		{
			ItemName = "tickit_1k",  -- ชื่อไอเท็ม
			ItemCount = 1,  
			Percent = 20   -- เปอร์เซ็น
		},
		{
			ItemName = "gacha_rsx",  -- ชื่อไอเท็ม
			ItemCount = 1,  
			Percent = 10   -- เปอร์เซ็น
		},
}

Config.listquest = {
	["unemployed"] = {
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "mine", label = 'ขุดเหมือง', amount = {30, 30}},
		{name = "mineinfinite", label = 'ขุดเหมืองมณีอวกาศ', amount = {30, 30}},
		{name = "vegs", label = 'เก็บผัก', amount = {30, 30}},
		{name = "sunflower", label = 'เก็บทานตะวัน', amount = {30, 30}},
		{name = "banana", label = 'เก็บกล้วย', amount = {30, 30}},
		{name = "lay", label = 'เก็บมันม่วง', amount = {30, 30}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
	},
	["mds"] = {
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "mine", label = 'ขุดเหมือง', amount = {30, 30}},
		{name = "mineinfinite", label = 'ขุดเหมืองมณีอวกาศ', amount = {30, 30}},
		{name = "vegs", label = 'เก็บผัก', amount = {30, 30}},
		{name = "sunflower", label = 'เก็บทานตะวัน', amount = {30, 30}},
		{name = "banana", label = 'เก็บกล้วย', amount = {30, 30}},
		{name = "lay", label = 'เก็บมันม่วง', amount = {30, 30}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
	},
	["rsk"] = {
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "mine", label = 'ขุดเหมือง', amount = {30, 30}},
		{name = "mineinfinite", label = 'ขุดเหมืองมณีอวกาศ', amount = {30, 30}},
		{name = "vegs", label = 'เก็บผัก', amount = {30, 30}},
		{name = "sunflower", label = 'เก็บทานตะวัน', amount = {30, 30}},
		{name = "banana", label = 'เก็บกล้วย', amount = {30, 30}},
		{name = "lay", label = 'เก็บมันม่วง', amount = {30, 30}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
	},
	["cl"] = {
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "mine", label = 'ขุดเหมือง', amount = {30, 30}},
		{name = "mineinfinite", label = 'ขุดเหมืองมณีอวกาศ', amount = {30, 30}},
		{name = "vegs", label = 'เก็บผัก', amount = {30, 30}},
		{name = "sunflower", label = 'เก็บทานตะวัน', amount = {30, 30}},
		{name = "banana", label = 'เก็บกล้วย', amount = {30, 30}},
		{name = "lay", label = 'เก็บมันม่วง', amount = {30, 30}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
	},
	["xten"] = {
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "mine", label = 'ขุดเหมือง', amount = {30, 30}},
		{name = "mineinfinite", label = 'ขุดเหมืองมณีอวกาศ', amount = {30, 30}},
		{name = "vegs", label = 'เก็บผัก', amount = {30, 30}},
		{name = "sunflower", label = 'เก็บทานตะวัน', amount = {30, 30}},
		{name = "banana", label = 'เก็บกล้วย', amount = {30, 30}},
		{name = "lay", label = 'เก็บมันม่วง', amount = {30, 30}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
	},
	["stx"] = {
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "mine", label = 'ขุดเหมือง', amount = {30, 30}},
		{name = "mineinfinite", label = 'ขุดเหมืองมณีอวกาศ', amount = {30, 30}},
		{name = "vegs", label = 'เก็บผัก', amount = {30, 30}},
		{name = "sunflower", label = 'เก็บทานตะวัน', amount = {30, 30}},
		{name = "banana", label = 'เก็บกล้วย', amount = {30, 30}},
		{name = "lay", label = 'เก็บมันม่วง', amount = {30, 30}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
	},
	["neko"] = {
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "mine", label = 'ขุดเหมือง', amount = {30, 30}},
		{name = "mineinfinite", label = 'ขุดเหมืองมณีอวกาศ', amount = {30, 30}},
		{name = "vegs", label = 'เก็บผัก', amount = {30, 30}},
		{name = "sunflower", label = 'เก็บทานตะวัน', amount = {30, 30}},
		{name = "banana", label = 'เก็บกล้วย', amount = {30, 30}},
		{name = "lay", label = 'เก็บมันม่วง', amount = {30, 30}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
	},
	["zone"] = {
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "mine", label = 'ขุดเหมือง', amount = {30, 30}},
		{name = "mineinfinite", label = 'ขุดเหมืองมณีอวกาศ', amount = {30, 30}},
		{name = "vegs", label = 'เก็บผัก', amount = {30, 30}},
		{name = "sunflower", label = 'เก็บทานตะวัน', amount = {30, 30}},
		{name = "banana", label = 'เก็บกล้วย', amount = {30, 30}},
		{name = "lay", label = 'เก็บมันม่วง', amount = {30, 30}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
	},
	["viper"] = {
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "mine", label = 'ขุดเหมือง', amount = {30, 30}},
		{name = "mineinfinite", label = 'ขุดเหมืองมณีอวกาศ', amount = {30, 30}},
		{name = "vegs", label = 'เก็บผัก', amount = {30, 30}},
		{name = "sunflower", label = 'เก็บทานตะวัน', amount = {30, 30}},
		{name = "banana", label = 'เก็บกล้วย', amount = {30, 30}},
		{name = "lay", label = 'เก็บมันม่วง', amount = {30, 30}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
	},
	["cs"] = {
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "mine", label = 'ขุดเหมือง', amount = {30, 30}},
		{name = "mineinfinite", label = 'ขุดเหมืองมณีอวกาศ', amount = {30, 30}},
		{name = "vegs", label = 'เก็บผัก', amount = {30, 30}},
		{name = "sunflower", label = 'เก็บทานตะวัน', amount = {30, 30}},
		{name = "banana", label = 'เก็บกล้วย', amount = {30, 30}},
		{name = "lay", label = 'เก็บมันม่วง', amount = {30, 30}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
	},
	["sigma"] = {
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "mine", label = 'ขุดเหมือง', amount = {30, 30}},
		{name = "mineinfinite", label = 'ขุดเหมืองมณีอวกาศ', amount = {30, 30}},
		{name = "vegs", label = 'เก็บผัก', amount = {30, 30}},
		{name = "sunflower", label = 'เก็บทานตะวัน', amount = {30, 30}},
		{name = "banana", label = 'เก็บกล้วย', amount = {30, 30}},
		{name = "lay", label = 'เก็บมันม่วง', amount = {30, 30}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
	},
	["stl"] = {
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "mine", label = 'ขุดเหมือง', amount = {30, 30}},
		{name = "mineinfinite", label = 'ขุดเหมืองมณีอวกาศ', amount = {30, 30}},
		{name = "vegs", label = 'เก็บผัก', amount = {30, 30}},
		{name = "sunflower", label = 'เก็บทานตะวัน', amount = {30, 30}},
		{name = "banana", label = 'เก็บกล้วย', amount = {30, 30}},
		{name = "lay", label = 'เก็บมันม่วง', amount = {30, 30}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
	},
	["puppy"] = {
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "mine", label = 'ขุดเหมือง', amount = {30, 30}},
		{name = "mineinfinite", label = 'ขุดเหมืองมณีอวกาศ', amount = {30, 30}},
		{name = "vegs", label = 'เก็บผัก', amount = {30, 30}},
		{name = "sunflower", label = 'เก็บทานตะวัน', amount = {30, 30}},
		{name = "banana", label = 'เก็บกล้วย', amount = {30, 30}},
		{name = "lay", label = 'เก็บมันม่วง', amount = {30, 30}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
	},
	["puppy"] = {
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "mine", label = 'ขุดเหมือง', amount = {30, 30}},
		{name = "mineinfinite", label = 'ขุดเหมืองมณีอวกาศ', amount = {30, 30}},
		{name = "vegs", label = 'เก็บผัก', amount = {30, 30}},
		{name = "sunflower", label = 'เก็บทานตะวัน', amount = {30, 30}},
		{name = "banana", label = 'เก็บกล้วย', amount = {30, 30}},
		{name = "lay", label = 'เก็บมันม่วง', amount = {30, 30}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
	},
	["police"] = {
		{name = "billing", label = 'ใส่บิลผู้ต้องหา', amount = {2000, 3000}},
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "jail", label = 'จำคุกผู้ต้องหา', amount = {1, 2}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "impound", label = 'ยึดรถ', amount = {1, 2}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
	},
	["ambulance"] = {
		{name = "billing", label = 'ใส่บิลคนไข้', amount = {2000, 3000}},
		{name = "syringe", label = 'ฉีดยา', amount = {1, 4}},
		{name = "revive", label = 'ชุบคนสลบ', amount = {1, 4}},
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
	},
	["concil"] = {
		{name = "withdraw", label = 'ถอนเงิน', amount = {5000, 10000}},
		{name = "deposit", label = 'ฝากเงิน', amount = {5000, 10000}},
		{name = "fixcar", label = 'ซ่อมรถ', amount = {1, 2}},
		{name = "mine", label = 'ขุดเหมือง', amount = {30, 30}},
		{name = "mineinfinite", label = 'ขุดเหมืองมณีอวกาศ', amount = {30, 30}},
		{name = "vegs", label = 'เก็บผัก', amount = {30, 30}},
		{name = "sunflower", label = 'เก็บทานตะวัน', amount = {30, 30}},
		{name = "banana", label = 'เก็บกล้วย', amount = {30, 30}},
		{name = "lay", label = 'เก็บมันม่วง', amount = {30, 30}},
		{name = "clothing", label = 'เปลี่ยนเสื้อผ้า', amount = {1, 1}},
		{name = "barber", label = 'เปลี่ยนทรงผม', amount = {1, 1}},
		
	}
}

Config.quest = {
    name = '~g~เควส',
}
