-- 模拟一次攻击（攻击目标是target），参数1为0默认当前攻击，为1模拟主手，为2模拟副手，为3模拟25%主手25%副手50%双手同时攻击，为4模拟副手但概率是副手武器熟练度2星50%、5星100%
function SY_ATTCK(effect, targetObject)
	local sourceSprite = EEex_GameObject_Get(effect.m_sourceId)
	local targetSprite = EEex_GameObject_Get(targetObject.m_id)
	local handType = effect.m_effectAmount
	if handType == 0 then
		local weaponRes1, fightingStyle, isLeftAttack = ST_GetCurrentWeapon(sourceSprite, true)
		ST_MockAttack(sourceSprite, targetSprite, weaponRes1, isLeftAttack)
	elseif handType == 1 then
		local weaponRes1, weaponRes2, fightingStyle, isLeftAttack = ST_GetCurrentWeapon(sourceSprite, false)
		ST_MockAttack(sourceSprite, targetSprite, weaponRes1, false)
	elseif handType == 2 then
		local weaponRes1, weaponRes2, fightingStyle, isLeftAttack = ST_GetCurrentWeapon(sourceSprite, false)
		if fightingStyle == 4 then
			ST_MockAttack(sourceSprite, targetSprite, weaponRes2, true)
		end
	elseif handType == 3 then
		local weaponRes1, weaponRes2, fightingStyle, isLeftAttack = ST_GetCurrentWeapon(sourceSprite, false)
		if fightingStyle == 4 then
			local rateRoll = math.random(4)
			if rateRoll > 1 then
				ST_MockAttack(sourceSprite, targetSprite, weaponRes1, false)
			end
			if rateRoll < 4 then
				ST_MockAttack(sourceSprite, targetSprite, weaponRes2, true)
			end
		else
			ST_MockAttack(sourceSprite, targetSprite, weaponRes1, false)
		end
	elseif handType == 4 then
		local weaponRes1, weaponRes2, fightingStyle, isLeftAttack = ST_GetCurrentWeapon(sourceSprite, false)
		if fightingStyle == 4 then	--确认是双武器
			local equipmentArray = sourceSprite.m_equipment.m_items	-- 读取装备序列
			local leftHandItem = equipmentArray:get(9)
			local leftHandItemResName = leftHandItem.cResRef:get()
			local leftHandItemRes = EEex_Resource_Fetch(leftHandItemResName, "ITM")	
			local leftweaponProficiencyIndex = leftHandItemRes.pHeader.proficiencyType
			local weaponProficiencyL = ST_GetWeaponProficiency(sourceSprite, leftweaponProficiencyIndex)
			if weaponProficiencyL > 4 then	--副手武器五星，模拟一次副手攻击
				ST_MockAttack(sourceSprite, targetSprite, weaponRes2, true)
			elseif weaponProficiencyL > 1 and weaponProficiencyL < 5 then	--副手武器2~4星，50%模拟一次副手攻击
				local rateRoll = math.random(2)
				if rateRoll == 1 then
					ST_MockAttack(sourceSprite, targetSprite, weaponRes2, true)	--模拟一次副手攻击
				end
			end
		end
	end
end

--攻击命中时调用，模拟一次范围刀刃攻击，调用前先判断当前为主副手以及是否使用大型剑，是大型剑才进行模拟（攻击目标是target）
--无论单双手都有可能调用此函数，调用前提是已经装备大型剑。需要注意主手为双手武器时副手武器不合法
--可能遇到一只手是大型剑但另一只手攻击命中的情况，这个时候不应放出回旋斩但要移除SY#WE1HC/2HC对SY#WE1HB/2HB的免疫，以便继续判断
--整个回旋斩动画和文字都在这个函数里，以应付回旋斩触发但手不对的情况
function SY_ATKE(effect, targetObject)
	local sourceSprite = EEex_GameObject_Get(effect.m_sourceId)
	local targetSprite = EEex_GameObject_Get(targetObject.m_id)
	local leftAttackCount = sourceSprite.m_leftAttack
	local isTwoHanded = false
	local isdualHanded = false
	local isLeftAttack = false
	local equipmentArray = sourceSprite.m_equipment.m_items	-- 读取装备序列
	-- 读取主手物品
	local rightHandItem = equipmentArray:get(sourceSprite.m_equipment.m_selectedWeapon)	-- 当前主手武器
	local rightHandItemRes = nil
	if rightHandItem then
		local rightHandItemName = rightHandItem.cResRef:get()
		rightHandItemRes = EEex_Resource_Fetch(rightHandItemName, "ITM")
		local rightHandItemFlags = rightHandItemRes.pHeader.itemFlags
		if bit32.extract(rightHandItemFlags, 1) == 1 then	-- Two-handed flag
			isTwoHanded = true
		end
	end
	-- 读取副手物品
	local leftHandItem = equipmentArray:get(9)
	local leftHandItemRes = nil
	if leftHandItem then --副手存在物品
		local leftHandItemResName = leftHandItem.cResRef:get()
		leftHandItemRes = EEex_Resource_Fetch(leftHandItemResName, "ITM")
		if leftHandItemRes.pHeader.itemType ~= 12 and not isTwoHanded then	-- 副手不是盾牌且主手不是双手武器
			isdualHanded = true --是合法的双武器
		end
	end
	if (leftAttackCount == 1) and isdualHanded then -- 当前攻击为左手且是合法双武器
		if leftHandItemRes.pHeader.itemType == 20 then --左手武器类型合适，模拟一次左手攻击
			EEex_GameObject_ApplyEffect(sourceSprite,{["effectID"] = 139, ["effectAmount"] = 11768, })
			EEex_GameObject_ApplyEffect(sourceSprite,{["effectID"] = 267, ["duration"] = 5, ["durationType"] = 10, ["effectAmount"] = 11768, })
			EEex_GameObject_ApplyEffect(sourceSprite,{["effectID"] = 215, ["duration"] = 1, ["dwFlags"] = 1, ["res"] = "SY#WSLSH",})
			ST_MockAttack(sourceSprite, targetSprite, leftHandItemRes, true)
		else --不模拟攻击而是移除SY#WE1HB
			EEex_GameObject_ApplyEffect(sourceSprite,{["effectID"] = 321, ["res"] = "SY#WE1HB",})
		end
	end
	if leftAttackCount ~= 1 then -- 当前攻击为右手
		if rightHandItemRes.pHeader.itemType == 20 then --右手武器类型合适，模拟一次右手攻击
			EEex_GameObject_ApplyEffect(sourceSprite,{["effectID"] = 139, ["effectAmount"] = 11768, })
			EEex_GameObject_ApplyEffect(sourceSprite,{["effectID"] = 267, ["duration"] = 5, ["durationType"] = 10, ["effectAmount"] = 11768, })
			EEex_GameObject_ApplyEffect(sourceSprite,{["effectID"] = 215, ["duration"] = 1, ["dwFlags"] = 1, ["res"] = "SY#WSLSH",})
			ST_MockAttack(sourceSprite, targetSprite, rightHandItemRes, false)
		else --不模拟攻击而是移除SY#WE1HB
			EEex_GameObject_ApplyEffect(sourceSprite,{["effectID"] = 321, ["res"] = "SY#WE1HB",})
		end
	end
end

--检查所持武器以及人物对应的武器熟练度。对攻击者以熟练度对应概率封印人物的武器细节技能，如果双武器取平均熟练度（自身是target）
function SY_WPBLK(effect, targetObject)
	local targetSprite = EEex_GameObject_Get(targetObject.m_id)
	local isTwoHanded = false
	local weaponProficiencyR = 0
	local weaponProficiencyL = 0
	local totalProficiency = 0
	local equipmentArray = targetSprite.m_equipment.m_items	-- 读取装备序列
	-- 读取主手物品
	local rightHandItem = equipmentArray:get(targetSprite.m_equipment.m_selectedWeapon)	-- 当前主手武器
	local rightHandItemRes = nil
	if rightHandItem then
		local rightHandItemName = rightHandItem.cResRef:get()
		rightHandItemRes = EEex_Resource_Fetch(rightHandItemName, "ITM")
--Infinity_DisplayString(Infinity_FetchString(rightHandItemRes.pHeader.identifiedName))
		local rightHandItemFlags = rightHandItemRes.pHeader.itemFlags
		local rightweaponProficiencyIndex = rightHandItemRes.pHeader.proficiencyType
		weaponProficiencyR = ST_GetWeaponProficiency(targetObject, rightweaponProficiencyIndex)
--Infinity_DisplayString('weaponProficiencyR:' .. weaponProficiencyR)
		if bit32.extract(rightHandItemFlags, 1) == 1 and rightHandItemRes.pHeader.itemType ~= 28 then	-- 主手为双手武器并且不是拳头，设置双手武器标志
			isTwoHanded = true
		end
		totalProficiency = 2 * weaponProficiencyR --为避免小数，熟练度*2
	end
	-- 读取副手物品
	local leftHandItem = equipmentArray:get(9)
	local leftHandItemRes = nil
	if leftHandItem then --副手存在物品
		local leftHandItemResName = leftHandItem.cResRef:get()
		leftHandItemRes = EEex_Resource_Fetch(leftHandItemResName, "ITM")
		if leftHandItemRes.pHeader.itemType ~= 12 and not isTwoHanded then	-- 副手不是盾牌且主手不是双手武器（主手可以是拳头）
			local leftweaponProficiencyIndex = leftHandItemRes.pHeader.proficiencyType
			weaponProficiencyL = ST_GetWeaponProficiency(targetObject, leftweaponProficiencyIndex)
			totalProficiency = weaponProficiencyL + weaponProficiencyR
		end
	end
--Infinity_DisplayString('totalProficiency:' .. totalProficiency)
	EEex_GameObject_ApplyEffect(targetObject,{["effectID"] = 206, ["duration"] = 30, ["durationType"] = 10, ["probabilityLower"] = (80 - (totalProficiency * 8)), ["res"] = "SY#WD2HA", })
	EEex_GameObject_ApplyEffect(targetObject,{["effectID"] = 206, ["duration"] = 30, ["durationType"] = 10, ["probabilityLower"] = (80 - (totalProficiency * 8)), ["res"] = "SY#WDSDA", })
	EEex_GameObject_ApplyEffect(targetObject,{["effectID"] = 206, ["duration"] = 30, ["durationType"] = 10, ["probabilityLower"] = (80 - (totalProficiency * 8)), ["res"] = "SY#WD2WA", })
	EEex_GameObject_ApplyEffect(targetObject,{["effectID"] = 206, ["duration"] = 30, ["durationType"] = 10, ["probabilityLower"] = (80 - (totalProficiency * 8)), ["res"] = "SY#WD1HA", })
	EEex_GameObject_ApplyEffect(targetObject,{["effectID"] = 206, ["duration"] = 6, ["durationType"] = 0, ["probabilityLower"] = (80 - (totalProficiency * 8)), ["res"] = "SY#WPE00", })
end

--用于盾击，鸟施法使用此函数让人物对自身施法（自身是target）
function SY_APSSD(effect, targetObject)
	local swordshieldproficiency = ST_GetWeaponProficiency(targetObject, 112)
	local shieldbashdelay = math.random(3) - 1	--避免每个人同时施展
	if swordshieldproficiency == 1 then
		EEex_GameObject_ApplyEffect(targetObject,{["effectID"] = 146, ["duration"] = shieldbashdelay, ["durationType"] = 3, ["dwFlags"] = 1, ["res"] = "SY#WPSDC", ["sourceID"] = targetObject.m_id, })
	end
	if swordshieldproficiency > 1 then
		EEex_GameObject_ApplyEffect(targetObject,{["effectID"] = 146, ["duration"] = shieldbashdelay, ["durationType"] = 3, ["dwFlags"] = 1, ["res"] = "SY#WPSDD", ["sourceID"] = targetObject.m_id, })
	end
end
