//~%dlgname%~������Ը������Ը����������
//~%lvlimit%~Ϊ��Ϸ�������ȼ�
//�������޸ߣ��Ų�ģʽ�ж�Ҫ��+900w

//~%dlgname%~������Ը������Ը����������
//~%lvlimit%~Ϊ��Ϸ�������ȼ�
//�������޵ͣ��Ų�ģʽ�ж�Ҫ���+250w

EXTEND_BOTTOM ~%dlgname%~ 0
	IF ~~
	THEN REPLY @9 DO ~ReallyForceSpellRES("XPEXCH00",Myself)~ GOTO xpcheck0	//�����ṩһЩ�������������ҵĶ�Ա�þ���������н�����
END

/*��
XPEXCH00������ȼ���Ϊ1
XPEXCH01���ȼ�+20
XPEXCH02���ȼ�+5
XPEXCH03���ȼ�+1
XPEXCH0A-0EĿ��۳�����������
XPEXCH1A-1EΪ�Ͷ��Ų��Ѷ��¿۳����ྭ��
XPEXCHAR����Ϊ1-6��ʾ�Բ�ͬ��Ա
*/

APPEND ~%dlgname%~

	IF ~~ THEN BEGIN xpcheck0
		SAY @10	//����һλ������Ҫ���о����������������Ҫ��ϸ��������״����
		IF ~InMyArea(Player1)~ THEN REPLY @11 DO ~SetGlobal("XPEXCHAR","LOCALS",1)~ GOTO xpcheck1	//��<PLAYER1>��Ҫ���н�����
		IF ~InMyArea(Player2)~ THEN REPLY @12 DO ~SetGlobal("XPEXCHAR","LOCALS",2)~ GOTO xpcheck2	//��<PLAYER2>��Ҫ���н�����
		IF ~InMyArea(Player3)~ THEN REPLY @13 DO ~SetGlobal("XPEXCHAR","LOCALS",3)~ GOTO xpcheck3	//��<PLAYER3>��Ҫ���н�����
		IF ~InMyArea(Player4)~ THEN REPLY @14 DO ~SetGlobal("XPEXCHAR","LOCALS",4)~ GOTO xpcheck4	//��<PLAYER4>��Ҫ���н�����
		IF ~InMyArea(Player5)~ THEN REPLY @15 DO ~SetGlobal("XPEXCHAR","LOCALS",5)~ GOTO xpcheck5	//��<PLAYER5>��Ҫ���н�����
		IF ~InMyArea(Player6)~ THEN REPLY @16 DO ~SetGlobal("XPEXCHAR","LOCALS",6)~ GOTO xpcheck6	//��<PLAYER6>��Ҫ���н�����
		IF ~~ THEN REPLY @40 DO ~SetGlobal("XPEXCHAR","LOCALS",0)~ GOTO xpcheck9	//�Ҹı������ˣ��������ˡ�
	END

	IF ~~ THEN BEGIN xpcheck1
		SAY @17	//���ҿ�������
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
		!Class(Player1,SHAMAN)~ THEN GOTO xpcheck7	//���ǵ�һְҵ
		IF ~!NightmareModeOn() XPLT(Player1,1000000)~ THEN GOTO xpcheck8	//���鲻��
		IF ~NightmareModeOn() XPLT(Player1,1500000)~ THEN  GOTO xpcheck8	//���鲻��
	END

	IF ~~ THEN BEGIN xpcheck2
		SAY @17	//���ҿ�������
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
		!Class(Player2,SHAMAN)~ THEN GOTO xpcheck7	//���ǵ�һְҵ
		IF ~!NightmareModeOn() XPLT(Player2,1000000)~ THEN GOTO xpcheck8	//���鲻��
		IF ~NightmareModeOn() XPLT(Player2,1500000)~ THEN  GOTO xpcheck8	//���鲻��
	END

	IF ~~ THEN BEGIN xpcheck3
		SAY @17	//���ҿ�������
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
		!Class(Player3,SHAMAN)~ THEN GOTO xpcheck7	//���ǵ�һְҵ
		IF ~!NightmareModeOn() XPLT(Player3,1000000)~ THEN GOTO xpcheck8	//���鲻��
		IF ~NightmareModeOn() XPLT(Player3,1500000)~ THEN  GOTO xpcheck8	//���鲻��
	END

	IF ~~ THEN BEGIN xpcheck4
		SAY @17	//���ҿ�������
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
		!Class(Player4,SHAMAN)~ THEN GOTO xpcheck7	//���ǵ�һְҵ
		IF ~!NightmareModeOn() XPLT(Player4,1000000)~ THEN GOTO xpcheck8	//���鲻��
		IF ~NightmareModeOn() XPLT(Player4,1500000)~ THEN  GOTO xpcheck8	//���鲻��
	END

	IF ~~ THEN BEGIN xpcheck5
		SAY @17	//���ҿ�������
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
		!Class(Player5,SHAMAN)~ THEN GOTO xpcheck7	//���ǵ�һְҵ
		IF ~!NightmareModeOn() XPLT(Player5,1000000)~ THEN GOTO xpcheck8	//���鲻��
		IF ~NightmareModeOn() XPLT(Player5,1500000)~ THEN  GOTO xpcheck8	//���鲻��
	END

	IF ~~ THEN BEGIN xpcheck6
		SAY @17	//���ҿ�������
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
		!Class(Player6,SHAMAN)~ THEN GOTO xpcheck7	//���ǵ�һְҵ
		IF ~!NightmareModeOn() XPLT(Player6,1000000)~ THEN GOTO xpcheck8	//���鲻��
		IF ~NightmareModeOn() XPLT(Player6,1500000)~ THEN  GOTO xpcheck8	//���鲻��
	END

	IF ~~ THEN BEGIN xpcheck7
		SAY @18	//ֻ�е�һְҵ�߲��ܽ��н�������λ�����Ѿ�ѧ�ù��๻�����ˡ�
		IF ~~ DO ~SetGlobal("XPEXCHAR","LOCALS",0)~ GOTO xpcheck0
	END

	IF ~~ THEN BEGIN xpcheck8
		SAY @37	//���ź�����λ���˻��۵ľ��黹�����ḻ��
		IF ~~ DO ~SetGlobal("XPEXCHAR","LOCALS",0)~ GOTO xpcheck0
	END

	IF ~~ THEN BEGIN xpselect1
		SAY @20	//�ҿ��Ժ���λ���˽��н��ף������㸶�����پ��������
		IF ~!NightmareModeOn() !XPLT(Player1,1000000)~ THEN REPLY @21 GOTO abselect1	//һ����㡣
		IF ~!NightmareModeOn() !XPLT(Player1,1500000)~ THEN REPLY @22 GOTO abselect2	//һ����ʮ��㡣
		IF ~!NightmareModeOn() !XPLT(Player1,2000000)~ THEN REPLY @23 GOTO abselect3	//������㡣
		IF ~!NightmareModeOn() !XPLT(Player1,2500000)~ THEN REPLY @24 GOTO abselect4	//������ʮ��㡣
		IF ~!NightmareModeOn() !XPLT(Player1,3000000)~ THEN REPLY @25 GOTO abselect5	//������㡣
		IF ~!NightmareModeOn() !XPLT(Player1,4000000)~ THEN REPLY @26 GOTO abselect6	//�İ���㡣
		IF ~!NightmareModeOn() !XPLT(Player1,5000000)~ THEN REPLY @27 GOTO abselect7	//�����㡣
		IF ~NightmareModeOn() !XPLT(Player1,2500000)~ THEN REPLY @71 GOTO abselect1	//������ʮ��㡣
		IF ~NightmareModeOn() !XPLT(Player1,3750000)~ THEN REPLY @72 GOTO abselect2	//������ʮ����㡣
		IF ~NightmareModeOn() !XPLT(Player1,5000000)~ THEN REPLY @73 GOTO abselect3	//�����㡣
		IF ~NightmareModeOn() !XPLT(Player1,6250000)~ THEN REPLY @74 GOTO abselect4	//���ٶ�ʮ����㡣
		IF ~NightmareModeOn() !XPLT(Player1,7500000)~ THEN REPLY @75 GOTO abselect5	//�߰���ʮ��㡣
		IF ~NightmareModeOn() !XPLT(Player1,10000000)~ THEN REPLY @76 GOTO abselect6	//һǧ��㡣
		IF ~NightmareModeOn() !XPLT(Player1,12500000)~ THEN REPLY @77 GOTO abselect7	//һǧ������ʮ��㡣
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//���뻻һλ��Ա���н��ס�
	END

	IF ~~ THEN BEGIN xpselect2
		SAY @20	//�ҿ��Ժ���λ���˽��н��ף������㸶�����پ��������
		IF ~!NightmareModeOn() !XPLT(Player2,1000000)~ THEN REPLY @21 GOTO abselect1	//һ����㡣
		IF ~!NightmareModeOn() !XPLT(Player2,1500000)~ THEN REPLY @22 GOTO abselect2	//һ����ʮ��㡣
		IF ~!NightmareModeOn() !XPLT(Player2,2000000)~ THEN REPLY @23 GOTO abselect3	//������㡣
		IF ~!NightmareModeOn() !XPLT(Player2,2500000)~ THEN REPLY @24 GOTO abselect4	//������ʮ��㡣
		IF ~!NightmareModeOn() !XPLT(Player2,3000000)~ THEN REPLY @25 GOTO abselect5	//������㡣
		IF ~!NightmareModeOn() !XPLT(Player2,4000000)~ THEN REPLY @26 GOTO abselect6	//�İ���㡣
		IF ~!NightmareModeOn() !XPLT(Player2,5000000)~ THEN REPLY @27 GOTO abselect7	//�����㡣
		IF ~NightmareModeOn() !XPLT(Player2,2500000)~ THEN REPLY @71 GOTO abselect1	//������ʮ��㡣
		IF ~NightmareModeOn() !XPLT(Player2,3750000)~ THEN REPLY @72 GOTO abselect2	//������ʮ����㡣
		IF ~NightmareModeOn() !XPLT(Player2,5000000)~ THEN REPLY @73 GOTO abselect3	//�����㡣
		IF ~NightmareModeOn() !XPLT(Player2,6250000)~ THEN REPLY @74 GOTO abselect4	//���ٶ�ʮ����㡣
		IF ~NightmareModeOn() !XPLT(Player2,7500000)~ THEN REPLY @75 GOTO abselect5	//�߰���ʮ��㡣
		IF ~NightmareModeOn() !XPLT(Player2,10000000)~ THEN REPLY @76 GOTO abselect6	//һǧ��㡣
		IF ~NightmareModeOn() !XPLT(Player2,12500000)~ THEN REPLY @77 GOTO abselect7	//һǧ������ʮ��㡣
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//���뻻һλ��Ա���н��ס�
	END

	IF ~~ THEN BEGIN xpselect3
		SAY @20	//�ҿ��Ժ���λ���˽��н��ף������㸶�����پ��������
		IF ~!NightmareModeOn() !XPLT(Player3,1000000)~ THEN REPLY @21 GOTO abselect1	//һ����㡣
		IF ~!NightmareModeOn() !XPLT(Player3,1500000)~ THEN REPLY @22 GOTO abselect2	//һ����ʮ��㡣
		IF ~!NightmareModeOn() !XPLT(Player3,2000000)~ THEN REPLY @23 GOTO abselect3	//������㡣
		IF ~!NightmareModeOn() !XPLT(Player3,2500000)~ THEN REPLY @24 GOTO abselect4	//������ʮ��㡣
		IF ~!NightmareModeOn() !XPLT(Player3,3000000)~ THEN REPLY @25 GOTO abselect5	//������㡣
		IF ~!NightmareModeOn() !XPLT(Player3,4000000)~ THEN REPLY @26 GOTO abselect6	//�İ���㡣
		IF ~!NightmareModeOn() !XPLT(Player3,5000000)~ THEN REPLY @27 GOTO abselect7	//�����㡣
		IF ~NightmareModeOn() !XPLT(Player3,2500000)~ THEN REPLY @71 GOTO abselect1	//������ʮ��㡣
		IF ~NightmareModeOn() !XPLT(Player3,3750000)~ THEN REPLY @72 GOTO abselect2	//������ʮ����㡣
		IF ~NightmareModeOn() !XPLT(Player3,5000000)~ THEN REPLY @73 GOTO abselect3	//�����㡣
		IF ~NightmareModeOn() !XPLT(Player3,6250000)~ THEN REPLY @74 GOTO abselect4	//���ٶ�ʮ����㡣
		IF ~NightmareModeOn() !XPLT(Player3,7500000)~ THEN REPLY @75 GOTO abselect5	//�߰���ʮ��㡣
		IF ~NightmareModeOn() !XPLT(Player3,10000000)~ THEN REPLY @76 GOTO abselect6	//һǧ��㡣
		IF ~NightmareModeOn() !XPLT(Player3,12500000)~ THEN REPLY @77 GOTO abselect7	//һǧ������ʮ��㡣
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//���뻻һλ��Ա���н��ס�
	END

	IF ~~ THEN BEGIN xpselect4
		SAY @20	//�ҿ��Ժ���λ���˽��н��ף������㸶�����پ��������
		IF ~!NightmareModeOn() !XPLT(Player4,1000000)~ THEN REPLY @21 GOTO abselect1	//һ����㡣
		IF ~!NightmareModeOn() !XPLT(Player4,1500000)~ THEN REPLY @22 GOTO abselect2	//һ����ʮ��㡣
		IF ~!NightmareModeOn() !XPLT(Player4,2000000)~ THEN REPLY @23 GOTO abselect3	//������㡣
		IF ~!NightmareModeOn() !XPLT(Player4,2500000)~ THEN REPLY @24 GOTO abselect4	//������ʮ��㡣
		IF ~!NightmareModeOn() !XPLT(Player4,3000000)~ THEN REPLY @25 GOTO abselect5	//������㡣
		IF ~!NightmareModeOn() !XPLT(Player4,4000000)~ THEN REPLY @26 GOTO abselect6	//�İ���㡣
		IF ~!NightmareModeOn() !XPLT(Player4,5000000)~ THEN REPLY @27 GOTO abselect7	//�����㡣
		IF ~NightmareModeOn() !XPLT(Player4,2500000)~ THEN REPLY @71 GOTO abselect1	//������ʮ��㡣
		IF ~NightmareModeOn() !XPLT(Player4,3750000)~ THEN REPLY @72 GOTO abselect2	//������ʮ����㡣
		IF ~NightmareModeOn() !XPLT(Player4,5000000)~ THEN REPLY @73 GOTO abselect3	//�����㡣
		IF ~NightmareModeOn() !XPLT(Player4,6250000)~ THEN REPLY @74 GOTO abselect4	//���ٶ�ʮ����㡣
		IF ~NightmareModeOn() !XPLT(Player4,7500000)~ THEN REPLY @75 GOTO abselect5	//�߰���ʮ��㡣
		IF ~NightmareModeOn() !XPLT(Player4,10000000)~ THEN REPLY @76 GOTO abselect6	//һǧ��㡣
		IF ~NightmareModeOn() !XPLT(Player4,12500000)~ THEN REPLY @77 GOTO abselect7	//һǧ������ʮ��㡣
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//���뻻һλ��Ա���н��ס�
	END

	IF ~~ THEN BEGIN xpselect5
		SAY @20	//�ҿ��Ժ���λ���˽��н��ף������㸶�����پ��������
		IF ~!NightmareModeOn() !XPLT(Player5,1000000)~ THEN REPLY @21 GOTO abselect1	//һ����㡣
		IF ~!NightmareModeOn() !XPLT(Player5,1500000)~ THEN REPLY @22 GOTO abselect2	//һ����ʮ��㡣
		IF ~!NightmareModeOn() !XPLT(Player5,2000000)~ THEN REPLY @23 GOTO abselect3	//������㡣
		IF ~!NightmareModeOn() !XPLT(Player5,2500000)~ THEN REPLY @24 GOTO abselect4	//������ʮ��㡣
		IF ~!NightmareModeOn() !XPLT(Player5,3000000)~ THEN REPLY @25 GOTO abselect5	//������㡣
		IF ~!NightmareModeOn() !XPLT(Player5,4000000)~ THEN REPLY @26 GOTO abselect6	//�İ���㡣
		IF ~!NightmareModeOn() !XPLT(Player5,5000000)~ THEN REPLY @27 GOTO abselect7	//�����㡣
		IF ~NightmareModeOn() !XPLT(Player5,2500000)~ THEN REPLY @71 GOTO abselect1	//������ʮ��㡣
		IF ~NightmareModeOn() !XPLT(Player5,3750000)~ THEN REPLY @72 GOTO abselect2	//������ʮ����㡣
		IF ~NightmareModeOn() !XPLT(Player5,5000000)~ THEN REPLY @73 GOTO abselect3	//�����㡣
		IF ~NightmareModeOn() !XPLT(Player5,6250000)~ THEN REPLY @74 GOTO abselect4	//���ٶ�ʮ����㡣
		IF ~NightmareModeOn() !XPLT(Player5,7500000)~ THEN REPLY @75 GOTO abselect5	//�߰���ʮ��㡣
		IF ~NightmareModeOn() !XPLT(Player5,10000000)~ THEN REPLY @76 GOTO abselect6	//һǧ��㡣
		IF ~NightmareModeOn() !XPLT(Player5,12500000)~ THEN REPLY @77 GOTO abselect7	//һǧ������ʮ��㡣
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//���뻻һλ��Ա���н��ס�
	END

	IF ~~ THEN BEGIN xpselect6
		SAY @20	//�ҿ��Ժ���λ���˽��н��ף������㸶�����پ��������
		IF ~!NightmareModeOn() !XPLT(Player6,1000000)~ THEN REPLY @21 GOTO abselect1	//һ����㡣
		IF ~!NightmareModeOn() !XPLT(Player6,1500000)~ THEN REPLY @22 GOTO abselect2	//һ����ʮ��㡣
		IF ~!NightmareModeOn() !XPLT(Player6,2000000)~ THEN REPLY @23 GOTO abselect3	//������㡣
		IF ~!NightmareModeOn() !XPLT(Player6,2500000)~ THEN REPLY @24 GOTO abselect4	//������ʮ��㡣
		IF ~!NightmareModeOn() !XPLT(Player6,3000000)~ THEN REPLY @25 GOTO abselect5	//������㡣
		IF ~!NightmareModeOn() !XPLT(Player6,4000000)~ THEN REPLY @26 GOTO abselect6	//�İ���㡣
		IF ~!NightmareModeOn() !XPLT(Player6,5000000)~ THEN REPLY @27 GOTO abselect7	//�����㡣
		IF ~NightmareModeOn() !XPLT(Player6,2500000)~ THEN REPLY @71 GOTO abselect1	//������ʮ��㡣
		IF ~NightmareModeOn() !XPLT(Player6,3750000)~ THEN REPLY @72 GOTO abselect2	//������ʮ����㡣
		IF ~NightmareModeOn() !XPLT(Player6,5000000)~ THEN REPLY @73 GOTO abselect3	//�����㡣
		IF ~NightmareModeOn() !XPLT(Player6,6250000)~ THEN REPLY @74 GOTO abselect4	//���ٶ�ʮ����㡣
		IF ~NightmareModeOn() !XPLT(Player6,7500000)~ THEN REPLY @75 GOTO abselect5	//�߰���ʮ��㡣
		IF ~NightmareModeOn() !XPLT(Player6,10000000)~ THEN REPLY @76 GOTO abselect6	//һǧ��㡣
		IF ~NightmareModeOn() !XPLT(Player6,12500000)~ THEN REPLY @77 GOTO abselect7	//һǧ������ʮ��㡣
		IF ~~ THEN REPLY @39 GOTO xpcheck0	//���뻻һλ��Ա���н��ס�
	END

	IF ~~ THEN BEGIN xpcheck9
		SAY @38	//�ܺã�������뿪��
		IF ~~ THEN DO ~SetInterrupt(FALSE)
		ForceSpell(Myself,DRYAD_TELEPORT)
		SmallWait(1)
		DestroySelf()~ EXIT
	END

	IF ~~ THEN BEGIN abselect1
		SAY @30	//ѡ����ϣ�������õ���������
		IF ~~ THEN REPLY @101 GOTO giveability1	//1	AC+1����
		IF ~~ THEN REPLY @102 DO ~ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//2	�Իӿ�������AC+4����
		IF ~~ THEN REPLY @103 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//3	�Դ���������AC+4����
		IF ~~ THEN REPLY @104 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//4	�Զۻ�������AC+4����
		IF ~~ THEN REPLY @105 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//5	��Զ��������AC+4����
		IF ~~ THEN REPLY @106 DO ~ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability1	//6	���HP+10
		IF ~~ THEN REPLY @107 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//7	���濹��+20%
		IF ~~ THEN REPLY @108 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//8	���俹��+20%
		IF ~~ THEN REPLY @109 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//9	���翹��+20%
		IF ~~ THEN REPLY @110 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//10	ǿ�Ό��+20%
		IF ~~ THEN REPLY @111 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability1	//11	���ؿ���+20%
		IF ~~ THEN REPLY @112 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//12	ħ���˺�����+10%
		IF ~~ THEN REPLY @113 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//13	ÿ������1��HP�����ظ�ѡȡ���ۼӣ�
		IF ~~ THEN REPLY @114 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//14	�ƶ��ٶ�+2
		IF ~~ THEN REPLY @115 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//15	����+1����
		IF ~~ THEN REPLY @116 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability1	//16	�����˺�+1
		IF ~~ THEN REPLY @117 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//17	ͽ�ֹ���ʱ���к��˺�+1����
		IF ~~ THEN REPLY @118 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//18	����һ����������5%�����ظ�ѡȡ���ۼӣ�
		IF ~~ THEN REPLY @119 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//19	һ������λ+2
		IF ~~ THEN REPLY @120 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability1	//20	��������ʱ��-4
		IF ~Global("XPEXCHAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	���������һ���ľ�����������Խ�������������
	END

	IF ~~ THEN BEGIN abselect2
		SAY @30	//ѡ����ϣ�������õ���������
		IF ~~ THEN REPLY @201 GOTO giveability2	//1	��ɵĻӿ��˺�����10%
		IF ~~ THEN REPLY @202 DO ~ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//2	��ɵĴ����˺�����10%
		IF ~~ THEN REPLY @203 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//3	��ɵķ����˺�����10%
		IF ~~ THEN REPLY @204 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//4	��ɵ�Զ���˺�����10%
		IF ~~ THEN REPLY @205 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//5	��ɵĻ����˺�����10%
		IF ~~ THEN REPLY @206 DO ~ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability2	//6	��ɵĺ����˺�����10%
		IF ~~ THEN REPLY @207 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//7	��ɵ������˺�����10%
		IF ~~ THEN REPLY @208 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//8	��ɵ�ǿ���˺�����10%
		IF ~~ THEN REPLY @209 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//9	��ɵ�ħ�������˺�����10%
		IF ~~ THEN REPLY @210 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//10	��ɵĶ����˺�����10%
		IF ~~ THEN REPLY @211 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability2	//11	�����ж����������߶����˺���
		IF ~~ THEN REPLY @212 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//12	���߳�Ĭ�Ͷ���
		IF ~~ THEN REPLY @213 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//13	ÿ�ι�����ȡ2D4��HP
		IF ~~ THEN REPLY @214 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//14	ÿ����������20%ʩ��ʧ���ʣ����ۼӣ�������һ�غϡ����ظ�ѡȡ���ۼӣ�
		IF ~~ THEN REPLY @215 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//15	����һ��ʱʩչ������������Ч��������������-1�ҳٻ�������1�֡��޻��⣩
		IF ~~ THEN REPLY @216 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability2	//16	����AC��Ϊ0
		IF ~~ THEN REPLY @217 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//17	˫������������Ϊ2��
		IF ~~ THEN REPLY @218 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//18	��������������Ϊ2��
		IF ~~ THEN REPLY @219 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability2	//19	��������������Ϊ2��
		IF ~~ THEN REPLY @220 GOTO abselect9	//20	ѡ��һ�������������������
		IF ~Global("XPEXCHAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	���������һ���ľ�����������Խ�������������
	END

	IF ~~ THEN BEGIN abselect3
		SAY @30	//ѡ����ϣ�������õ���������
		IF ~~ THEN REPLY @301 GOTO giveability3	//1	�޷����
		IF ~~ THEN REPLY @302 DO ~ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//2	���߼��������Ǻ�Ŀä
		IF ~~ THEN REPLY @303 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//3	������ͨ����
		IF ~~ THEN REPLY @304 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//4	ħ������+10%
		IF ~~ THEN REPLY @305 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//5	����ħ������+20�����޷�ʦ��
		IF ~~ THEN REPLY @306 DO ~ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability3	//6	�������Ļ���+2����
		IF ~~ THEN REPLY @307 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//7	�Է��ȵĻ���+2����
		IF ~~ THEN REPLY @308 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//8	��ʯ��/���εĻ���+2����
		IF ~~ THEN REPLY @309 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//9	�����¹����Ļ���+2����
		IF ~~ THEN REPLY @310 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//10	�Է����Ļ���+2����
		IF ~~ THEN REPLY @311 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability3	//11	�ļ����弶����λ+1
		IF ~~ THEN REPLY @312 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//12	�ļ����弶����λ+1
		IF ~~ THEN REPLY @313 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//13	˫����������Ϊ3��
		IF ~~ THEN REPLY @314 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//14	����+1
		IF ~~ THEN REPLY @315 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//15	����+1
		IF ~~ THEN REPLY @316 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability3	//16	����+1
		IF ~~ THEN REPLY @317 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//17	����+1
		IF ~~ THEN REPLY @318 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//18	��֪+1
		IF ~~ THEN REPLY @319 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//19	����+1
		IF ~~ THEN REPLY @320 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//20	����һ��ʱ�ض������˻������޻��⣩һ��ʱ��
		IF ~~ THEN REPLY @321 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability3	//21	�Իӿ���������20%�ĵֿ���
		IF ~~ THEN REPLY @322 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//22	�Զۻ���������20%�ĵֿ���
		IF ~~ THEN REPLY @323 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//23	�Դ�����������20%�ĵֿ���
		IF ~~ THEN REPLY @324 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability3	//24	��Զ����������20%�ĵֿ���
		IF ~Global("XPEXCHAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	���������һ���ľ�����������Խ�������������
	END

	IF ~~ THEN BEGIN abselect4
		SAY @30	//ѡ����ϣ�������õ���������
		IF ~~ THEN REPLY @401 GOTO giveability4	//1	���߸��澫��״̬��Ӱ�죬�����Ȼ󡢿��ơ��־塢ʿ���������񱩡�����ͻ���
		IF ~~ THEN REPLY @402 DO ~ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//2	����Ԫ�ؿ�����������ᶾ������+10%
		IF ~~ THEN REPLY @403 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//3	����+1�����ظ�ѡȡ���ۼӣ�
		IF ~~ THEN REPLY @404 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//4	������ף����Ӱ�졣���ظ�ѡȡ���ۼӣ�
		IF ~~ THEN REPLY @405 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//5	������������Ӱ�졣���ظ�ѡȡ���ۼӣ�
		IF ~~ THEN REPLY @406 DO ~ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability4	//6	�������������˺���1D3��
		IF ~~ THEN REPLY @407 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//7	�������������˺���1D3��
		IF ~~ THEN REPLY @408 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//8	�������߼�����λ+1
		IF ~~ THEN REPLY @409 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//9	�������߼�����λ+1
		IF ~~ THEN REPLY @410 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//10	�㶨����״̬
		IF ~~ THEN REPLY @411 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability4	//11	ʩ���ٶ�+1
		IF ~~ THEN REPLY @412 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//12	���̱���+1
		IF ~~ THEN REPLY @413 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//13	����һ��ʱ�ض���������壨�޻��⣩һ��ʱ��
		IF ~~ THEN REPLY @414 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//14	���̳ɹ�ʱ�²ж��֣�����Ч�����ٻ�����Ѫ����������-2����������1�غϡ��޻��⣩
		IF ~Global("XPEXCHAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	���������һ���ľ�����������Խ�������������
	END

	IF ~~ THEN BEGIN abselect5
		SAY @30	//ѡ����ϣ�������õ���������
		IF ~~ THEN REPLY @501 DO ~ReallyForceSpellRES("XPEXCH01",Myself)~ GOTO giveability4	//21	���߼���������ʯ�������������һָ��Ů��֮���ȷ����ļ���Ч��
		IF ~~ THEN REPLY @502 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//22	����Ӱ���ƶ��ĸ���Ч�����������������塢�������ơ�����������
		IF ~~ THEN REPLY @503 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//23	�˼��;ż�����λ+1
		IF ~~ THEN REPLY @504 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//24	������Ϊ��ȡ���Զ����������类��������ʳ����
		IF ~~ THEN REPLY @505 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//25	���߸�ħ�ȼ�+1����������������ͨ������
		IF ~~ THEN REPLY @506 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability4	//26	���߱���
		IF ~~ THEN REPLY @507 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//27	���ߵȼ���ȡ
		IF ~~ THEN REPLY @508 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//28	ÿ��20%���ʻ������ˣ��޻��⣩һ��ʱ�䡣���ظ�ѡȡ���ۼӣ�
		IF ~~ THEN REPLY @509 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//29	ÿ��30%����ʹ���˼��٣��޻��⣩һ��ʱ�䡣���ظ�ѡȡ���ۼӣ�
		IF ~~ THEN REPLY @510 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//30	���߳��Ȳ�������
		IF ~~ THEN REPLY @511 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability4	//31	����һ��ʱ�ض��ݻٲ�������޻��⣩
		IF ~~ THEN REPLY @512 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//32	��������15����ж�״̬���޻��⣩�������ж�ʱÿ���ܵ�1���˺�
		IF ~~ THEN REPLY @513 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability4	//33	���̳ɹ�ʱ�ض�ʹ�����������״̬
		IF ~Global("XPEXCHAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	���������һ���ľ�����������Խ�������������
	END

	IF ~~ THEN BEGIN abselect6
		SAY @30	//ѡ����ϣ�������õ���������
		IF ~~ THEN REPLY @601 GOTO giveability5	//1	ÿ�ֶ๥��1/2��
		IF ~~ THEN REPLY @602 DO ~ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//2	���߸�ħ�ȼ�+2��������������+2����������
		IF ~~ THEN REPLY @603 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//3	����������+10%
		IF ~~ THEN REPLY @604 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//4	���л���+2����
		IF ~~ THEN REPLY @605 DO ~ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//5	ÿ��20%����������ˣ��޻��⣩һ��ʱ�䡣���ظ�ѡȡ���ۼӣ�
		IF ~~ THEN REPLY @606 DO ~ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability5	//6	ÿ�����ħ��
		IF ~~ THEN REPLY @607 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//7	ÿ��10%����ն�ף��޻��⣩�����ظ�ѡȡ���ۼӣ�
		IF ~~ THEN REPLY @608 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//8	ÿ��ʹ����ħ��-5%��AC-1����������1�غ�
		IF ~~ THEN REPLY @609 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//9	����һ��ʱ�ض�������ն�ף��޻��⣩
		IF ~Global("XPEXCHAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	���������һ���ľ�����������Խ�������������
	END

	IF ~~ THEN BEGIN abselect7
		SAY @30	//ѡ����ϣ�������õ���������
		IF ~~ THEN REPLY @701 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability5	//11	�����������
		IF ~~ THEN REPLY @702 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//12	�㶨�ߵȼ���״̬
		IF ~~ THEN REPLY @703 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//13	���߸�ħ�ȼ�+3��������������+3����������
		IF ~~ THEN REPLY @704 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//14	ʩ�����Լ�ʹ�ü��ܣ��޼��
		IF ~~ THEN REPLY @705 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//15	���߽������Թ�
		IF ~~ THEN REPLY @706 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability5	//16	����ʱ��ֹͣ
		IF ~~ THEN REPLY @707 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//17	ʩչ�İ���Ч������ʱ�����������ظ�ѡȡ���ۼӣ�
		IF ~~ THEN REPLY @708 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//18	ʩչ������Ч������ʱ�����������ظ�ѡȡ���ۼӣ�
		IF ~~ THEN REPLY @709 DO ~ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//19	�߶Ƚ��ӣ�ֻ�ܿ���2�շ�Χ��
		IF ~Global("XPEXCHAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	���������һ���ľ�����������Խ�������������
	END

	IF ~~ THEN BEGIN abselect9
		SAY @29	//ѡ����ϣ�����յ��������͡�
		IF ~~ THEN REPLY @920 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	///40	����
		IF ~~ THEN REPLY @901 DO ~ReallyForceSpellRES("XPEXCH01",Myself)~ GOTO giveability5	//21	�޽�
		IF ~~ THEN REPLY @902 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//22	����
		IF ~~ THEN REPLY @903 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//23	�̽�
		IF ~~ THEN REPLY @904 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//24	ս��
		IF ~~ THEN REPLY @905 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//25	˫�ֽ�
		IF ~~ THEN REPLY @906 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability5	//26	��ʿ��
		IF ~~ THEN REPLY @907 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//27	�䵶
		IF ~~ THEN REPLY @908 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//28	ذ��
		IF ~~ THEN REPLY @909 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//29	ս��
		IF ~~ THEN REPLY @910 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//30	��ì
		IF ~~ THEN REPLY @911 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability5	//31	ս�
		IF ~~ THEN REPLY @912 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//32	����
		IF ~~ THEN REPLY @913 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//33	��ͷ��
		IF ~~ THEN REPLY @914 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//34	����
		IF ~~ THEN REPLY @915 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//35	ʮ�ֹ�
		IF ~~ THEN REPLY @916 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)~ GOTO giveability5	//36	����
		IF ~~ THEN REPLY @917 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//37	�̹�
		IF ~~ THEN REPLY @918 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	//38	����
		IF ~~ THEN REPLY @919 DO ~ReallyForceSpellRES("XPEXCH01",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH02",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)
		ReallyForceSpellRES("XPEXCH03",Myself)~ GOTO giveability5	///39	Ͷʯ��
		IF ~Global("XPEXCHAR","LOCALS",1)~ THEN REPLY @28 GOTO xpselect1	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",2)~ THEN REPLY @28 GOTO xpselect2	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",3)~ THEN REPLY @28 GOTO xpselect3	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",4)~ THEN REPLY @28 GOTO xpselect4	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",5)~ THEN REPLY @28 GOTO xpselect5	//	���������һ���ľ�����������Խ�������������
		IF ~Global("XPEXCHAR","LOCALS",6)~ THEN REPLY @28 GOTO xpselect6	//	���������һ���ľ�����������Խ�������������
	END

	IF ~~ THEN BEGIN giveability1
		SAY @31	//�Ǻã������������ɡ���
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
		SAY @31	//�Ǻã������������ɡ���
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
		SAY @31	//�Ǻã������������ɡ���
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
		SAY @31	//�Ǻã������������ɡ���
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
		SAY @31	//�Ǻã������������ɡ���
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
