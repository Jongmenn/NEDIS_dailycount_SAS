/*SAS �ڷ� ������ ���� */
libname a'D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outdata';

/* ���� ���̺� 
PTMIEMAR	    �����Ƿ�������(�ñ����ڵ�)            ->E_SGG
PTMIEMNM	    �����Ƿ�����                                 ->HOSPT
PTMIINDT     	��������                                           ->E_DATE
PTMIBRTD	    ����                                                 ->AGE_GROUP
PTMISEXX	    ����                                                 ->SEX
PTMIGUCD   	ȯ���ּ���(�ñ����ڵ�)                      ->P_SGG ** (�ַ� ���߱�) 
PTMIAKDT    	�ߺ�����                                           ->DATE  
DGOTDIAG	   "��������ڵ� (�ִ� 20�������� ����)"  ->DIS_A
DGOTDGGB 	������ܱ���                                     ->DIS_B
DGDCDIAG	   "��������ڵ� (���޽� ������ ���)"      ->DIS_E_A
DGDCDGGB 	������ܱ���(���޽� ������ ���)"       ->DIS_E_B
*/

/*****************************************************************************************/
/*****************************************************************************************/

/*�����ڷ� MERGE �� ���� ���� */
DATA A.NEDIS; SET A.NEDIS1415 A.NEDIS16 A.NEDIS17 A.NEDIS18 A.NEDIS19;

RENAME PTMIEMAR=E_SGG PTMIEMNM=HOSPT PTMIINDT=E_DATE PTMIBRTD=AGE_GROUP PTMISEXX=SEX PTMIGUCD=P_SGG PTMIAKDT=DATE
/*���޽� ��� ���� �ڵ� */
DGOTDIAG01=DIS_A01    DGOTDGGB01=DIS_B01 
DGOTDIAG02=DIS_A02    DGOTDGGB02=DIS_B02
DGOTDIAG03=DIS_A03    DGOTDGGB03=DIS_B03
DGOTDIAG04=DIS_A04    DGOTDGGB04=DIS_B04
DGOTDIAG05=DIS_A05    DGOTDGGB05=DIS_B05
DGOTDIAG06=DIS_A06    DGOTDGGB06=DIS_B06
DGOTDIAG07=DIS_A07    DGOTDGGB07=DIS_B07
DGOTDIAG08=DIS_A08    DGOTDGGB08=DIS_B08
DGOTDIAG09=DIS_A09    DGOTDGGB09=DIS_B09
DGOTDIAG10=DIS_A10    DGOTDGGB10=DIS_B10
DGOTDIAG11=DIS_A11    DGOTDGGB11=DIS_B11
DGOTDIAG12=DIS_A12    DGOTDGGB12=DIS_B12
DGOTDIAG13=DIS_A13    DGOTDGGB13=DIS_B13
DGOTDIAG14=DIS_A14    DGOTDGGB14=DIS_B14
DGOTDIAG15=DIS_A15    DGOTDGGB15=DIS_B15
DGOTDIAG16=DIS_A16    DGOTDGGB16=DIS_B16
DGOTDIAG17=DIS_A17    DGOTDGGB17=DIS_B17
DGOTDIAG18=DIS_A18    DGOTDGGB18=DIS_B18
DGOTDIAG19=DIS_A19    DGOTDGGB19=DIS_B19
DGOTDIAG20=DIS_A20    DGOTDGGB20=DIS_B20

/*���޽� ��� ���� �ڵ� */
DGDCDIAG01=DIS_E_A01 DGDCDGGB01=DIS_E_B01
DGDCDIAG02=DIS_E_A02 DGDCDGGB02=DIS_E_B02
DGDCDIAG03=DIS_E_A03 DGDCDGGB03=DIS_E_B03
DGDCDIAG04=DIS_E_A04 DGDCDGGB04=DIS_E_B04
DGDCDIAG05=DIS_E_A05 DGDCDGGB05=DIS_E_B05
DGDCDIAG06=DIS_E_A06 DGDCDGGB06=DIS_E_B06
DGDCDIAG07=DIS_E_A07 DGDCDGGB07=DIS_E_B07
DGDCDIAG08=DIS_E_A08 DGDCDGGB08=DIS_E_B08
DGDCDIAG09=DIS_E_A09 DGDCDGGB09=DIS_E_B09
DGDCDIAG10=DIS_E_A10 DGDCDGGB10=DIS_E_B10
DGDCDIAG11=DIS_E_A11 DGDCDGGB11=DIS_E_B11
DGDCDIAG12=DIS_E_A12 DGDCDGGB12=DIS_E_B12
DGDCDIAG13=DIS_E_A13 DGDCDGGB13=DIS_E_B13
DGDCDIAG14=DIS_E_A14 DGDCDGGB14=DIS_E_B14
DGDCDIAG15=DIS_E_A15 DGDCDGGB15=DIS_E_B15
DGDCDIAG16=DIS_E_A16 DGDCDGGB16=DIS_E_B16
DGDCDIAG17=DIS_E_A17 DGDCDGGB17=DIS_E_B17
DGDCDIAG18=DIS_E_A18 DGDCDGGB18=DIS_E_B18
DGDCDIAG19=DIS_E_A19 DGDCDGGB19=DIS_E_B19
DGDCDIAG20=DIS_E_A20 DGDCDGGB20=DIS_E_B20
;

/*�õ� ���� �߰� */
SIDO =SUBSTR(left(PTMIEMAR),1,2);

/*���޽�(����) �湮����� */
E_YR   =SUBSTR(LEFT(PTMIINDT),1,4);
E_MON=SUBSTR(LEFT(PTMIINDT),5,2);
E_DAY =SUBSTR(LEFT(PTMIINDT),7,2);

/*�ߺ����� (���޽� �湮�� ���� ���� �� ����) */
YR   =SUBSTR(LEFT(PTMIAKDT),1,4);
MON=SUBSTR(LEFT(PTMIAKDT),5,2);
DAY  =SUBSTR(LEFT(PTMIAKDT),7,2);
RUN;

/*****************************************************************************************/
/*****************************************************************************************/

/*������� �ڵ� 20�� ���� */
PROC FREQ DATA=A.NEDIS; TABLES DIS_A01-DIS_A20 ;RUN;
/*������� �ڵ� 20�� ���� */
PROC FREQ DATA=A.NEDIS; TABLES DIS_E_A01-DIS_E_A20 ; RUN;


/*NEDIS �ڷ� ���¶� ���缭 ���� �׷� */
/*������ Ŭ���� �� �ڷ� ���� */
DATA A.NEDIS_R; SET A.NEDIS;
IF P_SGG="." THEN SGG=E_SGG; ELSE SGG=P_SGG; /*ȯ���� ������ ���� ���� ���� ���޽� ���� �������� �־��ֱ� (���з� ������ ������)*/
IF P_SGG="." THEN SGG_TF=1; ELSE SGG_TF=0;       /*ȯ���� ������ ���� ���� ���� 1, �����ϸ� 0*/
SIDO_R= SUBSTR(LEFT(SGG),1,2);                          /*���� ������ �ñ����� �ش��ϴ� �õ� �ڷ�� ����*/

/*���� �׷� �ڷ� ����� */
/*5�� ������ ���� �׷� */
IF AGE_GROUP <=2  THEN AG=1;     /*0-4��*/
IF AGE_GROUP =3    THEN AG=2;     /*5-9��*/
IF AGE_GROUP =4    THEN AG=3;     /*10-14��*/
IF AGE_GROUP =5    THEN AG=4;     /*15-19��*/
IF AGE_GROUP =6    THEN AG=5;     /*20-24��*/
IF AGE_GROUP =7    THEN AG=6;     /*25-29��*/
IF AGE_GROUP =8    THEN AG=7;     /*30-34��*/
IF AGE_GROUP =9    THEN AG=8;     /*35-39��*/
IF AGE_GROUP =10  THEN AG=9;     /*40-44��*/
IF AGE_GROUP =11  THEN AG=10;   /*45-49��*/
IF AGE_GROUP =12  THEN AG=11;   /*50-54��*/
IF AGE_GROUP =13  THEN AG=12;   /*55-59��*/
IF AGE_GROUP =14  THEN AG=13;   /*60-64��*/
IF AGE_GROUP =15  THEN AG=14;   /*65-69��*/
IF AGE_GROUP =16  THEN AG=15;   /*70-74��*/
IF AGE_GROUP =17  THEN AG=16;   /*75-79��*/
IF AGE_GROUP =18  THEN AG=17;   /*80-84��*/
IF AGE_GROUP>=19 THEN AG=18;   /*85+ */

/*15�� �̸�, 15-64�� ,65�� �̻� */
IF AGE_GROUP <=4 THEN AG2=1; 
IF AGE_GROUP >=5 & AGE_GROUP <=14 THEN AG2=2;
IF AGE_GROUP >=15 THEN AG2=3;
RUN;

PROC FREQ DATA=A.DAT; TABLES AGE_GROUP/LIST; RUN;

/*****************************************************************************************/
/*****************************************************************************************/
/*�õ�, �ñ��� ���̺� �ڷ� �ҷ��ͼ� �����ϱ� */
PROC IMPORT OUT=A.SGG DATAFILE="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\�ñ����ڵ�.CSV" DBMS=CSV REPLACE; RUN;
PROC IMPORT OUT=A.SIDO DATAFILE="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\�õ��ڵ�.CSV" DBMS=CSV REPLACE; RUN;

/*�õ��ڷ� �Ӽ� ���� */
DATA A.SIDO; SET A.SIDO;
SIDO_R=INPUT(SIDO,$12.);
DROP SIDO;
RUN;

/*NEDIS�ڷ�� �ñ���, �õ� �ڷ� ���� (�ѱ� ���̺�)*/
PROC SQL; CREATE TABLE A.NEDIS_R2 AS SELECT * FROM A.NEDIS_R AS A LEFT JOIN A.SGG AS B ON A.SGG=B.SGG; QUIT;

PROC SQL; CREATE TABLE A.NEDIS_R2 AS SELECT * FROM A.NEDIS_R2 AS A LEFT JOIN A.SIDO AS B ON A.SIDO_R =B.SIDO_R;QUIT;

/*****************************************************************************************/
/*****************************************************************************************/

/*��¥ �ڷ� ���� �Ǽ� �ڷ� missing�� �� ���� ä��� ����  */
DATA A.DDATE ; 
FORMAT DATE YYMMDD10.;
DO I = 1 to 2191 BY 1;       
DATE=MDY(01,01,2014)+I-1; /* �ݺ������� ��¥ ����� 2014�� 1�� 1�Ϻ��� 2019�� 12�� 31�� ���� */
OUTPUT;
END;
DROP I;
RUN;
DATA A.DDATE; SET A.DDATE;
DATE2= PUT(DATE,YYMMDDN8.);RUN; /*��¥ -> ���ڷ� ���� ���� */

/*������ ������ ���ؿ��� ��¥ �ڷ�� �õ� �ڷ� MERGE�ϱ� (�̶� CROSS JOIN)*/
proc sql; create table a.SIDODATE as select * from a.ddate cross join  a.SIDO; quit;

/*KEY�� �� ����� KEY=��¥+�ñ���  (��¥�� �ñ��� ���պ� ���� ���, 3652�� * 250 =913000) */
DATA a.SIDOdate; SET a.SIDOdate; KEY=COMPRESS(DATE2)||("-")||COMPRESS(SIDO_R); KEEP KEY SIDO_KR; RUN;


/*ǥ�� �ű涧 ���� �̸� ������ֱ� */
data a.null_tb; 
Options obs=max;
input category$ Y_2014 Y_2015 Y_2016 Y_2017 Y_2018 Y_2019;

CARDS;
"" "" "" "" "" "" "" 
;
RUN;

/*****************************************************************************************/
/*****************************************************************************************/

/*disease: ������
 s_code: �������� ���ڵ� �� ù��°,
 e_code: �������� ���ڵ� �� ������,
 k: ���ڵ� �ڸ��� ���� (3�ܻ��̸� 3, 4�ܻ��̸� 4)*/

%MACRO DISEASE_COUNT(DISEASE,S_CODE,E_CODE,K);
DATA A.DAT ;  SET A.NEDIS_R2;
FORMAT E_DDATE YYMMDD10. ;

/*�ش� ��ȯ ICD �ڵ� ���� */
/*��� ���� �ڵ� */
IF 
SUBSTR(DIS_A01,1,&K.)>=&S_CODE. & SUBSTR(DIS_A01,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A02,1,&K.)>=&S_CODE. & SUBSTR(DIS_A02,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A03,1,&K.)>=&S_CODE. & SUBSTR(DIS_A03,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A04,1,&K.)>=&S_CODE. & SUBSTR(DIS_A04,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A05,1,&K.)>=&S_CODE. & SUBSTR(DIS_A05,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A06,1,&K.)>=&S_CODE. & SUBSTR(DIS_A06,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A07,1,&K.)>=&S_CODE. & SUBSTR(DIS_A07,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A08,1,&K.)>=&S_CODE. & SUBSTR(DIS_A08,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A09,1,&K.)>=&S_CODE. & SUBSTR(DIS_A09,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A10,1,&K.)>=&S_CODE. & SUBSTR(DIS_A10,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A11,1,&K.)>=&S_CODE. & SUBSTR(DIS_A11,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A12,1,&K.)>=&S_CODE. & SUBSTR(DIS_A12,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A13,1,&K.)>=&S_CODE. & SUBSTR(DIS_A13,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A14,1,&K.)>=&S_CODE. & SUBSTR(DIS_A14,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A15,1,&K.)>=&S_CODE. & SUBSTR(DIS_A15,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A16,1,&K.)>=&S_CODE. & SUBSTR(DIS_A16,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A17,1,&K.)>=&S_CODE. & SUBSTR(DIS_A17,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A18,1,&K.)>=&S_CODE. & SUBSTR(DIS_A18,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A19,1,&K.)>=&S_CODE. & SUBSTR(DIS_A19,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_A20,1,&K.)>=&S_CODE. & SUBSTR(DIS_A20,1,&K.)<=&E_CODE. OR

/*��� ���� �ڵ� */
SUBSTR(DIS_E_A01,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A01,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A02,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A02,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A03,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A03,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A04,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A04,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A05,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A05,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A06,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A06,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A07,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A07,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A08,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A08,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A09,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A09,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A10,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A10,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A11,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A11,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A12,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A12,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A13,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A13,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A14,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A14,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A15,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A15,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A16,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A16,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A17,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A17,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A18,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A18,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A19,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A19,1,&K.)<=&E_CODE. OR
SUBSTR(DIS_E_A20,1,&K.)>=&S_CODE. & SUBSTR(DIS_E_A20,1,&K.)<=&E_CODE. ;

/*���޽� �������� ��¥ ����  */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP HOSPT DIS_B01-DIS_B20 DIS_E_B01-DIS_E_B20 SGG_TF ;
RUN;

/*������ ���� */
PROC SORT DATA=A.DAT; BY E_DDATE SIDO_R AG; RUN;

/*���� ī��Ʈ �������� ������ */
DATA A.DAT ;SET A.DAT;

/*��ü */
TOT=1; 

/*����*/
IF SEX="M" THEN MALE=1; ELSE MALE=0;
IF SEX="F" THEN FEMALE=1; ELSE FEMALE=0;

/*���� �̻� ���� */
IF AGE_GROUP ^=""; 

/*���� �׷캰, 5�� ���� */
IF AG=1   THEN AG01=1; ELSE AG01=0; /*0-4��*/
IF AG=2   THEN AG02=1; ELSE AG02=0; /*5-9��*/
IF AG=3   THEN AG03=1; ELSE AG03=0; /*10-14��*/
IF AG=4   THEN AG04=1; ELSE AG04=0; /*15-19��*/
IF AG=5   THEN AG05=1; ELSE AG05=0; /*20-24��*/
IF AG=6   THEN AG06=1; ELSE AG06=0; /*25-29��*/
IF AG=7   THEN AG07=1; ELSE AG07=0; /*30-34��*/
IF AG=8   THEN AG08=1; ELSE AG08=0; /*35-39��*/
IF AG=9   THEN AG09=1; ELSE AG09=0; /*40-44��*/
IF AG=10 THEN AG10=1; ELSE AG10=0; /*45-49��*/
IF AG=11 THEN AG11=1; ELSE AG11=0; /*50-54��*/
IF AG=12 THEN AG12=1; ELSE AG12=0; /*55-59��*/
IF AG=13 THEN AG13=1; ELSE AG13=0; /*60-64��*/
IF AG=14 THEN AG14=1; ELSE AG14=0; /*65-69��*/
IF AG=15 THEN AG15=1; ELSE AG15=0; /*70-74��*/
IF AG=16 THEN AG16=1; ELSE AG16=0; /*75-79��*/
IF AG=17 THEN AG17=1; ELSE AG17=0; /*80-84��*/
IF AG=18 THEN AG18=1; ELSE AG18=0; /*85��+   */

/*���� �׷� 5��, 15-64, 65�� �̻�*/
IF AG2=1 THEN AG2_01=1; ELSE AG2_01=0;
IF AG2=2 THEN AG2_02=1; ELSE AG2_02=0;
IF AG2=3 THEN AG2_03=1; ELSE AG2_03=0;

/*�� ���� ���� 1*/
IF SEX="M" & AG=1   THEN M_AG01=1; ELSE M_AG01=0; /*0-4�� & ���� */
IF SEX="M" & AG=2   THEN M_AG02=1; ELSE M_AG02=0; /*5-9�� & ���� */
IF SEX="M" & AG=3   THEN M_AG03=1; ELSE M_AG03=0; /*10-14�� & ���� */
IF SEX="M" & AG=4   THEN M_AG04=1; ELSE M_AG04=0; /*15-19�� & ���� */
IF SEX="M" & AG=5   THEN M_AG05=1; ELSE M_AG05=0; /*20-24�� & ���� */
IF SEX="M" & AG=6   THEN M_AG06=1; ELSE M_AG06=0; /*25-29�� & ���� */
IF SEX="M" & AG=7   THEN M_AG07=1; ELSE M_AG07=0; /*30-34�� & ���� */
IF SEX="M" & AG=8   THEN M_AG08=1; ELSE M_AG08=0; /*35-39�� & ���� */
IF SEX="M" & AG=9   THEN M_AG09=1; ELSE M_AG09=0; /*40-44�� & ���� */
IF SEX="M" & AG=10 THEN M_AG10=1; ELSE M_AG10=0; /*45-49�� & ���� */
IF SEX="M" & AG=11 THEN M_AG11=1; ELSE M_AG11=0; /*50-54�� & ���� */
IF SEX="M" & AG=12 THEN M_AG12=1; ELSE M_AG12=0; /*55-59�� & ���� */
IF SEX="M" & AG=13 THEN M_AG13=1; ELSE M_AG13=0; /*60-64�� & ���� */
IF SEX="M" & AG=14 THEN M_AG14=1; ELSE M_AG14=0; /*65-69�� & ���� */
IF SEX="M" & AG=15 THEN M_AG15=1; ELSE M_AG15=0; /*70-74�� & ���� */
IF SEX="M" & AG=16 THEN M_AG16=1; ELSE M_AG16=0; /*75-79�� & ���� */
IF SEX="M" & AG=17 THEN M_AG17=1; ELSE M_AG17=0; /*80-84�� & ���� */ 
IF SEX="M" & AG=18 THEN M_AG18=1; ELSE M_AG18=0; /*85�� �̻� & ���� */

IF SEX="F" & AG=1   THEN F_AG01=1; ELSE F_AG01=0; /*0-4�� & ���� */
IF SEX="F" & AG=2   THEN F_AG02=1; ELSE F_AG02=0; /*5-9�� & ���� */
IF SEX="F" & AG=3   THEN F_AG03=1; ELSE F_AG03=0; /*10-14�� & ���� */
IF SEX="F" & AG=4   THEN F_AG04=1; ELSE F_AG04=0; /*15-19�� & ���� */
IF SEX="F" & AG=5   THEN F_AG05=1; ELSE F_AG05=0; /*20-24�� & ���� */
IF SEX="F" & AG=6   THEN F_AG06=1; ELSE F_AG06=0; /*25-29�� & ���� */
IF SEX="F" & AG=7   THEN F_AG07=1; ELSE F_AG07=0; /*30-34�� & ���� */
IF SEX="F" & AG=8   THEN F_AG08=1; ELSE F_AG08=0; /*35-39�� & ���� */
IF SEX="F" & AG=9   THEN F_AG09=1; ELSE F_AG09=0; /*40-44�� & ���� */
IF SEX="F" & AG=10 THEN F_AG10=1; ELSE F_AG10=0; /*45-49�� & ���� */
IF SEX="F" & AG=11 THEN F_AG11=1; ELSE F_AG11=0; /*50-54�� & ���� */
IF SEX="F" & AG=12 THEN F_AG12=1; ELSE F_AG12=0; /*55-59�� & ���� */
IF SEX="F" & AG=13 THEN F_AG13=1; ELSE F_AG13=0; /*60-64�� & ���� */
IF SEX="F" & AG=14 THEN F_AG14=1; ELSE F_AG14=0; /*65-69�� & ���� */
IF SEX="F" & AG=15 THEN F_AG15=1; ELSE F_AG15=0; /*70-74�� & ���� */
IF SEX="F" & AG=16 THEN F_AG16=1; ELSE F_AG16=0; /*75-79�� & ���� */
IF SEX="F" & AG=17 THEN F_AG17=1; ELSE F_AG17=0; /*80-84�� & ���� */ 
IF SEX="F" & AG=18 THEN F_AG18=1; ELSE F_AG18=0; /*85�� �̻� & ���� */

/*�� ���� ���� 2*/
IF SEX="M" & AG2=1   THEN M_AG2_01=1; ELSE M_AG2_01=0; /*0-4�� & ���� */
IF SEX="M" & AG2=2   THEN M_AG2_02=1; ELSE M_AG2_02=0; /*15-64�� & ���� */
IF SEX="M" & AG2=3   THEN M_AG2_03=1; ELSE M_AG2_03=0; /*65���̻� & ���� */

IF SEX="F" & AG2=1   THEN F_AG2_01=1; ELSE F_AG2_01=0; /*0-4�� & ���� */
IF SEX="F" & AG2=2   THEN F_AG2_02=1; ELSE F_AG2_02=0; /*15-64�� & ���� */
IF SEX="F" & AG2=3   THEN F_AG2_03=1; ELSE F_AG2_03=0; /*65���̻� & ���� */

/*��¥��+�õ� key */
KEY=COMPRESS(E_DATE)||("-")||COMPRESS(SIDO_R); 
RUN;

/*���� �׸񺰷� ���ϸ� ī��Ʈ ���� */
PROC SQL;CREATE TABLE A.TOT AS SELECT KEY, 
/*��ü*/
SUM(TOT) AS TOT, 

/*����*/
SUM(MALE) AS MALE, SUM(FEMALE) AS FEMALE,

/*���� �׷� 5���� */
SUM(AG01) AS AG01, SUM(AG02) AS AG02,  SUM(AG03) AS AG03,  SUM(AG04) AS AG04, 
SUM(AG05) AS AG05, SUM(AG06) AS AG06,  SUM(AG07) AS AG07,  SUM(AG08) AS AG08, 
SUM(AG09) AS AG09, SUM(AG10) AS AG10,  SUM(AG11) AS AG11,  SUM(AG12) AS AG12, 
SUM(AG13) AS AG13, SUM(AG14) AS AG14,  SUM(AG15) AS AG15,  SUM(AG16) AS AG16, 
SUM(AG17) AS AG17, SUM(AG18) AS AG18, 

/*���� �׷� 5�� �̸�, 15-64�� 65�� �̻�*/
SUM(AG2_01) AS AG2_01, SUM(AG2_02) AS AG2_02,  SUM(AG2_03) AS AG2_03, 

/*���� ���� �׷캰 5������ */
SUM(M_AG01) AS M_AG01, SUM(M_AG02) AS M_AG02,  SUM(M_AG03) AS M_AG03,  SUM(M_AG04) AS M_AG04, 
SUM(M_AG05) AS M_AG05, SUM(M_AG06) AS M_AG06,  SUM(M_AG07) AS M_AG07,  SUM(M_AG08) AS M_AG08, 
SUM(M_AG09) AS M_AG09, SUM(M_AG10) AS M_AG10,  SUM(M_AG11) AS M_AG11,  SUM(M_AG12) AS M_AG12, 
SUM(M_AG13) AS M_AG13, SUM(M_AG14) AS M_AG14,  SUM(M_AG15) AS M_AG15,  SUM(M_AG16) AS M_AG16, 
SUM(M_AG17) AS M_AG17, SUM(M_AG18) AS M_AG18, 

/*���� ���� �׷캰 5�� ����*/
SUM(F_AG01) AS F_AG01, SUM(F_AG02) AS F_AG02,  SUM(F_AG03) AS F_AG03,  SUM(F_AG04) AS F_AG04, 
SUM(F_AG05) AS F_AG05, SUM(F_AG06) AS F_AG06,  SUM(F_AG07) AS F_AG07,  SUM(F_AG08) AS F_AG08, 
SUM(F_AG09) AS F_AG09, SUM(F_AG10) AS F_AG10,  SUM(F_AG11) AS F_AG11,  SUM(F_AG12) AS F_AG12, 
SUM(F_AG13) AS F_AG13, SUM(F_AG14) AS F_AG14,  SUM(F_AG15) AS F_AG15,  SUM(F_AG16) AS F_AG16, 
SUM(F_AG17) AS F_AG17, SUM(F_AG18) AS F_AG18, 

/*���� ���� �׷캰 5�� �̸�, 15-64��, 65�� �̻�  */
SUM(M_AG2_01) AS M_AG2_01, SUM(M_AG2_02) AS M_AG2_02,  SUM(M_AG2_03) AS M_AG2_03, 
/*���� ���� �׷캰 5�� �̸�, 15-64��, 65�� �̻�  */
SUM(F_AG2_01) AS F_AG2_01, SUM(F_AG2_02) AS F_AG2_02,  SUM(F_AG2_03) AS F_AG2_03 FROM

A.DAT GROUP BY KEY ;QUIT;

/*��¥�ڷ�� ī��Ʈ �ڷ� ���� */
PROC SQL; CREATE TABLE A.TOT_final as select * from a.sidodate as a left join a.tot as b on a.key=b.key; quit;

/*���� �ڷ� ����*/
DATA A.&DISEASE._Dailycount; 

/*������ ���� ���� */
RETAIN DATE YEAR MONTH DAY  SIDO SIDO_KR &DISEASE. &DISEASE._M &DISEASE._F &DISEASE._AG01-&DISEASE._AG18 &DISEASE._AG2_01-&DISEASE._AG2_03 
&DISEASE._M_AG01-&DISEASE._M_AG18 &DISEASE._F_AG01-&DISEASE._F_AG18 &DISEASE._M_AG2_01-&DISEASE._M_AG2_03 &DISEASE._F_AG2_01-&DISEASE._F_AG2_03;

LENGTH YEAR $4. MONTH $2. DAY $2. SIDO $2.;

SET A.TOT_FINAL;

/*���̺�� ��ũ�θ� ���缭 ���� */
RENAME TOT=&DISEASE. MALE=&DISEASE._M FEMALE=&DISEASE._F 

AG01-AG18=&DISEASE._AG01-&DISEASE._AG18

AG2_01-AG2_03 =&DISEASE._AG2_01-&DISEASE._AG2_03

M_AG01-M_AG18=&DISEASE._M_AG01-&DISEASE._M_AG18
F_AG01-F_AG18  =&DISEASE._F_AG01-&DISEASE._F_AG18

M_AG2_01-M_AG2_03=&DISEASE._M_AG2_01-&DISEASE._M_AG2_03
F_AG2_01-F_AG2_03  =&DISEASE._F_AG2_01-&DISEASE._F_AG2_03
;

/*��¥�� �õ� ���� ���� */
DATE=CAT(SUBSTR(KEY,1,4),"-",SUBSTR(KEY,5,2),"-",SUBSTR(KEY,7,2));
YEAR=SUBSTR(DATE,1,4);
MONTH=SUBSTR(DATE,6,2);
DAY=SUBSTR(DATE,9,2);

SIDO=SUBSTR(KEY,10,2);

/* MISSING�γ����� 0���� �޲��ֱ� */
IF TOT       ="." THEN TOT       =0; IF MALE     ="." THEN MALE     =0; IF FEMALE  ="." THEN FEMALE =0;

IF AG01      ="." THEN AG01     =0; IF AG02     ="." THEN AG02      =0; IF AG03     ="." THEN AG03      =0;
IF AG04     ="." THEN AG04      =0; IF AG05     ="." THEN AG05      =0; IF AG06     ="." THEN AG06      =0;
IF AG07     ="." THEN AG07      =0; IF AG08     ="." THEN AG08      =0; IF AG09     ="." THEN AG09      =0;
IF AG10     ="." THEN AG10      =0; IF AG11     ="." THEN AG11      =0; IF AG12     ="." THEN AG12      =0;
IF AG13     ="." THEN AG13      =0; IF AG14     ="." THEN AG14      =0; IF AG15     ="." THEN AG15      =0;
IF AG16     ="." THEN AG16      =0; IF AG17     ="." THEN AG17      =0; IF AG18     ="." THEN AG18      =0;

IF AG2_01   ="." THEN AG2_01  =0;  IF AG2_02   ="." THEN AG2_02  =0;  IF AG2_03   ="." THEN AG2_03  =0;
IF M_AG01   ="." THEN M_AG01 =0; IF M_AG02   ="." THEN M_AG02 =0; IF M_AG03   ="." THEN M_AG03 =0;
IF M_AG04   ="." THEN M_AG04 =0; IF M_AG05   ="." THEN M_AG05 =0; IF M_AG06   ="." THEN M_AG06 =0;
IF M_AG07   ="." THEN M_AG07 =0; IF M_AG08   ="." THEN M_AG08 =0; IF M_AG09   ="." THEN M_AG09 =0;
IF M_AG10   ="." THEN M_AG10 =0; IF M_AG11   ="." THEN M_AG11 =0; IF M_AG12   ="." THEN M_AG12 =0;
IF M_AG13   ="." THEN M_AG13 =0; IF M_AG14   ="." THEN M_AG14 =0; IF M_AG15   ="." THEN M_AG15 =0;
IF M_AG16   ="." THEN M_AG16 =0; IF M_AG17   ="." THEN M_AG17 =0; IF M_AG18   ="." THEN M_AG18 =0;

IF F_AG01   ="." THEN F_AG01  =0;  IF F_AG02   ="." THEN F_AG02  =0;  IF F_AG03   ="." THEN F_AG03  =0;
IF F_AG04   ="." THEN F_AG04  =0;  IF F_AG05   ="." THEN F_AG05  =0;  IF F_AG06   ="." THEN F_AG06  =0;
IF F_AG07   ="." THEN F_AG07  =0;  IF F_AG08   ="." THEN F_AG08  =0;  IF F_AG09   ="." THEN F_AG09  =0; 
IF F_AG10   ="." THEN F_AG10  =0;  IF F_AG11   ="." THEN F_AG11  =0;  IF F_AG12   ="." THEN F_AG12  =0;
IF F_AG13   ="." THEN F_AG13  =0;  IF F_AG14   ="." THEN F_AG14  =0;  IF F_AG15   ="." THEN F_AG15  =0;
IF F_AG16   ="." THEN F_AG16  =0;  IF F_AG17   ="." THEN F_AG17  =0;  IF F_AG18   ="." THEN F_AG18  =0;

IF M_AG2_01 ="." THEN M_AG2_01=0; IF M_AG2_02 ="." THEN M_AG2_02=0; IF M_AG2_03 ="." THEN M_AG2_03=0;
IF F_AG2_01 ="." THEN F_AG2_01=0;   IF F_AG2_02 ="." THEN F_AG2_02=0;   IF F_AG2_03 ="." THEN F_AG2_03=0;

DROP KEY;
RUN;

/*�ڷ� ����*/
PROC SORT DATA=A.&DISEASE._Dailycount; BY SIDO DATE ; RUN;

/*ī�װ����� ���� (��ü, ����, ����, �õ���)*/
PROC SQL; 
/*������ */
CREATE TABLE A.Z AS SELECT YEAR, 
SUM(&DISEASE.) AS TOT,  SUM(&DISEASE._M) AS MALE, SUM(&DISEASE._F) AS FEMALE,
SUM(&DISEASE._AG01) AS AG01, SUM(&DISEASE._AG02) AS AG02,
SUM(&DISEASE._AG03) AS AG03, SUM(&DISEASE._AG04) AS AG04,
SUM(&DISEASE._AG05) AS AG05, SUM(&DISEASE._AG06) AS AG06,
SUM(&DISEASE._AG07) AS AG07, SUM(&DISEASE._AG08) AS AG08,
SUM(&DISEASE._AG09) AS AG09, SUM(&DISEASE._AG10) AS AG10,
SUM(&DISEASE._AG11) AS AG11, SUM(&DISEASE._AG12) AS AG12,
SUM(&DISEASE._AG13) AS AG13, SUM(&DISEASE._AG14) AS AG14,
SUM(&DISEASE._AG15) AS AG15, SUM(&DISEASE._AG16) AS AG16,
SUM(&DISEASE._AG17) AS AG17, SUM(&DISEASE._AG18) AS AG18 
FROM A.&DISEASE._DAILYCOUNT GROUP BY YEAR; QUIT;

Options firstobs=1 obs=max;
PROC TRANSPOSE DATA=A.Z PREFIX=Y_ OUT=A.Z_T;
ID YEAR; RUN;
/*label ����*/
data a.z_t; set a.z_t; rename _name_=category; run;

/*���̺� ���� */
DATA A.Z_T1; OPTIONS FIRSTOBS=1 OBS=1 ; SET A.Z_T; RUN; /*��ü*/
DATA A.Z_T2; OPTIONS FIRSTOBS=2 OBS=3 ; SET A.Z_T; RUN; /*����*/
DATA A.Z_T3; OPTIONS FIRSTOBS=4 OBS=21; SET A.Z_T; RUN; /*���� �׷캰*/

Options firstobs=1 obs=max;

/*������ �õ� �հ� */
PROC SQL;  CREATE TABLE A.Z2 AS SELECT YEAR, SIDO, SUM(&DISEASE.) AS TOT FROM A.&DISEASE._DAILYCOUNT GROUP BY YEAR, SIDO; QUIT;

/*���̺� ��ġ, ��ġ �� ���� */
PROC SORT DATA=A.Z2; BY SIDO;
PROC TRANSPOSE DATA=A.Z2 PREFIX=Y_ OUT=A.Z_T4;
BY SIDO; ID YEAR; 
RUN;

data a.z_t4; set a.z_t4;
rename sido=category;
drop _name_; 
run;

/*������ ���� �հ� */
PROC SQL;  CREATE TABLE A.Z3 AS SELECT YEAR, month, SUM(&DISEASE.) AS TOT FROM A.&DISEASE._DAILYCOUNT GROUP BY YEAR, month; QUIT;

/*���̺� ��ġ, ��ġ �� ���� */
PROC SORT DATA=A.Z3; BY month;run;
PROC TRANSPOSE DATA=A.Z3 PREFIX=Y_ OUT=A.Z_T5;
BY month; ID YEAR; 
RUN;

data A.Z_T5; set A.Z_T5;
rename month=category;
drop _name_; 
run;

data a.&disease._table; set a.z_t1 a.null_tb  a.z_t2 a.null_tb a.z_t3 a.null_tb a.z_t4 a.null_tb a.z_t5 ; 
IF CATEGORY='""' THEN CATEGORY="."; run;

%MEND;


/*��ũ�� ���� */
/*3�� �� */
%DISEASE_COUNT(circ                   ,"I00","I99",K=3);     /*��ȯ��� ��ü (��ü ������) I00-I99*/
%DISEASE_COUNT(ischHD              ,"I20","I25",K=3);    /*������ ����ȯ I20-I25*/
%DISEASE_COUNT(angina              ,"I20","I20",K=3);    /*������ I20*/
%DISEASE_COUNT(MI                     ,"I21","I25",K=3);    /*�ɱٰ�� I21-I25*/
%DISEASE_COUNT(resp                 ,"J00","J99",K=3);   /*ȣ���� ��ü  J00-J99*/
%DISEASE_COUNT(acuteup            ,"J00","J06",K=3);  /*�޼� ��⵵���� J00-J06*/
%DISEASE_COUNT(pneum              ,"J09","J18",K=3);  /*���÷翣�� �� ��� J09-J18*/
%DISEASE_COUNT(acutelow           ,"J20","J22",K=3);  /*�޼� �Ϻ�ȣ��Ⱘ�� J20-J22*/
%DISEASE_COUNT(copd                 ,"J40","J44",K=3);  /*������⼺����ȯ J40-J44*/
%DISEASE_COUNT(asthma             ,"J45","J46",K=3);  /*õ�� J45-J46*/
%DISEASE_COUNT(heat                  ,"T67","T67",K=3); /*��°�����ȯ T67*/
%DISEASE_COUNT(voldep               ,"E86","E86",K=3); /*������Ż�� E86*/
%DISEASE_COUNT(frost                   ,"T33","T35",K=3); /*���� T33-T35*/
%DISEASE_COUNT(hypothermia      ,"T68","T68",K=3); /*��ü���� T68*/
%DISEASE_COUNT(otherredutemp   ,"T69","T69",K=3); /*�񵿰� �� ��Ÿ (Other effects of reduced temperature) T69*/
%DISEASE_COUNT(aki                      ,"N17","N17",K=3); /*�޼� �żջ� N17*/
%DISEASE_COUNT(kidney                ,"N00","N29",K=3); /*������ȯ N00-N29*/
%DISEASE_COUNT(dm                     ,"E10","E14",K=3); /*�索 E10-E14*/
%DISEASE_COUNT(mental                ,"F31","F39",K=3); /*����� F31-F39*/
%DISEASE_COUNT(suicide               ,"X60","X84",K=3); /*�ڻ����, ������ ���� X60-X84*/
%DISEASE_COUNT(intestinal_infec   ,"A00","A09",K=3); /*�尨�� A00-A09*/
%DISEASE_COUNT(cholera              ,"A00","A00",K=3);    /*�ݷ��� A00*/
%DISEASE_COUNT(typhoid_para      ,"A01","A01",K=3); /*��ƼǪ�� �� �Ķ�ƼǪ�� A01*/
%DISEASE_COUNT(othersalmone     ,"A02","A02",K=3); /*��Ÿ ���ڶ󰨿� A02*/
%DISEASE_COUNT(shigellosis          ,"A03","A03",K=3); /*�ðֶ��� A03*/
%DISEASE_COUNT(otherbac             ,"A04","A04",K=3); /*��Ÿ ���ռ� �尨�� A04*/
%DISEASE_COUNT(otherbac_food    ,"A05","A05",K=3); /*�޸� �з����� ���� ��Ÿ ���ռ� ���� �Ű��ߵ� A05*/
%DISEASE_COUNT(amoebiasis        ,"A06","A06",K=3); /*�Ƹ޹��� A06*/
%DISEASE_COUNT(otherprotozoal    ,"A07","A07",K=3); /*��Ÿ ���漺 ����ȯ A07*/
%DISEASE_COUNT(viral_intestinal     ,"A08","A08",K=3); /*���̷����� �� ��Ÿ ��õ� �尨�� A08*/
%DISEASE_COUNT(othergast_coli     ,"A09","A09",K=3); /*������ �� �󼼺Ҹ� ����� ��Ÿ ���忰 �� ���忰 A09*/
%DISEASE_COUNT(zoster                 ,"B02","B02",K=3); /*������� B02*/
%DISEASE_COUNT(vasomotor_allerg,"J30","J30",K=3); /*�ɰ���, ������� �� �ٷ����� �� J30*/

/*4�� �� */
%DISEASE_COUNT(TIA                  ,"G458","G458",K=4); /*�ϰ��� ������ ������ G458-G459*/
%DISEASE_COUNT(tsutsugamushi,"A753","A753",K=4); /*������ ���갡����  A753*/


/*****************************************************************************************/
/*****************************************************************************************/
/*��ȯ�ڵ尡 ���������� �ʰ� ���� �ִ� ���  */

/*��������ȯ ��ü I60-I67, I690-I694,G458-G459 */
DATA A.cerebvas ;  SET A.NEDIS_R2;
FORMAT E_DDATE YYMMDD10. ;

/*�ش� ��ȯ ICD �ڵ� ���� */
/*��� ���� �ڵ� */
IF 
SUBSTR(DIS_A01,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A01,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A02,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A02,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A03,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A03,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A04,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A04,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A05,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A05,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A06,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A06,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A07,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A07,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A08,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A08,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A09,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A09,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A10,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A10,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A11,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A11,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A12,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A12,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A13,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A13,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A14,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A14,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A15,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A15,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A16,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A16,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A17,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A17,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A18,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A18,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A19,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A19,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_A20,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_A20,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR

/*��� ���� �ڵ� */
SUBSTR(DIS_E_A01,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A01,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A02,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A02,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A03,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A03,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A04,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A04,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A05,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A05,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A06,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A06,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A07,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A07,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A08,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A08,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A09,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A09,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A10,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A10,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A11,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A11,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A12,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A12,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A13,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A13,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A14,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A14,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A15,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A15,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A16,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A16,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A17,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A17,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A18,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A18,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A19,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A19,1,4) IN ("I690","I691","I692","I693","I694","G458","G459") OR
SUBSTR(DIS_E_A20,1,3) IN ("I60","I61","I62","I63","I64","I65","I66","I67") OR SUBSTR(DIS_E_A20,1,4) IN ("I690","I691","I692","I693","I694","G458","G459")  ;

/*���޽� �������� ��¥ ����  */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP HOSPT DIS_B01-DIS_B20 DIS_E_B01-DIS_E_B20 SGG_TF ;
RUN;


/*������ ������ I60-I62, I690-I692*/
DATA A.hemoStroke ;   SET A.NEDIS_R2;
FORMAT E_DDATE YYMMDD10. ;

/*�ش� ��ȯ ICD �ڵ� ���� */
/*��� ���� �ڵ� */
IF 
SUBSTR(DIS_A01,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A01,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A02,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A02,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A03,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A03,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A04,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A04,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A05,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A05,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A06,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A06,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A07,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A07,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A08,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A08,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A09,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A09,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A10,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A10,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A11,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A11,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A12,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A12,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A13,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A13,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A14,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A14,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A15,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A15,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A16,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A16,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A17,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A17,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A18,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A18,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A19,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A19,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_A20,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_A20,1,4) IN ("I690","I691","I692") OR

/*��� ���� �ڵ� */
SUBSTR(DIS_E_A01,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A01,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A02,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A02,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A03,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A03,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A04,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A04,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A05,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A05,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A06,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A06,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A07,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A07,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A08,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A08,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A09,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A09,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A10,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A10,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A11,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A11,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A12,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A12,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A13,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A13,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A14,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A14,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A15,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A15,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A16,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A16,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A17,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A17,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A18,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A18,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A19,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A19,1,4) IN ("I690","I691","I692") OR
SUBSTR(DIS_E_A20,1,3) IN ("I60","I61","I62") OR SUBSTR(DIS_E_A20,1,4) IN ("I690","I691","I692")  ;

/*���޽� �������� ��¥ ����  */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP HOSPT DIS_B01-DIS_B20 DIS_E_B01-DIS_E_B20 SGG_TF ;
RUN;


/*������ ������ I63, I65-I67, I693*/
DATA A.ischStroke ;   SET A.NEDIS_R2;
FORMAT E_DDATE YYMMDD10. ;

/*�ش� ��ȯ ICD �ڵ� ���� */
/*��� ���� �ڵ� */
IF 
SUBSTR(DIS_A01,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A01,1,4) IN ("I693") OR
SUBSTR(DIS_A02,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A02,1,4) IN ("I693") OR
SUBSTR(DIS_A03,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A03,1,4) IN ("I693") OR
SUBSTR(DIS_A04,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A04,1,4) IN ("I693") OR
SUBSTR(DIS_A05,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A05,1,4) IN ("I693") OR
SUBSTR(DIS_A06,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A06,1,4) IN ("I693") OR
SUBSTR(DIS_A07,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A07,1,4) IN ("I693") OR
SUBSTR(DIS_A08,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A08,1,4) IN ("I693") OR
SUBSTR(DIS_A09,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A09,1,4) IN ("I693") OR
SUBSTR(DIS_A10,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A10,1,4) IN ("I693") OR
SUBSTR(DIS_A11,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A11,1,4) IN ("I693") OR
SUBSTR(DIS_A12,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A12,1,4) IN ("I693") OR
SUBSTR(DIS_A13,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A13,1,4) IN ("I693") OR
SUBSTR(DIS_A14,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A14,1,4) IN ("I693") OR
SUBSTR(DIS_A15,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A15,1,4) IN ("I693") OR
SUBSTR(DIS_A16,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A16,1,4) IN ("I693") OR
SUBSTR(DIS_A17,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A17,1,4) IN ("I693") OR
SUBSTR(DIS_A18,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A18,1,4) IN ("I693") OR
SUBSTR(DIS_A19,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A19,1,4) IN ("I693") OR
SUBSTR(DIS_A20,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_A20,1,4) IN ("I693") OR

/*��� ���� �ڵ� */
SUBSTR(DIS_E_A01,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A01,1,4) IN ("I693") OR
SUBSTR(DIS_E_A02,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A02,1,4) IN ("I693") OR
SUBSTR(DIS_E_A03,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A03,1,4) IN ("I693") OR
SUBSTR(DIS_E_A04,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A04,1,4) IN ("I693") OR
SUBSTR(DIS_E_A05,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A05,1,4) IN ("I693") OR
SUBSTR(DIS_E_A06,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A06,1,4) IN ("I693") OR
SUBSTR(DIS_E_A07,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A07,1,4) IN ("I693") OR
SUBSTR(DIS_E_A08,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A08,1,4) IN ("I693") OR
SUBSTR(DIS_E_A09,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A09,1,4) IN ("I693") OR
SUBSTR(DIS_E_A10,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A10,1,4) IN ("I693") OR
SUBSTR(DIS_E_A11,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A11,1,4) IN ("I693") OR
SUBSTR(DIS_E_A12,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A12,1,4) IN ("I693") OR
SUBSTR(DIS_E_A13,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A13,1,4) IN ("I693") OR
SUBSTR(DIS_E_A14,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A14,1,4) IN ("I693") OR
SUBSTR(DIS_E_A15,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A15,1,4) IN ("I693") OR
SUBSTR(DIS_E_A16,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A16,1,4) IN ("I693") OR
SUBSTR(DIS_E_A17,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A17,1,4) IN ("I693") OR
SUBSTR(DIS_E_A18,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A18,1,4) IN ("I693") OR
SUBSTR(DIS_E_A19,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A19,1,4) IN ("I693") OR
SUBSTR(DIS_E_A20,1,3) IN ("I63","I65","I66","I67") OR SUBSTR(DIS_E_A20,1,4) IN ("I693")  ;

/*���޽� �������� ��¥ ����  */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP HOSPT DIS_B01-DIS_B20 DIS_E_B01-DIS_E_B20 SGG_TF ;
RUN;

/*��Ÿ ������ I64, I694*/
DATA A.otherStroke ;   SET A.NEDIS_R2;
FORMAT E_DDATE YYMMDD10. ;

/*�ش� ��ȯ ICD �ڵ� ���� */
/*��� ���� �ڵ� */
IF 
SUBSTR(DIS_A01,1,3) IN ("I64") OR SUBSTR(DIS_A01,1,4) IN ("I694") OR
SUBSTR(DIS_A02,1,3) IN ("I64") OR SUBSTR(DIS_A02,1,4) IN ("I694") OR
SUBSTR(DIS_A03,1,3) IN ("I64") OR SUBSTR(DIS_A03,1,4) IN ("I694") OR
SUBSTR(DIS_A04,1,3) IN ("I64") OR SUBSTR(DIS_A04,1,4) IN ("I694") OR
SUBSTR(DIS_A05,1,3) IN ("I64") OR SUBSTR(DIS_A05,1,4) IN ("I694") OR
SUBSTR(DIS_A06,1,3) IN ("I64") OR SUBSTR(DIS_A06,1,4) IN ("I694") OR
SUBSTR(DIS_A07,1,3) IN ("I64") OR SUBSTR(DIS_A07,1,4) IN ("I694") OR
SUBSTR(DIS_A08,1,3) IN ("I64") OR SUBSTR(DIS_A08,1,4) IN ("I694") OR
SUBSTR(DIS_A09,1,3) IN ("I64") OR SUBSTR(DIS_A09,1,4) IN ("I694") OR
SUBSTR(DIS_A10,1,3) IN ("I64") OR SUBSTR(DIS_A10,1,4) IN ("I694") OR
SUBSTR(DIS_A11,1,3) IN ("I64") OR SUBSTR(DIS_A11,1,4) IN ("I694") OR
SUBSTR(DIS_A12,1,3) IN ("I64") OR SUBSTR(DIS_A12,1,4) IN ("I694") OR
SUBSTR(DIS_A13,1,3) IN ("I64") OR SUBSTR(DIS_A13,1,4) IN ("I694") OR
SUBSTR(DIS_A14,1,3) IN ("I64") OR SUBSTR(DIS_A14,1,4) IN ("I694") OR
SUBSTR(DIS_A15,1,3) IN ("I64") OR SUBSTR(DIS_A15,1,4) IN ("I694") OR
SUBSTR(DIS_A16,1,3) IN ("I64") OR SUBSTR(DIS_A16,1,4) IN ("I694") OR
SUBSTR(DIS_A17,1,3) IN ("I64") OR SUBSTR(DIS_A17,1,4) IN ("I694") OR
SUBSTR(DIS_A18,1,3) IN ("I64") OR SUBSTR(DIS_A18,1,4) IN ("I694") OR
SUBSTR(DIS_A19,1,3) IN ("I64") OR SUBSTR(DIS_A19,1,4) IN ("I694") OR
SUBSTR(DIS_A20,1,3) IN ("I64") OR SUBSTR(DIS_A20,1,4) IN ("I694") OR

/*��� ���� �ڵ� */
SUBSTR(DIS_E_A01,1,3) IN ("I64") OR SUBSTR(DIS_E_A01,1,4) IN ("I694") OR
SUBSTR(DIS_E_A02,1,3) IN ("I64") OR SUBSTR(DIS_E_A02,1,4) IN ("I694") OR
SUBSTR(DIS_E_A03,1,3) IN ("I64") OR SUBSTR(DIS_E_A03,1,4) IN ("I694") OR
SUBSTR(DIS_E_A04,1,3) IN ("I64") OR SUBSTR(DIS_E_A04,1,4) IN ("I694") OR
SUBSTR(DIS_E_A05,1,3) IN ("I64") OR SUBSTR(DIS_E_A05,1,4) IN ("I694") OR
SUBSTR(DIS_E_A06,1,3) IN ("I64") OR SUBSTR(DIS_E_A06,1,4) IN ("I694") OR
SUBSTR(DIS_E_A07,1,3) IN ("I64") OR SUBSTR(DIS_E_A07,1,4) IN ("I694") OR
SUBSTR(DIS_E_A08,1,3) IN ("I64") OR SUBSTR(DIS_E_A08,1,4) IN ("I694") OR
SUBSTR(DIS_E_A09,1,3) IN ("I64") OR SUBSTR(DIS_E_A09,1,4) IN ("I694") OR
SUBSTR(DIS_E_A10,1,3) IN ("I64") OR SUBSTR(DIS_E_A10,1,4) IN ("I694") OR
SUBSTR(DIS_E_A11,1,3) IN ("I64") OR SUBSTR(DIS_E_A11,1,4) IN ("I694") OR
SUBSTR(DIS_E_A12,1,3) IN ("I64") OR SUBSTR(DIS_E_A12,1,4) IN ("I694") OR
SUBSTR(DIS_E_A13,1,3) IN ("I64") OR SUBSTR(DIS_E_A13,1,4) IN ("I694") OR
SUBSTR(DIS_E_A14,1,3) IN ("I64") OR SUBSTR(DIS_E_A14,1,4) IN ("I694") OR
SUBSTR(DIS_E_A15,1,3) IN ("I64") OR SUBSTR(DIS_E_A15,1,4) IN ("I694") OR
SUBSTR(DIS_E_A16,1,3) IN ("I64") OR SUBSTR(DIS_E_A16,1,4) IN ("I694") OR
SUBSTR(DIS_E_A17,1,3) IN ("I64") OR SUBSTR(DIS_E_A17,1,4) IN ("I694") OR
SUBSTR(DIS_E_A18,1,3) IN ("I64") OR SUBSTR(DIS_E_A18,1,4) IN ("I694") OR
SUBSTR(DIS_E_A19,1,3) IN ("I64") OR SUBSTR(DIS_E_A19,1,4) IN ("I694") OR
SUBSTR(DIS_E_A20,1,3) IN ("I64") OR SUBSTR(DIS_E_A20,1,4) IN ("I694")  ;

/*���޽� �������� ��¥ ����  */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP HOSPT DIS_B01-DIS_B20 DIS_E_B01-DIS_E_B20 SGG_TF ;
RUN;

/*�¿���ȯ ���� E86,T67*/
DATA A.heatrelated ;    SET A.NEDIS_R2;
FORMAT E_DDATE YYMMDD10. ;

/*�ش� ��ȯ ICD �ڵ� ���� */
/*��� ���� �ڵ� */
IF 
SUBSTR(DIS_A01,1,3) IN ("E86","T67") OR 
SUBSTR(DIS_A02,1,3) IN ("E86","T67") OR 
SUBSTR(DIS_A03,1,3) IN ("E86","T67") OR 
SUBSTR(DIS_A04,1,3) IN ("E86","T67") OR 
SUBSTR(DIS_A05,1,3) IN ("E86","T67") OR
SUBSTR(DIS_A06,1,3) IN ("E86","T67") OR 
SUBSTR(DIS_A07,1,3) IN ("E86","T67") OR 
SUBSTR(DIS_A08,1,3) IN ("E86","T67") OR 
SUBSTR(DIS_A09,1,3) IN ("E86","T67") OR 
SUBSTR(DIS_A10,1,3) IN ("E86","T67") OR 
SUBSTR(DIS_A11,1,3) IN ("E86","T67") OR 
SUBSTR(DIS_A12,1,3) IN ("E86","T67") OR
SUBSTR(DIS_A13,1,3) IN ("E86","T67") OR 
SUBSTR(DIS_A14,1,3) IN ("E86","T67") OR 
SUBSTR(DIS_A15,1,3) IN ("E86","T67") OR 
SUBSTR(DIS_A16,1,3) IN ("E86","T67") OR 
SUBSTR(DIS_A17,1,3) IN ("E86","T67") OR 
SUBSTR(DIS_A18,1,3) IN ("E86","T67") OR
SUBSTR(DIS_A19,1,3) IN ("E86","T67") OR
SUBSTR(DIS_A20,1,3) IN ("E86","T67") OR

/*��� ���� �ڵ� */
SUBSTR(DIS_E_A01,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A02,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A03,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A04,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A05,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A06,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A07,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A08,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A09,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A10,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A11,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A12,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A13,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A14,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A15,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A16,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A17,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A18,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A19,1,3) IN ("E86","T67") OR
SUBSTR(DIS_E_A20,1,3) IN ("E86","T67");

/*���޽� �������� ��¥ ����  */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP HOSPT DIS_B01-DIS_B20 DIS_E_B01-DIS_E_B20 SGG_TF ;
RUN;

/*�ѷ���ȯ ���� T33-T35,T68,T69*/
DATA A.frostrelated ;   SET A.NEDIS_R2;
FORMAT E_DDATE YYMMDD10. ;

/*�ش� ��ȯ ICD �ڵ� ���� */
/*��� ���� �ڵ� */
IF 
SUBSTR(DIS_A01,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_A02,1,3) IN ("T33","T34","T35","T68","T69") OR
SUBSTR(DIS_A03,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_A04,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_A05,1,3) IN ("T33","T34","T35","T68","T69") OR
SUBSTR(DIS_A06,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_A07,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_A08,1,3) IN ("T33","T34","T35","T68","T69") OR
SUBSTR(DIS_A09,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_A10,1,3) IN ("T33","T34","T35","T68","T69") OR
SUBSTR(DIS_A11,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_A12,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_A13,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_A14,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_A15,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_A16,1,3) IN ("T33","T34","T35","T68","T69") OR
SUBSTR(DIS_A17,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_A18,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_A19,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_A20,1,3) IN ("T33","T34","T35","T68","T69") OR 

/*��� ���� �ڵ� */
SUBSTR(DIS_E_A01,1,3) IN ("T33","T34","T35","T68","T69") OR
SUBSTR(DIS_E_A02,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_E_A03,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_E_A04,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_E_A05,1,3) IN ("T33","T34","T35","T68","T69") OR
SUBSTR(DIS_E_A06,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_E_A07,1,3) IN ("T33","T34","T35","T68","T69") OR
SUBSTR(DIS_E_A08,1,3) IN ("T33","T34","T35","T68","T69") OR
SUBSTR(DIS_E_A09,1,3) IN ("T33","T34","T35","T68","T69") OR
SUBSTR(DIS_E_A10,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_E_A11,1,3) IN ("T33","T34","T35","T68","T69") OR
SUBSTR(DIS_E_A12,1,3) IN ("T33","T34","T35","T68","T69") OR
SUBSTR(DIS_E_A13,1,3) IN ("T33","T34","T35","T68","T69") OR
SUBSTR(DIS_E_A14,1,3) IN ("T33","T34","T35","T68","T69") OR
SUBSTR(DIS_E_A15,1,3) IN ("T33","T34","T35","T68","T69") OR
SUBSTR(DIS_E_A16,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_E_A17,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_E_A18,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_E_A19,1,3) IN ("T33","T34","T35","T68","T69") OR 
SUBSTR(DIS_E_A20,1,3) IN ("T33","T34","T35","T68","T69")  ;

/*���޽� �������� ��¥ ����  */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP HOSPT DIS_B01-DIS_B20 DIS_E_B01-DIS_E_B20 SGG_TF ;
RUN;
/*****************************************************************************************/
/*****************************************************************************************/

%MACRO DISEASE_COUNT2(DISEASE);

/*���� ī��Ʈ �������� ������ */
DATA A.DAT ;SET A.&DISEASE.;

/*��ü */
TOT=1; 

/*����*/
IF SEX="M" THEN MALE=1; ELSE MALE=0;
IF SEX="F" THEN FEMALE=1; ELSE FEMALE=0;

/*���� �̻� ���� */
IF AGE_GROUP ^=""; 

/*���� �׷캰, 5�� ���� */
IF AG=1   THEN AG01=1; ELSE AG01=0;
IF AG=2   THEN AG02=1; ELSE AG02=0;
IF AG=3   THEN AG03=1; ELSE AG03=0;
IF AG=4   THEN AG04=1; ELSE AG04=0;
IF AG=5   THEN AG05=1; ELSE AG05=0;
IF AG=6   THEN AG06=1; ELSE AG06=0;
IF AG=7   THEN AG07=1; ELSE AG07=0;
IF AG=8   THEN AG08=1; ELSE AG08=0;
IF AG=9   THEN AG09=1; ELSE AG09=0;
IF AG=10 THEN AG10=1; ELSE AG10=0;
IF AG=11 THEN AG11=1; ELSE AG11=0;
IF AG=12 THEN AG12=1; ELSE AG12=0;
IF AG=13 THEN AG13=1; ELSE AG13=0;
IF AG=14 THEN AG14=1; ELSE AG14=0;
IF AG=15 THEN AG15=1; ELSE AG15=0;
IF AG=16 THEN AG16=1; ELSE AG16=0;
IF AG=17 THEN AG17=1; ELSE AG17=0;
IF AG=18 THEN AG18=1; ELSE AG18=0;

/*���� �׷� 5��, 15-64, 65�� �̻�*/
IF AG2=1 THEN AG2_01=1; ELSE AG2_01=0;
IF AG2=2 THEN AG2_02=1; ELSE AG2_02=0;
IF AG2=3 THEN AG2_03=1; ELSE AG2_03=0;

/*�� ���� ���� 1*/
IF SEX="M" & AG=1   THEN M_AG01=1; ELSE M_AG01=0; /*0-4�� & ���� */
IF SEX="M" & AG=2   THEN M_AG02=1; ELSE M_AG02=0; /*5-9�� & ���� */
IF SEX="M" & AG=3   THEN M_AG03=1; ELSE M_AG03=0; /*10-14�� & ���� */
IF SEX="M" & AG=4   THEN M_AG04=1; ELSE M_AG04=0; /*15-19�� & ���� */
IF SEX="M" & AG=5   THEN M_AG05=1; ELSE M_AG05=0; /*20-24�� & ���� */
IF SEX="M" & AG=6   THEN M_AG06=1; ELSE M_AG06=0; /*25-29�� & ���� */
IF SEX="M" & AG=7   THEN M_AG07=1; ELSE M_AG07=0; /*30-34�� & ���� */
IF SEX="M" & AG=8   THEN M_AG08=1; ELSE M_AG08=0; /*35-39�� & ���� */
IF SEX="M" & AG=9   THEN M_AG09=1; ELSE M_AG09=0; /*40-44�� & ���� */
IF SEX="M" & AG=10 THEN M_AG10=1; ELSE M_AG10=0; /*45-49�� & ���� */
IF SEX="M" & AG=11 THEN M_AG11=1; ELSE M_AG11=0; /*50-54�� & ���� */
IF SEX="M" & AG=12 THEN M_AG12=1; ELSE M_AG12=0; /*55-59�� & ���� */
IF SEX="M" & AG=13 THEN M_AG13=1; ELSE M_AG13=0; /*60-64�� & ���� */
IF SEX="M" & AG=14 THEN M_AG14=1; ELSE M_AG14=0; /*65-69�� & ���� */
IF SEX="M" & AG=15 THEN M_AG15=1; ELSE M_AG15=0; /*70-74�� & ���� */
IF SEX="M" & AG=16 THEN M_AG16=1; ELSE M_AG16=0; /*75-79�� & ���� */
IF SEX="M" & AG=17 THEN M_AG17=1; ELSE M_AG17=0; /*80-84�� & ���� */ 
IF SEX="M" & AG=18 THEN M_AG18=1; ELSE M_AG18=0; /*85�� �̻� & ���� */

IF SEX="F" & AG=1   THEN F_AG01=1; ELSE F_AG01=0; /*0-4�� & ���� */
IF SEX="F" & AG=2   THEN F_AG02=1; ELSE F_AG02=0; /*5-9�� & ���� */
IF SEX="F" & AG=3   THEN F_AG03=1; ELSE F_AG03=0; /*10-14�� & ���� */
IF SEX="F" & AG=4   THEN F_AG04=1; ELSE F_AG04=0; /*15-19�� & ���� */
IF SEX="F" & AG=5   THEN F_AG05=1; ELSE F_AG05=0; /*20-24�� & ���� */
IF SEX="F" & AG=6   THEN F_AG06=1; ELSE F_AG06=0; /*25-29�� & ���� */
IF SEX="F" & AG=7   THEN F_AG07=1; ELSE F_AG07=0; /*30-34�� & ���� */
IF SEX="F" & AG=8   THEN F_AG08=1; ELSE F_AG08=0; /*35-39�� & ���� */
IF SEX="F" & AG=9   THEN F_AG09=1; ELSE F_AG09=0; /*40-44�� & ���� */
IF SEX="F" & AG=10 THEN F_AG10=1; ELSE F_AG10=0; /*45-49�� & ���� */
IF SEX="F" & AG=11 THEN F_AG11=1; ELSE F_AG11=0; /*50-54�� & ���� */
IF SEX="F" & AG=12 THEN F_AG12=1; ELSE F_AG12=0; /*55-59�� & ���� */
IF SEX="F" & AG=13 THEN F_AG13=1; ELSE F_AG13=0; /*60-64�� & ���� */
IF SEX="F" & AG=14 THEN F_AG14=1; ELSE F_AG14=0; /*65-69�� & ���� */
IF SEX="F" & AG=15 THEN F_AG15=1; ELSE F_AG15=0; /*70-74�� & ���� */
IF SEX="F" & AG=16 THEN F_AG16=1; ELSE F_AG16=0; /*75-79�� & ���� */
IF SEX="F" & AG=17 THEN F_AG17=1; ELSE F_AG17=0; /*80-84�� & ���� */ 
IF SEX="F" & AG=18 THEN F_AG18=1; ELSE F_AG18=0; /*85�� �̻� & ���� */

/*�� ���� ���� 2*/
IF SEX="M" & AG2=1   THEN M_AG2_01=1; ELSE M_AG2_01=0; /*0-4�� & ���� */
IF SEX="M" & AG2=2   THEN M_AG2_02=1; ELSE M_AG2_02=0; /*15-64�� & ���� */
IF SEX="M" & AG2=3   THEN M_AG2_03=1; ELSE M_AG2_03=0; /*65���̻� & ���� */

IF SEX="F" & AG2=1   THEN F_AG2_01=1; ELSE F_AG2_01=0; /*0-4�� & ���� */
IF SEX="F" & AG2=2   THEN F_AG2_02=1; ELSE F_AG2_02=0; /*15-64�� & ���� */
IF SEX="F" & AG2=3   THEN F_AG2_03=1; ELSE F_AG2_03=0; /*65���̻� & ���� */

/*��¥��+�õ� key */
KEY=COMPRESS(E_DATE)||("-")||COMPRESS(SIDO_R); 
RUN;

/*���� �׸񺰷� ���ϸ� ī��Ʈ ���� */
PROC SQL;CREATE TABLE A.TOT AS SELECT KEY, 
/*��ü*/
SUM(TOT) AS TOT, 

/*����*/
SUM(MALE) AS MALE, SUM(FEMALE) AS FEMALE,

/*���� �׷� 5���� */
SUM(AG01) AS AG01, SUM(AG02) AS AG02,  SUM(AG03) AS AG03,  SUM(AG04) AS AG04, 
SUM(AG05) AS AG05, SUM(AG06) AS AG06,  SUM(AG07) AS AG07,  SUM(AG08) AS AG08, 
SUM(AG09) AS AG09, SUM(AG10) AS AG10,  SUM(AG11) AS AG11,  SUM(AG12) AS AG12, 
SUM(AG13) AS AG13, SUM(AG14) AS AG14,  SUM(AG15) AS AG15,  SUM(AG16) AS AG16, 
SUM(AG17) AS AG17, SUM(AG18) AS AG18, 

/*���� �׷� 5�� �̸�, 15-64�� 65�� �̻�*/
SUM(AG2_01) AS AG2_01, SUM(AG2_02) AS AG2_02,  SUM(AG2_03) AS AG2_03, 

/*���� ���� �׷캰 5������ */
SUM(M_AG01) AS M_AG01, SUM(M_AG02) AS M_AG02,  SUM(M_AG03) AS M_AG03,  SUM(M_AG04) AS M_AG04, 
SUM(M_AG05) AS M_AG05, SUM(M_AG06) AS M_AG06,  SUM(M_AG07) AS M_AG07,  SUM(M_AG08) AS M_AG08, 
SUM(M_AG09) AS M_AG09, SUM(M_AG10) AS M_AG10,  SUM(M_AG11) AS M_AG11,  SUM(M_AG12) AS M_AG12, 
SUM(M_AG13) AS M_AG13, SUM(M_AG14) AS M_AG14,  SUM(M_AG15) AS M_AG15,  SUM(M_AG16) AS M_AG16, 
SUM(M_AG17) AS M_AG17, SUM(M_AG18) AS M_AG18, 

/*���� ���� �׷캰 5�� ����*/
SUM(F_AG01) AS F_AG01, SUM(F_AG02) AS F_AG02,  SUM(F_AG03) AS F_AG03,  SUM(F_AG04) AS F_AG04, 
SUM(F_AG05) AS F_AG05, SUM(F_AG06) AS F_AG06,  SUM(F_AG07) AS F_AG07,  SUM(F_AG08) AS F_AG08, 
SUM(F_AG09) AS F_AG09, SUM(F_AG10) AS F_AG10,  SUM(F_AG11) AS F_AG11,  SUM(F_AG12) AS F_AG12, 
SUM(F_AG13) AS F_AG13, SUM(F_AG14) AS F_AG14,  SUM(F_AG15) AS F_AG15,  SUM(F_AG16) AS F_AG16, 
SUM(F_AG17) AS F_AG17, SUM(F_AG18) AS F_AG18, 

/*���� ���� �׷캰 5�� �̸�, 15-64��, 65�� �̻�  */
SUM(M_AG2_01) AS M_AG2_01, SUM(M_AG2_02) AS M_AG2_02,  SUM(M_AG2_03) AS M_AG2_03, 
/*���� ���� �׷캰 5�� �̸�, 15-64��, 65�� �̻�  */
SUM(F_AG2_01) AS F_AG2_01, SUM(F_AG2_02) AS F_AG2_02,  SUM(F_AG2_03) AS F_AG2_03 FROM

A.DAT GROUP BY KEY ;QUIT;

/*��¥�ڷ�� ī��Ʈ �ڷ� ���� */
PROC SQL; CREATE TABLE A.TOT_final as select * from a.sidodate as a left join a.tot as b on a.key=b.key; quit;

/*���� �ڷ� ����*/
DATA A.&DISEASE._Dailycount; 

/*������ ���� ���� */
RETAIN DATE YEAR MONTH DAY  SIDO SIDO_KR &DISEASE. &DISEASE._M &DISEASE._F &DISEASE._AG01-&DISEASE._AG18 &DISEASE._AG2_01-&DISEASE._AG2_03 
&DISEASE._M_AG01-&DISEASE._M_AG18 &DISEASE._F_AG01-&DISEASE._F_AG18 &DISEASE._M_AG2_01-&DISEASE._M_AG2_03 &DISEASE._F_AG2_01-&DISEASE._F_AG2_03;

LENGTH YEAR $4. MONTH $2. DAY $2. SIDO $2.;

SET A.TOT_FINAL;

/*���̺�� ��ũ�θ� ���缭 ���� */
RENAME TOT=&DISEASE. MALE=&DISEASE._M FEMALE=&DISEASE._F 

AG01-AG18=&DISEASE._AG01-&DISEASE._AG18

AG2_01-AG2_03 =&DISEASE._AG2_01-&DISEASE._AG2_03

M_AG01-M_AG18=&DISEASE._M_AG01-&DISEASE._M_AG18
F_AG01-F_AG18  =&DISEASE._F_AG01-&DISEASE._F_AG18

M_AG2_01-M_AG2_03=&DISEASE._M_AG2_01-&DISEASE._M_AG2_03
F_AG2_01-F_AG2_03  =&DISEASE._F_AG2_01-&DISEASE._F_AG2_03
;

/*��¥�� �õ� ���� ���� */
DATE=CAT(SUBSTR(KEY,1,4),"-",SUBSTR(KEY,5,2),"-",SUBSTR(KEY,7,2));
YEAR=SUBSTR(DATE,1,4);
MONTH=SUBSTR(DATE,6,2);
DAY=SUBSTR(DATE,9,2);

SIDO=SUBSTR(KEY,10,2);

/* MISSING�γ����� 0���� �޲��ֱ� */
IF TOT       ="." THEN TOT       =0; IF MALE     ="." THEN MALE     =0;  IF FEMALE  ="." THEN FEMALE =0;

IF AG01      ="." THEN AG01     =0;   IF AG02       ="." THEN AG02      =0;  IF AG03     ="." THEN AG03      =0;
IF AG04     ="." THEN AG04      =0;   IF AG05       ="." THEN AG05      =0;  IF AG06     ="." THEN AG06      =0;
IF AG07     ="." THEN AG07      =0;   IF AG08       ="." THEN AG08      =0;  IF AG09     ="." THEN AG09      =0;
IF AG10     ="." THEN AG10      =0;   IF AG11       ="." THEN AG11      =0;  IF AG12     ="." THEN AG12      =0;
IF AG13     ="." THEN AG13      =0;   IF AG14       ="." THEN AG14      =0;  IF AG15     ="." THEN AG15      =0;
IF AG16     ="." THEN AG16      =0;   IF AG17       ="." THEN AG17      =0;  IF AG18     ="." THEN AG18      =0;
IF AG2_01   ="." THEN AG2_01  =0;  IF AG2_02   ="." THEN AG2_02  =0; IF AG2_03   ="." THEN AG2_03  =0;

IF M_AG01   ="." THEN M_AG01 =0; IF M_AG02  ="." THEN M_AG02 =0; IF M_AG03   ="." THEN M_AG03 =0;
IF M_AG04   ="." THEN M_AG04 =0; IF M_AG05   ="." THEN M_AG05 =0; IF M_AG06   ="." THEN M_AG06 =0;
IF M_AG07   ="." THEN M_AG07 =0; IF M_AG08   ="." THEN M_AG08 =0; IF M_AG09   ="." THEN M_AG09 =0;
IF M_AG10   ="." THEN M_AG10 =0; IF M_AG11   ="." THEN M_AG11 =0; IF M_AG12   ="." THEN M_AG12 =0;
IF M_AG13   ="." THEN M_AG13 =0; IF M_AG14   ="." THEN M_AG14 =0; IF M_AG15   ="." THEN M_AG15 =0;
IF M_AG16   ="." THEN M_AG16 =0; IF M_AG17   ="." THEN M_AG17 =0; IF M_AG18   ="." THEN M_AG18 =0;

IF F_AG01   ="." THEN F_AG01  =0; IF F_AG02   ="." THEN F_AG02  =0; IF F_AG03   ="." THEN F_AG03  =0;
IF F_AG04   ="." THEN F_AG04  =0; IF F_AG05   ="." THEN F_AG05  =0; IF F_AG06   ="." THEN F_AG06  =0;
IF F_AG07   ="." THEN F_AG07  =0; IF F_AG08   ="." THEN F_AG08  =0; IF F_AG09   ="." THEN F_AG09  =0;
IF F_AG10   ="." THEN F_AG10  =0; IF F_AG11   ="." THEN F_AG11  =0; IF F_AG12   ="." THEN F_AG12  =0;
IF F_AG13   ="." THEN F_AG13  =0; IF F_AG14   ="." THEN F_AG14  =0; IF F_AG15   ="." THEN F_AG15  =0;
IF F_AG16   ="." THEN F_AG16  =0; IF F_AG17   ="." THEN F_AG17  =0; IF F_AG18   ="." THEN F_AG18  =0;

IF M_AG2_01 ="." THEN M_AG2_01=0; IF M_AG2_02 ="." THEN M_AG2_02=0; IF M_AG2_03 ="." THEN M_AG2_03=0;
IF F_AG2_01 ="." THEN F_AG2_01=0; IF F_AG2_02 ="." THEN F_AG2_02=0; IF F_AG2_03 ="." THEN F_AG2_03=0;

DROP KEY;
RUN;

/*�ڷ� ����*/
PROC SORT DATA=A.&DISEASE._Dailycount; BY SIDO DATE ; RUN;

/*ī�װ����� ���� (��ü, ����, ����, �õ���)*/
PROC SQL; 
/*������ */
CREATE TABLE A.Z AS SELECT YEAR, 
SUM(&DISEASE.) AS TOT,  SUM(&DISEASE._M) AS MALE, SUM(&DISEASE._F) AS FEMALE,
SUM(&DISEASE._AG01) AS AG01, SUM(&DISEASE._AG02) AS AG02,
SUM(&DISEASE._AG03) AS AG03, SUM(&DISEASE._AG04) AS AG04,
SUM(&DISEASE._AG05) AS AG05, SUM(&DISEASE._AG06) AS AG06,
SUM(&DISEASE._AG07) AS AG07, SUM(&DISEASE._AG08) AS AG08,
SUM(&DISEASE._AG09) AS AG09, SUM(&DISEASE._AG10) AS AG10,
SUM(&DISEASE._AG11) AS AG11, SUM(&DISEASE._AG12) AS AG12,
SUM(&DISEASE._AG13) AS AG13, SUM(&DISEASE._AG14) AS AG14,
SUM(&DISEASE._AG15) AS AG15, SUM(&DISEASE._AG16) AS AG16,
SUM(&DISEASE._AG17) AS AG17, SUM(&DISEASE._AG18) AS AG18 
FROM A.&DISEASE._DAILYCOUNT GROUP BY YEAR; QUIT;

Options firstobs=1 obs=max;
PROC TRANSPOSE DATA=A.Z PREFIX=Y_ OUT=A.Z_T;
ID YEAR; RUN;
/*label ����*/
data a.z_t; set a.z_t; rename _name_=category; run;

/*���̺� ���� */
DATA A.Z_T1; OPTIONS FIRSTOBS=1 OBS=1 ; SET A.Z_T; RUN; /*��ü*/
DATA A.Z_T2; OPTIONS FIRSTOBS=2 OBS=3 ; SET A.Z_T; RUN; /*����*/
DATA A.Z_T3; OPTIONS FIRSTOBS=4 OBS=21; SET A.Z_T; RUN; /*���� �׷캰*/

Options firstobs=1 obs=max;

/*������ �õ� �հ� */
PROC SQL;  CREATE TABLE A.Z2 AS SELECT YEAR, SIDO, SUM(&DISEASE.) AS TOT FROM A.&DISEASE._DAILYCOUNT GROUP BY YEAR, SIDO; QUIT;

/*���̺� ��ġ, ��ġ �� ���� */
PROC SORT DATA=A.Z2; BY SIDO;
PROC TRANSPOSE DATA=A.Z2 PREFIX=Y_ OUT=A.Z_T4;
BY SIDO; ID YEAR; 
RUN;

data a.z_t4; set a.z_t4;
rename sido=category;
drop _name_; 
run;

/*������ ���� �հ� */
PROC SQL;  CREATE TABLE A.Z3 AS SELECT YEAR, month, SUM(&DISEASE.) AS TOT FROM A.&DISEASE._DAILYCOUNT GROUP BY YEAR, month; QUIT;

/*���̺� ��ġ, ��ġ �� ���� */
PROC SORT DATA=A.Z3; BY month;run;
PROC TRANSPOSE DATA=A.Z3 PREFIX=Y_ OUT=A.Z_T5;
BY month; ID YEAR; 
RUN;

data A.Z_T5; set A.Z_T5;
rename month=category;
drop _name_; 
run;

data a.&disease._table; set a.z_t1 a.null_tb  a.z_t2 a.null_tb a.z_t3 a.null_tb a.z_t4 a.null_tb a.z_t5 ; 
IF CATEGORY='""' THEN CATEGORY="."; run;

%MEND;

%DISEASE_COUNT2(cerebvas);         /*������ ��ȯ ��ü I60-I67, I690-I694,G458-G459*/
%DISEASE_COUNT2(hemoStroke);     /*������ ������ I60-I62, I690-I692 */
%DISEASE_COUNT2(ischStroke);       /*������ ������ I60-I62, I690-I692*/
%DISEASE_COUNT2(otherStroke);      /*��Ÿ ������ I64, I694*/
%DISEASE_COUNT2(heatrelated);      /*�¿���ȯ E86,T67*/
%DISEASE_COUNT2(frostrelated);      /*�ѷ���ȯ T33-T35,T68,T69*/

/*****************************************************************************************/
/*****************************************************************************************/
/*���ϸ� ī��Ʈ ��ȯ���� ������ ��� merge �ϱ� */
/*�ƹ��ų� ��ȯ �ڷ� ��� ��¥�� �������� ,key�� ���� Ű (��¥+�õ�)*/
data daily; set a.circ_dailycount;
KEY=COMPRESS(DATE)||("-")||COMPRESS(SIDO);
keep KEY date YEAR month day SIDO SIDO_KR ;
RUN;
proc sort data=daily ; by key; run;

/*��ȯ���� merge�� key���� ��ȯ �����ؼ� �������� ��ü, ��,��, 5���̸�, 15���̸�, 15-64��, 65�� �̻� */
%MACRO revise(N,DISEASE);
DATA D&N.; SET A.&DISEASE._dailycount;
RENAME &DISEASE.=&DISEASE._tot;
KEY=COMPRESS(DATE)||("-")||COMPRESS(SIDO);
keep KEY &DISEASE. &DISEASE._M &DISEASE._F &DISEASE._AG01 &DISEASE._AG2_01 &DISEASE._AG2_02 &DISEASE._AG2_03; 
RUN;
proc sort data=  D&n.; by key; run;
%mend;

%revise(1,intestinal_infec)
%revise(2,cholera)
%revise(3,typhoid_para)
%revise(4,othersalmone)
%revise(5,shigellosis)
%revise(6,otherbac)
%revise(7,otherbac_food)
%revise(8,amoebiasis)
%revise(9,otherprotozoal)
%revise(10,viral_intestinal)
%revise(11,othergast_coli)
%revise(12,tsutsugamushi)
%revise(13,zoster)
%revise(14,circ)
%revise(15,angina)
%revise(16,ischHD)
%revise(17,MI)
%revise(18,cerebvas)
%revise(19,hemoStroke)
%revise(20,ischStroke)
%revise(21,otherStroke)
%revise(22,TIA)
%revise(23,suicide)
%revise(24,mental)
%revise(25,resp)
%revise(26,acuteup)
%revise(27,pneum)
%revise(28,asthma)
%revise(29,copd)
%revise(30,voldep)
%revise(31,frost)
%revise(32,heat)
%revise(33,hypothermia)
%revise(34,otherredutemp)
%revise(35,heatrelated)
%revise(36,frostrelated)
%revise(37,aki)
%revise(38,kidney)
%revise(39,dm)
%revise(40,vasomotor_allerg)

DATA DAILYCOUNT; 
MERGE daily D1-D40;
BY KEY;
RUN;
proc sort data=dailycount; by sido date ; run;


/*NEDIS ������� ����ڷ� �ҷ�����*/
data WORK.ENV ; %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
infile 'D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\NEDIS_linkage_AP.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
informat ddate yymmdd10.  ; informat sido best32. ;
informat dow $6.               ;informat area $4. ;
informat meantemp best32. ;informat mintemp best32.    ;
informat maxtemp best32.  ;informat meanhumi best32. ;
informat meanpress1 best32. ; informat meanpress2 best32. ;
informat dewtemp best32.      ;informat rain best32. ;
informat windspeed best32.    ;informat totsun best32. ;
informat pm25 best32.           ;informat pm10 best32. ;
informat no2 best32.             ;informat so2 best32. ;
informat co best32.               ;informat o3 best32. ;
informat pm25_model best32. ;

format ddate yymmdd10.      ;format sido best12. ;
format dow $6.                   ;format area $4. ;
format meantemp best12.     ;format mintemp best12. ;
format maxtemp best12.      ;format meanhumi best12. ;
format meanpress1 best12. ;format meanpress2 best12. ;
format dewtemp best12.     ;format rain best12. ;
format windspeed best12.  ;format totsun best12. ;
format pm25 best12.         ;format pm10 best12. ;
format no2 best12.            ;format so2 best12. ;
format co best12.              ;format o3 best12. ;
format pm25_model best12. ;
input
 ddate
 sido
 dow  $
 area  $
 meantemp
 mintemp
 maxtemp
 meanhumi
 meanpress1
 meanpress2
 dewtemp
 rain
 windspeed
 totsun
 pm25  
 pm10
 no2
 so2
 co
 o3
 pm25_model
;
if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
 run;

 proc freq data=env; tables sido; run;

DATA ENV; SET ENV;
DATE=PUT(DDATE,YYMMDDN8.);
IF AREA="����" THEN SIDO=39; /*���� 50->36���� ����*/
IF AREA="����" THEN SIDO=50; /*���� 49->50���� ����*/
KEY=COMPRESS(SUBSTR(DATE,1,4))||("-")||COMPRESS(SUBSTR(DATE,5,2))||("-")||COMPRESS(SUBSTR(DATE,7,2))||("-")||COMPRESS(SIDO);
DROP DDATE DATE ENV SIDO;
RUN;

PROC SQL; CREATE TABLE A.DAILYCOUNT AS SELECT * FROM DAILYCOUNT AS A LEFT JOIN ENV AS B ON A.KEY=B.KEY; QUIT;

/*����Ű ����*/
DATA A.DAILYCOUNT; SET A.DAILYCOUNT;
DROP KEY; RUN;

/*�ڷ� ����*/
proc sort data=a.dailycount; by sido date ; run;

/*�Ϻ� �ڷ�+����ڷ� �����ڷ� �������� */
proc export data=a.dailycount outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\dailycount.csv" dbms=csv replace; run;

/*****************************************************************************************/
/*****************************************************************************************/
/*�� ���̺� ���� �ϱ� */
PROC EXPORT DATA=A.intestinal_infec_table    outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="��ü �尨�� ��ȯ "; RUN;
PROC EXPORT DATA=A.cholera_table             outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="�ݷ���" ;RUN;
PROC EXPORT DATA=A.typhoid_para_table      outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="��ƼǪ�� �� �Ķ�ƼǪ��" ;RUN;
PROC EXPORT DATA=A.othersalmone_table     outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="��Ÿ ���ڶ󰨿�" ;RUN;
PROC EXPORT DATA=A.shigellosis_table         outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"     DBMS=EXCEL REPLACE; SHEET="�ðֶ���"; RUN;
PROC EXPORT DATA=A.otherbac_table           outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"     DBMS=EXCEL REPLACE; SHEET="��Ÿ ���ռ� �尨��"; RUN;
PROC EXPORT DATA=A.otherbac_food_table    outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="��Ÿ ���ռ� ���ĸŰ�" ;RUN;
PROC EXPORT DATA=A.amoebiasis_table        outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="�Ƹ޹���" ;RUN;
PROC EXPORT DATA=A.Otherprotozoal_table   outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="��Ÿ ���漺 ����ȯ"; RUN;
PROC EXPORT DATA=A.viral_intestinal_table     outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="���̷�����  �尨��" ;RUN;
PROC EXPORT DATA=A.othergast_coli_table     outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="�󼼺Ҹ�_��Ÿ ����_���忰" ;RUN;
PROC EXPORT DATA=A.tsutsugamushi_table    outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="���갡���ú�"; RUN;
PROC EXPORT DATA=A.zoster_table               outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="�������" ;RUN;
PROC EXPORT DATA=A.circ_table                   outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="��ü �ɳ�������ȯ" ;RUN;
PROC EXPORT DATA=A.angina_table               outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="������" ;RUN;
PROC EXPORT DATA=A.ischHD_table               outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="��ü ������ ����ȯ" ;RUN;
PROC EXPORT DATA=A.MI_table                     outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="�ɱٰ��" ;RUN;
PROC EXPORT DATA=A.cerebvas_table            outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"   DBMS=EXCEL REPLACE; SHEET="��ü ������" ;RUN;
PROC EXPORT DATA=A.hemoStroke_table        outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="������ ������" ;RUN;
PROC EXPORT DATA=A.ischStroke_table          outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="������ ������" ;RUN;
PROC EXPORT DATA=A.otherStroke_table         outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"   DBMS=EXCEL REPLACE; SHEET="��Ÿ ������"; RUN;
PROC EXPORT DATA=A.TIA_table                    outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"   DBMS=EXCEL REPLACE; SHEET="�ϰ��� ������ ������" ;RUN;
PROC EXPORT DATA=A.suicide_table               outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"   DBMS=EXCEL REPLACE; SHEET="�ڻ�" ;RUN;
PROC EXPORT DATA=A.mental_table                outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="�����" ;RUN;
PROC EXPORT DATA=A.resp_table                   outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="��ü ȣ������ȯ" ;RUN;
PROC EXPORT DATA=A.acuteup_table              outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="�޼� ��⵵ ����" ;RUN;
PROC EXPORT DATA=A.pneum_table                outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="���÷翣�� �� ���"; RUN;
PROC EXPORT DATA=A.asthma_table               outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="õ��"; RUN;
PROC EXPORT DATA=A.copd_table                  outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="������⼺����ȯ" ;RUN;
PROC EXPORT DATA=A.voldep_table                outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="������ Ż��"; RUN;
PROC EXPORT DATA=A.frost_table                  outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="����"; RUN;
PROC EXPORT DATA=A.heat_table                   outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX" DBMS=EXCEL REPLACE; SHEET="��°��� ��ȯ(���纴, ���Ƿ�)"; RUN;
PROC EXPORT DATA=A.hypothermia_table        outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX" DBMS=EXCEL REPLACE; SHEET="��ü����"; RUN;
PROC EXPORT DATA=A.otherredutemp_table     outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX" DBMS=EXCEL REPLACE; SHEET="�񵿰� �� ��Ÿ" ;RUN;
PROC EXPORT DATA=A.heatrelated_table          outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX" DBMS=EXCEL REPLACE; SHEET="�¿���ȯ ����" ;RUN;
PROC EXPORT DATA=A.frostrelated_table          outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX" DBMS=EXCEL REPLACE; SHEET="�ѷ���ȯ ����" ;RUN;
PROC EXPORT DATA=A.aki_table                     outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="�޼� �ź�����"; RUN;
PROC EXPORT DATA=A.kidney_table                outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="������ȯ" ;RUN;
PROC EXPORT DATA=A.dm_table                    outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="�索" ;RUN;
PROC EXPORT DATA=A.vasomotor_allerg_table outfile="D:\SNU\����\������������\���ĺ��ǿ�����_��ü�豸��׽ù����\2021\�ڷ�\NEDIS\outtable\frequency_table.XLSX" DBMS=EXCEL REPLACE; SHEET="������� �� �ٷ����� ��" ;RUN;
