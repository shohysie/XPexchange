//~%dlgname%~分有限愿望和许愿术两个法术
//~%lvlimit%~为游戏最高人物等级
//经验上限高，遗产模式判断要求+900w

//~%dlgname%~分有限愿望和许愿术两个法术
//~%lvlimit%~为游戏最高人物等级
//经验上限低，遗产模式判断要求仅+250w

EXTEND_BOTTOM ~%dlgname%~ 0
	IF ~~
	THEN REPLY @9 DO ~ReallyForceSpellRES("XPEXCH00",Myself)~ GOTO xpcheck0	//你能提供一些特殊能力，让我的队员用经验点数进行交易吗？
END

/*改
XPEXCH00，自身等级设为1
XPEXCH01，等级+20
XPEXCH02，等级+5
XPEXCH03，等级+1
XPEXCH0A-0E目标扣除经验获得能力
XPEXCH1A-1E为巴尔遗产难度下扣除更多经验
XPEXCHAR变量为1-6表示对不同队员
*/

APPEND ~%dlgname%~

	IF ~~ THEN BEGIN xpcheck0
		SAY @10	//是哪一位大人需要进行经验点数交换？我需要仔细看看他的状况。
		IF ~InMyArea(Player1)~ THEN REPLY @11 DO ~SetGlobal("XPEXCHAR","LOCALS",1)~ GOTO xpcheck1	//是<PLAYER1>需要进行交换。
		IF ~InMyArea(Player2)~ THEN REPLY @12 DO ~SetGlobal("XPEXCHAR","LOCALS",2)~ GOTO xpcheck2	//是<PLAYER2>需要进行交换。
		IF ~InMyArea(Player3)~ THEN REPLY @13 DO ~SetGlobal("XPEXCHAR","LOCALS",3)~ GOTO xpcheck3	//是<PLAYER3>需要进行交换。
		IF ~InMyArea(Player4)~ THEN REPLY @14 DO ~SetGlobal("XPEXCHAR","LOCALS",4)~ GOTO xpcheck4	//是<PLAYER4>需要进行交换。
		IF ~InMyArea(Player5)~ THEN REPLY @15 DO ~SetGlobal("XPEXCHAR","LOCALS",5)~ GOTO xpcheck5	//是<PLAYER5>需要进行交换。
		IF ~InMyArea(Player6)~ THEN REPLY @16 DO ~SetGlobal("XPEXCHAR","LOCALS",6)~ GOTO xpcheck6	//是<PLAYER6>需要进行交换。
		IF ~~ THEN REPLY @40 DO ~SetGlobal("XPEXCHAR","LOCALS",0)~ GOTO xpcheck9	//我改变主意了，还是算了。
	END

	IF ~~ THEN BEGIN xpcheck1
		SAY @17	//让我看看……
		IF ~OR(11)
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
		IF ~!Class(Player1,MAGE)
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
		IF ~!NightmareModeOn() XPLT(Player1,1000000)~ THEN GOTO xpcheck8	//经验不足
		IF ~NightmareModeOn() XPLT(Player1,1500000)~ THEN  GOTO xpcheck8	//经验不足
	END

	IF ~~ THEN BEGIN xpcheck2
		SAY @17	//让我看看……
		IF ~OR(11)
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
		IF ~!Class(Player2,MAGE)
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
		IF ~!NightmareModeOn() XPLT(Player2,1000000)~ THEN GOTO xpcheck8	//经验不足
		IF ~NightmareModeOn() XPLT(Player2,1500000)~ THEN  GOTO xpcheck8	//经验不足
	END

	IF ~~ THEN BEGIN xpcheck3
		SAY @17	//让我看看……
		IF ~OR(2)OR(11)
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
		IF ~!Class(Player3,MAGE)
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
		IF ~!NightmareModeOn() XPLT(Player3,1000000)~ THEN GOTO xpcheck8	//经验不足
		IF ~NightmareModeOn() XPLT(Player3,1500000)~ THEN  GOTO xpcheck8	//经验不足
	END

	IF ~~ THEN BEGIN xpcheck4
		SAY @17	//让我看看……
		IF ~OR(11)
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
		IF ~!Class(Player4,MAGE)
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
		IF ~!NightmareModeOn() XPLT(Player4,1000000)~ THEN GOTO xpcheck8	//经验不足
		IF ~NightmareModeOn() XPLT(Player4,1500000)~ THEN  GOTO xpcheck8	//经验不足
	END

	IF ~~ THEN BEGIN xpcheck5
		SAY @17	//让我看看……
		IF ~OR(11)
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
		IF ~!Class(Player5,MAGE)
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
		IF ~!NightmareModeOn() XPLT(Player5,1000000)~ THEN GOTO xpcheck8	//经验不足
		IF ~NightmareModeOn() XPLT(Player5,1500000)~ THEN  GOTO xpcheck8	//经验不足
	END

	IF ~~ THEN BEGIN xpcheck6
		SAY @17	//让我看看……
		IF ~OR(11)
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
		IF ~!Class(Player6,MAGE)
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
		IF ~!NightmareModeOn() XPLT(Player6,1000000)~ THEN GOTO xpcheck8	//经验不足
		IF ~NightmareModeOn() XPLT(Player6,1500000)~ THEN  GOTO xpcheck8	//经验不足
	END

	IF ~~ THEN BEGIN xpcheck7
		SAY @18	//只有单一职业者才能进行交换，这位大人已经学得够多够复杂了。
		IF ~~ DO ~SetGlobal("XPEXCHAR","LOCALS",0)~ GOTO xpcheck0
	END

	IF ~~ THEN BEGIN xpcheck8
		SAY @37	//很遗憾，这位大人积累的经验还不够丰富。
		IF ~~ DO ~SetGlobal("XPEXCHAR","LOCALS",0)~ GOTO xpcheck0
	END

	IF ~~ THEN BEGIN xpselect1
		SAY @20	//我可以和这位大人进行交易，您打算付出多少经验点数？
		IF ~!NightmareModeOn() !XPLT(Player1,1000000)~ THEN REPLY @21 GOTO abselect1	//一百万点。
		IF ~!NightmareModeOn() !XPLT(Player1,1500000)~ THEN REPLY @22 GOTO abselect2	//一百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player1,2000000)~ THEN REPLY @23 GOTO abselect3	//二百万点。
		IF ~!NightmareModeOn() !XPLT(Player1,2500000)~ THEN REPLY @24 GOTO abselect4	//二百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player1,3000000)~ THEN REPLY @25 GOTO abselect5	//三百万点。
		IF ~!NightmareModeOn() !XPLT(Player1,4000000)~ THEN REPLY @26 GOTO abselect6	//四百万点。
		IF ~!NightmareModeOn() !XPLT(Player1,5000000)~ THEN REPLY @27 GOTO abselect7	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player1,2500000)~ THEN REPLY @71 GOTO abselect1	//两百五十万点。
		IF ~NightmareModeOn() !XPLT(Player1,3750000)~ THEN REPLY @72 GOTO abselect2	//三百七十五万点。
		IF ~NightmareModeOn() !XPLT(Player1,5000000)~ THEN REPLY @73 GOTO abselect3	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player1,6250000)~ THEN REPLY @74 GOTO abselect4	//六百二十五万点。
		IF ~NightmareModeOn() !XPLT(Player1,7500000)~ THEN REPLY @75 GOTO abselect5	//七百五十万点。
		IF ~NightmareModeOn() !XPLT(Player1,10000000)~ THEN REPLY @76 GOTO abselect6	//一千万点。
		IF ~NightmareModeOn() !XPLT(Player1,12500000)~ THEN REPLY @77 GOTO abselect7	//一千二百五十万点。
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//我想换一位队员进行交易。
	END

	IF ~~ THEN BEGIN xpselect2
		SAY @20	//我可以和这位大人进行交易，您打算付出多少经验点数？
		IF ~!NightmareModeOn() !XPLT(Player2,1000000)~ THEN REPLY @21 GOTO abselect1	//一百万点。
		IF ~!NightmareModeOn() !XPLT(Player2,1500000)~ THEN REPLY @22 GOTO abselect2	//一百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player2,2000000)~ THEN REPLY @23 GOTO abselect3	//二百万点。
		IF ~!NightmareModeOn() !XPLT(Player2,2500000)~ THEN REPLY @24 GOTO abselect4	//二百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player2,3000000)~ THEN REPLY @25 GOTO abselect5	//三百万点。
		IF ~!NightmareModeOn() !XPLT(Player2,4000000)~ THEN REPLY @26 GOTO abselect6	//四百万点。
		IF ~!NightmareModeOn() !XPLT(Player2,5000000)~ THEN REPLY @27 GOTO abselect7	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player2,2500000)~ THEN REPLY @71 GOTO abselect1	//两百五十万点。
		IF ~NightmareModeOn() !XPLT(Player2,3750000)~ THEN REPLY @72 GOTO abselect2	//三百七十五万点。
		IF ~NightmareModeOn() !XPLT(Player2,5000000)~ THEN REPLY @73 GOTO abselect3	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player2,6250000)~ THEN REPLY @74 GOTO abselect4	//六百二十五万点。
		IF ~NightmareModeOn() !XPLT(Player2,7500000)~ THEN REPLY @75 GOTO abselect5	//七百五十万点。
		IF ~NightmareModeOn() !XPLT(Player2,10000000)~ THEN REPLY @76 GOTO abselect6	//一千万点。
		IF ~NightmareModeOn() !XPLT(Player2,12500000)~ THEN REPLY @77 GOTO abselect7	//一千二百五十万点。
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//我想换一位队员进行交易。
	END

	IF ~~ THEN BEGIN xpselect3
		SAY @20	//我可以和这位大人进行交易，您打算付出多少经验点数？
		IF ~!NightmareModeOn() !XPLT(Player3,1000000)~ THEN REPLY @21 GOTO abselect1	//一百万点。
		IF ~!NightmareModeOn() !XPLT(Player3,1500000)~ THEN REPLY @22 GOTO abselect2	//一百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player3,2000000)~ THEN REPLY @23 GOTO abselect3	//二百万点。
		IF ~!NightmareModeOn() !XPLT(Player3,2500000)~ THEN REPLY @24 GOTO abselect4	//二百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player3,3000000)~ THEN REPLY @25 GOTO abselect5	//三百万点。
		IF ~!NightmareModeOn() !XPLT(Player3,4000000)~ THEN REPLY @26 GOTO abselect6	//四百万点。
		IF ~!NightmareModeOn() !XPLT(Player3,5000000)~ THEN REPLY @27 GOTO abselect7	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player3,2500000)~ THEN REPLY @71 GOTO abselect1	//两百五十万点。
		IF ~NightmareModeOn() !XPLT(Player3,3750000)~ THEN REPLY @72 GOTO abselect2	//三百七十五万点。
		IF ~NightmareModeOn() !XPLT(Player3,5000000)~ THEN REPLY @73 GOTO abselect3	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player3,6250000)~ THEN REPLY @74 GOTO abselect4	//六百二十五万点。
		IF ~NightmareModeOn() !XPLT(Player3,7500000)~ THEN REPLY @75 GOTO abselect5	//七百五十万点。
		IF ~NightmareModeOn() !XPLT(Player3,10000000)~ THEN REPLY @76 GOTO abselect6	//一千万点。
		IF ~NightmareModeOn() !XPLT(Player3,12500000)~ THEN REPLY @77 GOTO abselect7	//一千二百五十万点。
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//我想换一位队员进行交易。
	END

	IF ~~ THEN BEGIN xpselect4
		SAY @20	//我可以和这位大人进行交易，您打算付出多少经验点数？
		IF ~!NightmareModeOn() !XPLT(Player4,1000000)~ THEN REPLY @21 GOTO abselect1	//一百万点。
		IF ~!NightmareModeOn() !XPLT(Player4,1500000)~ THEN REPLY @22 GOTO abselect2	//一百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player4,2000000)~ THEN REPLY @23 GOTO abselect3	//二百万点。
		IF ~!NightmareModeOn() !XPLT(Player4,2500000)~ THEN REPLY @24 GOTO abselect4	//二百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player4,3000000)~ THEN REPLY @25 GOTO abselect5	//三百万点。
		IF ~!NightmareModeOn() !XPLT(Player4,4000000)~ THEN REPLY @26 GOTO abselect6	//四百万点。
		IF ~!NightmareModeOn() !XPLT(Player4,5000000)~ THEN REPLY @27 GOTO abselect7	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player4,2500000)~ THEN REPLY @71 GOTO abselect1	//两百五十万点。
		IF ~NightmareModeOn() !XPLT(Player4,3750000)~ THEN REPLY @72 GOTO abselect2	//三百七十五万点。
		IF ~NightmareModeOn() !XPLT(Player4,5000000)~ THEN REPLY @73 GOTO abselect3	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player4,6250000)~ THEN REPLY @74 GOTO abselect4	//六百二十五万点。
		IF ~NightmareModeOn() !XPLT(Player4,7500000)~ THEN REPLY @75 GOTO abselect5	//七百五十万点。
		IF ~NightmareModeOn() !XPLT(Player4,10000000)~ THEN REPLY @76 GOTO abselect6	//一千万点。
		IF ~NightmareModeOn() !XPLT(Player4,12500000)~ THEN REPLY @77 GOTO abselect7	//一千二百五十万点。
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//我想换一位队员进行交易。
	END

	IF ~~ THEN BEGIN xpselect5
		SAY @20	//我可以和这位大人进行交易，您打算付出多少经验点数？
		IF ~!NightmareModeOn() !XPLT(Player5,1000000)~ THEN REPLY @21 GOTO abselect1	//一百万点。
		IF ~!NightmareModeOn() !XPLT(Player5,1500000)~ THEN REPLY @22 GOTO abselect2	//一百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player5,2000000)~ THEN REPLY @23 GOTO abselect3	//二百万点。
		IF ~!NightmareModeOn() !XPLT(Player5,2500000)~ THEN REPLY @24 GOTO abselect4	//二百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player5,3000000)~ THEN REPLY @25 GOTO abselect5	//三百万点。
		IF ~!NightmareModeOn() !XPLT(Player5,4000000)~ THEN REPLY @26 GOTO abselect6	//四百万点。
		IF ~!NightmareModeOn() !XPLT(Player5,5000000)~ THEN REPLY @27 GOTO abselect7	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player5,2500000)~ THEN REPLY @71 GOTO abselect1	//两百五十万点。
		IF ~NightmareModeOn() !XPLT(Player5,3750000)~ THEN REPLY @72 GOTO abselect2	//三百七十五万点。
		IF ~NightmareModeOn() !XPLT(Player5,5000000)~ THEN REPLY @73 GOTO abselect3	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player5,6250000)~ THEN REPLY @74 GOTO abselect4	//六百二十五万点。
		IF ~NightmareModeOn() !XPLT(Player5,7500000)~ THEN REPLY @75 GOTO abselect5	//七百五十万点。
		IF ~NightmareModeOn() !XPLT(Player5,10000000)~ THEN REPLY @76 GOTO abselect6	//一千万点。
		IF ~NightmareModeOn() !XPLT(Player5,12500000)~ THEN REPLY @77 GOTO abselect7	//一千二百五十万点。
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//我想换一位队员进行交易。
	END

	IF ~~ THEN BEGIN xpselect6
		SAY @20	//我可以和这位大人进行交易，您打算付出多少经验点数？
		IF ~!NightmareModeOn() !XPLT(Player6,1000000)~ THEN REPLY @21 GOTO abselect1	//一百万点。
		IF ~!NightmareModeOn() !XPLT(Player6,1500000)~ THEN REPLY @22 GOTO abselect2	//一百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player6,2000000)~ THEN REPLY @23 GOTO abselect3	//二百万点。
		IF ~!NightmareModeOn() !XPLT(Player6,2500000)~ THEN REPLY @24 GOTO abselect4	//二百五十万点。
		IF ~!NightmareModeOn() !XPLT(Player6,3000000)~ THEN REPLY @25 GOTO abselect5	//三百万点。
		IF ~!NightmareModeOn() !XPLT(Player6,4000000)~ THEN REPLY @26 GOTO abselect6	//四百万点。
		IF ~!NightmareModeOn() !XPLT(Player6,5000000)~ THEN REPLY @27 GOTO abselect7	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player6,2500000)~ THEN REPLY @71 GOTO abselect1	//两百五十万点。
		IF ~NightmareModeOn() !XPLT(Player6,3750000)~ THEN REPLY @72 GOTO abselect2	//三百七十五万点。
		IF ~NightmareModeOn() !XPLT(Player6,5000000)~ THEN REPLY @73 GOTO abselect3	//五百万点。
		IF ~NightmareModeOn() !XPLT(Player6,6250000)~ THEN REPLY @74 GOTO abselect4	//六百二十五万点。
		IF ~NightmareModeOn() !XPLT(Player6,7500000)~ THEN REPLY @75 GOTO abselect5	//七百五十万点。
		IF ~NightmareModeOn() !XPLT(Player6,10000000)~ THEN REPLY @76 GOTO abselect6	//一千万点。
		IF ~NightmareModeOn() !XPLT(Player6,12500000)~ THEN REPLY @77 GOTO abselect7	//一千二百五十万点。
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//我想换一位队员进行交易。
	END

	IF ~~ THEN BEGIN xpcheck9
		SAY @38	//很好，我这就离开。
		IF ~~ THEN DO ~SetInterrupt(FALSE)
		ForceSpell(Myself,DRYAD_TELEPORT)
		SmallWait(1)
		DestroySelf()~ EXIT
	END

	IF ~~ THEN BEGIN abselect1
		SAY @30	//选择你希望交换得到的能力。
		IF ~~ THEN REPLY @101 GOTO giveability1	//1	AC+1有利
		IF ~~ THEN REPLY @102 DO ~ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//2	对挥砍武器的AC+4有利
		IF ~~ THEN REPLY @103 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//3	对穿刺武器的AC+4有利
		IF ~~ THEN REPLY @104 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//4	对钝击武器的AC+4有利
		IF ~~ THEN REPLY @105 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//5	对远程武器的AC+4有利
		IF ~~ THEN REPLY @106 DO ~ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability1	//6	最大HP+10
		IF ~~ THEN REPLY @107 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//7	火焰抗力+20%
		IF ~~ THEN REPLY @108 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//8	寒冷抗力+20%
		IF ~~ THEN REPLY @109 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//9	闪电抗力+20%
		IF ~~ THEN REPLY @110 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//10	强酸抗力+20%
		IF ~~ THEN REPLY @111 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability1	//11	毒素抗力+20%
		IF ~~ THEN REPLY @112 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//12	魔法伤害抗力+10%
		IF ~~ THEN REPLY @113 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//13	每轮再生1点HP。（重复选取可累加）
		IF ~~ THEN REPLY @114 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//14	移动速度+2
		IF ~~ THEN REPLY @115 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//15	命中+1有利
		IF ~~ THEN REPLY @116 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability1	//16	额外伤害+1
		IF ~~ THEN REPLY @117 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//17	徒手攻击时命中和伤害+1有利
		IF ~~ THEN REPLY @118 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//18	致命一击概率提升5%。（重复选取可累加）
		IF ~~ THEN REPLY @119 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//19	一级奥术位+2
		IF ~~ THEN REPLY @120 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//20	武器出手时间-4
		IF ~Global("XPEXCHAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END

	IF ~~ THEN BEGIN abselect2
		SAY @30	//选择你希望交换得到的能力。
		IF ~~ THEN REPLY @201 GOTO giveability2	//1	造成的挥砍伤害提升10%
		IF ~~ THEN REPLY @202 DO ~ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//2	造成的穿刺伤害提升10%
		IF ~~ THEN REPLY @203 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//3	造成的粉碎伤害提升10%
		IF ~~ THEN REPLY @204 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//4	造成的远程伤害提升10%
		IF ~~ THEN REPLY @205 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//5	造成的火焰伤害提升10%
		IF ~~ THEN REPLY @206 DO ~ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability2	//6	造成的寒冷伤害提升10%
		IF ~~ THEN REPLY @207 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//7	造成的闪电伤害提升10%
		IF ~~ THEN REPLY @208 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//8	造成的强酸伤害提升10%
		IF ~~ THEN REPLY @209 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//9	造成的魔法能量伤害提升10%
		IF ~~ THEN REPLY @210 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//10	造成的毒素伤害提升10%
		IF ~~ THEN REPLY @211 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability2	//11	免疫中毒（但不免疫毒素伤害）
		IF ~~ THEN REPLY @212 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//12	免疫沉默和耳聋
		IF ~~ THEN REPLY @213 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//13	每次攻击吸取2D4点HP
		IF ~~ THEN REPLY @214 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//14	每击带给敌人20%施法失败率（可累加），持续一回合。（重复选取不累加）
		IF ~~ THEN REPLY @215 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//15	致命一击时施展弱点打击（疾病效果，力量、敏捷-1且迟缓，持续1轮。无豁免）
		IF ~~ THEN REPLY @216 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability2	//16	基础AC设为0
		IF ~~ THEN REPLY @217 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//17	双手武器流派设为2星
		IF ~~ THEN REPLY @218 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//18	剑盾武器流派设为2星
		IF ~~ THEN REPLY @219 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//19	单手武器流派设为2星
		IF ~~ THEN REPLY @220 GOTO abselect9	//20	选定一种武器获得五星熟练度
		IF ~Global("XPEXCHAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END

	IF ~~ THEN BEGIN abselect3
		SAY @30	//选择你希望交换得到的能力。
		IF ~~ THEN REPLY @301 GOTO giveability3	//1	无法侦测
		IF ~~ THEN REPLY @302 DO ~ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//2	免疫疾病、弱智和目盲
		IF ~~ THEN REPLY @303 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//3	免疫普通武器
		IF ~~ THEN REPLY @304 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//4	魔法抗力+10%
		IF ~~ THEN REPLY @305 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//5	狂乱魔法掷骰+20（仅限法师）
		IF ~~ THEN REPLY @306 DO ~ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability3	//6	对死亡的豁免+2有利
		IF ~~ THEN REPLY @307 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//7	对法杖的豁免+2有利
		IF ~~ THEN REPLY @308 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//8	对石化/变形的豁免+2有利
		IF ~~ THEN REPLY @309 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//9	对喷吐攻击的豁免+2有利
		IF ~~ THEN REPLY @310 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//10	对法术的豁免+2有利
		IF ~~ THEN REPLY @311 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability3	//11	四级和五级奥术位+1
		IF ~~ THEN REPLY @312 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//12	四级和五级神术位+1
		IF ~~ THEN REPLY @313 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//13	双武器流派设为3星
		IF ~~ THEN REPLY @314 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//14	力量+1
		IF ~~ THEN REPLY @315 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//15	敏捷+1
		IF ~~ THEN REPLY @316 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability3	//16	体质+1
		IF ~~ THEN REPLY @317 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//17	智力+1
		IF ~~ THEN REPLY @318 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//18	感知+1
		IF ~~ THEN REPLY @319 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//19	魅力+1
		IF ~~ THEN REPLY @320 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//20	致命一击时必定将敌人击倒（无豁免）一轮时间
		IF ~~ THEN REPLY @321 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability3	//21	对挥砍武器增加20%的抵抗力
		IF ~~ THEN REPLY @322 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//22	对钝击武器增加20%的抵抗力
		IF ~~ THEN REPLY @323 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//23	对穿刺武器增加20%的抵抗力
		IF ~~ THEN REPLY @324 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//24	对远程武器增加20%的抵抗力
		IF ~Global("XPEXCHAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END

	IF ~~ THEN BEGIN abselect4
		SAY @30	//选择你希望交换得到的能力。
		IF ~~ THEN REPLY @401 GOTO giveability4	//1	免疫负面精神状态的影响，包括魅惑、控制、恐惧、士气崩溃、狂暴、困惑和昏迷
		IF ~~ THEN REPLY @402 DO ~ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//2	所有元素抗力（火冰电酸毒）永久+10%
		IF ~~ THEN REPLY @403 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//3	幸运+1。（重复选取可累加）
		IF ~~ THEN REPLY @404 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//4	永久受祝福术影响。（重复选取不累加）
		IF ~~ THEN REPLY @405 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//5	永久受赞美术影响。（重复选取不累加）
		IF ~~ THEN REPLY @406 DO ~ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability4	//6	攻击附带冰火伤害各1D3点
		IF ~~ THEN REPLY @407 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//7	攻击附带电酸伤害各1D3点
		IF ~~ THEN REPLY @408 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//8	六级和七级奥术位+1
		IF ~~ THEN REPLY @409 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//9	六级和七级神术位+1
		IF ~~ THEN REPLY @410 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//10	恒定加速状态
		IF ~~ THEN REPLY @411 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability4	//11	施法速度+1
		IF ~~ THEN REPLY @412 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//12	背刺倍数+1
		IF ~~ THEN REPLY @413 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//13	致命一击时必定令敌人震慑（无豁免）一轮时间
		IF ~~ THEN REPLY @414 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//14	背刺成功时致残对手（疾病效果，迟缓、流血且力量敏捷-2不利，持续1回合。无豁免）
		IF ~Global("XPEXCHAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END

	IF ~~ THEN BEGIN abselect5
		SAY @30	//选择你希望交换得到的能力。
		IF ~~ THEN REPLY @501 DO ~ReallyForceSpellRES("XPEXCH01",Myself)~ GOTO giveability4	//21	免疫即死，包括石化、解离和死亡一指、女妖之嚎等法术的即死效果
		IF ~~ THEN REPLY @502 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//22	免疫影响移动的负面效果，包括缓慢、震慑、定身、缠绕、蛛网和油腻
		IF ~~ THEN REPLY @503 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//23	八级和九级奥术位+1
		IF ~~ THEN REPLY @504 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//24	不会因为吸取属性而死亡，例如被灵吸怪吸食大脑
		IF ~~ THEN REPLY @505 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//25	免疫附魔等级+1的武器（不包括普通武器）
		IF ~~ THEN REPLY @506 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability4	//26	免疫背刺
		IF ~~ THEN REPLY @507 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//27	免疫等级吸取
		IF ~~ THEN REPLY @508 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//28	每击20%概率击倒敌人（无豁免）一轮时间。（重复选取不累加）
		IF ~~ THEN REPLY @509 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//29	每击30%概率使敌人减速（无豁免）一轮时间。（重复选取不累加）
		IF ~~ THEN REPLY @510 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//30	免疫超度不死生物
		IF ~~ THEN REPLY @511 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability4	//31	致命一击时必定摧毁不死生物（无豁免）
		IF ~~ THEN REPLY @512 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//32	攻击附带15秒的中毒状态（无豁免），敌人中毒时每秒受到1点伤害
		IF ~~ THEN REPLY @513 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//33	背刺成功时必定使自身进入隐形状态
		IF ~Global("XPEXCHAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END

	IF ~~ THEN BEGIN abselect6
		SAY @30	//选择你希望交换得到的能力。
		IF ~~ THEN REPLY @601 GOTO giveability5	//1	每轮多攻击1/2次
		IF ~~ THEN REPLY @602 DO ~ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//2	免疫附魔等级+2的武器（不包括+2以下武器）
		IF ~~ THEN REPLY @603 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//3	所有物理抗力+10%
		IF ~~ THEN REPLY @604 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//4	所有豁免+2有利
		IF ~~ THEN REPLY @605 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//5	每击20%概率震慑敌人（无豁免）一轮时间。（重复选取不累加）
		IF ~~ THEN REPLY @606 DO ~ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability5	//6	每击解除魔法
		IF ~~ THEN REPLY @607 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//7	每击10%概率斩首（无豁免）。（重复选取不累加）
		IF ~~ THEN REPLY @608 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//8	每击使对手魔抗-5%且AC-1不利，持续1回合
		IF ~~ THEN REPLY @609 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//9	致命一击时必定将敌人斩首（无豁免）
		IF ~Global("XPEXCHAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END

	IF ~~ THEN BEGIN abselect7
		SAY @30	//选择你希望交换得到的能力。
		IF ~~ THEN REPLY @701 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability5	//11	获得万能巧手
		IF ~~ THEN REPLY @702 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//12	恒定高等加速状态
		IF ~~ THEN REPLY @703 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//13	免疫附魔等级+3的武器（不包括+3以下武器）
		IF ~~ THEN REPLY @704 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//14	施法（以及使用技能）无间隔
		IF ~~ THEN REPLY @705 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//15	免疫禁锢和迷宫
		IF ~~ THEN REPLY @706 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability5	//16	免疫时间停止
		IF ~~ THEN REPLY @707 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//17	施展的奥术效果持续时间变成三倍（重复选取不累加）
		IF ~~ THEN REPLY @708 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//18	施展的神术效果持续时间变成三倍（重复选取不累加）
		IF ~~ THEN REPLY @709 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//19	高度近视（只能看见2呎范围）
		IF ~Global("XPEXCHAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END

	IF ~~ THEN BEGIN abselect9
		SAY @29	//选择你希望掌握的武器类型。
		IF ~~ THEN REPLY @920 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	///40	棍棒
		IF ~~ THEN REPLY @901 DO ~ReallyForceSpellRES("XPEXCH01",Myself)~ GOTO giveability5	//21	巨剑
		IF ~~ THEN REPLY @902 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//22	长剑
		IF ~~ THEN REPLY @903 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//23	短剑
		IF ~~ THEN REPLY @904 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//24	战斧
		IF ~~ THEN REPLY @905 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//25	双手剑
		IF ~~ THEN REPLY @906 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability5	//26	武士刀
		IF ~~ THEN REPLY @907 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//27	弯刀
		IF ~~ THEN REPLY @908 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//28	匕首
		IF ~~ THEN REPLY @909 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//29	战锤
		IF ~~ THEN REPLY @910 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//30	长矛
		IF ~~ THEN REPLY @911 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability5	//31	战戟
		IF ~~ THEN REPLY @912 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//32	链枷
		IF ~~ THEN REPLY @913 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//33	钉头锤
		IF ~~ THEN REPLY @914 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//34	手杖
		IF ~~ THEN REPLY @915 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//35	十字弓
		IF ~~ THEN REPLY @916 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability5	//36	长弓
		IF ~~ THEN REPLY @917 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//37	短弓
		IF ~~ THEN REPLY @918 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//38	飞镖
		IF ~~ THEN REPLY @919 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	///39	投石索
		IF ~Global("XPEXCHAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	如果付出不一样的经验点数，可以交换其它技能吗？
		IF ~Global("XPEXCHAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	如果付出不一样的经验点数，可以交换其它技能吗？
	END

	IF ~~ THEN BEGIN giveability1
		SAY @31	//那好，我们来交换吧……
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0A",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0A",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0A",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0A",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0A",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0A",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1A",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1A",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1A",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1A",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1A",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1A",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
	END

	IF ~~ THEN BEGIN giveability2
		SAY @31	//那好，我们来交换吧……
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0B",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0B",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0B",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0B",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0B",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0B",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1B",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1B",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1B",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1B",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1B",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1B",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
	END

	IF ~~ THEN BEGIN giveability3
		SAY @31	//那好，我们来交换吧……
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0C",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0C",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0C",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0C",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0C",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0C",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1C",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1C",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1C",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1C",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1C",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1C",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
	END

	IF ~~ THEN BEGIN giveability4
		SAY @31	//那好，我们来交换吧……
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0D",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0D",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0D",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0D",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0D",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0D",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1D",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1D",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1D",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1D",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1D",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1D",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
	END

	IF ~~ THEN BEGIN giveability5
		SAY @31	//那好，我们来交换吧……
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0E",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0E",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0E",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0E",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0E",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~!NightmareModeOn() Global("XPEXCHAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH0E",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",1)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1E",Player1) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",2)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1E",Player2) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",3)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1E",Player3) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",4)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1E",Player4) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",5)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1E",Player5) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
		IF ~NightmareModeOn() Global("XPEXCHAR","LOCALS",6)~ THEN DO ~SetInterrupt(FALSE) SmallWait(2) ForceSpellRES("XPEXCH1E",Player6) ForceSpell(Myself,DRYAD_TELEPORT) DestroySelf()~ EXIT
	END

END
