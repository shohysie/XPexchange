-- 确保在LuaJIT环境下，位操作指令的兼容性
local bit = bit32 or require("bit")
if not bit32 and bit then
    bit32 = {
        band = bit.band,
        bor = bit.bor,
        bnot = bit.bnot,
        bxor = bit.bxor,
        lshift = bit.lshift,
        rshift = bit.rshift,
    }
    function bit32.extract(n, field, width)
		field = field or 1
        width = width or 1
        return bit.band(bit.rshift(n, field), bit.lshift(1, width) - 1)
    end
end
--[[
+----------+
| 通用函数 |
+----------+
--]]
function ST_GetSprite(spriteOrId)
	if type(spriteOrId) == "number" then
		return EEex_GameObject_Get(spriteOrId)
	end
	return spriteOrId
end

function ST_Read_i32(x)
    return (x >= 0x80000000) and (x - 0x100000000) or x
end

function ST_GetResRef(m_resRef)
	local chars = ""
	for i = 0, 7 do
		if m_resRef ~= 0 then
			chars = chars .. string.char(m_resRef:get(i))
		end
	end
	return chars
end

function ST_MatchIds(sprite, idsIndex, idsValue)
	local ST_IdsIndexToSpriteField = {
		[2] = function(sprite) return sprite.m_typeAI.m_EnemyAlly end,
		[3] = function(sprite) return sprite.m_typeAI.m_General end,
		[4] = function(sprite) return sprite.m_typeAI.m_Race end,
		[5] = function(sprite) return sprite.m_typeAI.m_Class end,
		[6] = function(sprite) return sprite.m_typeAI.m_Specifics end,
		[7] = function(sprite) return sprite.m_typeAI.m_Gender end,
		[8] = function(sprite) return sprite.m_typeAI.m_Alignment end,
		[9] = function(sprite) return sprite.m_derivedStats.m_nKit end,
	}

	local getter = ST_IdsIndexToSpriteField[idsIndex]
	if not getter then
		return false
	end

	local spriteValue = getter(sprite)

	if idsIndex == 8 then
		if idsValue == 0x00 then
			return spriteValue == 0x00
		end

		local isMask =
			idsValue == 0x01 or idsValue == 0x02 or idsValue == 0x03 or
			idsValue == 0x10 or idsValue == 0x20 or idsValue == 0x30

		if isMask then
			return bit32.band(spriteValue, idsValue) == idsValue
		end
	end

	return spriteValue == idsValue
end
--[[
+-------------+
| 加载2da列表 |
+-------------+
--]]
local strMod = EEex_Resource_Load2DA('strmod')
local strModEx = EEex_Resource_Load2DA('strmodex')
local dexMod = EEex_Resource_Load2DA('dexmod')
--[[
+--------------+
| 读取当前武器 |
+--------------+
--]]
function ST_GetCurrentWeapon(sprite, getCurrentAttack)
	local leftAttackCount = sprite.m_leftAttack
	
	local isTwoHanded = false
	local isLeftAttack = false
	
	local fightingStyle = nil	-- 1 单手，2 双手，3 剑盾，4 双手
		
	local equipmentArray = sprite.m_equipment.m_items	-- 读取装备序列
	-- 读取主手物品
	local rightHandItem = equipmentArray:get(sprite.m_equipment.m_selectedWeapon)	-- 当前主手武器
	local rightHandItemRes = nil
	if rightHandItem then
		local rightHandItemName = rightHandItem.cResRef:get()
		rightHandItemRes = EEex_Resource_Fetch(rightHandItemName, "ITM")
		local rightHandItemFlags = rightHandItemRes.pHeader.itemFlags
		local weaponProficiencyIndex = rightHandItemRes.pHeader.proficiencyType
		if bit32.extract(rightHandItemFlags, 1) == 1 then	-- Two-handed flag
			isTwoHanded = true
			fightingStyle = 2
			-- Infinity_DisplayString(Infinity_FetchString(rightHandItemRes.pHeader.identifiedName))
		elseif (weaponProficiencyIndex >= 89 and weaponProficiencyIndex <= 108) or (weaponProficiencyIndex >= 111 and weaponProficiencyIndex <= 115) then	-- 限制物品种类
			fightingStyle = 1
			-- Infinity_DisplayString(Infinity_FetchString(rightHandItemRes.pHeader.identifiedName))
		end
	end
		
	-- 读取副手物品
	local leftHandItem = equipmentArray:get(9)
	local leftHandItemRes = nil
	if leftHandItem then
		local leftHandItemResName = leftHandItem.cResRef:get()
		leftHandItemRes = EEex_Resource_Fetch(leftHandItemResName, "ITM")
		if leftHandItemRes.pHeader.itemType ~= 12 then	-- 副手不是盾牌
			fightingStyle = 4
		elseif not isTwoHanded then	-- 副手是盾牌且主手不是双手武器
			fightingStyle = 3
		end
	end
	
	-- 判断当前攻击是否为副手攻击
	if (leftAttackCount == 1) and (fightingStyle == 4) then
		isLeftAttack = true
	end
	
	local weaponRes1 = rightHandItemRes
	local weaponRes2 = leftHandItemRes
	
	if getCurrentAttack and isLeftAttack then
		weaponRes1 = leftHandItemRes
	end
	
	if getCurrentAttack then
		return weaponRes1, fightingStyle, isLeftAttack
	else
		return weaponRes1, weaponRes2, fightingStyle, isLeftAttack
	end
end
--[[
+------------  --+
| 读取武器熟练度 |
+---------  -----+
--]]
function ST_GetWeaponProficiency(sprite, statsIndex)
	local weaponProficiency1 = 0
	local weaponProficiency2 = 0
	if (statsIndex >= 89 and statsIndex <= 108) or (statsIndex >= 111 and statsIndex <= 115) then
		local weaponProficiency = EEex_Sprite_GetStat(sprite, statsIndex)
		weaponProficiency1 = bit32.band(weaponProficiency, 0x0F)
		weaponProficiency2 = bit32.rshift(bit32.band(weaponProficiency, 0xF0), 4)
	end
	-- if statsIndex < 89 or (statsIndex > 108 and statsIndex < 111) or statsIndex > 115 then
		-- error("statsIndex "..statsIndex.." 不在允许范围内")
	-- end

	return math.max(weaponProficiency1, weaponProficiency2)
end
--[[
+-----------+
| 读取state |
+-----------+
--]]
function ST_HasState(sprite, state)
	local stateMaskMap = {
		STATE_SLEEPING = 0x00000001,
		STATE_BERSERK = 0x00000002,
		STATE_PANIC = 0x00000004,
		STATE_STUNNED = 0x00000008,
		STATE_INVISIBLE = 0x00000010,
		STATE_HELPLESS = 0x00000020,

		STATE_IMMOBILE = 0x00000029,        -- 组合状态

		STATE_FROZEN_DEATH = 0x00000040,
		STATE_STONE_DEATH = 0x00000080,
		STATE_EXPLODING_DEATH = 0x00000100,
		STATE_FLAME_DEATH = 0x00000200,
		STATE_ACID_DEATH = 0x00000400,
		STATE_DEAD = 0x00000800,

		STATE_REALLY_DEAD = 0x00000FC0,     -- 组合状态

		STATE_SILENCED = 0x00001000,
		STATE_CHARMED = 0x00002000,
		STATE_POISONED = 0x00004000,
		STATE_HASTED = 0x00008000,
		STATE_SLOWED = 0x00010000,
		STATE_INFRAVISION = 0x00020000,
		STATE_BLIND = 0x00040000,
		STATE_DISEASED = 0x00080000,

		STATE_FEEBLEMINDED = 0x00100000,

		STATE_HARMLESS = 0x00102029,        -- 组合状态

		STATE_NONDETECTION = 0x00200000,
		STATE_IMPROVEDINVISIBILITY = 0x00400000,
		STATE_NOT_TARGETABLE = 0x00400010,  -- 组合状态

		STATE_BLESS = 0x00800000,
		STATE_CHANT = 0x01000000,
		STATE_DRAWUPONHOLYMIGHT = 0x02000000,
		STATE_LUCK = 0x04000000,
		STATE_AID = 0x08000000,
		STATE_CHANTBAD = 0x10000000,
		STATE_BLUR = 0x20000000,
		STATE_MIRRORIMAGE = 0x40000000,

		STATE_ILLUSIONS = 0x60400010,       -- 组合状态

		STATE_CONFUSED = 0x80000000,
	}
	
	if type(state) == 'string' then
		state = stateMaskMap[state] or stateMaskMap["STATE_" .. state] or 0x0	-- 输入参数可以是state名字符串（带不带STATE_前缀都可），也可以是bit mask。字符串无对应时视为0x0
	end

	local stateBits = sprite.m_derivedStats.m_generalState
	
	return bit32.band(stateBits, state) ~= 0
end
--[[
+--------------+
| 模拟物理攻击 |
+--------------+
--]]
function ST_MockAttack(sourceSprite, targetSprite, weaponRes, isLeftAttack, abilityIndex)
	-- 武器数据
	if not weaponRes then
		if not isLeftAttack then
			weaponRes = ST_GetCurrentWeapon(sourceSprite)
		else
			_, weaponRes = ST_GetCurrentWeapon(sourceSprite)
		end
	end
	
	abilityIndex = abilityIndex or sourceSprite.m_equipment.m_selectedWeaponAbility	-- 默认使用当前选择的 ability
	local adress =  EEex_UDToPtr(weaponRes.pAbilities) + 0x38 * abilityIndex
	local ability = EEex_PtrToUD(adress, "Item_ability_st")

	local itemFlags = weaponRes.pHeader.itemFlags
	local isMagical = bit32.extract(itemFlags, 6) == 1
	local enchantment = weaponRes.pHeader.attributes
	
	local itemType = weaponRes.pHeader.itemType	-- 物品类型
	local weaponType = ability.type	-- 近战/远程
	
	local damageType = ability.damageType	-- 武器伤害类型
	local damageDice = ability.damageDice
	local damageDiceCount = ability.damageDiceCount
	local damageDiceBonus = ability.damageDiceBonus
	
	local abilityFlags = ability.abilityFlags
	local addStrBonus = bit32.extract(abilityFlags, 0) == 1
	local addDamStrBonus = bit32.extract(abilityFlags, 2) == 1

	-- 致命一击修正
	local criticalHitBonus = EEex_Sprite_GetStat(sourceSprite, 146)
	local criticalMissBonus = 0
	
	local criticalEntryList = sourceSprite.m_derivedStats.m_cCriticalEntryList
	local node = criticalEntryList.m_pNodeHead
	while node do
		local criticalEntry = node.data
		if criticalEntry.m_hitOrMiss == 1 then	-- 0: hit, 1: miss
			if criticalEntry.m_slot == -1 or criticalEntry.m_slot == sourceSprite.m_equipment.m_selectedWeapon then	-- 对该slot的武器生效（-1对所有武器生效）
				if criticalEntry.m_attackType == 0 or criticalEntry.m_attackType == weaponType then
					criticalMissBonus = criticalMissBonus + criticalEntry.m_bonus
				end
			end
		end
		node = node.pNext
	end
	
	local hit = false
	local criticalHit = false
	local criticalMiss = false
	
	local hitRoll = math.random(0, 19)
	hitRoll = ST_Hook_HitRoll(sourceSprite, targetSprite, hitRoll) + 1	-- 调用Hook
	
	if ST_HasState(targetSprite, 'STATE_HELPLESS') then
		hit = true
	elseif hitRoll <= 1 + criticalMissBonus then
		criticalMiss = true
	elseif hitRoll >= 20 - criticalHitBonus then
		hit = true
		criticalHit = true
	end
	
	local str = EEex_Sprite_GetStat(sourceSprite, 36)	-- 角色力量	
	local hitModifier = 0	-- 命中修正值
	
	local resistPiercing = EEex_Sprite_GetStat(targetSprite, 88)
	local resistCrushing = EEex_Sprite_GetStat(targetSprite, 87)
	local resistSlashing = EEex_Sprite_GetStat(targetSprite, 86)
	local resistMissile = EEex_Sprite_GetStat(targetSprite, 89)
	
	if not (criticalHit or criticalMiss) then
		-- 基础命中值
		local thac0 = EEex_Sprite_GetStat(sourceSprite, 7)
		
		hitModifier =  hitModifier + EEex_Sprite_GetStat(sourceSprite, 84)	-- hitBonusRight

		-- 副手攻击修正
		if isLeftAttack then
			hitModifier = hitModifier + EEex_Sprite_GetStat(sourceSprite, 85)	-- hitBonusLeft
		end	

		-- 幸运修正
		local luck = EEex_Sprite_GetStat(sourceSprite, 32)
		hitModifier = hitModifier + luck

		-- local hitBonusMelee = EEex_Sprite_GetStat(sourceSprite, 166)	-- 近战命中修正，疑似包含在 hitBonusRight 里，无需计算
		
		-- 命中修正
		local hitBonus = sourceSprite.m_derivedStats.m_nHitBonus
		hitModifier = hitModifier + hitBonus

		if itemType == 28 then	-- 徒手攻击
			hitModifier = hitModifier + EEex_Sprite_GetStat(sourceSprite, 170)	-- fistHitModifier
		end

		-- 目标AC值
		local ac = EEex_Sprite_GetStat(targetSprite, 2)
		ac = math.max(ac, -20)
		ac = math.min(ac, 20)
		
		local acPiercing = EEex_Sprite_GetStat(targetSprite, 5)
		local acCrushing = EEex_Sprite_GetStat(targetSprite, 3)
		local acSlashing = EEex_Sprite_GetStat(targetSprite, 6)
		local acMissile = EEex_Sprite_GetStat(targetSprite, 4)
	
		local acModifiers = {
			[1] = acPiercing,
			[2] = acCrushing,
			[3] = acSlashing,
			[4] = acMissile,
			[6] = (resistPiercing <= resistCrushing) and acPiercing or acCrushing,
			[7] = (resistPiercing <= resistSlashing) and acPiercing or acSlashing,
			[8] = (resistSlashing <= resistCrushing) and acCrushing or acSlashing,
		}
		
		if acModifiers[damageType] then
			hitModifier = hitModifier + acModifiers[damageType]	-- 伤害类型带来的命中修正值
		end
		-- Infinity_DisplayString('hitModifier: ' .. hitModifier)
		
		-- 近战/远程惩罚
		local targetWeaponRes = ST_GetCurrentWeapon(targetSprite, false)
		adress =  EEex_UDToPtr(targetWeaponRes.pAbilities) + 0x38 * targetSprite.m_equipment.m_selectedWeaponAbility
		local targetAbility = EEex_PtrToUD(adress, "Item_ability_st")
		local targetWeaponType = targetAbility.type
		if weaponType == 1 and (targetWeaponType == 2 or targetWeaponType == 4) then
			hitModifier = hitModifier + 4
		elseif weaponType == 2 or weaponType == 4 then
			local dx = targetSprite.m_pos.x - sourceSprite.m_pos.x
			local dy = targetSprite.m_pos.y - sourceSprite.m_pos.y
			local distance = math.sqrt(dx * dx + dy * dy)
			if distance < 0x10 then
				hitModifier = hitModifier - 8
			end
		end
		
		-- 隐形修正
		if ST_HasState(sourceSprite, 'STATE_INVISIBLE') or ST_HasState(sourceSprite, 'STATE_IMPROVEDINVISIBILITY') then
			hitModifier = hitModifier + 4
		end
		if ST_HasState(targetSprite, 'STATE_INVISIBLE') or ST_HasState(targetSprite, 'STATE_IMPROVEDINVISIBILITY') then
			hitModifier = hitModifier - 4
		end
		
		-- 宿敌修正
		if sourceSprite.m_derivedStats.m_nHatedRace == targetSprite.m_typeAI.m_Race then
			hitModifier = hitModifier + 4
		end
		
		-- IDS 修正
		local matchedEffects = ST_FindEffectsAll(sourceSprite, {m_effectId = 177})
		local hitModifierIDS = 0
		for i = 1, #matchedEffects do
			local res = matchedEffects[i].m_res:get()
			local effect = EEex_Resource_Demand(res, 'EFF')
			if effect.m_effectId == 178 then
				if ST_MatchIds(targetSprite, effect.dwFlags, effect.effectAmount) then
					hitModifierIDS = math.max(hitModifierIDS, effect.m_effectAmount2)
				end
			end
		end
		hitModifierIDS = hitModifierIDS + hitModifierIDS
		
		-- 调用Hook
		hitModifier = ST_Hook_HitMod(sourceSprite, targetSprite, hitModifier)
		
		-- 命中判定
		hit = hitRoll + hitModifier >= thac0 - ac
	end
	
	local damModifier = 0
	local damModified = 0
	local blocked = false
	
	if hit then
		-- 是否武器无效
		local matchedEffects = {}
		
		if isMagical then
			matchedEffects = ST_FindEffectsAll(targetSprite, {m_effectId = 120, dwFlags = 1}, true)
		else
			matchedEffects = ST_FindEffectsAll(targetSprite, {m_effectId = 120, dwFlags = 2}, true)
		end
		blocked = (#matchedEffects > 0)
		
		matchedEffects = ST_FindEffectsAll(targetSprite, {m_effectId = 120, effectAmount = enchantment, dwFlags = 0}, true)
		blocked = blocked or (#matchedEffects > 0)
	
		if not blocked then	
			-- 伤害修正
			damModifier = damModifier + damageDiceBonus	-- 武器伤害加值
			damModifier = damModifier + sourceSprite.m_derivedStats.m_nDamageBonus	-- 通用伤害修正值
			damModifier = damModifier + sourceSprite.m_derivedStats.m_DamageBonusRight	-- 熟练度加值 + 武器风格加值 + 近战/远程修正值 + 效果（？）修正值
			
			-- 副手伤害修正
			if isLeftAttack then
				damModifier = damModifier + sourceSprite.m_derivedStats.m_DamageBonusLeft
			end	
			
			-- 力量修正		
			if addStrBonus or addDamStrBonus then
				local damStrBonus = EEex_Resource_GetAt2DALabels(strMod, 'DAMAGE', tostring(str))
				if str == 18 then
					local strExtra = EEex_Sprite_GetStat(sourceSprite, 37)
					damStrBonus = damStrBonus + EEex_Resource_GetAt2DALabels(strModEx, 'DAMAGE', tostring(strExtra))
				end
				damModifier = damModifier + damStrBonus
			end
			
			-- 武器类型修正，疑似包含在 m_DamageBonusRight 里，此处不计算
			-- if weaponType == 1 then	-- 近战武器
				-- damModifier = damModifier + EEex_Sprite_GetStat(sourceSprite, 167)	-- meleedamModifier
			-- elseif weaponType == 2 then	-- 远程武器
				-- damModifier = damModifier + EEex_Sprite_GetStat(sourceSprite, 168)	-- missiledamModifier
			-- end	
			if itemType == 28 then	-- 徒手攻击
				damModifier = damModifier + EEex_Sprite_GetStat(sourceSprite, 171)	-- fistdamModifier
			end
			
			-- 宿敌修正
			if sourceSprite.m_derivedStats.m_nHatedRace == targetSprite.m_typeAI.m_Race then
				damModifier = damModifier + 4
			end
			
			-- IDS 修正
			local matchedEffects = ST_FindEffectsAll(sourceSprite, {m_effectId = 177})
			local damModifierIDS = 0
			for i = 1, #matchedEffects do
				local res = matchedEffects[i].m_res:get()
				local effect = EEex_Resource_Demand(res, 'EFF')
				if effect.m_effectId == 179 then
					if ST_MatchIds(targetSprite, effect.dwFlags, effect.effectAmount) then
						damModifierIDS = math.max(damModifierIDS, effect.m_effectAmount2)
					end
				end
			end
			damModifier = damModifier + damModifierIDS
			
			-- 调用Hook
			damModified = math.random(damageDice) * damageDiceCount + damModifier
			damModified = ST_Hook_AttackDamMod(sourceSprite, targetSprite, damModified)
		end
	end
	
	-- 致命一击是否被挡住
	local criticalHitBlocked = false
	
	if criticalHit and (not blocked) then
		local equipmentArray = targetSprite.m_equipment.m_items	-- 读取装备序列
		
		local scanSlots = {
			6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 
			targetSprite.m_equipment.m_selectedWeapon,
		}	
		-- 读取物品
		for i = 1, #scanSlots do
			local item = equipmentArray:get(scanSlots[i])	-- 当前主手武器
			if item then
				local itemResRef = item.cResRef:get()
				local itemRes = EEex_Resource_Fetch(itemResRef, "ITM")
				if itemRes then
					local itemFlags = itemRes.pHeader.itemFlags
					local isHeadGear = itemRes.pHeader.itemType == 7
					local toggleCriticalHitFlag = bit32.extract(itemFlags, 25) == 1
					if isHeadGear ~= toggleCriticalHitFlag then
						criticalHitBlocked = true
						break
					end	
				end
			end
		end
	end

	-- 提示文本
	local sourceName = EEex_Sprite_GetName(sourceSprite)
	
	local hitRollString = ""
	if isLeftAttack then
		hitRollString = sourceName .. ": " .. Infinity_FetchString(8715) .. hitRoll	-- 副手攻击
	else
		hitRollString = sourceName .. ": " .. Infinity_FetchString(14643) .. hitRoll	-- 攻击检定
	end		
	if hitModifier >= 0 then
		hitRollString = hitRollString .. " + " .. hitModifier
	else
		hitRollString = hitRollString .. " - " .. -hitModifier
	end
	hitRollString = hitRollString .. " = " .. hitRoll + hitModifier .. " : "
	
	local resultString = hit and Infinity_FetchString(16460) or Infinity_FetchString(16461)
	hitRollString = hitRollString .. resultString
	
	if blocked then
		if hit then
			Infinity_DisplayString(Infinity_FetchString(11025))
		else
			Infinity_DisplayString(hitRollString)
		end
	else
		if criticalHit then
			if not criticalHitBlocked then
				Infinity_DisplayString(sourceName .. " : " .. Infinity_FetchString(16462))
			else
				Infinity_DisplayString(sourceName .. " : " .. Infinity_FetchString(20696))
			end
		elseif criticalMiss then
			Infinity_DisplayString(sourceName .. " : " .. Infinity_FetchString(16463))
		else
			Infinity_DisplayString(hitRollString)
		end
	end
	
	-- 造成效果
	if hit then	
		if blocked then
		else
			if criticalHit then
				damModified = damModified * 2
			end		
			-- 伤害参数
			local effectDamageType = {
				[1] = 0x00100000,	-- Piercing
				[2] = 0x00000000,	-- Crushing
				[3] = 0x01000000,	-- Slashing
				[4] = 0x00800000,	-- Missile
				[6] = (resistPiercing <= resistCrushing) and 0x00100000 or 0x00000000,
				[7] = (resistPiercing <= resistSlashing) and 0x00100000 or 0x01000000,
				[8] = (resistSlashing <= resistCrushing) and 0x00000000 or 0x01000000,
			}
			EEex_GameObject_ApplyEffect(targetSprite,{
				["effectID"] = 12,	-- opcode#12 造成伤害
				["effectList"] = 1,
				["effectAmount"] = damModified,				-- parameter 1 (Damage Amount)
				["dwFlags"] = effectDamageType[damageType],	-- parameter 2 (Mode & Damage Type)
				["durationType"] = 1,
				-- ["numDice"] = damageDiceCount,
				-- ['diceSize'] = damageDice,
				["sourceID"] = sourceSprite.m_id,
				})
			
			ST_ApplyWeaponHitEffects(sourceSprite, targetSprite, weaponRes, abilityIndex)
			if criticalHit and (not criticalHitBlocked) then
				ST_ApplyCriticalEffects(sourceSprite, targetSprite, 0, weaponType)
			end	
		end
		
		if weaponType == 1 then	-- opcode#248 携带的命中效果
			ST_RunMeleeAttackListeners(sourceSprite, targetSprite, blocked)
			-- EEex_Opcode_Private_ApplyExtraMeleeEffects(sourceSprite, targetSprite)
		elseif weaponType == 2 or weaponType == 4 then	-- opcode#249 携带的命中效果
			-- EEex_Opcode_Private_ApplyExtraRangedEffects(sourceSprite, targetSprite)
		end
	elseif criticalMiss then
		ST_ApplyCriticalEffects(sourceSprite, targetSprite, 1, weaponType)
	end
	
	st_currentAttack.sourceTag = nil	-- 模拟攻击已完成，重置 sourceTag
end

function ST_ApplyWeaponHitEffects(sourceSprite, targetSprite, weaponRes, abilityIndex)
	weaponRes = weaponRes or ST_GetCurrentWeapon(sourceSprite, true)
	abilityIndex = abilityIndex or sourceSprite.m_equipment.m_selectedWeaponAbility
	
	local adress =  EEex_UDToPtr(weaponRes.pAbilities) + 0x38 * abilityIndex
	local ability = EEex_PtrToUD(adress, "Item_ability_st")
	local startingEffect = ability.startingEffect
	local effectCount = ability.effectCount
	
	for i = 1, effectCount do
		local adress =  EEex_UDToPtr(weaponRes.pEffects) + 0x30 * (startingEffect + i - 1)
		local effect = EEex_PtrToUD(adress, "Item_effect_st")
		EEex_GameObject_ApplyEffect(targetSprite,{
			["effectID"] = effect.effectID,
			["effectList"] = 1,
			["targetType"] = effect.targetType,
			["spellLevel"] = effect.spellLevel,
			["effectAmount"] = effect.effectAmount,
			["dwFlags"] = effect.dwFlags,
			["durationType"] = effect.durationType,
			["duration"] = effect.duration,
			["probabilityUpper"] = effect.probabilityUpper,
			["probabilityLower"] = effect.probabilityLower,
			["res"] = effect.res:get(),
			["numDice"] = effect.numDice,
			['diceSize'] = effect.diceSize,
			['savingThrow'] = effect.savingThrow,
			['saveMod'] = effect.saveMod,
			['special'] = effect.special,
			["sourceID"] = sourceSprite.m_id,
			["sourceTarget"] = targetSprite.m_id
			})
	end
end

function ST_ApplyCriticalEffects(sourceSprite, targetSprite, hitOrMiss, weaponType)	-- 0: hit, 1: miss
	hitOrMiss = hitOrMiss or 0	-- 默认为 hit 效果
	
	local node = sourceSprite.m_derivedStats.m_cCriticalEntryList.m_pNodeHead
	while node do
		local criticalEntry = node.data
		if criticalEntry.m_hitOrMiss == hitOrMiss then
			if criticalEntry.m_slot == -1 or criticalEntry.m_slot == sourceSprite.m_equipment.m_selectedWeapon then
				if criticalEntry.m_attackType == 0 or criticalEntry.m_attackType == weaponType then
					local effect = EEex_Resource_Demand(criticalEntry.m_res.m_resRef:get(), 'EFF')
					EEex_GameObject_ApplyEffect(targetSprite, {
						["effectID"] = effect.effectID,
						["effectList"] = 1,
						["targetType"] = effect.targetType,
						["spellLevel"] = effect.spellLevel,
						["effectAmount"] = effect.effectAmount,
						["dwFlags"] = effect.dwFlags,
						["durationType"] = effect.durationType,
						["duration"] = effect.duration,
						["probabilityUpper"] = effect.probabilityUpper,
						["probabilityLower"] = effect.probabilityLower,
						["res"] = effect.res:get(),
						["numDice"] = effect.numDice,
						["diceSize"] = effect.diceSize,
						["savingThrow"] = effect.savingThrow,
						["saveMod"] = effect.saveMod,
						['special'] = effect.special,
						["sourceID"] = sourceSprite.m_id,
						["sourceTarget"] = targetSprite.m_id,
					})
				end
			end
		end
		node = node.pNext
	end
end
--[[
+------------+
| 法术位操作 |
+------------+
--]]
local spellTypeToField = {
	[0] = 'm_memorizedSpellsInnate',
	[1] = 'm_memorizedSpellsMage',
	[2] = 'm_memorizedSpellsPriest',
	[3] = 'm_memorizedSpellsInnate',
	[4] = 'm_memorizedSpellsInnate',
	[5] = 'm_memorizedSpellsInnate',
}

function ST_GetMemorizedSpellNodeList(sprite, spellName, spellType, spellLevel)	
	local spellRes = nil
	if spellType == nil or spellLevel == nil then
		spellRes = EEex_Resource_Fetch(spellName, 'SPL')
	end
	if spellType == nil then
		spellType = spellRes.pHeader.itemType
	end
	if spellType ~= 1 and spellType ~= 2 then	-- Innate一律视为1级
		spellLevel = 1
	elseif spellLevel == nil then
		spellLevel = spellRes.pHeader.spellLevel
	end
	
	local fieldName = spellTypeToField[spellType]
	
	local nodeList = sprite[fieldName]:getReference(spellLevel - 1)
	return nodeList
end

-- 修改已记忆法术的最大数量
function ST_SetMemorizedSpellNumMax(sprite, spellName, numToSetMax, spellType, spellLevel)
	local nodeList = ST_GetMemorizedSpellNodeList(sprite, spellName, spellType, spellLevel)
	local nodeCount = nodeList.m_nCount
	local node = nodeList.m_pNodeHead  -- 获取链表头部
	
	local matchedNodes = {}  -- 存储匹配的节点	
	local currentNumMax = 0

	while node ~= nil do
		if node.data.m_spellId:get() == spellName then
			table.insert(matchedNodes, node)
			currentNumMax = currentNumMax + 1	-- 记录法术数量
		end
		node = node.pNext
	end
	
	local nodeFree = nodeList.m_pNodeFree
	local nodeFreeCount = 0	-- 以后可能要用到，先留着
	while nodeFree do
		nodeFreeCount = nodeFreeCount + 1
		if not nodeFree.pNext then
			break
		end
		nodeFree = nodeFree.pNext
	end
	
	if currentNumMax > numToSetMax then
		for i = 1, (currentNumMax - numToSetMax) do
			local nodeToDelete = matchedNodes[i]
			if nodeToDelete then
				if nodeToDelete.pPrev then
					nodeToDelete.pPrev.pNext = nodeToDelete.pNext	-- 如果被删节点前存在节点，则将其与被删节点后的节点连接
				else
					nodeList.m_pNodeHead = nodeToDelete.pNext  -- 否则将被删节点后的节点设为头部
				end
				if nodeToDelete.pNext then
					nodeToDelete.pNext.pPrev = nodeToDelete.pPrev	-- 如果被删节点后存在节点，则将其与被删节点前的节点连接
				else
					nodeList.m_pNodeTail = nodeToDelete.pPrev  -- 否则将被删节点后的节点设为尾部
				end
				if nodeFree then	-- 归还nodeFree
					nodeFree.pNext = nodeToDelete
					nodeToDelete.pPrev = nodeFree
				else
					nodeToDelete.pPrev = nil
					nodeList.m_pNodeFree = nodeToDelete
				end
				nodeToDelete.pNext = nil	
				nodeFree = nodeToDelete
				nodeList.m_nCount = nodeList.m_nCount - 1
			end
		end
	elseif currentNumMax < numToSetMax then
		for i = 1, (numToSetMax - currentNumMax) do
			local spellData = EEex_NewUD("CCreatureFileMemorizedSpell")
			spellData.m_spellId:set(spellName)
			spellData.m_flags = 1
			nodeList:AddTail(spellData)
			-- if spellType == 1 or spellType == 2 then
				-- local spellData = EEex_NewUD("CCreatureFileMemorizedSpell")
				-- spellData.m_spellId:set(spellName)
				-- spellData.m_flags = 1
				-- nodeList:AddTail(spellData)
			-- else
				-- EEex_GameObject_ApplyEffect(sprite,{
					-- ["effectID"] = 171,
					-- ["effectAmount"] = 0,
					-- ["dwFlags"] = 0,
					-- ["durationType"] = 0,
					-- ["res"] = spellName,
				-- })
			-- end
		end
	end
end

-- 修改已记忆法术的记忆数量
function ST_SetMemorizedSpellNum(sprite, spellName, numToSet, spellType, spellLevel)
	local nodeList = ST_GetMemorizedSpellNodeList(sprite, spellName, spellType, spellLevel)
	local node = nodeList.m_pNodeHead  -- 获取链表头部
	
	local matchedNodes = {}  -- 存储匹配的节点	
	local currentNum = 0
	
	while node ~= nil do
		if node.data.m_spellId:get() == spellName then
			table.insert(matchedNodes, node)
			if node.data.m_flags == 1 then
				currentNum = currentNum + 1	-- 记录已记忆法术数量
			end
		end
		node = node.pNext
	end
	
	if currentNum ~= numToSet then
		for i = 1, #matchedNodes do
			node = matchedNodes[i]
			node.data.m_flags = (i <= numToSet) and 1 or 0
		end
	end
end

-- 增减已记忆法术的记忆数量
function ST_ChangeMemorizedSpellNum(sprite, spellName, numToChange, spellType, spellLevel)
	local nodeList = ST_GetMemorizedSpellNodeList(sprite, spellName, spellType, spellLevel)
	local node = nodeList.m_pNodeHead  -- 获取链表头部
	
	local matchedNodes = {}  -- 存储匹配的节点	
	
	while node ~= nil do
		if node.data.m_spellId:get() == spellName then
			table.insert(matchedNodes, node)
		end
		node = node.pNext
	end
	
	if numToChange ~= 0 then
		for i = 1, #matchedNodes do
			if numToChange == 0 then
				break
			end
		
			node = matchedNodes[i]
			if numToChange > 0 then
				if node.data.m_flags == 0 then
					node.data.m_flags = 1
					numToChange = numToChange - 1
				end
			elseif numToChange < 0 then
				if node.data.m_flags == 1 then
					node.data.m_flags = 0
					numToChange = numToChange + 1
				end
			end
		end
	end
end

-- 修改已记忆法术的代码
function ST_ReplaceMemorizedSpellRes(sprite, spellName, spellNameNew, spellType, spellLevel)
	local nodeList = ST_GetMemorizedSpellNodeList(sprite, spellName, spellType, spellLevel)
	local nodeCount = nodeList.m_nCount
	local node = nodeList.m_pNodeHead  -- 获取链表头部
	
	local matchedNodes = {}  -- 存储匹配的节点	
	local currentNumMax = 0
	
	while node ~= nil do
		if node.data.m_spellId:get() == spellName then
			table.insert(matchedNodes, node)
		end
		node = node.pNext
	end
	
	local args = {
		["m_spellId"] = spellNameNew  -- 你想要修改的字段
	}
	local writeDefs = {
		{ "m_spellId", EEex_WriteFailType.ERROR },
	}
	for i = 1, #matchedNodes do
		node = matchedNodes[i]
		EEex_WriteUDArgs(node.data, args, writeDefs)
	end
end
--[[
+-------------------+
| 查找指定的 effect |
+-------------------+
--]]
function ST_FindEffects(effectList, filter, firstOnly)
	local matchedEffects = {}
	
	local node = effectList.m_pNodeHead
	
	while node ~= nil do
		local effect = node.data
		local match = true
		
        for key, value in pairs(filter) do
			local e_value = effect[key]
			if type(e_value) == "userdata" then
				e_value = e_value:get()
			end
            if e_value ~= value then
                match = false
                break
            end
        end

        if match then
			table.insert(matchedEffects, effect)
			if firstOnly then
				break
			end
        end
		
		node = node.pNext
	end
	
	return matchedEffects
end

function ST_FindEffectsAll(sprite, filter, firstOnly)
	local matchedEffects = ST_FindEffects(sprite.m_equipedEffectList, filter, firstOnly)
	if #matchedEffects == 0 or (not firstOnly) then
		local timedEffect = ST_FindEffects(sprite.m_timedEffectList, filter, firstOnly)
		for i = 1, #timedEffect do
			table.insert(matchedEffects, timedEffect[i])
		end
	end
	if #matchedEffects == 0 or (not firstOnly) then
		local persistantEffects = ST_FindEffects(sprite.m_persistantEffects, filter, firstOnly)
		for i = 1, #persistantEffects do
			table.insert(matchedEffects, persistantEffects[i])
		end
	end
	
	return matchedEffects
end
--[[
+------------------+
| 随地潜行判定hook |
+------------------+
--]]
function ST_RegisterHook_HideInPlainSight()
	-- 已知地址
	local hookAddr = 0x14039D837	-- cmp ecx,0x21
	-- local hookAddr = 0x14039d7e7
	local returnAddr = 0x14039d9a3
	local successAddr = 0x14039d840
	
	EEex_DefineAssemblyLabel("jmp_return", returnAddr)
	EEex_DefineAssemblyLabel("jmp_success", successAddr)
	
	local patchAddr = EEex_JITNear(EEex_FlattenTable({
		{[[	
			#MAKE_SHADOW_SPACE(64)
			mov qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)], r13
			mov r13d, dword ptr [rsi + 0x48]
		]]},
		EEex_GenLuaCall("ST_Hook_HideInPlainSight", {
			["args"] = {
				function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], r13 #ENDL", {rspOffset}} end,
			},
			["returnType"] = EEex_LuaCallReturnType.Boolean,
		}),
		{[[
			call_error:
			
			no_error:
			mov r13, qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)]
			cmp qword ptr [rsp + 56], 0x0
			#DESTROY_SHADOW_SPACE
			je #L(jmp_return)
			jmp #L(jmp_success)
		]]},
	}))
	
	EEex_DefineAssemblyLabel("ST_HideInPlainSight", patchAddr)	-- 将 patchAddr 注册为 ST_HideInPlainSight
	
	EEex_JITAt(hookAddr, {[[
		cmp ecx, 0x21
		JNZ #L(ST_HideInPlainSight)
	]]})
end

function ST_Hook_HideInPlainSight(spriteId)
	local sprite = EEex_GameObject_Get(spriteId)
	local hideInPlainSight = false
	
	local matchedEffects = ST_FindEffectsAll(sprite, {m_effectId = 275, m_special = 1}, true)	-- opcode#275 special 值为1时允许随地潜行	
	if #matchedEffects > 0 then
		hideInPlainSight = true
	end
	
	return hideInPlainSight	-- 返回值存放在shadow space中，ptr [rsp+56]
end
--[[
+--------------------+
| 物理攻击命中骰hook |
+--------------------+
--]]
function ST_RegisterHook_HitRoll()
	EEex_HookAfterCallWithLabels(0x14039dad5, {
		{"hook_integrity_watchdog_ignore_registers", {EEex_HookIntegrityWatchdogRegister.RAX}}},
		EEex_FlattenTable({
			{[[
				#MAKE_SHADOW_SPACE(80)
				mov qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)], r10
				mov qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-16)], r11
				mov r10d, dword ptr [rbx + 0x48]
				mov r11d, dword ptr [r14 + 0x48]
			]]},
			EEex_GenLuaCall("ST_Hook_HitRoll", {
				["args"] = {
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], r10 #ENDL", {rspOffset}} end,
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], r11 #ENDL", {rspOffset}} end,
					function(rspOffset) return {"mov dword ptr ss:[rsp+#$(1)], eax #ENDL", {rspOffset}} end,
				},
				["returnType"] = EEex_LuaCallReturnType.Number,
			}),
			{[[
				call_error:
				
				no_error:
				mov r11, qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-16)]
				mov r10, qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)]
				mov rax, qword ptr [rsp + 56]
				#DESTROY_SHADOW_SPACE
			]]},
		})
	)
end

st_currentAttack = {
    sourceSprite = nil,
    targetSprite = nil,
    hitRoll = nil,
	sourceTag = nil,
}

function ST_Hook_HitRoll(sourceSpriteOrId, targetSpriteOrId, hitRoll)	-- hitRoll 的取值范围是0-19，所以它会比游戏里显示的小1
	-- print('sourceSpriteId:' .. sourceSpriteId)
	-- print('targetSpriteId:' .. targetSpriteId)
	-- print('hitRoll: ' .. hitRoll)
	local sourceSprite = ST_GetSprite(sourceSpriteOrId)
	local targetSprite = ST_GetSprite(targetSpriteOrId)
	local reRollTokens = 0
	
    for i = 1, #ST_HitRollListeners do
        local listener = ST_HitRollListeners[i]
        local reRollToken = listener(sourceSprite, targetSprite, hitRoll) or 0
		reRollTokens = reRollTokens + reRollToken
    end
	
	if reRollTokens ~= 0 then
		for i = 1, math.abs(reRollTokens) do
			local reRoll = math.random(0, 19)
			if reRollTokens > 0 then
				hitRoll = math.max(hitRoll, reRoll)
			else
				hitRoll = math.min(hitRoll, reRoll)
			end
		end
	end
	
	st_currentAttack.sourceSprite = sourceSprite
	st_currentAttack.targetSprite = targetSprite
	st_currentAttack.hitRoll = hitRoll
	return hitRoll
end

ST_HitRollListeners = {}
function ST_AddHitRollListener(func)
    table.insert(ST_HitRollListeners, func)
end

ST_AddHitRollListener(function(sourceSprite, targetSprite, hitRoll)	-- 用于测试
	-- local sourceName = EEex_Sprite_GetName(sourceSprite)
	
	-- Infinity_DisplayString(sourceName)
	-- Infinity_DisplayString('m_nDamageBonus: ' .. sourceSprite.m_derivedStats.m_nDamageBonus)	-- 通用伤害修正值
	
	
	-- Infinity_DisplayString('m_DamageBonusRight: ' .. sourceSprite.m_derivedStats.m_DamageBonusRight)	-- 熟练度加值 + 武器风格加值 + 近战/远程修正值 + 效果（？）修正值
	
	-- local criticalEntryList = sourceSprite.m_derivedStats.m_cCriticalEntryList
	-- local node = criticalEntryList.m_pNodeHead
	-- local i = 1
	-- while node do
		-- local criticalEntry = node.data
		-- Infinity_DisplayString('criticalEntry[' .. i .. ']:')
		-- Infinity_DisplayString('m_hitOrMiss: ' .. criticalEntry.m_hitOrMiss)	-- 0: hit, 1: miss
		-- Infinity_DisplayString('m_slot: ' .. criticalEntry.m_slot)	-- 对该slot的武器生效（-1对所有武器生效）
		-- Infinity_DisplayString('m_attackType: ' .. criticalEntry.m_attackType)
		-- Infinity_DisplayString('m_itemType: ' .. criticalEntry.m_itemType)
		-- Infinity_DisplayString('m_bonus: ' .. criticalEntry.m_bonus)
		-- if criticalEntry.m_hitOrMiss == 1 then
			
		-- end
		-- node = node.pNext
		-- i = i + 1
	-- end
	
	-- local effect = sourceSprite.m_equipedEffectList
	-- Infinity_DisplayString(effect.m_pNodeHead.data.m_effectId)
	-- Infinity_DisplayString(sourceSprite.m_derivedStats.m_nPhysicalSpeed)
	-- Infinity_DisplayString(targetSprite.m_derivedStats.m_nPhysicalSpeed)
end)
--[[
+----------------------+
| 物理攻击命中修正hook |
+----------------------+
--]]
function ST_RegisterHook_HitMod()
	EEex_HookAfterCallWithLabels(0x14039dff4, {
		{"hook_integrity_watchdog_ignore_registers", {EEex_HookIntegrityWatchdogRegister.RAX}}},
		EEex_FlattenTable({
			{[[
				#MAKE_SHADOW_SPACE(80)
				mov qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)], r10
				mov qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-16)], r11
				mov r10d, dword ptr [rbx + 0x48]
				mov r11d, dword ptr [r14 + 0x48]
			]]},
			EEex_GenLuaCall("ST_Hook_HitMod", {
				["args"] = {
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], r10 #ENDL", {rspOffset}} end,
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], r11 #ENDL", {rspOffset}} end,
					function(rspOffset) return {"mov word ptr ss:[rsp+#$(1)], r15w #ENDL", {rspOffset}} end,
				},
				["returnType"] = EEex_LuaCallReturnType.Number,
			}),
			{[[
				call_error:
				
				no_error:
				mov r11, qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-16)]
				mov r10, qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)]
				mov r15w, word ptr [rsp + 56]
				#DESTROY_SHADOW_SPACE
			]]},
		})
	)

end

function ST_Hook_HitMod(sourceSpriteOrId, targetSpriteOrId, hitModified)
	local sourceSprite = ST_GetSprite(sourceSpriteOrId)
	local targetSprite = ST_GetSprite(targetSpriteOrId)
	
    for i = 1, #ST_HitModListeners do
        local listener = ST_HitModListeners[i]
        hitModified = listener(sourceSprite, targetSprite, hitModified) or hitModified
    end
	
	return hitModified
end

ST_HitModListeners = {}
function ST_AddHitModListener(func)
    table.insert(ST_HitModListeners, func)
end

ST_AddHitModListener(function(sourceSprite, targetSprite, hitModified)	-- 用于测试
	-- if targetSprite.m_typeAI.m_Race == 122 then
		-- Infinity_DisplayString('狼人杀手')
		-- hitModified = hitModified + 200
	-- end
	-- return hitModified
end)
--[[
+----------------------+
| 物理攻击伤害修正hook |
+----------------------+
--]]
function ST_RegisterHook_AttackDamMod()
	EEex_HookAfterCallWithLabels(0x14038fef0, {
		{"hook_integrity_watchdog_ignore_registers", {EEex_HookIntegrityWatchdogRegister.RAX}}},
		EEex_FlattenTable({
			{[[
				#MAKE_SHADOW_SPACE(80)
				mov qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)], r10
				mov qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-16)], r11
				mov r10d, dword ptr [rdi + 0x48]
				mov r11d, dword ptr [r15 + 0x48]
			]]},
			EEex_GenLuaCall("ST_Hook_AttackDamMod", {
				["args"] = {
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], r10 #ENDL", {rspOffset}} end,
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], r11 #ENDL", {rspOffset}} end,
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], rsi #ENDL", {rspOffset}} end,
				},
				["returnType"] = EEex_LuaCallReturnType.Number,
			}),
			{[[
				call_error:
				
				no_error:
				mov r11, qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-16)]
				mov r10, qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)]
				mov si, word ptr [rsp + 56]
				#DESTROY_SHADOW_SPACE
			]]},
		})
	)

end

function ST_Hook_AttackDamMod(sourceSpriteOrId, targetSpriteOrId, damModified)
	local sourceSprite = ST_GetSprite(sourceSpriteOrId)
	local targetSprite = ST_GetSprite(targetSpriteOrId)
	
    for i = 1, #ST_AttackDamModListeners do
        local listener = ST_AttackDamModListeners[i]
        damModified = listener(sourceSprite, targetSprite, damModified) or damModified
    end
	
	return damModified
end

ST_AttackDamModListeners = {}
function ST_AddAttackDamModListener(func)
    table.insert(ST_AttackDamModListeners, func)
end

-- ST_AddAttackDamModListener(function(sourceSprite, targetSprite, damModified)	-- 用于测试
	-- if targetSprite.m_typeAI.m_Race == 122 then
		-- Infinity_DisplayString('狼人杀手')
		-- damModified = damModified + 200
	-- end
	-- return damModified
-- end)

-- EEex_DisableCodeProtection()

-- EEex_EnableCodeProtection()

--[[
+------------------+
| 物理攻击命中hook |
+------------------+
--]]
ST_MeleeAttackListeners = {}

function ST_AddMeleeAttackListener(func)
	table.insert(ST_MeleeAttackListeners, func)
end

function ST_RunMeleeAttackListeners(sourceSprite, targetSprite, bBlocked)
	for i = 1, #ST_MeleeAttackListeners do
		local listener = ST_MeleeAttackListeners[i]
		local ok, err = pcall(listener, sourceSprite, targetSprite, bBlocked)

		if not ok then
			Infinity_DisplayString("ST_MeleeAttackListener error: " .. tostring(err))
		end
	end
end

local ST_EEex_Opcode_Hook_OnAfterSwingCheckedOp248 = EEex_Opcode_Hook_OnAfterSwingCheckedOp248

function EEex_Opcode_Hook_OnAfterSwingCheckedOp248(sourceSprite, targetSprite, bBlocked)
	-- 执行原始逻辑
	ST_EEex_Opcode_Hook_OnAfterSwingCheckedOp248(sourceSprite, targetSprite, bBlocked)
	-- 执行注册的监听器
	ST_RunMeleeAttackListeners(sourceSprite, targetSprite, bBlocked)
end

-- 向常驻监视器中添加调用
--[[
function ST_Opcode_AddListsResolvedListener(func)
	-- [EEex.dll]
	EEex.Opcode_LuaHook_AfterListsResolved_Enabled = true
	table.insert(EEex_Opcode_ListsResolvedListeners, func)
end

ST_Opcode_AddListsResolvedListener(function(sprite)	
end)
]]--

--[[
+----------+
| 按钮hook |
+----------+
--]]
local function ST_RegisterHook_ButtonPressed()
	EEex_HookBeforeRestoreWithLabels(0x1402633e1, 0, 8, 8, {
		{"hook_integrity_watchdog_ignore_registers", {
			EEex_HookIntegrityWatchdogRegister.RAX, EEex_HookIntegrityWatchdogRegister.RDX, EEex_HookIntegrityWatchdogRegister.R8,
			EEex_HookIntegrityWatchdogRegister.R9, EEex_HookIntegrityWatchdogRegister.R10, EEex_HookIntegrityWatchdogRegister.R11
		}}},
		EEex_FlattenTable({
			{[[
				#MAKE_SHADOW_SPACE(48)
				mov qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)], rcx
			]]},
			EEex_GenLuaCall("ST_Hook_ButtonPressed", {
				["args"] = {
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], r15 #ENDL", {rspOffset}} end,
				},
			}),
			{[[
				call_error:
				
				no_error:
				
				mov rcx, qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)]
				#DESTROY_SHADOW_SPACE
			]]},
		})
	)
end

function ST_Hook_ButtonPressed(buttonIndex)
    for i = 1, #ST_ButtonPressedListeners do
        local listener = ST_ButtonPressedListeners[i]
        listener(buttonIndex)
    end
end

ST_ButtonPressedListeners = {}
function ST_AddButtonPressedListener(func)
    table.insert(ST_ButtonPressedListeners, func)
end
--[[
+--------------------+
| 命中力量修正值hook |
+--------------------+
--]]
function ST_RegisterHook_HitStrMod()
	EEex_HookAfterCallWithLabels(0x14034c97d, {
		{"hook_integrity_watchdog_ignore_registers", {
			EEex_HookIntegrityWatchdogRegister.RAX, EEex_HookIntegrityWatchdogRegister.RDX, EEex_HookIntegrityWatchdogRegister.R8,
			EEex_HookIntegrityWatchdogRegister.R9, EEex_HookIntegrityWatchdogRegister.R10, EEex_HookIntegrityWatchdogRegister.R11
		}}},
		EEex_FlattenTable({
			{[[
				#MAKE_SHADOW_SPACE(80)
				mov qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)], r10
				mov qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-16)], r11
				mov qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-24)], r12
				mov r10d, dword ptr [r14 + 0x48]
				movsx r11d, word ptr [rbp + 0x58]
				movsx r12d, word ptr [rbp - 0x48]
			]]},
			EEex_GenLuaCall("ST_Hook_HitStrMod", {
				["args"] = {
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], r10 #ENDL", {rspOffset}} end,
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], r11 #ENDL", {rspOffset}} end,
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], r12 #ENDL", {rspOffset}} end,
				},
			}),
			{[[
				call_error:
				
				no_error:
						
				mov r12, qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-24)]
				mov r11, qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-16)]
				mov r10, qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)]
				#DESTROY_SHADOW_SPACE
			]]},
		})
	)
end

function ST_Hook_HitStrMod(spriteId, hitStrMod, hitStrExMod)
	local sprite = EEex_GameObject_Get(spriteId)
	hitStrMod = ST_Read_i32(hitStrMod)	-- 将无符号数转化为符号数
	hitStrExMod = ST_Read_i32(hitStrExMod)
	
    for i = 1, #ST_HitStrModListeners do
        local listener = ST_HitStrModListeners[i]
        listener(sprite, hitStrMod, hitStrExMod)
    end
	
	-- Infinity_DisplayString(Infinity_FetchString(sprite.m_baseStats.m_name) .. ': ' .. hitStrMod .. ', ' .. hitStrExMod)
end

ST_HitStrModListeners = {}
function ST_AddHitStrModListener(func)
    table.insert(ST_HitStrModListeners, func)
end
--[[
+----------+
| 背刺hook |
+----------+
--]]
function ST_RegisterHook_BackstabFail()	-- 因为目标免疫而背刺失败的分支，正常背刺不会进入此流程
	EEex_HookBeforeRestoreWithLabels(0x140390748, 0, 7, 7, {
		{"hook_integrity_watchdog_ignore_registers", {
			EEex_HookIntegrityWatchdogRegister.RAX, EEex_HookIntegrityWatchdogRegister.RDX, EEex_HookIntegrityWatchdogRegister.R8,
			EEex_HookIntegrityWatchdogRegister.R9, EEex_HookIntegrityWatchdogRegister.R10, EEex_HookIntegrityWatchdogRegister.R11
		}}},
		EEex_FlattenTable({
			{[[
				#MAKE_SHADOW_SPACE(64)
				mov qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)], r10
				mov qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-16)], r11
				mov r10d, dword ptr [rdi + 0x48]
				mov r11d, dword ptr [r15 + 0x48]
			]]},
			EEex_GenLuaCall("ST_Hook_BackstabFail", {
				["args"] = {
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], r10 #ENDL", {rspOffset}} end,
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], r11 #ENDL", {rspOffset}} end,
				},
				["returnType"] = EEex_LuaCallReturnType.Boolean,
			}),
			{[[
				call_error:
				
				no_error:
				
				mov r11, qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-16)]
				mov r10, qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)]
				cmp qword ptr [rsp + 56], 0x0
				#DESTROY_SHADOW_SPACE
				jnz 0x140390790
			]]},
		})
	)
end

function ST_RegisterHook_Backstab()	-- 背刺成功分支。失败分支Hook的返回值为true时也会进入此分支
	EEex_HookAfterCallWithLabels(0x140390794, {
		{"hook_integrity_watchdog_ignore_registers", {EEex_HookIntegrityWatchdogRegister.RAX}}},
		EEex_FlattenTable({
			{[[
				#MAKE_SHADOW_SPACE(64)
				mov qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)], r10
				mov qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-16)], r11
				mov r10d, dword ptr [rdi + 0x48]
				mov r11d, dword ptr [r15 + 0x48]

			]]},
			EEex_GenLuaCall("ST_Hook_Backstab", {
				["args"] = {
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], r10 #ENDL", {rspOffset}} end,
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], r11 #ENDL", {rspOffset}} end,
				},
			}),
			{[[
				call_error:
				
				no_error:
						
				mov r11, qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-16)]
				mov r10, qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)]
				#DESTROY_SHADOW_SPACE
			]]},
		})
	)
end

function ST_Hook_BackstabFail(sourceSpriteId, targetSpriteId)
	local sourceSprite = EEex_GameObject_Get(sourceSpriteId)
	local targetSprite = EEex_GameObject_Get(targetSpriteId)
	-- Infinity_DisplayString(Infinity_FetchString(sourceSprite.m_baseStats.m_name))
	local forceBackstab = false
	
    for i = 1, #ST_BackstabListeners do
        local listener = ST_BackstabListeners[i]
        local toForceBackstab = listener(sourceSprite, targetSprite, false)
		if toForceBackstab == true then
			forceBackstab = true
		end
    end
	
	return forceBackstab
end

function ST_Hook_Backstab(sourceSpriteId, targetSpriteId)
	local sourceSprite = EEex_GameObject_Get(sourceSpriteId)
	local targetSprite = EEex_GameObject_Get(targetSpriteId)
	-- Infinity_DisplayString(Infinity_FetchString(sourceSprite.m_baseStats.m_name))
	
    for i = 1, #ST_BackstabListeners do
        local listener = ST_BackstabListeners[i]
        local toForceBackstab = listener(sourceSprite, targetSprite, true)
    end
end

ST_BackstabListeners = {}
function ST_AddBackstabListener(func)
    table.insert(ST_BackstabListeners, func)
end

ST_AddBackstabListener(function(sourceSprite, targetSprite, backstabSuccess)	-- opcode#263 special == 1 无视背刺免疫，但背刺倍数减半
	if not backstabSuccess then
		local matchedEffects = ST_FindEffectsAll(sourceSprite, {m_effectId = 263, m_special = 1}, true)
		if #matchedEffects > 0 then
			sourceSprite.m_derivedStats.m_nBackstabDamageMultiplier = math.floor((sourceSprite.m_derivedStats.m_nBackstabDamageMultiplier + 1) / 2)
			return true
		end
	end
end)
--[[
+-------------+
| 法术DC Hook |
+-------------+
--]]
function ST_RegisterHook_SaveDCMod_At(address)
	EEex_HookAfterCallWithLabels(address, {
		{"hook_integrity_watchdog_ignore_registers", {
			EEex_HookIntegrityWatchdogRegister.RAX, EEex_HookIntegrityWatchdogRegister.RDX, EEex_HookIntegrityWatchdogRegister.R8,
			EEex_HookIntegrityWatchdogRegister.R9, EEex_HookIntegrityWatchdogRegister.R10, EEex_HookIntegrityWatchdogRegister.R11
		}}},
		EEex_FlattenTable({
			{[[
				#MAKE_SHADOW_SPACE(64)
				mov qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)], r10
				mov r10d, dword ptr [rsi + 0x48]
			]]},
			EEex_GenLuaCall("ST_Hook_SaveDCMod", {
				["args"] = {
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], r10 #ENDL", {rspOffset}} end,
					function(rspOffset) return {"mov qword ptr ss:[rsp+#$(1)], rbx #ENDL", {rspOffset}} end,
				},
			}),
			{[[
				call_error:

				no_error:

				mov r10, qword ptr ss:[rsp+#SHADOW_SPACE_BOTTOM(-8)]
				#DESTROY_SHADOW_SPACE
			]]},
		})
	)
end

function ST_RegisterHook_SaveDCMod()
	for _, address in ipairs({
		0x14024ed06, -- 常规施法
		0x1401fb2f2, -- 物品能力
	}) do
		ST_RegisterHook_SaveDCMod_At(address)
	end
end

function ST_Hook_SaveDCMod(spriteId, effectAddress)
	local sprite = EEex_GameObject_Get(spriteId)
	local effect = EEex_PtrToUD(effectAddress, "CGameEffect")
	
    for i = 1, #ST_SaveDCModListeners do
        local listener = ST_SaveDCModListeners[i]
        listener(sprite, effect)
    end
end

ST_SaveDCModListeners = {}
function ST_AddSaveDCModListener(func)
    table.insert(ST_SaveDCModListeners, func)
end
--[[
+------------------+
| 执行hook注册函数 |
+------------------+
--]]
EEex_DisableCodeProtection()
ST_RegisterHook_HideInPlainSight()
ST_RegisterHook_HitRoll()
ST_RegisterHook_ButtonPressed()
-- ST_RegisterHook_HitStrMod()
ST_RegisterHook_BackstabFail()
ST_RegisterHook_Backstab()
ST_RegisterHook_HitMod()
ST_RegisterHook_AttackDamMod()
ST_RegisterHook_SaveDCMod()
EEex_EnableCodeProtection()