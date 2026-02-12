//~%dlgname%~分有限愿望和许愿术两个法术
//~%lvlimit%~为游戏最高人物等级
//经验上限低，遗产模式判断要求1.5倍

EXTEND_BOTTOM ~%dlgname%~ 0
	IF ~~
	THEN REPLY @9 DO ~ReallyForceSpellRES("SYLVSET1",Myself)~ GOTO xpcheck0	//你能提供一些特殊能力，让我的队员用经验点数进行交易吗？
END

/*改
SYLVSET1，等级设为0
SYLVAD20，等级+20
SYLVADD5，等级+5
SYLVADD1，等级+1
SY#XPE0A-0I目标扣除经验获得能力
SY#XPE1A-1I为巴尔遗产难度下扣除更多经验
SY#XPEAR变量为1-6表示对不同队员
*/

APPEND ~%dlgname%~

	IF ~~ THEN BEGIN xpcheck0
		SAY @10	//是哪一位大人需要进行经验点数交换？我需要仔细看看他的状况。
		IF ~InMyArea(Player1)~ THEN REPLY @11 DO ~SetGlobal("SY#XPEAR","LOCALS",1)~ GOTO xpcheck1	//是<PLAYER1>需要进行交换。
		IF ~InMyArea(Player2)~ THEN REPLY @12 DO ~SetGlobal("SY#XPEAR","LOCALS",2)~ GOTO xpcheck2	//是<PLAYER2>需要进行交换。
		IF ~InMyArea(Player3)~ THEN REPLY @13 DO ~SetGlobal("SY#XPEAR","LOCALS",3)~ GOTO xpcheck3	//是<PLAYER3>需要进行交换。
		IF ~InMyArea(Player4)~ THEN REPLY @14 DO ~SetGlobal("SY#XPEAR","LOCALS",4)~ GOTO xpcheck4	//是<PLAYER4>需要进行交换。
		IF ~InMyArea(Player5)~ THEN REPLY @15 DO ~SetGlobal("SY#XPEAR","LOCALS",5)~ GOTO xpcheck5	//是<PLAYER5>需要进行交换。
		IF ~InMyArea(Player6)~ THEN REPLY @16 DO ~SetGlobal("SY#XPEAR","LOCALS",6)~ GOTO xpcheck6	//是<PLAYER6>需要进行交换。
		IF ~~ THEN REPLY @40 DO ~SetGlobal("SY#XPEAR","LOCALS",0)~ GOTO xpcheck9	//我改变主意了，还是算了。
	END

	IF ~~ THEN BEGIN xpcheck1
		SAY @17	//让我看看……
		IF ~OR(12)
		GlobalGT("SY#XPE99","LOCALS",0)
		Class(Player1,MAGE)
		Class(Player1,FIGHTER)
		Class(Player1,CLERIC)
		Class(Player1,THIEF)
		Class(Player1,BARD)
		Class(Player1,PALADIN)
		Class(Player1,DRUID)
		Class(Player1,RANGER)
		Class(Player1,SORCERER)
		Class(Player1,MONK)
		Class(Player1,SHAMAN)~ THEN GOTO xpselect1
		IF ~!GlobalGT("SY#XPE88","LOCALS",0)
		!Class(Player1,MAGE)
		!Class(Player1,FIGHTER)
		!Class(Player1,CLERIC)
		!Class(Player1,THIEF)
		!Class(Player1,BARD)
		!Class(Player1,PALADIN)
		!Class(Player1,DRUID)
		!Class(Player1,RANGER)
		!Class(Player1,SORCERER)
		!Class(Player1,MONK)
		!Class(Player1,SHAMAN)~ THEN GOTO xpcheck7	//不是单一职业
		IF ~!NightmareModeOn() XPLT(Player1,500000)~ THEN GOTO xpcheck8	//经验不足
		IF ~NightmareModeOn() XPLT(Player1,750000)~ THEN  GOTO xpcheck8	//经验不足
	END

	IF ~~ THEN BEGIN xpcheck2
		SAY @17	//让我看看……
		IF ~OR(12)
		GlobalGT("SY#XPE99","LOCALS",0)
		Class(Player2,MAGE)
		Class(Player2,FIGHTER)
		Class(Player2,CLERIC)
		Class(Player2,THIEF)
		Class(Player2,BARD)
		Class(Player2,PALADIN)
		Class(Player2,DRUID)
		Class(Player2,RANGER)
		Class(Player2,SORCERER)
		Class(Player2,MONK)
		Class(Player2,SHAMAN)~ THEN GOTO xpselect2
		IF ~!GlobalGT("SY#XPE88","LOCALS",0)
		!Class(Player2,MAGE)
		!Class(Player2,FIGHTER)
		!Class(Player2,CLERIC)
		!Class(Player2,THIEF)
		!Class(Player2,BARD)
		!Class(Player2,PALADIN)
		!Class(Player2,DRUID)
		!Class(Player2,RANGER)
		!Class(Player2,SORCERER)
		!Class(Player2,MONK)
		!Class(Player2,SHAMAN)~ THEN GOTO xpcheck7	//不是单一职业
		IF ~!NightmareModeOn() XPLT(Player2,500000)~ THEN GOTO xpcheck8	//经验不足
		IF ~NightmareModeOn() XPLT(Player2,750000)~ THEN  GOTO xpcheck8	//经验不足
	END

	IF ~~ THEN BEGIN xpcheck3
		SAY @17	//让我看看……
		IF ~OR(12)
		GlobalGT("SY#XPE99","LOCALS",0)
		Class(Player3,MAGE)
		Class(Player3,FIGHTER)
		Class(Player3,CLERIC)
		Class(Player3,THIEF)
		Class(Player3,BARD)
		Class(Player3,PALADIN)
		Class(Player3,DRUID)
		Class(Player3,RANGER)
		Class(Player3,SORCERER)
		Class(Player3,MONK)
		Class(Player3,SHAMAN)~ THEN GOTO xpselect3
		IF ~!GlobalGT("SY#XPE88","LOCALS",0)
		!Class(Player3,MAGE)
		!Class(Player3,FIGHTER)
		!Class(Player3,CLERIC)
		!Class(Player3,THIEF)
		!Class(Player3,BARD)
		!Class(Player3,PALADIN)
		!Class(Player3,DRUID)
		!Class(Player3,RANGER)
		!Class(Player3,SORCERER)
		!Class(Player3,MONK)
		!Class(Player3,SHAMAN)~ THEN GOTO xpcheck7	//不是单一职业
		IF ~!NightmareModeOn() XPLT(Player3,500000)~ THEN GOTO xpcheck8	//经验不足
		IF ~NightmareModeOn() XPLT(Player3,750000)~ THEN  GOTO xpcheck8	//经验不足
	END

	IF ~~ THEN BEGIN xpcheck4
		SAY @17	//让我看看……
		IF ~OR(12)
		GlobalGT("SY#XPE99","LOCALS",0)
		Class(Player4,MAGE)
		Class(Player4,FIGHTER)
		Class(Player4,CLERIC)
		Class(Player4,THIEF)
		Class(Player4,BARD)
		Class(Player4,PALADIN)
		Class(Player4,DRUID)
		Class(Player4,RANGER)
		Class(Player4,SORCERER)
		Class(Player4,MONK)
		Class(Player4,SHAMAN)~ THEN GOTO xpselect4
		IF ~!GlobalGT("SY#XPE88","LOCALS",0)
		!Class(Player4,MAGE)
		!Class(Player4,FIGHTER)
		!Class(Player4,CLERIC)
		!Class(Player4,THIEF)
		!Class(Player4,BARD)
		!Class(Player4,PALADIN)
		!Class(Player4,DRUID)
		!Class(Player4,RANGER)
		!Class(Player4,SORCERER)
		!Class(Player4,MONK)
		!Class(Player4,SHAMAN)~ THEN GOTO xpcheck7	//不是单一职业
		IF ~!NightmareModeOn() XPLT(Player4,500000)~ THEN GOTO xpcheck8	//经验不足
		IF ~NightmareModeOn() XPLT(Player4,750000)~ THEN  GOTO xpcheck8	//经验不足
	END

	IF ~~ THEN BEGIN xpcheck5
		SAY @17	//让我看看……
		IF ~OR(12)
		GlobalGT("SY#XPE99","LOCALS",0)
		Class(Player5,MAGE)
		Class(Player5,FIGHTER)
		Class(Player5,CLERIC)
		Class(Player5,THIEF)
		Class(Player5,BARD)
		Class(Player5,PALADIN)
		Class(Player5,DRUID)
		Class(Player5,RANGER)
		Class(Player5,SORCERER)
		Class(Player5,MONK)
		Class(Player5,SHAMAN)~ THEN GOTO xpselect5
		IF ~!GlobalGT("SY#XPE88","LOCALS",0)
		!Class(Player5,MAGE)
		!Class(Player5,FIGHTER)
		!Class(Player5,CLERIC)
		!Class(Player5,THIEF)
		!Class(Player5,BARD)
		!Class(Player5,PALADIN)
		!Class(Player5,DRUID)
		!Class(Player5,RANGER)
		!Class(Player5,SORCERER)
		!Class(Player5,MONK)
		!Class(Player5,SHAMAN)~ THEN GOTO xpcheck7	//不是单一职业
		IF ~!NightmareModeOn() XPLT(Player5,500000)~ THEN GOTO xpcheck8	//经验不足
		IF ~NightmareModeOn() XPLT(Player5,750000)~ THEN  GOTO xpcheck8	//经验不足
	END

	IF ~~ THEN BEGIN xpcheck6
		SAY @17	//让我看看……
		IF ~OR(12)
		GlobalGT("SY#XPE99","LOCALS",0)
		Class(Player6,MAGE)
		Class(Player6,FIGHTER)
		Class(Player6,CLERIC)
		Class(Player6,THIEF)
		Class(Player6,BARD)
		Class(Player6,PALADIN)
		Class(Player6,DRUID)
		Class(Player6,RANGER)
		Class(Player6,SORCERER)
		Class(Player6,MONK)
		Class(Player6,SHAMAN)~ THEN GOTO xpselect6
		IF ~!GlobalGT("SY#XPE88","LOCALS",0)
		!Class(Player6,MAGE)
		!Class(Player6,FIGHTER)
		!Class(Player6,CLERIC)
		!Class(Player6,THIEF)
		!Class(Player6,BARD)
		!Class(Player6,PALADIN)
		!Class(Player6,DRUID)
		!Class(Player6,RANGER)
		!Class(Player6,SORCERER)
		!Class(Player6,MONK)
		!Class(Player6,SHAMAN)~ THEN GOTO xpcheck7	//不是单一职业
		IF ~!NightmareModeOn() XPLT(Player6,500000)~ THEN GOTO xpcheck8	//经验不足
		IF ~NightmareModeOn() XPLT(Player6,750000)~ THEN  GOTO xpcheck8	//经验不足
	END

	IF ~~ THEN BEGIN xpcheck7
		SAY @18	//只有单一职业者才能进行交换，这位大人已经学得够多够复杂了。
		IF ~~ DO ~SetGlobal("SY#XPEAR","LOCALS",0)~ GOTO xpcheck0
	END

	IF ~~ THEN BEGIN xpcheck8
		SAY @37	//很遗憾，这位大人积累的经验还不够丰富。
		IF ~~ DO ~SetGlobal("SY#XPEAR","LOCALS",0)~ GOTO xpcheck0
	END

	IF ~~ THEN BEGIN xpselect1
		SAY @8	//我可以和这位大人进行交易，您打算付出多少经验点数？
		IF ~!NightmareModeOn() !XPLT(Player1,500000)~ THEN REPLY @20 GOTO abselect1	//五十万点。
		IF ~!NightmareModeOn() !XPLT(Player1,1000000)~ THEN REPLY @21 GOTO abselect2	//一百万点。
		IF ~!NightmareModeOn() !XPLT(Player1,1500000)~ THEN REPLY @22 GOTO abselect3	//一百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player1,2000000)~ THEN REPLY @23 GOTO abselect4	//二百万点。
		IF ~!NightmareModeOn() !XPLT(Player1,2500000)~ THEN REPLY @24 GOTO abselect5	//二百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player1,3000000)~ THEN REPLY @25 GOTO abselect6	//三百万点。
		IF ~!NightmareModeOn() !XPLT(Player1,4000000)~ THEN REPLY @26 GOTO abselect7	//四百万点。
		IF ~!NightmareModeOn() !XPLT(Player1,5000000)~ THEN REPLY @27 GOTO abselect8	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player1,750000)~ THEN REPLY @60 GOTO abselect1	//七十五万点。
		IF ~NightmareModeOn() !XPLT(Player1,1500000)~ THEN REPLY @61 GOTO abselect2	//一百五十万点。
		IF ~NightmareModeOn() !XPLT(Player1,2250000)~ THEN REPLY @62 GOTO abselect3	//二百二十五万点。
		IF ~NightmareModeOn() !XPLT(Player1,3000000)~ THEN REPLY @63 GOTO abselect4	//三百万点。
		IF ~NightmareModeOn() !XPLT(Player1,3750000)~ THEN REPLY @64 GOTO abselect5	//三百七十五万点。
		IF ~NightmareModeOn() !XPLT(Player1,4500000)~ THEN REPLY @65 GOTO abselect6	//四百五十万点。
		IF ~NightmareModeOn() !XPLT(Player1,6000000)~ THEN REPLY @66 GOTO abselect7	//六百万点。
		IF ~NightmareModeOn() !XPLT(Player1,7500000)~ THEN REPLY @67 GOTO abselect8	//七百五十万点。
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//我想换一位队员进行交易。
	END

	IF ~~ THEN BEGIN xpselect2
		SAY @8	//我可以和这位大人进行交易，您打算付出多少经验点数？
		IF ~!NightmareModeOn() !XPLT(Player2,500000)~ THEN REPLY @20 GOTO abselect1	//五十万点。
		IF ~!NightmareModeOn() !XPLT(Player2,1000000)~ THEN REPLY @21 GOTO abselect2	//一百万点。
		IF ~!NightmareModeOn() !XPLT(Player2,1500000)~ THEN REPLY @22 GOTO abselect3	//一百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player2,2000000)~ THEN REPLY @23 GOTO abselect4	//二百万点。
		IF ~!NightmareModeOn() !XPLT(Player2,2500000)~ THEN REPLY @24 GOTO abselect5	//二百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player2,3000000)~ THEN REPLY @25 GOTO abselect6	//三百万点。
		IF ~!NightmareModeOn() !XPLT(Player2,4000000)~ THEN REPLY @26 GOTO abselect7	//四百万点。
		IF ~!NightmareModeOn() !XPLT(Player2,5000000)~ THEN REPLY @27 GOTO abselect8	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player2,750000)~ THEN REPLY @60 GOTO abselect1	//七十五万点。
		IF ~NightmareModeOn() !XPLT(Player2,1500000)~ THEN REPLY @61 GOTO abselect2	//一百五十万点。
		IF ~NightmareModeOn() !XPLT(Player2,2250000)~ THEN REPLY @62 GOTO abselect3	//二百二十五万点。
		IF ~NightmareModeOn() !XPLT(Player2,3000000)~ THEN REPLY @63 GOTO abselect4	//三百万点。
		IF ~NightmareModeOn() !XPLT(Player2,3750000)~ THEN REPLY @64 GOTO abselect5	//三百七十五万点。
		IF ~NightmareModeOn() !XPLT(Player2,4500000)~ THEN REPLY @65 GOTO abselect6	//四百五十万点。
		IF ~NightmareModeOn() !XPLT(Player2,6000000)~ THEN REPLY @66 GOTO abselect7	//六百万点。
		IF ~NightmareModeOn() !XPLT(Player2,7500000)~ THEN REPLY @67 GOTO abselect8	//七百五十万点。
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//我想换一位队员进行交易。
	END

	IF ~~ THEN BEGIN xpselect3
		SAY @8	//我可以和这位大人进行交易，您打算付出多少经验点数？
		IF ~!NightmareModeOn() !XPLT(Player3,500000)~ THEN REPLY @20 GOTO abselect1	//五十万点。
		IF ~!NightmareModeOn() !XPLT(Player3,1000000)~ THEN REPLY @21 GOTO abselect2	//一百万点。
		IF ~!NightmareModeOn() !XPLT(Player3,1500000)~ THEN REPLY @22 GOTO abselect3	//一百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player3,2000000)~ THEN REPLY @23 GOTO abselect4	//二百万点。
		IF ~!NightmareModeOn() !XPLT(Player3,2500000)~ THEN REPLY @24 GOTO abselect5	//二百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player3,3000000)~ THEN REPLY @25 GOTO abselect6	//三百万点。
		IF ~!NightmareModeOn() !XPLT(Player3,4000000)~ THEN REPLY @26 GOTO abselect7	//四百万点。
		IF ~!NightmareModeOn() !XPLT(Player3,5000000)~ THEN REPLY @27 GOTO abselect8	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player3,750000)~ THEN REPLY @60 GOTO abselect1	//七十五万点。
		IF ~NightmareModeOn() !XPLT(Player3,1500000)~ THEN REPLY @61 GOTO abselect2	//一百五十万点。
		IF ~NightmareModeOn() !XPLT(Player3,2250000)~ THEN REPLY @62 GOTO abselect3	//二百二十五万点。
		IF ~NightmareModeOn() !XPLT(Player3,3000000)~ THEN REPLY @63 GOTO abselect4	//三百万点。
		IF ~NightmareModeOn() !XPLT(Player3,3750000)~ THEN REPLY @64 GOTO abselect5	//三百七十五万点。
		IF ~NightmareModeOn() !XPLT(Player3,4500000)~ THEN REPLY @65 GOTO abselect6	//四百五十万点。
		IF ~NightmareModeOn() !XPLT(Player3,6000000)~ THEN REPLY @66 GOTO abselect7	//六百万点。
		IF ~NightmareModeOn() !XPLT(Player3,7500000)~ THEN REPLY @67 GOTO abselect8	//七百五十万点。
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//我想换一位队员进行交易。
	END

	IF ~~ THEN BEGIN xpselect4
		SAY @8	//我可以和这位大人进行交易，您打算付出多少经验点数？
		IF ~!NightmareModeOn() !XPLT(Player4,500000)~ THEN REPLY @20 GOTO abselect1	//五十万点。
		IF ~!NightmareModeOn() !XPLT(Player4,1000000)~ THEN REPLY @21 GOTO abselect2	//一百万点。
		IF ~!NightmareModeOn() !XPLT(Player4,1500000)~ THEN REPLY @22 GOTO abselect3	//一百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player4,2000000)~ THEN REPLY @23 GOTO abselect4	//二百万点。
		IF ~!NightmareModeOn() !XPLT(Player4,2500000)~ THEN REPLY @24 GOTO abselect5	//二百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player4,3000000)~ THEN REPLY @25 GOTO abselect6	//三百万点。
		IF ~!NightmareModeOn() !XPLT(Player4,4000000)~ THEN REPLY @26 GOTO abselect7	//四百万点。
		IF ~!NightmareModeOn() !XPLT(Player4,5000000)~ THEN REPLY @27 GOTO abselect8	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player4,750000)~ THEN REPLY @60 GOTO abselect1	//七十五万点。
		IF ~NightmareModeOn() !XPLT(Player4,1500000)~ THEN REPLY @61 GOTO abselect2	//一百五十万点。
		IF ~NightmareModeOn() !XPLT(Player4,2250000)~ THEN REPLY @62 GOTO abselect3	//二百二十五万点。
		IF ~NightmareModeOn() !XPLT(Player4,3000000)~ THEN REPLY @63 GOTO abselect4	//三百万点。
		IF ~NightmareModeOn() !XPLT(Player4,3750000)~ THEN REPLY @64 GOTO abselect5	//三百七十五万点。
		IF ~NightmareModeOn() !XPLT(Player4,4500000)~ THEN REPLY @65 GOTO abselect6	//四百五十万点。
		IF ~NightmareModeOn() !XPLT(Player4,6000000)~ THEN REPLY @66 GOTO abselect7	//六百万点。
		IF ~NightmareModeOn() !XPLT(Player4,7500000)~ THEN REPLY @67 GOTO abselect8	//七百五十万点。
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//我想换一位队员进行交易。
	END

	IF ~~ THEN BEGIN xpselect5
		SAY @8	//我可以和这位大人进行交易，您打算付出多少经验点数？
		IF ~!NightmareModeOn() !XPLT(Player5,500000)~ THEN REPLY @20 GOTO abselect1	//五十万点。
		IF ~!NightmareModeOn() !XPLT(Player5,1000000)~ THEN REPLY @21 GOTO abselect2	//一百万点。
		IF ~!NightmareModeOn() !XPLT(Player5,1500000)~ THEN REPLY @22 GOTO abselect3	//一百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player5,2000000)~ THEN REPLY @23 GOTO abselect4	//二百万点。
		IF ~!NightmareModeOn() !XPLT(Player5,2500000)~ THEN REPLY @24 GOTO abselect5	//二百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player5,3000000)~ THEN REPLY @25 GOTO abselect6	//三百万点。
		IF ~!NightmareModeOn() !XPLT(Player5,4000000)~ THEN REPLY @26 GOTO abselect7	//四百万点。
		IF ~!NightmareModeOn() !XPLT(Player5,5000000)~ THEN REPLY @27 GOTO abselect8	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player5,750000)~ THEN REPLY @60 GOTO abselect1	//七十五万点。
		IF ~NightmareModeOn() !XPLT(Player5,1500000)~ THEN REPLY @61 GOTO abselect2	//一百五十万点。
		IF ~NightmareModeOn() !XPLT(Player5,2250000)~ THEN REPLY @62 GOTO abselect3	//二百二十五万点。
		IF ~NightmareModeOn() !XPLT(Player5,3000000)~ THEN REPLY @63 GOTO abselect4	//三百万点。
		IF ~NightmareModeOn() !XPLT(Player5,3750000)~ THEN REPLY @64 GOTO abselect5	//三百七十五万点。
		IF ~NightmareModeOn() !XPLT(Player5,4500000)~ THEN REPLY @65 GOTO abselect6	//四百五十万点。
		IF ~NightmareModeOn() !XPLT(Player5,6000000)~ THEN REPLY @66 GOTO abselect7	//六百万点。
		IF ~NightmareModeOn() !XPLT(Player5,7500000)~ THEN REPLY @67 GOTO abselect8	//七百五十万点。
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//我想换一位队员进行交易。
	END

	IF ~~ THEN BEGIN xpselect6
		SAY @8	//我可以和这位大人进行交易，您打算付出多少经验点数？
		IF ~!NightmareModeOn() !XPLT(Player6,500000)~ THEN REPLY @20 GOTO abselect1	//五十万点。
		IF ~!NightmareModeOn() !XPLT(Player6,1000000)~ THEN REPLY @21 GOTO abselect2	//一百万点。
		IF ~!NightmareModeOn() !XPLT(Player6,1500000)~ THEN REPLY @22 GOTO abselect3	//一百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player6,2000000)~ THEN REPLY @23 GOTO abselect4	//二百万点。
		IF ~!NightmareModeOn() !XPLT(Player6,2500000)~ THEN REPLY @24 GOTO abselect5	//二百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player6,3000000)~ THEN REPLY @25 GOTO abselect6	//三百万点。
		IF ~!NightmareModeOn() !XPLT(Player6,4000000)~ THEN REPLY @26 GOTO abselect7	//四百万点。
		IF ~!NightmareModeOn() !XPLT(Player6,5000000)~ THEN REPLY @27 GOTO abselect8	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player6,750000)~ THEN REPLY @60 GOTO abselect1	//七十五万点。
		IF ~NightmareModeOn() !XPLT(Player6,1500000)~ THEN REPLY @61 GOTO abselect2	//一百五十万点。
		IF ~NightmareModeOn() !XPLT(Player6,2250000)~ THEN REPLY @62 GOTO abselect3	//二百二十五万点。
		IF ~NightmareModeOn() !XPLT(Player6,3000000)~ THEN REPLY @63 GOTO abselect4	//三百万点。
		IF ~NightmareModeOn() !XPLT(Player6,3750000)~ THEN REPLY @64 GOTO abselect5	//三百七十五万点。
		IF ~NightmareModeOn() !XPLT(Player6,4500000)~ THEN REPLY @65 GOTO abselect6	//四百五十万点。
		IF ~NightmareModeOn() !XPLT(Player6,6000000)~ THEN REPLY @66 GOTO abselect7	//六百万点。
		IF ~NightmareModeOn() !XPLT(Player6,7500000)~ THEN REPLY @67 GOTO abselect8	//七百五十万点。
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//我想换一位队员进行交易。
	END

	IF ~~ THEN BEGIN xpcheck9
		SAY @38	//很好，我这就离开。
		IF ~~ THEN DO ~SetInterrupt(FALSE)
		ForceSpell(Myself,DRYAD_TELEPORT)
		SmallWait(1)
		DestroySelf()~ EXIT
	END
	
	IF ~~ THEN BEGIN abselect1	//50w档
		SAY @30	//选择你希望交换得到的能力。
		IF ~~ THEN REPLY @101 GOTO giveability1	//1	AC+1有利
		IF ~~ THEN REPLY @102 DO ~ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability1	//2	对挥砍武器的AC+4有利
		IF ~~ THEN REPLY @103 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability1	//3	对穿刺武器的AC+4有利
		IF ~~ THEN REPLY @104 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability1	//4	对钝击武器的AC+4有利
		IF ~~ THEN REPLY @105 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability1	//5	对远程武器的AC+4有利
		IF ~~ THEN REPLY @106 DO ~ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability1	//6	最大HP+10
		IF ~~ THEN REPLY @107 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability1	//7	移动速度+2
		IF ~~ THEN REPLY @108 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability1	//8	命中+1有利
		IF ~~ THEN REPLY @109 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability1	//9	永久夜视能力
		IF ~~ THEN REPLY @110 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability1	//10	人物力量达到18时会自动变为18/00
		IF ~~ THEN REPLY @111 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability1	//11	武器出手时间-3
		IF ~~ THEN REPLY @112 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability1	//12	一级神术位+2
		IF ~~ THEN REPLY @113 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability1	//13	学识+100
		IF ~~ THEN REPLY @114 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability1	//14	获得剑圣的提气斩技能
		IF ~~ THEN REPLY @115 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability1	//15	获得驯兽师的寻找魔宠技能
		IF ~~ THEN REPLY @116 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability1	//16	获得赏金猎人的特殊陷阱
		IF ~~ THEN REPLY @117 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability1	//17	获得舞剑士的回旋防御技能
		IF ~~ THEN REPLY @118 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability1	//18	获得牧师的特殊能力
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END

	IF ~~ THEN BEGIN abselect2	//100w档
		SAY @30	//选择你希望交换得到的能力。
		IF ~~ THEN REPLY @201 GOTO giveability2	//1	免疫疲劳
		IF ~~ THEN REPLY @202 DO ~ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//2	每轮再生1点HP
		IF ~~ THEN REPLY @203 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//3	一级奥术位+2
		IF ~~ THEN REPLY @204 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//4	致命一击概率提升5
		IF ~~ THEN REPLY @205 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//5	伤害+1
		IF ~~ THEN REPLY @206 DO ~ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability2	//6	徒手攻击时命中和伤害+1有利
		IF ~~ THEN REPLY @207 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//7	双手武器二星
		IF ~~ THEN REPLY @208 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//8	剑盾二星
		IF ~~ THEN REPLY @209 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//9	单手武器二星
		IF ~~ THEN REPLY @210 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//10	强酸抗力+20%
		IF ~~ THEN REPLY @211 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability2	//11	寒冷抗力+20%
		IF ~~ THEN REPLY @212 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//12	闪电抗力+20%
		IF ~~ THEN REPLY @213 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//13	火焰抗力+20%
		IF ~~ THEN REPLY @214 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//14	毒素抗力+20%
		IF ~~ THEN REPLY @215 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//15	获得野蛮人的狂暴技能
		IF ~~ THEN REPLY @216 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability2	//16	获得黑卫的绝望光环技能
		IF ~~ THEN REPLY @217 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//17	获得黑卫的召唤死尸
		IF ~~ THEN REPLY @218 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//18	获得刺客的武器淬毒技能
		IF ~~ THEN REPLY @219 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//19	获得图腾德鲁伊召唤动物灵技能
		IF ~~ THEN REPLY @220 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//20	获得变形者变身为巨型狼人技能
		IF ~~ THEN REPLY @221 DO ~ReallyForceSpellRES("SYLVAD20",Myself)~ GOTO giveability2	//21	获得审理者的真实视域技能
		IF ~~ THEN REPLY @222 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//22	获得审理者的解除魔法技能
		IF ~~ THEN REPLY @223 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//23	获得舞剑士的回旋攻击技能
		IF ~~ THEN REPLY @224 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//24	获得战士高阶技能战嚎
		IF ~~ THEN REPLY @225 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability2	//25	获得战士高阶技能强力必杀一击
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END

	IF ~~ THEN BEGIN abselect3	//150w档
		SAY @30	//选择你希望交换得到的能力。
		IF ~~ THEN REPLY @301 GOTO giveability3	//1	火焰伤害提升10%
		IF ~~ THEN REPLY @302 DO ~ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//2	寒冷伤害提升10%
		IF ~~ THEN REPLY @303 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//3	闪电伤害提升10%
		IF ~~ THEN REPLY @304 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//4	强酸伤害提升10%
		IF ~~ THEN REPLY @305 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//5	魔法能量伤害提升10%
		IF ~~ THEN REPLY @306 DO ~ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability3	//6	毒素伤害提升10%
		IF ~~ THEN REPLY @307 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//7	挥砍伤害提升10%
		IF ~~ THEN REPLY @308 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//8	穿刺伤害提升10%
		IF ~~ THEN REPLY @309 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//9	粉碎伤害提升10%
		IF ~~ THEN REPLY @310 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//10	远程伤害提升10%
		IF ~~ THEN REPLY @311 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability3	//11	对死亡的豁免+2有利
		IF ~~ THEN REPLY @312 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//12	对法杖的豁免+2有利
		IF ~~ THEN REPLY @313 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//13	对石化/变形的豁免+2有利
		IF ~~ THEN REPLY @314 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//14	对喷吐攻击的豁免+2有利
		IF ~~ THEN REPLY @315 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//15	对法术的豁免+2有利
		IF ~~ THEN REPLY @316 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability3	//16	免疫中毒和醉酒
		IF ~~ THEN REPLY @317 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//17	免疫沉默和耳聋
		IF ~~ THEN REPLY @318 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//18	每次攻击吸取2D4点HP
		IF ~~ THEN REPLY @319 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//19	每击带给敌人20%施法失败率
		IF ~~ THEN REPLY @320 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//20	致命一击时带来疾病效果
		IF ~~ THEN REPLY @321 DO ~ReallyForceSpellRES("SYLVAD20",Myself)~ GOTO giveability3	//21	基础AC设为0
		IF ~~ THEN REPLY @322 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//22	魔法伤害抗力+20%
		IF ~~ THEN REPLY @323 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//23	可将一个生物的武器强化为+3
		IF ~~ THEN REPLY @324 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//24	二级和三级奥术位+1
		IF ~~ THEN REPLY @325 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//25	二级和三级神术位+1
		IF ~~ THEN REPLY @326 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability3	//26	获得弓箭手的百步穿杨技能
		IF ~~ THEN REPLY @327 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//27	获得战士的高阶技能：抵抗魔法
		IF ~~ THEN REPLY @328 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//28	获得盗贼的高阶技能：高等闪躲技巧
		IF ~~ THEN REPLY @329 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//29	获得盗贼的高阶技能：九死一生
		IF ~~ THEN REPLY @330 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability3	//30	致命一击时造成额外伤害
		IF ~~ THEN REPLY @331 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability3	//31	双武器三星
		IF ~~ THEN REPLY @332 GOTO wpmaster0	//25	选定一种武器获得五星熟练度
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END

	IF ~~ THEN BEGIN abselect4	//200w档
		SAY @30	//选择你希望交换得到的能力。
		IF ~~ THEN REPLY @401 GOTO giveability4	//1	无法侦测
		IF ~~ THEN REPLY @402 DO ~ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//2	免疫疾病、弱智和目盲
		IF ~~ THEN REPLY @403 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//3	免疫普通武器
		IF ~~ THEN REPLY @404 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//4	魔法抗力+10%
		IF ~~ THEN REPLY @405 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//5	狂乱魔法掷骰+20（仅限法师）
		IF ~~ THEN REPLY @406 DO ~ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability4	//6	四级和五级奥术位+1
		IF ~~ THEN REPLY @407 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//7	四级和五级神术位+1
		IF ~~ THEN REPLY @408 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//8	力量+1
		IF ~~ THEN REPLY @409 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//9	敏捷+1
		IF ~~ THEN REPLY @410 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//10	体质+1
		IF ~~ THEN REPLY @411 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability4	//11	智力+1
		IF ~~ THEN REPLY @412 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//12	感知+1
		IF ~~ THEN REPLY @413 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//13	魅力+1
		IF ~~ THEN REPLY @414 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//14	致命一击时必定将敌人击倒
		IF ~~ THEN REPLY @415 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//15	对挥砍武器增加20%的抵抗力
		IF ~~ THEN REPLY @416 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability4	//16	对穿刺武器增加20%的抵抗力
		IF ~~ THEN REPLY @417 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//17	对钝击武器增加20%的抵抗力
		IF ~~ THEN REPLY @418 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//18	对远程武器增加20%的抵抗力
		IF ~~ THEN REPLY @419 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//19	徒手攻击命中时，下一轮攻击次数+1
		IF ~~ THEN REPLY @420 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//20	使用十字弓和投石索时，攻击次数+1
		IF ~~ THEN REPLY @421 DO ~ReallyForceSpellRES("SYLVAD20",Myself)~ GOTO giveability4	//21	使用投掷类武器时可以用，若未装备盾牌则每轮攻击次数+1
		IF ~~ THEN REPLY @422 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//22	可将一个生物的武器强化为+4
		IF ~~ THEN REPLY @423 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//23	获得狂战士的狂暴技能
		IF ~~ THEN REPLY @424 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//24	获得战士的高阶技能：强力旋风攻击
		IF ~~ THEN REPLY @425 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//25	获得战士的高阶技能：强韧
		IF ~~ THEN REPLY @426 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability4	//26	获得战士的高阶技能：致命一击
		IF ~~ THEN REPLY @427 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//27	获得战士的高阶技能：威猛攻击
		IF ~~ THEN REPLY @428 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//28	获得影舞者的高阶技能：影之迷宫
		IF ~~ THEN REPLY @429 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//29	获得影舞者的高阶技能：影之形
		IF ~~ THEN REPLY @430 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//30	牧师超度等级+7
		IF ~~ THEN REPLY @431 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability4	//31	永久防护邪恶
		IF ~~ THEN REPLY @432 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability4	//32	致命失误时对自身施展朦胧术
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END

	IF ~~ THEN BEGIN abselect5	//250w档
		SAY @30	//选择你希望交换得到的能力。
		IF ~~ THEN REPLY @501 GOTO giveability5	//1	免疫负面精神状态的影响
		IF ~~ THEN REPLY @502 DO ~ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//2	所有元素抗力+10%
		IF ~~ THEN REPLY @503 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//3	幸运+1。（重复选取可累加）
		IF ~~ THEN REPLY @504 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//4	永久受援助术影响。（重复选取不累加）
		IF ~~ THEN REPLY @505 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//5	永久受赞美术影响。（重复选取不累加）
		IF ~~ THEN REPLY @506 DO ~ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability5	//6	攻击附带冰火伤害各1D3点
		IF ~~ THEN REPLY @507 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//7	攻击附带电酸伤害各1D3点
		IF ~~ THEN REPLY @508 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//8	六级和七级奥术位+1
		IF ~~ THEN REPLY @509 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//9	六级和七级神术位+1
		IF ~~ THEN REPLY @510 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//10	恒定加速状态
		IF ~~ THEN REPLY @511 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability5	//11	攻击次数+1
		IF ~~ THEN REPLY @512 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//12	施法速度+1
		IF ~~ THEN REPLY @513 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//13	背刺倍数+1
		IF ~~ THEN REPLY @514 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//14	致命一击时必定令敌人震慑（无豁免）一轮时间
		IF ~~ THEN REPLY @515 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//15	背刺成功时致残对手
		IF ~~ THEN REPLY @516 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability5	//16	可将一个生物的武器强化为+5
		IF ~~ THEN REPLY @517 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//17	获得战士的高阶技能：震撼攻击
		IF ~~ THEN REPLY @518 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//18	获得影舞者的高阶技能：影之形
		IF ~~ THEN REPLY @519 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//19	获得牧师的高阶技能：召唤使徒
		IF ~~ THEN REPLY @520 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//20	获得牧师的高阶技能：召唤堕落使徒
		IF ~~ THEN REPLY @521 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability5	//21	致命失误时对自身施展正义魔法
		IF ~~ THEN REPLY @522 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//22	20%概率完全抵挡物理攻击
		IF ~~ THEN REPLY @523 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//23	近战命中时，对方需要以-2不利对喷吐进行豁免检定来避免被卸武
		IF ~~ THEN REPLY @524 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability5	//24	徒手作战时，有15%概率抵挡近战攻击并且卸除对方武器
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END

	IF ~~ THEN BEGIN abselect6	//300w档
		SAY @30	//选择你希望交换得到的能力。
		IF ~~ THEN REPLY @601 GOTO giveability6	//1	免疫即死
		IF ~~ THEN REPLY @602 DO ~ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	//2	免疫影响移动的负面效果
		IF ~~ THEN REPLY @603 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	//3	八级和九级奥术位+1
		IF ~~ THEN REPLY @604 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	//4	不会因为吸取属性而死亡
		IF ~~ THEN REPLY @605 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	//5	免疫附魔等级+1的武器（不包括普通武器）
		IF ~~ THEN REPLY @606 DO ~ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability6	//6	免疫背刺
		IF ~~ THEN REPLY @607 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	//7	免疫等级吸取
		IF ~~ THEN REPLY @608 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	//8	每击20%概率击倒敌人（无豁免）一轮时间。（重复选取不累加）
		IF ~~ THEN REPLY @609 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	//9	每击30%概率使敌人减速（无豁免）一轮时间。（重复选取不累加）
		IF ~~ THEN REPLY @610 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	//10	免疫超度不死生物
		IF ~~ THEN REPLY @611 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability6	//11	穿着重甲等情况可以使用盗贼技能
		IF ~~ THEN REPLY @612 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	//12	攻击附带15秒的中毒状态（无豁免），敌人中毒时每秒受到1点伤害
		IF ~~ THEN REPLY @613 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	//13	背刺成功时必定使自身进入隐形状态
		IF ~~ THEN REPLY @614 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	//14	每击使对手魔抗-5%且AC-1不利，持续1回合
		IF ~~ THEN REPLY @615 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	//15	可将一个生物的武器强化为+6
		IF ~~ THEN REPLY @616 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability6	//16	HP小于25%时被击中施展误导术
		IF ~~ THEN REPLY @617 GOTO alignment0	//17	改变九宫格阵营
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END

	IF ~~ THEN BEGIN abselect7	//400w档
		SAY @30	//选择你希望交换得到的能力。
		IF ~~ THEN REPLY @701 GOTO giveability7	//1	HP小于25%时对自己施展灵魂形态
		IF ~~ THEN REPLY @702 DO ~ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability7	//2	免疫附魔等级+2的武器（不包括+2以下武器）
		IF ~~ THEN REPLY @703 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability7	//3	所有物理抗力+10%
		IF ~~ THEN REPLY @704 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability7	//4	所有豁免+2有利
		IF ~~ THEN REPLY @705 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability7	//5	每击20%概率震慑敌人（无豁免）一轮时间。（重复选取不累加）
		IF ~~ THEN REPLY @706 DO ~ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability7	//6	每击解除魔法
		IF ~~ THEN REPLY @707 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability7	//7	攻击时直接摧毁不死生物，-2不利对死亡豁免
		IF ~~ THEN REPLY @708 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability7	//8	攻击时直接放逐恶魔等异位面生物，-2不利对死亡豁免
		IF ~~ THEN REPLY @709 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability7	//9	每击10%概率斩首（无豁免）。（重复选取不累加）
		IF ~~ THEN REPLY @710 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability7	//10	致命一击时必定将敌人斩首（无豁免）
		IF ~~ THEN REPLY @711 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability7	//11	获得影舞者的高阶技能：阴影双子
		IF ~~ THEN REPLY @712 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability7	//12	游吟诗人歌曲效果的持续时间变成十倍（重复选取不累加）
		IF ~~ THEN REPLY @713 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability7	//13	穿着重甲等情况下可以施展法术
		IF ~~ THEN REPLY @714 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability7	//14	互换生命值，每天一次
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END

	IF ~~ THEN BEGIN abselect8	//500w档
		SAY @30	//选择你希望交换得到的能力。
		IF ~~ THEN REPLY @801 GOTO giveability8	//1	获得万能巧手
		IF ~~ THEN REPLY @802 DO ~ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability8	//2	恒定高等加速状态
		IF ~~ THEN REPLY @803 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability8	//3	免疫附魔等级+3的武器（不包括+3以下武器）
		IF ~~ THEN REPLY @804 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability8	//4	施法（以及使用技能）无间隔
		IF ~~ THEN REPLY @805 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability8	//5	免疫禁锢和迷宫
		IF ~~ THEN REPLY @806 DO ~ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability8	//6	免疫时间停止
		IF ~~ THEN REPLY @807 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability8	//7	所施展奥术的效果持续时间变成三倍（重复选取不累加）
		IF ~~ THEN REPLY @808 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability8	//8	所施展神术的效果持续时间变成三倍（重复选取不累加）
		IF ~~ THEN REPLY @809 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability8	//9	万能巧手
		IF ~~ THEN REPLY @810 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability8	//10	创造任意目标的拟像
		IF ~~ THEN REPLY @811 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability8	//11	高度近视（只能看见2呎范围）
		IF ~~ THEN REPLY @812 GOTO reducelevel	//12	更换任意职业和宗派，保留已有技能
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END

	IF ~~ THEN BEGIN wpmaster0
		SAY @29	//选择你希望掌握的武器类型。
		IF ~~ THEN REPLY @920 DO ~~ GOTO giveability9	///1	棍棒
		IF ~~ THEN REPLY @901 DO ~ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability9	//2	巨剑
		IF ~~ THEN REPLY @902 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability9	//3	长剑
		IF ~~ THEN REPLY @903 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability9	//4	短剑
		IF ~~ THEN REPLY @904 DO ~ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability9	//5	战斧
		IF ~~ THEN REPLY @905 DO ~ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability9	//6	双手剑
		IF ~~ THEN REPLY @906 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability9	//7	武士刀
		IF ~~ THEN REPLY @907 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability9	//8	弯刀
		IF ~~ THEN REPLY @908 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability9	//9	匕首
		IF ~~ THEN REPLY @909 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability9	//10	战锤
		IF ~~ THEN REPLY @910 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability9	//11	长矛
		IF ~~ THEN REPLY @911 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability9	//12	战戟
		IF ~~ THEN REPLY @912 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability9	//13	链枷
		IF ~~ THEN REPLY @913 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability9	//14	钉头锤
		IF ~~ THEN REPLY @914 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability9	//15	手杖
		IF ~~ THEN REPLY @915 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability9	//16	十字弓
		IF ~~ THEN REPLY @916 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability9	//17	长弓
		IF ~~ THEN REPLY @917 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability9	//18	短弓
		IF ~~ THEN REPLY @918 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability9	//19	飞镖
		IF ~~ THEN REPLY @919 DO ~ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability9	///20	投石索
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END
	
	IF ~~ THEN BEGIN alignment0	//放在法术F但是施法等级+30
		SAY @33	//需要转变到哪个阵营？
		IF ~~ THEN REPLY @951 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability6	///31	守序善良
		IF ~~ THEN REPLY @952 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	///32	中立善良
		IF ~~ THEN REPLY @953 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	///33	混乱善良
		IF ~~ THEN REPLY @954 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	///34	守序中立
		IF ~~ THEN REPLY @955 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	///35	绝对中立
		IF ~~ THEN REPLY @956 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)~ GOTO giveability6	///36	混乱中立
		IF ~~ THEN REPLY @957 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	///37	守序邪恶
		IF ~~ THEN REPLY @958 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	///38	中立邪恶
		IF ~~ THEN REPLY @959 DO ~ReallyForceSpellRES("SYLVAD20",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD5",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)
		ReallyForceSpellRES("SYLVADD1",Myself)~ GOTO giveability6	///39	混乱邪恶
	END

	IF ~~ THEN BEGIN reducelevel	//放在法术H但是施法等级为21
		SAY @1534	//确认扣除等级和经验进行转职？不可逆转
		IF ~~ THEN REPLY @1533 GOTO abselect8	//我现在还不需要转职。
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @1535 DO ~ReallyForceSpellRES("SYLVSET1",Player1)
		ReallyForceSpellRES("SYLVAD20",Myself)~ GOTO changeclass0 	//确认进行转职。
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @1535 DO ~ReallyForceSpellRES("SYLVSET1",Player2)
		ReallyForceSpellRES("SYLVAD20",Myself)~ GOTO changeclass0 	//确认进行转职。
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @1535 DO ~ReallyForceSpellRES("SYLVSET1",Player3)
		ReallyForceSpellRES("SYLVAD20",Myself)~ GOTO changeclass0 	//确认进行转职。
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @1535 DO ~ReallyForceSpellRES("SYLVSET1",Player4)
		ReallyForceSpellRES("SYLVAD20",Myself)~ GOTO changeclass0 	//确认进行转职。
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @1535 DO ~ReallyForceSpellRES("SYLVSET1",Player5)
		ReallyForceSpellRES("SYLVAD20",Myself)~ GOTO changeclass0 	//确认进行转职。
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @1535 DO ~ReallyForceSpellRES("SYLVSET1",Player6)
		ReallyForceSpellRES("SYLVAD20",Myself)~ GOTO changeclass0 	//确认进行转职。
	END

	IF ~~ THEN BEGIN changeclass0
		SAY @1510	//选择需要转职的主职业。
		IF ~~ THEN REPLY @1511 GOTO changetomage
		IF ~~ THEN REPLY @1512 GOTO changetofighter
		IF ~~ THEN REPLY @1513 GOTO changetocleric
		IF ~~ THEN REPLY @1514 GOTO changetothief
		IF ~~ THEN REPLY @1515 GOTO changetobard
		IF ~~ THEN REPLY @1516 GOTO changetopaladin
		IF ~~ THEN REPLY @1517 GOTO changetodruid
		IF ~~ THEN REPLY @1518 GOTO changetoranger
		IF ~~ THEN REPLY @1519 GOTO changetosorcerer
		IF ~~ THEN REPLY @1520 GOTO changetomonk
		IF ~~ THEN REPLY @1521 GOTO changetoshaman
	END
	


	IF ~~ THEN BEGIN changetomage
		SAY @1530	//选择需要转职的宗派。
		IF ~~ THEN REPLY @1531 GOTO changeclass0	//重新选择主职业
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @1532 DO ~ChangeClass(Player1,MAGE) ClearActions(Player1) ActionOverride(Player1,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @1532 DO ~ChangeClass(Player2,MAGE) ClearActions(Player2) ActionOverride(Player2,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @1532 DO ~ChangeClass(Player3,MAGE) ClearActions(Player3) ActionOverride(Player3,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @1532 DO ~ChangeClass(Player4,MAGE) ClearActions(Player4) ActionOverride(Player4,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @1532 DO ~ChangeClass(Player5,MAGE) ClearActions(Player5) ActionOverride(Player5,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @1532 DO ~ChangeClass(Player6,MAGE) ClearActions(Player6) ActionOverride(Player6,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
	END

	IF ~~ THEN BEGIN changetofighter
		SAY @1530	//选择需要转职的宗派。
		IF ~~ THEN REPLY @1531 GOTO changeclass0	//重新选择主职业
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @1532 DO ~ChangeClass(Player1,FIGHTER) ClearActions(Player1) ActionOverride(Player1,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @1532 DO ~ChangeClass(Player2,FIGHTER) ClearActions(Player2) ActionOverride(Player2,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @1532 DO ~ChangeClass(Player3,FIGHTER) ClearActions(Player3) ActionOverride(Player3,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @1532 DO ~ChangeClass(Player4,FIGHTER) ClearActions(Player4) ActionOverride(Player4,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @1532 DO ~ChangeClass(Player5,FIGHTER) ClearActions(Player5) ActionOverride(Player5,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @1532 DO ~ChangeClass(Player6,FIGHTER) ClearActions(Player6) ActionOverride(Player6,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
	END

	IF ~~ THEN BEGIN changetocleric
		SAY @1530	//选择需要转职的宗派。
		IF ~~ THEN REPLY @1531 GOTO changeclass0	//重新选择主职业
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @1532 DO ~ChangeClass(Player1,CLERIC) ClearActions(Player1) ActionOverride(Player1,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @1532 DO ~ChangeClass(Player2,CLERIC) ClearActions(Player2) ActionOverride(Player2,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @1532 DO ~ChangeClass(Player3,CLERIC) ClearActions(Player3) ActionOverride(Player3,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @1532 DO ~ChangeClass(Player4,CLERIC) ClearActions(Player4) ActionOverride(Player4,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @1532 DO ~ChangeClass(Player5,CLERIC) ClearActions(Player5) ActionOverride(Player5,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @1532 DO ~ChangeClass(Player6,CLERIC) ClearActions(Player6) ActionOverride(Player6,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
	END

	IF ~~ THEN BEGIN changetothief
		SAY @1530	//选择需要转职的宗派。
		IF ~~ THEN REPLY @1531 GOTO changeclass0	//重新选择主职业
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @1532 DO ~ChangeClass(Player1,THIEF) ClearActions(Player1) ActionOverride(Player1,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @1532 DO ~ChangeClass(Player2,THIEF) ClearActions(Player2) ActionOverride(Player2,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @1532 DO ~ChangeClass(Player3,THIEF) ClearActions(Player3) ActionOverride(Player3,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @1532 DO ~ChangeClass(Player4,THIEF) ClearActions(Player4) ActionOverride(Player4,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @1532 DO ~ChangeClass(Player5,THIEF) ClearActions(Player5) ActionOverride(Player5,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @1532 DO ~ChangeClass(Player6,THIEF) ClearActions(Player6) ActionOverride(Player6,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
	END

	IF ~~ THEN BEGIN changetobard
		SAY @1530	//选择需要转职的宗派。
		IF ~~ THEN REPLY @1531 GOTO changeclass0	//重新选择主职业
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @1532 DO ~ChangeClass(Player1,BARD) ClearActions(Player1) ActionOverride(Player1,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @1532 DO ~ChangeClass(Player2,BARD) ClearActions(Player2) ActionOverride(Player2,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @1532 DO ~ChangeClass(Player3,BARD) ClearActions(Player3) ActionOverride(Player3,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @1532 DO ~ChangeClass(Player4,BARD) ClearActions(Player4) ActionOverride(Player4,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @1532 DO ~ChangeClass(Player5,BARD) ClearActions(Player5) ActionOverride(Player5,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @1532 DO ~ChangeClass(Player6,BARD) ClearActions(Player6) ActionOverride(Player6,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
	END

	IF ~~ THEN BEGIN changetopaladin
		SAY @1530	//选择需要转职的宗派。
		IF ~~ THEN REPLY @1531 GOTO changeclass0	//重新选择主职业
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @1532 DO ~ChangeClass(Player1,PALADIN) ClearActions(Player1) ActionOverride(Player1,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @1532 DO ~ChangeClass(Player2,PALADIN) ClearActions(Player2) ActionOverride(Player2,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @1532 DO ~ChangeClass(Player3,PALADIN) ClearActions(Player3) ActionOverride(Player3,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @1532 DO ~ChangeClass(Player4,PALADIN) ClearActions(Player4) ActionOverride(Player4,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @1532 DO ~ChangeClass(Player5,PALADIN) ClearActions(Player5) ActionOverride(Player5,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @1532 DO ~ChangeClass(Player6,PALADIN) ClearActions(Player6) ActionOverride(Player6,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
	END

	IF ~~ THEN BEGIN changetodruid
		SAY @1530	//选择需要转职的宗派。
		IF ~~ THEN REPLY @1531 GOTO changeclass0	//重新选择主职业
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @1532 DO ~ChangeClass(Player1,DRUID) ClearActions(Player1) ActionOverride(Player1,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @1532 DO ~ChangeClass(Player2,DRUID) ClearActions(Player2) ActionOverride(Player2,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @1532 DO ~ChangeClass(Player3,DRUID) ClearActions(Player3) ActionOverride(Player3,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @1532 DO ~ChangeClass(Player4,DRUID) ClearActions(Player4) ActionOverride(Player4,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @1532 DO ~ChangeClass(Player5,DRUID) ClearActions(Player5) ActionOverride(Player5,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @1532 DO ~ChangeClass(Player6,DRUID) ClearActions(Player6) ActionOverride(Player6,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
	END

	IF ~~ THEN BEGIN changetoranger
		SAY @1530	//选择需要转职的宗派。
		IF ~~ THEN REPLY @1531 GOTO changeclass0	//重新选择主职业
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @1532 DO ~ChangeClass(Player1,RANGER) ClearActions(Player1) ActionOverride(Player1,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @1532 DO ~ChangeClass(Player2,RANGER) ClearActions(Player2) ActionOverride(Player2,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @1532 DO ~ChangeClass(Player3,RANGER) ClearActions(Player3) ActionOverride(Player3,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @1532 DO ~ChangeClass(Player4,RANGER) ClearActions(Player4) ActionOverride(Player4,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @1532 DO ~ChangeClass(Player5,RANGER) ClearActions(Player5) ActionOverride(Player5,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @1532 DO ~ChangeClass(Player6,RANGER) ClearActions(Player6) ActionOverride(Player6,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
	END

	IF ~~ THEN BEGIN changetosorcerer
		SAY @1530	//选择需要转职的宗派。
		IF ~~ THEN REPLY @1531 GOTO changeclass0	//重新选择主职业
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @1532 DO ~ChangeClass(Player1,SORCERER) ClearActions(Player1) ActionOverride(Player1,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @1532 DO ~ChangeClass(Player2,SORCERER) ClearActions(Player2) ActionOverride(Player2,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @1532 DO ~ChangeClass(Player3,SORCERER) ClearActions(Player3) ActionOverride(Player3,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @1532 DO ~ChangeClass(Player4,SORCERER) ClearActions(Player4) ActionOverride(Player4,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @1532 DO ~ChangeClass(Player5,SORCERER) ClearActions(Player5) ActionOverride(Player5,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @1532 DO ~ChangeClass(Player6,SORCERER) ClearActions(Player6) ActionOverride(Player6,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
	END


	IF ~~ THEN BEGIN changetomonk
		SAY @1530	//选择需要转职的宗派。
		IF ~~ THEN REPLY @1531 GOTO changeclass0	//重新选择主职业
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @1532 DO ~ChangeClass(Player1,MONK) ClearActions(Player1) ActionOverride(Player1,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @1532 DO ~ChangeClass(Player2,MONK) ClearActions(Player2) ActionOverride(Player2,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @1532 DO ~ChangeClass(Player3,MONK) ClearActions(Player3) ActionOverride(Player3,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @1532 DO ~ChangeClass(Player4,MONK) ClearActions(Player4) ActionOverride(Player4,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @1532 DO ~ChangeClass(Player5,MONK) ClearActions(Player5) ActionOverride(Player5,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @1532 DO ~ChangeClass(Player6,MONK) ClearActions(Player6) ActionOverride(Player6,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
	END


	IF ~~ THEN BEGIN changetoshaman
		SAY @1530	//选择需要转职的宗派。
		IF ~~ THEN REPLY @1531 GOTO changeclass0	//重新选择主职业
		IF ~Global("SY#XPEAR","LOCALS",1)~ THEN REPLY @1532 DO ~ChangeClass(Player1,SHAMAN) ClearActions(Player1) ActionOverride(Player1,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",2)~ THEN REPLY @1532 DO ~ChangeClass(Player2,SHAMAN) ClearActions(Player2) ActionOverride(Player2,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",3)~ THEN REPLY @1532 DO ~ChangeClass(Player3,SHAMAN) ClearActions(Player3) ActionOverride(Player3,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",4)~ THEN REPLY @1532 DO ~ChangeClass(Player4,SHAMAN) ClearActions(Player4) ActionOverride(Player4,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",5)~ THEN REPLY @1532 DO ~ChangeClass(Player5,SHAMAN) ClearActions(Player5) ActionOverride(Player5,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
		IF ~Global("SY#XPEAR","LOCALS",6)~ THEN REPLY @1532 DO ~ChangeClass(Player6,SHAMAN) ClearActions(Player6) ActionOverride(Player6,AddKit(0)) CreateVisualEffectObject("SPUSEANY",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		//无宗派基础职业
	END

	IF ~~ THEN BEGIN giveability1
		SAY @31	//那好，我们来交换吧……
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0A",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0A",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0A",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0A",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0A",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0A",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1A",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1A",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1A",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1A",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1A",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1A",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
	END

	IF ~~ THEN BEGIN giveability2
		SAY @31	//那好，我们来交换吧……
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0B",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0B",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0B",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0B",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0B",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0B",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1B",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1B",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1B",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1B",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1B",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1B",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
	END
	
	IF ~~ THEN BEGIN giveability3
		SAY @31	//那好，我们来交换吧……
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0C",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0C",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0C",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0C",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0C",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0C",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1C",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1C",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1C",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1C",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1C",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1C",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
	END

	IF ~~ THEN BEGIN giveability4
		SAY @31	//那好，我们来交换吧……
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0D",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0D",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0D",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0D",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0D",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0D",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1D",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1D",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1D",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1D",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1D",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1D",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
	END

	IF ~~ THEN BEGIN giveability5
		SAY @31	//那好，我们来交换吧……
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0E",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0E",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0E",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0E",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0E",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0E",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1E",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1E",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1E",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1E",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1E",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1E",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
	END

	IF ~~ THEN BEGIN giveability6
		SAY @31	//那好，我们来交换吧……
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0F",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0F",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0F",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0F",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0F",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0F",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1F",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1F",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1F",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1F",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1F",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1F",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
	END

	IF ~~ THEN BEGIN giveability7
		SAY @31	//那好，我们来交换吧……
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0G",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0G",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0G",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0G",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0G",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0G",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1G",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1G",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1G",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1G",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1G",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1G",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
	END

	IF ~~ THEN BEGIN giveability8
		SAY @31	//那好，我们来交换吧……
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0H",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0H",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0H",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0H",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0H",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0H",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1H",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1H",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1H",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1H",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1H",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1H",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
	END

	IF ~~ THEN BEGIN giveability9
		SAY @31	//那好，我们来交换吧……
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0I",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0I",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0I",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0I",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0I",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE0I",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1I",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1I",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1I",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1I",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1I",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("SY#XPEAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("SY#XPE1I",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
	END

END
