LIBNAME A 'D:\�Ѿ��\NEDIS\JE20230602_1421'; 
LIBNAME B 'D:\�Ѿ��\NEDIS\out';


/*�ڷ� �ҷ�����*/
%MACRO LOAD(YR,DATA);
data A.NEDIS&YR.    ;
%let _EFIERR_ = 0; /* set the ERROR detection macro variable */
infile &DATA. delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
   informat PTMIEMAR $7. ;
   informat PTMIEMNM $10. ;
   informat PTMIINDT $10. ;
   informat PTMIBRTD best32. ;
   informat PTMISEXX $1. ;
   informat PTMIGUCD $7. ;
   informat PTMIAKDT $10. ;
   informat DGOTDIAG01 $5. ;
   informat DGOTDGGB01 $5. ;
   informat DGOTDIAG02 $5. ;
   informat DGOTDGGB02 $5. ;
   informat DGOTDIAG03 $5. ;
   informat DGOTDGGB03 $5. ;
   informat DGOTDIAG04 $5. ;
   informat DGOTDGGB04 $5. ;
   informat DGOTDIAG05 $5. ;
   informat DGOTDGGB05 $5. ;
   informat DGOTDIAG06 $5. ;
   informat DGOTDGGB06 $5. ;
   informat DGOTDIAG07 $5. ;
   informat DGOTDGGB07 $5. ;
   informat DGOTDIAG08 $5. ;
   informat DGOTDGGB08 $5. ;
   informat DGOTDIAG09 $5. ;
   informat DGOTDGGB09 $5. ;
   informat DGOTDIAG10 $5. ;
   informat DGOTDGGB10 $5. ;
   informat DGOTDIAG11 $5. ;
   informat DGOTDGGB11 $5. ;
   informat DGOTDIAG12 $5. ;
   informat DGOTDGGB12 $5. ;
   informat DGOTDIAG13 $5. ;
   informat DGOTDGGB13 $5. ;
   informat DGOTDIAG14 $5. ;
   informat DGOTDGGB14 $5. ;
   informat DGOTDIAG15 $5. ;
   informat DGOTDGGB15 $5. ;
   informat DGOTDIAG16 $5. ;
   informat DGOTDGGB16 $5. ;
   informat DGOTDIAG17 $5. ;
   informat DGOTDGGB17 $5. ;
   informat DGOTDIAG18 $5. ;
   informat DGOTDGGB18 $5. ;
   informat DGOTDIAG19 $5. ;
   informat DGOTDGGB19 $5. ;
   informat DGOTDIAG20 $5. ;
   informat DGOTDGGB20 $5. ;
   informat DGDCDIAG01 $5. ;
   informat DGDCDGGB01 $5. ;
   informat DGDCDIAG02 $5. ;
   informat DGDCDGGB02 $5. ;
   informat DGDCDIAG03 $5. ;
   informat DGDCDGGB03 $5. ;
   informat DGDCDIAG04 $5. ;
   informat DGDCDGGB04 $5. ;
   informat DGDCDIAG05 $5. ;
   informat DGDCDGGB05 $5. ;
   informat DGDCDIAG06 $5. ;
   informat DGDCDGGB06 $5. ;
   informat DGDCDIAG07 $5. ;
   informat DGDCDGGB07 $5. ;
   informat DGDCDIAG08 $5. ;
   informat DGDCDGGB08 $5. ;
   informat DGDCDIAG09 $5. ;
   informat DGDCDGGB09 $5. ;
   informat DGDCDIAG10 $5. ;
   informat DGDCDGGB10 $5. ;
   informat DGDCDIAG11 $5. ;
   informat DGDCDGGB11 $5. ;
   informat DGDCDIAG12 $5. ;
   informat DGDCDGGB12 $5. ;
   informat DGDCDIAG13 $5. ;
   informat DGDCDGGB13 $5. ;
   informat DGDCDIAG14 $5. ;
   informat DGDCDGGB14 $5. ;
   informat DGDCDIAG15 $5. ;
   informat DGDCDGGB15 $5. ;
   informat DGDCDIAG16 $5. ;
   informat DGDCDGGB16 $5. ;
   informat DGDCDIAG17 $5. ;
   informat DGDCDGGB17 $5. ;
   informat DGDCDIAG18 $5. ;
   informat DGDCDGGB18 $5. ;
   informat DGDCDIAG19 $5. ;
   informat DGDCDGGB19 $5. ;
   informat DGDCDIAG20 $5. ;
   informat DGDCDGGB20 $5. ;
   format PTMIEMAR $7. ;
   format PTMIEMNM $10. ;
   format PTMIINDT $10. ;
   format PTMIBRTD best12. ;
   format PTMISEXX $1. ;
   format PTMIGUCD $7. ;
   format PTMIAKDT $10. ;
   format DGOTDIAG01 $5. ;
   format DGOTDGGB01 $5. ;
   format DGOTDIAG02 $5. ;
   format DGOTDGGB02 $5. ;
   format DGOTDIAG03 $5. ;
   format DGOTDGGB03 $5. ;
   format DGOTDIAG04 $5. ;
   format DGOTDGGB04 $5. ;
   format DGOTDIAG05 $5. ;
   format DGOTDGGB05 $5. ;
   format DGOTDIAG06 $5. ;
   format DGOTDGGB06 $5. ;
   format DGOTDIAG07 $5. ;
   format DGOTDGGB07 $5. ;
   format DGOTDIAG08 $5. ;
   format DGOTDGGB08 $5. ;
   format DGOTDIAG09 $5. ;
   format DGOTDGGB09 $5. ;
   format DGOTDIAG10 $5. ;
   format DGOTDGGB10 $5. ;
   format DGOTDIAG11 $5. ;
   format DGOTDGGB11 $5. ;
   format DGOTDIAG12 $5. ;
   format DGOTDGGB12 $5. ;
   format DGOTDIAG13 $5. ;
   format DGOTDGGB13 $5. ;
   format DGOTDIAG14 $5. ;
   format DGOTDGGB14 $5. ;
   format DGOTDIAG15 $5. ;
   format DGOTDGGB15 $5. ;
   format DGOTDIAG16 $5. ;
   format DGOTDGGB16 $5. ;
   format DGOTDIAG17 $5. ;
   format DGOTDGGB17 $5. ;
   format DGOTDIAG18 $5. ;
   format DGOTDGGB18 $5. ;
   format DGOTDIAG19 $5. ;
   format DGOTDGGB19 $5. ;
   format DGOTDIAG20 $5. ;
   format DGOTDGGB20 $5. ;
   format DGDCDIAG01 $5. ;
   format DGDCDGGB01 $5. ;
   format DGDCDIAG02 $5. ;
   format DGDCDGGB02 $5. ;
   format DGDCDIAG03 $5. ;
   format DGDCDGGB03 $5. ;
   format DGDCDIAG04 $5. ;
   format DGDCDGGB04 $5. ;
   format DGDCDIAG05 $5. ;
   format DGDCDGGB05 $5. ;
   format DGDCDIAG06 $5. ;
   format DGDCDGGB06 $5. ;
   format DGDCDIAG07 $5. ;
   format DGDCDGGB07 $5. ;
   format DGDCDIAG08 $5. ;
   format DGDCDGGB08 $5. ;
   format DGDCDIAG09 $5. ;
   format DGDCDGGB09 $5. ;
   format DGDCDIAG10 $5. ;
   format DGDCDGGB10 $5. ;
   format DGDCDIAG11 $5. ;
   format DGDCDGGB11 $5. ;
   format DGDCDIAG12 $5. ;
   format DGDCDGGB12 $5. ;
   format DGDCDIAG13 $5. ;
   format DGDCDGGB13 $5. ;
   format DGDCDIAG14 $5. ;
   format DGDCDGGB14 $5. ;
   format DGDCDIAG15 $5. ;
   format DGDCDGGB15 $5. ;
   format DGDCDIAG16 $5. ;
   format DGDCDGGB16 $5. ;
   format DGDCDIAG17 $5. ;
   format DGDCDGGB17 $5. ;
   format DGDCDIAG18 $5. ;
   format DGDCDGGB18 $5. ;
   format DGDCDIAG19 $5. ;
   format DGDCDGGB19 $5. ;
   format DGDCDIAG20 $5. ;
   format DGDCDGGB20 $5. ;
input
            PTMIEMAR $
            PTMIEMNM $
            PTMIINDT $
            PTMIBRTD
            PTMISEXX $
            PTMIGUCD $
            PTMIAKDT $
            DGOTDIAG01 $
            DGOTDGGB01 $
            DGOTDIAG02 $
            DGOTDGGB02 $
            DGOTDIAG03 $
            DGOTDGGB03 $
            DGOTDIAG04 $
            DGOTDGGB04 $
            DGOTDIAG05 $
            DGOTDGGB05 $
            DGOTDIAG06 $
            DGOTDGGB06 $
            DGOTDIAG07 $
            DGOTDGGB07 $
            DGOTDIAG08 $
            DGOTDGGB08 $
            DGOTDIAG09 $
            DGOTDGGB09 $
            DGOTDIAG10 $
            DGOTDGGB10 $
            DGOTDIAG11 $
            DGOTDGGB11 $
            DGOTDIAG12 $
            DGOTDGGB12 $
            DGOTDIAG13 $
            DGOTDGGB13 $
            DGOTDIAG14 $
            DGOTDGGB14 $
            DGOTDIAG15 $
            DGOTDGGB15 $
            DGOTDIAG16 $
            DGOTDGGB16 $
            DGOTDIAG17 $
            DGOTDGGB17 $
            DGOTDIAG18 $
            DGOTDGGB18 $
            DGOTDIAG19 $
            DGOTDGGB19 $
            DGOTDIAG20 $
            DGOTDGGB20 $
            DGDCDIAG01 $
            DGDCDGGB01 $
            DGDCDIAG02 $
            DGDCDGGB02 $
            DGDCDIAG03 $
            DGDCDGGB03 $
            DGDCDIAG04 $
            DGDCDGGB04 $
            DGDCDIAG05 $
            DGDCDGGB05 $
            DGDCDIAG06 $
            DGDCDGGB06 $
            DGDCDIAG07 $
            DGDCDGGB07 $
            DGDCDIAG08 $
            DGDCDGGB08 $
            DGDCDIAG09 $
            DGDCDGGB09 $
            DGDCDIAG10 $
            DGDCDGGB10 $
            DGDCDIAG11 $
            DGDCDGGB11 $
            DGDCDIAG12 $
            DGDCDGGB12 $
            DGDCDIAG13 $
            DGDCDGGB13 $
            DGDCDIAG14 $
            DGDCDGGB14 $
            DGDCDIAG15 $
            DGDCDGGB15 $
            DGDCDIAG16 $
            DGDCDGGB16 $
            DGDCDIAG17 $
            DGDCDGGB17 $
            DGDCDIAG18 $
            DGDCDGGB18 $
            DGDCDIAG19 $
            DGDCDGGB19 $
            DGDCDIAG20 $
            DGDCDGGB20 $
;
if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
run;
%MEND;
%LOAD(14,'D:\�Ѿ��\NEDIS\JE20230602_1421\JE20230602_PTMI14.csv');
%LOAD(15,'D:\�Ѿ��\NEDIS\JE20230602_1421\JE20230602_PTMI15.csv');
%LOAD(16,'D:\�Ѿ��\NEDIS\JE20230602_1421\JE20230602_PTMI16.csv');
%LOAD(17,'D:\�Ѿ��\NEDIS\JE20230602_1421\JE20230602_PTMI17.csv');
%LOAD(18,'D:\�Ѿ��\NEDIS\JE20230602_1421\JE20230602_PTMI18.csv');
%LOAD(19,'D:\�Ѿ��\NEDIS\JE20230602_1421\JE20230602_PTMI19.csv');
%LOAD(20,'D:\�Ѿ��\NEDIS\JE20230602_1421\JE20230602_PTMI20.csv');
%LOAD(21,'D:\�Ѿ��\NEDIS\JE20230602_1421\JE20230602_PTMI21.csv');

%MACRO REV(YR);
DATA A.NEDIS_REV&YR.; SET  A.NEDIS&YR. ;

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
%MEND;
%REV(14);%REV(15);%REV(16);%REV(17);
%REV(18);%REV(19);%REV(20);%REV(21);


DATA A.NEDIS14_21; SET A.NEDIS_REV14-A.NEDIS_REV21; RUN;

PROC FREQ DATA=A.NEDIS14_21; TABLES YR; RUN;
PROC FREQ DATA=A.NEDIS14_21; TABLES E_YR; RUN;

/*NEDIS �ڷ� ���¶� ���缭 ���� �׷� */
/*������ Ŭ���� �� �ڷ� ���� */
DATA A.NEDIS_R; SET A.NEDIS14_21;
IF P_SGG="." OR P_SGG="" THEN SGG=E_SGG; ELSE SGG=P_SGG; /*ȯ���� ������ ���� ���� ���� ���޽� ���� �������� �־��ֱ� (���з� ������ ������)*/
IF P_SGG="." OR P_SGG="" THEN SGG_TF=1; ELSE SGG_TF=0;       /*ȯ���� ������ ���� ���� ���� 1, �����ϸ� 0*/
SIDO_R= SUBSTR(LEFT(SGG),1,2);                          /*���� ������ �ñ����� �ش��ϴ� �õ� �ڷ�� ����*/

/*���� �׷� �ڷ� ����� */
/*65�� �̸� , 65�� �̻� */
IF AGE_GROUP="" OR AGE_GROUP="." THEN DELETE;
IF AGE_GROUP <15 THEN AGE0064=1;ELSE  AGE0064=0; 
IF AGE_GROUP >=15 THEN AGE65=1; ELSE AGE65=0;
RUN;

PROC FREQ DATA=A.NEDIS_R; TABLES E_YR*SGG/LIST; RUN;
PROC FREQ DATA=A.NEDIS_R; TABLES E_YR; RUN;
PROC FREQ DATA=A.NEDIS_R; TABLES E_YR*AGE0064/LIST; RUN;
PROC FREQ DATA=A.NEDIS_R; TABLES E_YR*AGE65/LIST; RUN;

PROC SORT DATA=A.NEDIS_R NODUPKEY OUT=A.SIDO; BY SIDO_R; RUN;
PROC SORT DATA=A.NEDIS_R NODUPKEY OUT=A.SGG; BY SGG; RUN;

DATA A.SIDO; SET A.SIDO; KEEP SIDO_R; RUN;
DATA A.SGG; SET A.SGG; KEEP SGG; RUN;

/*****************************************************************************************/
/*****************************************************************************************/
/*��¥ �ڷ� ���� �Ǽ� �ڷ� missing�� �� ���� ä��� ����  */
DATA A.DDATE ; 
FORMAT DATE YYMMDD10.;
DO I = 1 to 2922 BY 1;       
DATE=MDY(01,01,2014)+I-1; /* �ݺ������� ��¥ ����� 2014�� 1�� 1�Ϻ��� 2019�� 12�� 31�� ���� */
OUTPUT;
END;
DROP I;
RUN;
DATA A.DDATE; SET A.DDATE;
DATE2= PUT(DATE,YYMMDDN8.);RUN; /*��¥ -> ���ڷ� ���� ���� */

/*������ ������ ���ؿ��� ��¥ �ڷ�� �õ� �ڷ� MERGE�ϱ� (�̶� CROSS JOIN)*/
proc sql; create table a.SIDODATE as select * from a.ddate cross join  a.SIDO; quit;
proc sql; create table a.SGGDATE as select * from a.ddate cross join  a.SGG; quit;

/*KEY�� �� ����� KEY=��¥+�ñ���  (��¥�� �ñ��� ���պ� ���� ���, 3652�� * 250 =913000) */
DATA a.SIDOdate; SET a.SIDOdate; KEY=COMPRESS(DATE2)||("-")||COMPRESS(SIDO_R); KEEP KEY; RUN;
DATA a.SGGdate; SET a.SGGdate; KEY=COMPRESS(DATE2)||("-")||COMPRESS(SGG); KEEP KEY; RUN;

/*ǥ�� �ű涧 ���� �̸� ������ֱ� */
data a.null_tb; 
Options obs=max;
input category$ Y_2014 Y_2015 Y_2016 Y_2017 Y_2018 Y_2019 Y_2020 Y_2021;

CARDS;
"" "" "" "" "" "" "" 
;
RUN;
/*****************************************************************************************/
/*****************************************************************************************/

%MACRO DISEASE_COUNT(DISEASE,S_CODE,E_CODE,K);
DATA A.DAT ;  SET A.NEDIS_R;
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
PROC SORT DATA=A.DAT; BY E_DDATE SIDO_R AGE_GROUP; RUN;

/*���� ī��Ʈ �������� ������ */
DATA A.DAT ;SET A.DAT;

/*��ü */
TOT=1; 

/*����*/
IF SEX="M" THEN MALE=1; ELSE MALE=0;
IF SEX="F" THEN FEMALE=1; ELSE FEMALE=0;

/*�� ���� ���� 1*/
IF SEX="M" & AGE0064=1 THEN M_AGE0064=1; ELSE M_AGE0064=0; /*65�� �̸� & ���� */
IF SEX="M" & AGE65=1    THEN M_AGE65=1; ELSE M_AGE65=0;       /*65�� �̻� & ���� */

IF SEX="F" & AGE0064=1 THEN F_AGE0064=1; ELSE F_AGE0064=0; /*65�� �̸� & ���� */
IF SEX="F" & AGE65=1    THEN F_AGE65=1; ELSE F_AGE65=0;       /*65�� �̻� & ���� */

/*��¥��+�ñ��� key */
SGGKEY=COMPRESS(E_DATE)||("-")||COMPRESS(SGG); 
RUN;

/*���� �׸񺰷� ���ϸ� ī��Ʈ ���� */
PROC SQL;CREATE TABLE A.TOT AS SELECT SGGKEY, 
/*��ü*/
SUM(TOT) AS TOT, 

/*����*/
SUM(MALE) AS MALE, SUM(FEMALE) AS FEMALE,

/*���� �׷� 65���̸�/65�� �̻� */
SUM(AGE0064) AS AGE0064, SUM(AGE65) AS AGE65,

/*���� ���� �׷캰  */
SUM(M_AGE0064) AS M_AGE0064,  SUM(M_AGE65) AS M_AGE65,

/*���� ���� �׷캰 */
SUM(F_AGE0064) AS F_AGE0064,  SUM(F_AGE65) AS F_AGE65 FROM

A.DAT GROUP BY SGGKEY ;QUIT;

/*��¥�ڷ�� ī��Ʈ �ڷ� ���� */
PROC SQL; CREATE TABLE A.TOT_final as select * from a.SGGdate as a left join a.tot as b on a.key=b.SGGkey; quit;

/*���� �ڷ� ����*/
DATA A.&DISEASE._Dailycount; 

/*������ ���� ���� */
RETAIN DATE YEAR MONTH DAY SGG &DISEASE. &DISEASE._M &DISEASE._F &DISEASE._AGE0064 &DISEASE._AGE0065 
&DISEASE._M_AGE0064 &DISEASE._M_AGE65
&DISEASE._F_AGE0064 &DISEASE._F_AGE65; 
LENGTH YEAR $4. MONTH $2. DAY $2. SIDO $2.;

SET A.TOT_FINAL;

/*���̺�� ��ũ�θ� ���缭 ���� */
RENAME 
TOT=&DISEASE. 
MALE=&DISEASE._M 
FEMALE=&DISEASE._F 
AGE0064    =&DISEASE._AGE0064 
AGE65       =&DISEASE._AGE65
M_AGE0064=&DISEASE._M_AGE0064 
M_AGE65   =&DISEASE._M_AGE65
F_AGE0064 =&DISEASE._F_AGE0064 
F_AGE65    =&DISEASE._F_AGE65
;

/*��¥�� �õ� ���� ���� */
DATE=CAT(SUBSTR(KEY,1,4),"-",SUBSTR(KEY,5,2),"-",SUBSTR(KEY,7,2));
YEAR=SUBSTR(DATE,1,4);
MONTH=SUBSTR(DATE,6,2);
DAY=SUBSTR(DATE,9,2);
SIDO=SUBSTR(KEY,10,2);
SGG=SUBSTR(KEY,10,5);

/* MISSING�γ����� 0���� �޲��ֱ� */
IF TOT            ="." THEN TOT       =0; 
IF MALE          ="." THEN MALE     =0; 
IF FEMALE       ="." THEN FEMALE =0;

IF AGE0064      ="." THEN AGE0064      =0; 
IF AGE65         ="." THEN AGE65         =0; 
IF M_AGE0064  ="." THEN M_AGE0064  =0; 
IF M_AGE65     ="." THEN M_AGE65     =0; 
IF F_AGE0064   ="." THEN F_AGE0064  =0; 
IF F_AGE65      ="." THEN F_AGE65     =0; 

DROP SGGKEY;
RUN;

/*�ڷ� ����*/
PROC SORT DATA=A.&DISEASE._Dailycount; BY SGG DATE ; RUN;

/*ī�װ����� ���� (��ü, ����, ����, �õ���)*/
PROC SQL; 
/*������ */
CREATE TABLE A.Z AS SELECT YEAR, 
SUM(&DISEASE.) AS TOT,  SUM(&DISEASE._M) AS MALE, SUM(&DISEASE._F) AS FEMALE,
SUM(&DISEASE._AGE0064) AS AGE0064, 
SUM(&DISEASE._AGE65) AS AGE65,
SUM(&DISEASE._M_AGE0064) AS M_AGE0064, 
SUM(&DISEASE._M_AGE65) AS M_AGE65,
SUM(&DISEASE._F_AGE0064) AS F_AGE0064, 
SUM(&DISEASE._F_AGE65) AS F_AGE65

FROM A.&DISEASE._DAILYCOUNT GROUP BY YEAR; QUIT;

Options firstobs=1 obs=max;
PROC TRANSPOSE DATA=A.Z PREFIX=Y_ OUT=A.Z_T;
ID YEAR; RUN;
/*label ����*/
data a.z_t; set a.z_t; rename _name_=category; run;

/*���̺� ���� */
DATA A.Z_T1; OPTIONS FIRSTOBS=1 OBS=1 ; SET A.Z_T; RUN; /*��ü*/
DATA A.Z_T2; OPTIONS FIRSTOBS=2 OBS=3 ; SET A.Z_T; RUN; /*����*/
DATA A.Z_T3; OPTIONS FIRSTOBS=4 OBS=5; SET A.Z_T; RUN; /*���� �׷캰*/

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
%DISEASE_COUNT(otherredutemp   ,"T69","T69",K=3); /*�񵿰� �� ��Ÿ (Other effects of reduced temperature) T69*/
%DISEASE_COUNT(aki                      ,"N17","N17",K=3); /*�޼� �żջ� N17*/
%DISEASE_COUNT(kidney                ,"N00","N29",K=3); /*������ȯ N00-N29*/
%DISEASE_COUNT(dm                     ,"E10","E14",K=3); /*�索 E10-E14*/
%DISEASE_COUNT(intestinal_infec   ,"A00","A09",K=3); /*�尨�� A00-A09*/

/*����� ������ ��û ��ȯ�ڵ�*/
%DISEASE_COUNT(mental                ,"F00","F99",K=3); /*������ȯ(��ü) F00-F99*/
%DISEASE_COUNT(organic_mental     ,"F00","F09",K=3); /*������ȯ(������ �������) F00-F09*/
%DISEASE_COUNT(schizophrenia      ,"F20","F29",K=3); /*������ȯ(������ �п� �� �������) F20-F29*/
%DISEASE_COUNT(mood                 ,"F30","F39",K=3); /*������ȯ(������) F30-F39*/
%DISEASE_COUNT(somatoform         ,"F40","F48",K=3); /*������ȯ(�Ű��������) F40-48*/
%DISEASE_COUNT(behavioural         ,"F50","F59",K=3); /*������ȯ(�ൿ���) F50-F59*/
%DISEASE_COUNT(developmental     ,"F84","F84",K=3); /*������ȯ(�ߴ����) F84*/
%DISEASE_COUNT(suicide               ,"X60","X84",K=3); /*�ڻ����, ������ ���� X60-X84*/

/*������ ������ ��û ��ȯ�ڵ�*/
%DISEASE_COUNT(Asphyxiation       ,"T71","T71",K=3); /*Asphyxiation T71*/
%DISEASE_COUNT(Cellulitis             ,"L03","L03",K=3); /*Cellulitis L03*/
%DISEASE_COUNT(Frostbite            ,"T33","T34",K=3); /*Frostbite T33-T34*/
%DISEASE_COUNT(ADS                 ,"W69","W74",K=3); /*Accidental drowning and submersion W69-W74*/

%DISEASE_COUNT(TA                   ,"V01","V99",K=3); /*Transport accidents  V01-V99*/
%DISEASE_COUNT(inj_pedestrians    ,"V01","V09",K=3); /*Injuries to pedestrians V01-V09*/
%DISEASE_COUNT(inj_pedal            ,"V10","V19",K=3); /*Injuries to pedal cyclists V10-V19*/
%DISEASE_COUNT(inj_transport       ,"V20","V99",K=3); /*Other transport injuries V20-V99*/
%DISEASE_COUNT(injuries_FSH      ,"X00","X19",K=3); /*Injuries from fire, smoke, and hot objects or fluids X00-X19*/

%DISEASE_COUNT(poisoning          ,"X40","X49",K=3); /*Poisoning or contact with corrosive substances X40-X49*/
%DISEASE_COUNT(Falls                 ,"W00","W19",K=3); /*Falls W00-W19*/

/*4�� �� */
%DISEASE_COUNT(TIA                  ,"G458","G458",K=4); /*�ϰ��� ������ ������ G458-G459*/



/*****************************************************************************************/
/*****************************************************************************************/
/*��ȯ�ڵ尡 ���������� �ʰ� ���� �ִ� ���  */

/*��������ȯ ��ü I60-I67, I690-I694,G458-G459 */
DATA A.cerebvas ;  SET A.NEDIS_R;
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
DATA A.hemoStroke ;   SET A.NEDIS_R;
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
DATA A.ischStroke ;   SET A.NEDIS_R;
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
DATA A.otherStroke ;   SET A.NEDIS_R;
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
DATA A.heatrelated ;    SET A.NEDIS_R;
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
DATA A.frostrelated ;   SET A.NEDIS_R;
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

/*�ѷ���ȯ ���� T68, T69, X31*/
DATA A.Hypothermia ;   SET A.NEDIS_R;
FORMAT E_DDATE YYMMDD10. ;

/*�ش� ��ȯ ICD �ڵ� ���� */
/*��� ���� �ڵ� */
IF 
SUBSTR(DIS_A01,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_A02,1,3) IN ("T68","T69","X31") OR
SUBSTR(DIS_A03,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_A04,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_A05,1,3) IN ("T68","T69","X31") OR
SUBSTR(DIS_A06,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_A07,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_A08,1,3) IN ("T68","T69","X31") OR
SUBSTR(DIS_A09,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_A10,1,3) IN ("T68","T69","X31") OR
SUBSTR(DIS_A11,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_A12,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_A13,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_A14,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_A15,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_A16,1,3) IN ("T68","T69","X31") OR
SUBSTR(DIS_A17,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_A18,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_A19,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_A20,1,3) IN ("T68","T69","X31") OR 

/*��� ���� �ڵ� */
SUBSTR(DIS_E_A01,1,3) IN ("T68","T69","X31") OR
SUBSTR(DIS_E_A02,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_E_A03,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_E_A04,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_E_A05,1,3) IN ("T68","T69","X31") OR
SUBSTR(DIS_E_A06,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_E_A07,1,3) IN ("T68","T69","X31") OR
SUBSTR(DIS_E_A08,1,3) IN ("T68","T69","X31") OR
SUBSTR(DIS_E_A09,1,3) IN ("T68","T69","X31") OR
SUBSTR(DIS_E_A10,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_E_A11,1,3) IN ("T68","T69","X31") OR
SUBSTR(DIS_E_A12,1,3) IN ("T68","T69","X31") OR
SUBSTR(DIS_E_A13,1,3) IN ("T68","T69","X31") OR
SUBSTR(DIS_E_A14,1,3) IN ("T68","T69","X31") OR
SUBSTR(DIS_E_A15,1,3) IN ("T68","T69","X31") OR
SUBSTR(DIS_E_A16,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_E_A17,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_E_A18,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_E_A19,1,3) IN ("T68","T69","X31") OR 
SUBSTR(DIS_E_A20,1,3) IN ("T68","T69","X31")  ;

/*���޽� �������� ��¥ ����  */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP HOSPT DIS_B01-DIS_B20 DIS_E_B01-DIS_E_B20 SGG_TF ;
RUN;

/*Electric shock T754, W85, W86, W87*/
DATA A.Electric ;   SET A.NEDIS_R;
FORMAT E_DDATE YYMMDD10. ;

/*�ش� ��ȯ ICD �ڵ� ���� */
/*��� ���� �ڵ� */
IF 
SUBSTR(DIS_A01,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A01,1,4) IN ("T754") OR
SUBSTR(DIS_A02,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A02,1,4) IN ("T754") OR
SUBSTR(DIS_A03,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A03,1,4) IN ("T754") OR
SUBSTR(DIS_A04,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A04,1,4) IN ("T754") OR
SUBSTR(DIS_A05,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A05,1,4) IN ("T754") OR
SUBSTR(DIS_A06,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A06,1,4) IN ("T754") OR
SUBSTR(DIS_A07,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A07,1,4) IN ("T754") OR
SUBSTR(DIS_A08,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A08,1,4) IN ("T754") OR
SUBSTR(DIS_A09,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A09,1,4) IN ("T754") OR
SUBSTR(DIS_A10,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A10,1,4) IN ("T754") OR
SUBSTR(DIS_A11,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A11,1,4) IN ("T754") OR
SUBSTR(DIS_A12,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A12,1,4) IN ("T754") OR
SUBSTR(DIS_A13,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A13,1,4) IN ("T754") OR
SUBSTR(DIS_A14,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A14,1,4) IN ("T754") OR
SUBSTR(DIS_A15,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A15,1,4) IN ("T754") OR
SUBSTR(DIS_A16,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A16,1,4) IN ("T754") OR
SUBSTR(DIS_A17,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A17,1,4) IN ("T754") OR
SUBSTR(DIS_A18,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A18,1,4) IN ("T754") OR
SUBSTR(DIS_A19,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A19,1,4) IN ("T754") OR
SUBSTR(DIS_A20,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_A20,1,4) IN ("T754") OR

/*��� ���� �ڵ� */
SUBSTR(DIS_E_A01,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A01,1,4) IN ("T754") OR
SUBSTR(DIS_E_A02,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A02,1,4) IN ("T754") OR 
SUBSTR(DIS_E_A03,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A03,1,4) IN ("T754") OR 
SUBSTR(DIS_E_A04,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A04,1,4) IN ("T754") OR 
SUBSTR(DIS_E_A05,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A05,1,4) IN ("T754") OR
SUBSTR(DIS_E_A06,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A06,1,4) IN ("T754") OR 
SUBSTR(DIS_E_A07,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A07,1,4) IN ("T754") OR
SUBSTR(DIS_E_A08,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A08,1,4) IN ("T754") OR
SUBSTR(DIS_E_A09,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A09,1,4) IN ("T754") OR
SUBSTR(DIS_E_A10,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A10,1,4) IN ("T754") OR 
SUBSTR(DIS_E_A11,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A11,1,4) IN ("T754") OR
SUBSTR(DIS_E_A12,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A12,1,4) IN ("T754") OR
SUBSTR(DIS_E_A13,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A13,1,4) IN ("T754") OR
SUBSTR(DIS_E_A14,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A14,1,4) IN ("T754") OR
SUBSTR(DIS_E_A15,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A15,1,4) IN ("T754") OR
SUBSTR(DIS_E_A16,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A16,1,4) IN ("T754") OR 
SUBSTR(DIS_E_A17,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A17,1,4) IN ("T754") OR 
SUBSTR(DIS_E_A18,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A18,1,4) IN ("T754") OR 
SUBSTR(DIS_E_A19,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A19,1,4) IN ("T754") OR 
SUBSTR(DIS_E_A20,1,3) IN ("W85","W86","W87") OR SUBSTR(DIS_E_A20,1,4) IN ("T754") ;

/*���޽� �������� ��¥ ����  */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP HOSPT DIS_B01-DIS_B20 DIS_E_B01-DIS_E_B20 SGG_TF ;
RUN;

/*Burns and Explosions T20-T32, X00-X09, X10-X19*/
DATA A.burn ;   SET A.NEDIS_R;
FORMAT E_DDATE YYMMDD10. ;

/*�ش� ��ȯ ICD �ڵ� ���� */
/*��� ���� �ڵ� */
IF 
SUBSTR(DIS_A01,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A01,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A02,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A02,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A03,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A03,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A04,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A04,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A05,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A05,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A06,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A06,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A07,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A07,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A08,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A08,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A09,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A09,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A10,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A10,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A11,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A11,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A12,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A12,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A13,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A13,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A14,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A14,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A15,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A15,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A16,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A16,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A17,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A17,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A18,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A18,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A19,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A19,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_A20,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_A20,1,3) IN ("T30","T31","T32") OR

/*��� ���� �ڵ� */
SUBSTR(DIS_E_A01,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A01,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_E_A02,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A02,1,3) IN ("T30","T31","T32") OR 
SUBSTR(DIS_E_A03,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A03,1,3) IN ("T30","T31","T32") OR 
SUBSTR(DIS_E_A04,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A04,1,3) IN ("T30","T31","T32") OR 
SUBSTR(DIS_E_A05,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A05,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_E_A06,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A06,1,3) IN ("T30","T31","T32") OR 
SUBSTR(DIS_E_A07,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A07,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_E_A08,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A08,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_E_A09,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A09,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_E_A10,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A10,1,3) IN ("T30","T31","T32") OR 
SUBSTR(DIS_E_A11,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A11,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_E_A12,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A12,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_E_A13,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A13,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_E_A14,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A14,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_E_A15,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A15,1,3) IN ("T30","T31","T32") OR
SUBSTR(DIS_E_A16,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A16,1,3) IN ("T30","T31","T32") OR 
SUBSTR(DIS_E_A17,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A17,1,3) IN ("T30","T31","T32") OR 
SUBSTR(DIS_E_A18,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A18,1,3) IN ("T30","T31","T32") OR 
SUBSTR(DIS_E_A19,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A19,1,3) IN ("T30","T31","T32") OR 
SUBSTR(DIS_E_A20,1,2) IN ("X0","X1","T2") OR SUBSTR(DIS_E_A20,1,3) IN ("T30","T31","T32") ;

/*���޽� �������� ��¥ ����  */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP HOSPT DIS_B01-DIS_B20 DIS_E_B01-DIS_E_B20 SGG_TF ;
RUN;

/*Other external causes of accidental injury  W00-X59*/
DATA A.inj_others ;   SET A.NEDIS_R;
FORMAT E_DDATE YYMMDD10. ;

/*�ش� ��ȯ ICD �ڵ� ���� */
/*��� ���� �ڵ� */
IF 
SUBSTR(DIS_A01,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A01,1,1) IN ("W") OR
SUBSTR(DIS_A02,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A02,1,1) IN ("W") OR
SUBSTR(DIS_A03,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A03,1,1) IN ("W") OR
SUBSTR(DIS_A04,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A04,1,1) IN ("W") OR
SUBSTR(DIS_A05,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A05,1,1) IN ("W") OR
SUBSTR(DIS_A06,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A06,1,1) IN ("W") OR
SUBSTR(DIS_A07,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A07,1,1) IN ("W") OR
SUBSTR(DIS_A08,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A08,1,1) IN ("W") OR
SUBSTR(DIS_A09,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A09,1,1) IN ("W") OR
SUBSTR(DIS_A10,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A10,1,1) IN ("W") OR
SUBSTR(DIS_A11,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A11,1,1) IN ("W") OR
SUBSTR(DIS_A12,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A12,1,1) IN ("W") OR
SUBSTR(DIS_A13,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A13,1,1) IN ("W") OR
SUBSTR(DIS_A14,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A14,1,1) IN ("W") OR
SUBSTR(DIS_A15,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A15,1,1) IN ("W") OR
SUBSTR(DIS_A16,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A16,1,1) IN ("W") OR
SUBSTR(DIS_A17,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A17,1,1) IN ("W") OR
SUBSTR(DIS_A18,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A18,1,1) IN ("W") OR
SUBSTR(DIS_A19,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A19,1,1) IN ("W") OR
SUBSTR(DIS_A20,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_A20,1,1) IN ("W") OR

/*��� ���� �ڵ� */
SUBSTR(DIS_E_A01,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A01,1,1) IN ("W") OR
SUBSTR(DIS_E_A02,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A02,1,1) IN ("W") OR 
SUBSTR(DIS_E_A03,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A03,1,1) IN ("W") OR 
SUBSTR(DIS_E_A04,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A04,1,1) IN ("W") OR 
SUBSTR(DIS_E_A05,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A05,1,1) IN ("W") OR
SUBSTR(DIS_E_A06,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A06,1,1) IN ("W") OR 
SUBSTR(DIS_E_A07,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A07,1,1) IN ("W") OR
SUBSTR(DIS_E_A08,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A08,1,1) IN ("W") OR
SUBSTR(DIS_E_A09,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A09,1,1) IN ("W") OR
SUBSTR(DIS_E_A10,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A10,1,1) IN ("W") OR 
SUBSTR(DIS_E_A11,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A11,1,1) IN ("W") OR
SUBSTR(DIS_E_A12,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A12,1,1) IN ("W") OR
SUBSTR(DIS_E_A13,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A13,1,1) IN ("W") OR
SUBSTR(DIS_E_A14,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A14,1,1) IN ("W") OR
SUBSTR(DIS_E_A15,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A15,1,1) IN ("W") OR
SUBSTR(DIS_E_A16,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A16,1,1) IN ("W") OR 
SUBSTR(DIS_E_A17,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A17,1,1) IN ("W") OR 
SUBSTR(DIS_E_A18,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A18,1,1) IN ("W") OR 
SUBSTR(DIS_E_A19,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A19,1,1) IN ("W") OR 
SUBSTR(DIS_E_A20,1,2) IN ("X0","X1","X2","X3","X4","X5") OR SUBSTR(DIS_E_A20,1,1) IN ("W") ;

/*���޽� �������� ��¥ ����  */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP HOSPT DIS_B01-DIS_B20 DIS_E_B01-DIS_E_B20 SGG_TF ;
RUN;


/*Total injury and external causes (Excluding medical complication) (S00-T79, V01-X59)*/
DATA A.tot_injury ;   SET A.NEDIS_R;
FORMAT E_DDATE YYMMDD10. ;

/*�ش� ��ȯ ICD �ڵ� ���� */
/*��� ���� �ڵ� */
IF 
SUBSTR(DIS_A01,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A01,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A02,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A02,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A03,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A03,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A04,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A04,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A05,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A05,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A06,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A06,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A07,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A07,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A08,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A08,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A09,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A09,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A10,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A10,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A11,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A11,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A12,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A12,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A13,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A13,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A14,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A14,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A15,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A15,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A16,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A16,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A17,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A17,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A18,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A18,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A19,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A19,1,1) IN ("S","V","W") OR
SUBSTR(DIS_A20,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_A20,1,1) IN ("S","V","W") OR

/*��� ���� �ڵ� */
SUBSTR(DIS_E_A01,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A01,1,1) IN ("S","V","W") OR
SUBSTR(DIS_E_A02,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A02,1,1) IN ("S","V","W") OR 
SUBSTR(DIS_E_A03,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A03,1,1) IN ("S","V","W") OR 
SUBSTR(DIS_E_A04,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A04,1,1) IN ("S","V","W") OR 
SUBSTR(DIS_E_A05,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A05,1,1) IN ("S","V","W") OR
SUBSTR(DIS_E_A06,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A06,1,1) IN ("S","V","W") OR 
SUBSTR(DIS_E_A07,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A07,1,1) IN ("S","V","W") OR
SUBSTR(DIS_E_A08,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A08,1,1) IN ("S","V","W") OR
SUBSTR(DIS_E_A09,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A09,1,1) IN ("S","V","W") OR
SUBSTR(DIS_E_A10,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A10,1,1) IN ("S","V","W") OR 
SUBSTR(DIS_E_A11,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A11,1,1) IN ("S","V","W") OR
SUBSTR(DIS_E_A12,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A12,1,1) IN ("S","V","W") OR
SUBSTR(DIS_E_A13,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A13,1,1) IN ("S","V","W") OR
SUBSTR(DIS_E_A14,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A14,1,1) IN ("S","V","W") OR
SUBSTR(DIS_E_A15,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A15,1,1) IN ("S","V","W") OR
SUBSTR(DIS_E_A16,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A16,1,1) IN ("S","V","W") OR 
SUBSTR(DIS_E_A17,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A17,1,1) IN ("S","V","W") OR 
SUBSTR(DIS_E_A18,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A18,1,1) IN ("S","V","W") OR 
SUBSTR(DIS_E_A19,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A19,1,1) IN ("S","V","W") OR 
SUBSTR(DIS_E_A20,1,2) IN ("X0","X1","X2","X3","X4","X5","T0","T1","T2","T3","T4","T5","T6","T7") OR SUBSTR(DIS_E_A20,1,1) IN ("S","V","W") ;

/*���޽� �������� ��¥ ����  */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP HOSPT DIS_B01-DIS_B20 DIS_E_B01-DIS_E_B20 SGG_TF ;
RUN;

/*���� S00-S99, T00-T99, U00-U99*/
DATA A.accd ;   SET A.NEDIS_R;
FORMAT E_DDATE YYMMDD10. ;

/*�ش� ��ȯ ICD �ڵ� ���� */
/*��� ���� �ڵ� */
IF 
SUBSTR(DIS_A01,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A02,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A03,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A04,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A05,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A06,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A07,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A08,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A09,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A10,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A11,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A12,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A13,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A14,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A15,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A16,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A17,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A18,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A19,1,1) IN ("S","T","U") OR
SUBSTR(DIS_A20,1,1) IN ("S","T","U") OR

/*��� ���� �ڵ� */
SUBSTR(DIS_E_A01,1,1) IN ("S","T","U") OR
SUBSTR(DIS_E_A02,1,1) IN ("S","T","U") OR 
SUBSTR(DIS_E_A03,1,1) IN ("S","T","U") OR 
SUBSTR(DIS_E_A04,1,1) IN ("S","T","U") OR 
SUBSTR(DIS_E_A05,1,1) IN ("S","T","U") OR
SUBSTR(DIS_E_A06,1,1) IN ("S","T","U") OR 
SUBSTR(DIS_E_A07,1,1) IN ("S","T","U") OR
SUBSTR(DIS_E_A08,1,1) IN ("S","T","U") OR
SUBSTR(DIS_E_A09,1,1) IN ("S","T","U") OR
SUBSTR(DIS_E_A10,1,1) IN ("S","T","U") OR 
SUBSTR(DIS_E_A11,1,1) IN ("S","T","U") OR
SUBSTR(DIS_E_A12,1,1) IN ("S","T","U") OR
SUBSTR(DIS_E_A13,1,1) IN ("S","T","U") OR
SUBSTR(DIS_E_A14,1,1) IN ("S","T","U") OR
SUBSTR(DIS_E_A15,1,1) IN ("S","T","U") OR
SUBSTR(DIS_E_A16,1,1) IN ("S","T","U") OR 
SUBSTR(DIS_E_A17,1,1) IN ("S","T","U") OR 
SUBSTR(DIS_E_A18,1,1) IN ("S","T","U") OR 
SUBSTR(DIS_E_A19,1,1) IN ("S","T","U") OR 
SUBSTR(DIS_E_A20,1,1) IN ("S","T","U") ;

/*���޽� �������� ��¥ ����  */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP HOSPT DIS_B01-DIS_B20 DIS_E_B01-DIS_E_B20 SGG_TF ;
RUN;

/*Fracture (S02, S12, S22, S32, S42, S52, S62, S72, S82, S92, T02, T08, T10, T12, T142)*/
DATA A.Fracture ;   SET A.NEDIS_R;
FORMAT E_DDATE YYMMDD10. ;

/*�ش� ��ȯ ICD �ڵ� ���� */
/*��� ���� �ڵ� */
IF 
SUBSTR(DIS_A01,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A01,1,4) IN ("T142") OR
SUBSTR(DIS_A02,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A02,1,4) IN ("T142") OR
SUBSTR(DIS_A03,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A03,1,4) IN ("T142") OR
SUBSTR(DIS_A04,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A04,1,4) IN ("T142") OR
SUBSTR(DIS_A05,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A05,1,4) IN ("T142") OR
SUBSTR(DIS_A06,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A06,1,4) IN ("T142") OR
SUBSTR(DIS_A07,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A07,1,4) IN ("T142") OR
SUBSTR(DIS_A08,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A08,1,4) IN ("T142") OR
SUBSTR(DIS_A09,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A09,1,4) IN ("T142") OR
SUBSTR(DIS_A10,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A10,1,4) IN ("T142") OR
SUBSTR(DIS_A11,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A11,1,4) IN ("T142") OR
SUBSTR(DIS_A12,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A12,1,4) IN ("T142") OR
SUBSTR(DIS_A13,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A13,1,4) IN ("T142") OR
SUBSTR(DIS_A14,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A14,1,4) IN ("T142") OR
SUBSTR(DIS_A15,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A15,1,4) IN ("T142") OR
SUBSTR(DIS_A16,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A16,1,4) IN ("T142") OR
SUBSTR(DIS_A17,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A17,1,4) IN ("T142") OR
SUBSTR(DIS_A18,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A18,1,4) IN ("T142") OR
SUBSTR(DIS_A19,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A19,1,4) IN ("T142") OR
SUBSTR(DIS_A20,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_A20,1,4) IN ("T142") OR

/*��� ���� �ڵ� */
SUBSTR(DIS_E_A01,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A01,1,4) IN ("T142") OR
SUBSTR(DIS_E_A02,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A02,1,4) IN ("T142") OR
SUBSTR(DIS_E_A03,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A03,1,4) IN ("T142") OR
SUBSTR(DIS_E_A04,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A04,1,4) IN ("T142") OR
SUBSTR(DIS_E_A05,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A05,1,4) IN ("T142") OR
SUBSTR(DIS_E_A06,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A06,1,4) IN ("T142") OR
SUBSTR(DIS_E_A07,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A07,1,4) IN ("T142") OR
SUBSTR(DIS_E_A08,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A08,1,4) IN ("T142") OR
SUBSTR(DIS_E_A09,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A09,1,4) IN ("T142") OR
SUBSTR(DIS_E_A10,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A10,1,4) IN ("T142") OR
SUBSTR(DIS_E_A11,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A11,1,4) IN ("T142") OR
SUBSTR(DIS_E_A12,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A12,1,4) IN ("T142") OR
SUBSTR(DIS_E_A13,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A13,1,4) IN ("T142") OR
SUBSTR(DIS_E_A14,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A14,1,4) IN ("T142") OR
SUBSTR(DIS_E_A15,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A15,1,4) IN ("T142") OR
SUBSTR(DIS_E_A16,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A16,1,4) IN ("T142") OR
SUBSTR(DIS_E_A17,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A17,1,4) IN ("T142") OR
SUBSTR(DIS_E_A18,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A18,1,4) IN ("T142") OR
SUBSTR(DIS_E_A19,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A19,1,4) IN ("T142") OR
SUBSTR(DIS_E_A20,1,3) IN ("S02","S12","S22","S32","S42","S52","S62","S72","S82","S92","T02","T08","T10","T12") OR SUBSTR(DIS_E_A20,1,4) IN ("T142");                        

/*���޽� �������� ��¥ ����  */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP HOSPT DIS_B01-DIS_B20 DIS_E_B01-DIS_E_B20 SGG_TF ;
RUN;

/*Traumatic brain injury 
S06
S02.0, S02.1, S02.3, S02.7?S02.9, S04.0, S07.0, S07.1, S07.8, S07.9, S09.7?S09.9, T01.0, T02.0, T04.0, T06.0, T90.1, T90.2, T90.4, T.90.5, T90.8, T90.9*/
DATA A.traumatic_brain ;   SET A.NEDIS_R;
FORMAT E_DDATE YYMMDD10. ;

/*�ش� ��ȯ ICD �ڵ� ���� */
/*��� ���� �ڵ� */
IF 
SUBSTR(DIS_A01,1,3) IN ("S06") OR SUBSTR(DIS_A01,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A02,1,3) IN ("S06") OR SUBSTR(DIS_A02,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A03,1,3) IN ("S06") OR SUBSTR(DIS_A03,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A04,1,3) IN ("S06") OR SUBSTR(DIS_A04,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A05,1,3) IN ("S06") OR SUBSTR(DIS_A05,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A06,1,3) IN ("S06") OR SUBSTR(DIS_A06,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A07,1,3) IN ("S06") OR SUBSTR(DIS_A07,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A08,1,3) IN ("S06") OR SUBSTR(DIS_A08,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A09,1,3) IN ("S06") OR SUBSTR(DIS_A09,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A10,1,3) IN ("S06") OR SUBSTR(DIS_A10,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A11,1,3) IN ("S06") OR SUBSTR(DIS_A11,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A12,1,3) IN ("S06") OR SUBSTR(DIS_A12,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A13,1,3) IN ("S06") OR SUBSTR(DIS_A13,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A14,1,3) IN ("S06") OR SUBSTR(DIS_A14,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A15,1,3) IN ("S06") OR SUBSTR(DIS_A15,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A16,1,3) IN ("S06") OR SUBSTR(DIS_A16,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A17,1,3) IN ("S06") OR SUBSTR(DIS_A17,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A18,1,3) IN ("S06") OR SUBSTR(DIS_A18,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A19,1,3) IN ("S06") OR SUBSTR(DIS_A19,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_A20,1,3) IN ("S06") OR SUBSTR(DIS_A20,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR

/*��� ���� �ڵ� */
SUBSTR(DIS_E_A01,1,3) IN ("S06") OR SUBSTR(DIS_E_A01,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A02,1,3) IN ("S06") OR SUBSTR(DIS_E_A02,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A03,1,3) IN ("S06") OR SUBSTR(DIS_E_A03,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A04,1,3) IN ("S06") OR SUBSTR(DIS_E_A04,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A05,1,3) IN ("S06") OR SUBSTR(DIS_E_A05,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A06,1,3) IN ("S06") OR SUBSTR(DIS_E_A06,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A07,1,3) IN ("S06") OR SUBSTR(DIS_E_A07,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A08,1,3) IN ("S06") OR SUBSTR(DIS_E_A08,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A09,1,3) IN ("S06") OR SUBSTR(DIS_E_A09,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A10,1,3) IN ("S06") OR SUBSTR(DIS_E_A10,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A11,1,3) IN ("S06") OR SUBSTR(DIS_E_A11,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A12,1,3) IN ("S06") OR SUBSTR(DIS_E_A12,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A13,1,3) IN ("S06") OR SUBSTR(DIS_E_A13,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A14,1,3) IN ("S06") OR SUBSTR(DIS_E_A14,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A15,1,3) IN ("S06") OR SUBSTR(DIS_E_A15,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A16,1,3) IN ("S06") OR SUBSTR(DIS_E_A16,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A17,1,3) IN ("S06") OR SUBSTR(DIS_E_A17,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A18,1,3) IN ("S06") OR SUBSTR(DIS_E_A18,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A19,1,3) IN ("S06") OR SUBSTR(DIS_E_A19,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909") OR
SUBSTR(DIS_E_A20,1,3) IN ("S06") OR SUBSTR(DIS_E_A20,1,4) IN ("S020","S021","S023","S027","S028","S029","S040","S070","S071","S078","S079","S097","S098","S099","T010","T020","T040","T060","T901","T902","T904","T905","T908","T909");                        

/*���޽� �������� ��¥ ����  */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP HOSPT DIS_B01-DIS_B20 DIS_E_B01-DIS_E_B20 SGG_TF ;
RUN;

/*****************************************************************************************/
/*****************************************************************************************/
%MACRO DISEASE_COUNT2(DISEASE);

/*������ ���� */
PROC SORT DATA=A.&DISEASE.; BY E_DDATE SIDO_R AGE_GROUP; RUN;

/*���� ī��Ʈ �������� ������ */
DATA A.DAT ;SET A.&DISEASE.;

/*��ü */
TOT=1; 

/*����*/
IF SEX="M" THEN MALE=1; ELSE MALE=0;
IF SEX="F" THEN FEMALE=1; ELSE FEMALE=0;

/*�� ���� ���� 1*/
IF SEX="M" & AGE0064=1 THEN M_AGE0064=1; ELSE M_AGE0064=0; /*65�� �̸� & ���� */
IF SEX="M" & AGE65=1    THEN M_AGE65=1; ELSE M_AGE65=0;       /*65�� �̻� & ���� */

IF SEX="F" & AGE0064=1 THEN F_AGE0064=1; ELSE F_AGE0064=0; /*65�� �̸� & ���� */
IF SEX="F" & AGE65=1    THEN F_AGE65=1; ELSE F_AGE65=0;       /*65�� �̻� & ���� */

/*��¥��+�ñ��� key */
SGGKEY=COMPRESS(E_DATE)||("-")||COMPRESS(SGG); 
RUN;

/*���� �׸񺰷� ���ϸ� ī��Ʈ ���� */
PROC SQL;CREATE TABLE A.TOT AS SELECT SGGKEY, 
/*��ü*/
SUM(TOT) AS TOT, 

/*����*/
SUM(MALE) AS MALE, SUM(FEMALE) AS FEMALE,

/*���� �׷� 65���̸�/65�� �̻� */
SUM(AGE0064) AS AGE0064, SUM(AGE65) AS AGE65,

/*���� ���� �׷캰  */
SUM(M_AGE0064) AS M_AGE0064,  SUM(M_AGE65) AS M_AGE65,

/*���� ���� �׷캰 */
SUM(F_AGE0064) AS F_AGE0064,  SUM(F_AGE65) AS F_AGE65 FROM

A.DAT GROUP BY SGGKEY ;QUIT;

/*��¥�ڷ�� ī��Ʈ �ڷ� ���� */
PROC SQL; CREATE TABLE A.TOT_final as select * from a.SGGdate as a left join a.tot as b on a.key=b.SGGkey; quit;

/*���� �ڷ� ����*/
DATA A.&DISEASE._Dailycount; 

/*������ ���� ���� */
RETAIN DATE YEAR MONTH DAY SGG &DISEASE. &DISEASE._M &DISEASE._F &DISEASE._AGE0064 &DISEASE._AGE0065 
&DISEASE._M_AGE0064 &DISEASE._M_AGE65
&DISEASE._F_AGE0064 &DISEASE._F_AGE65; 
LENGTH YEAR $4. MONTH $2. DAY $2. SIDO $2.;

SET A.TOT_FINAL;

/*���̺�� ��ũ�θ� ���缭 ���� */
RENAME 
TOT=&DISEASE. 
MALE=&DISEASE._M 
FEMALE=&DISEASE._F 
AGE0064    =&DISEASE._AGE0064 
AGE65       =&DISEASE._AGE65
M_AGE0064=&DISEASE._M_AGE0064 
M_AGE65   =&DISEASE._M_AGE65
F_AGE0064 =&DISEASE._F_AGE0064 
F_AGE65    =&DISEASE._F_AGE65
;

/*��¥�� �õ� ���� ���� */
DATE=CAT(SUBSTR(KEY,1,4),"-",SUBSTR(KEY,5,2),"-",SUBSTR(KEY,7,2));
YEAR=SUBSTR(DATE,1,4);
MONTH=SUBSTR(DATE,6,2);
DAY=SUBSTR(DATE,9,2);
SIDO=SUBSTR(KEY,10,2);
SGG=SUBSTR(KEY,10,5);

/* MISSING�γ����� 0���� �޲��ֱ� */
IF TOT            ="." THEN TOT       =0; 
IF MALE          ="." THEN MALE     =0; 
IF FEMALE       ="." THEN FEMALE =0;

IF AGE0064      ="." THEN AGE0064      =0; 
IF AGE65         ="." THEN AGE65         =0; 
IF M_AGE0064  ="." THEN M_AGE0064  =0; 
IF M_AGE65     ="." THEN M_AGE65     =0; 
IF F_AGE0064   ="." THEN F_AGE0064  =0; 
IF F_AGE65      ="." THEN F_AGE65     =0; 

DROP SGGKEY;
RUN;

/*�ڷ� ����*/
PROC SORT DATA=A.&DISEASE._Dailycount; BY SGG DATE ; RUN;

/*ī�װ����� ���� (��ü, ����, ����, �õ���)*/
PROC SQL; 
/*������ */
CREATE TABLE A.Z AS SELECT YEAR, 
SUM(&DISEASE.) AS TOT,  SUM(&DISEASE._M) AS MALE, SUM(&DISEASE._F) AS FEMALE,
SUM(&DISEASE._AGE0064) AS AGE0064, 
SUM(&DISEASE._AGE65) AS AGE65,
SUM(&DISEASE._M_AGE0064) AS M_AGE0064, 
SUM(&DISEASE._M_AGE65) AS M_AGE65,
SUM(&DISEASE._F_AGE0064) AS F_AGE0064, 
SUM(&DISEASE._F_AGE65) AS F_AGE65

FROM A.&DISEASE._DAILYCOUNT GROUP BY YEAR; QUIT;

Options firstobs=1 obs=max;
PROC TRANSPOSE DATA=A.Z PREFIX=Y_ OUT=A.Z_T;
ID YEAR; RUN;
/*label ����*/
data a.z_t; set a.z_t; rename _name_=category; run;

/*���̺� ���� */
DATA A.Z_T1; OPTIONS FIRSTOBS=1 OBS=1 ; SET A.Z_T; RUN; /*��ü*/
DATA A.Z_T2; OPTIONS FIRSTOBS=2 OBS=3 ; SET A.Z_T; RUN; /*����*/
DATA A.Z_T3; OPTIONS FIRSTOBS=4 OBS=5; SET A.Z_T; RUN; /*���� �׷캰*/

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

%DISEASE_COUNT2(cerebvas);     /*��������ȯ ��ü I60-I67, I690-I694,G458-G459 */
%DISEASE_COUNT2(hemoStroke); /*������ ������ I60-I62, I690-I692 */
%DISEASE_COUNT2(ischStroke);    /*������ ������ I63, I65-I67, I693 */
%DISEASE_COUNT2(otherStroke); /*��Ÿ ������ I64, I694 */
%DISEASE_COUNT2(heatrelated);  /*�¿���ȯ ���� E86,T67 */
%DISEASE_COUNT2(frostrelated); /*�ѷ���ȯ ���� T33-T35,T68,T69 */
%DISEASE_COUNT2(Hypothermia); /*Hypothermia T68, T69, X31 */
%DISEASE_COUNT2(Electric); /*Electric shock T754, W85, W86, W87*/
%DISEASE_COUNT2(burn); /*Burns and Explosions T20-T32, X00-X09, X10-X19 */
%DISEASE_COUNT2(inj_others); /*Other external causes of accidental injury  W00-X59 */
%DISEASE_COUNT2(accd); /*����  S00-S99, T00-T99, U00-U99 */
%DISEASE_COUNT2(tot_injury); /*Total injury and external causes (Excluding medical complication)  S00-T79, V01-X59*/
%DISEASE_COUNT2(Fracture); /*Fracture  S02.0, S02.1, S02.3, S02.7?S02.9, S04.0, S06, S07.0, S07.1, S07.8, S07.9, S09.7?S09.9, T01.0, T02.0, T04.0, T06.0, T90.1, T90.2, T90.4, T.90.5, T90.8, T90.9 */
%DISEASE_COUNT2(traumatic_brain); /*Traumatic brain injury  S02.0, S02.1, S02.3, S02.7?S02.9, S04.0, S06, S07.0, S07.1, S07.8, S07.9, S09.7?S09.9, T01.0, T02.0, T04.0, T06.0, T90.1, T90.2, T90.4, T.90.5, T90.8, T90.9 */


/*****************************************************************************************/
/*****************************************************************************************/
/*���� ���� �ڷ� ����*/
PROC EXPORT DATA=A.Circ_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\Circ_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.ischhd_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\ischhd_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.angina_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\angina_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.mi_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\MI_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.RESP_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\RESP_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.pneum_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\pneum_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.acuteup_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\acuteup_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.acutelow_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\acutelow_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.copd_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\copd_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.asthma_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\asthma_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.heat_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\heat_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.voldep_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\voldep_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.frost_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\frost_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.Otherredutemp_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\Otherredutemp_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.aki_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\aki_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.kidney_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\kidneyi_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.dm_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\dm_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.intestinal_infec_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\intestinal_infec_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.mental_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\mental_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.Organic_mental_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\Organic_mental_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.schizophrenia_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\schizophrenia_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.mood_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\mood_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.somatoform_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\somatoform_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.behavioural_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\behavioural_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.Developmental_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\Developmental_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.Suicide_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\Suicide_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.Asphyxiation_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\Asphyxiation_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.Cellulitis_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\Cellulitis_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.Frostbite_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\Frostbite_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.ADS_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\ADS_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.TA_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\TA_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.inj_pedestrians_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\inj_pedestrians_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.Inj_pedal_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\Inj_pedal_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.Inj_transport_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\Inj_transport_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.injuries_FSH_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\injuries_FSH_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.poisoning_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\poisoning_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.FALLS_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\FALLS_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.TIA_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\TIA_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.cerebvas_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\cerebvas_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.hemoStroke_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\hemoStroke_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.ischStroke_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\ischStroke_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.otherStroke_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\otherStroke_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.heatrelated_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\heatrelated_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.frostrelated_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\frostrelated_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.Hypothermia_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\Hypothermia_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.Electric_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\Electric_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.burn_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\burn_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.inj_others_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\inj_others_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.accd_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\accd_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.tot_injury_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\tot_injury_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.Fracture_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\Fracture_dailycount.CSV' DBMS=CSV REPLACE; RUN;
PROC EXPORT DATA=A.traumatic_brain_dailycount OUTFILE='"D:\�Ѿ��\NEDIS\out\traumatic_brain_dailycount.CSV' DBMS=CSV REPLACE; RUN;

/*****************************************************************************************/
/*****************************************************************************************/
/*�� ���̺� ���� �ϱ� */
PROC EXPORT DATA=A.Circ_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="��ü������"; RUN;
PROC EXPORT DATA=A.ischhd_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="����������ȯ"; RUN;
PROC EXPORT DATA=A.angina_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="������"; RUN;
PROC EXPORT DATA=A.MI_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="�ɱٰ��"; RUN;
PROC EXPORT DATA=A.resp_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="��üȣ���"; RUN;
PROC EXPORT DATA=A.pneum_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="���"; RUN;
PROC EXPORT DATA=A.acutelow_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="�Ϻ�ȣ���"; RUN;
PROC EXPORT DATA=A.acuteup_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="���ȣ���"; RUN;
PROC EXPORT DATA=A.copd_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="COPD"; RUN;
PROC EXPORT DATA=A.asthma_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="õ��"; RUN;
PROC EXPORT DATA=A.heat_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="�����ȯ"; RUN;
PROC EXPORT DATA=A.voldep_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="������Ż��"; RUN;
PROC EXPORT DATA=A.frost_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="����"; RUN;
PROC EXPORT DATA=A.Otherredutemp_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="�񵿰�ױ�Ÿ"; RUN;
PROC EXPORT DATA=A.AKI_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="�޼��żջ�"; RUN;
PROC EXPORT DATA=A.kidney_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="������ȯ"; RUN;
PROC EXPORT DATA=A.dm_table    outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="�索"; RUN;
PROC EXPORT DATA=A.intestinal_infec_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="��ü�尨��"; RUN;
PROC EXPORT DATA=A.mental_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="������ȯ"; RUN;
PROC EXPORT DATA=A.Organic_mental_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="�������������"; RUN;
PROC EXPORT DATA=A.schizophrenia_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="������"; RUN;
PROC EXPORT DATA=A.mood_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="������"; RUN;
PROC EXPORT DATA=A.somatoform_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="�Ű��������"; RUN;
PROC EXPORT DATA=A.behavioural_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="�ൿ���"; RUN;
PROC EXPORT DATA=A.Developmental_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="�ߴ����"; RUN;
PROC EXPORT DATA=A.Suicide_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="�ڻ�"; RUN;
PROC EXPORT DATA=A.Asphyxiation_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="Asphyxiation"; RUN;
PROC EXPORT DATA=A.Cellulitis_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="Cellulitis"; RUN;
PROC EXPORT DATA=A.Frostbite_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="Frostbite"; RUN;
PROC EXPORT DATA=A.ADS_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="ADS"; RUN;
PROC EXPORT DATA=A.TA_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="TA"; RUN;
PROC EXPORT DATA=A.inj_pedestrians_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="inj_pedestrians"; RUN;
PROC EXPORT DATA=A.Inj_pedal_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="Inj_pedal"; RUN;
PROC EXPORT DATA=A.Inj_transport_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="Inj_transport"; RUN;
PROC EXPORT DATA=A.injuries_FSH_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="injuries_FSH"; RUN;
PROC EXPORT DATA=A.poisoning_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="poisoning"; RUN;
PROC EXPORT DATA=A.FALLS_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="FALLS"; RUN;
PROC EXPORT DATA=A.TIA_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="TIA"; RUN;
PROC EXPORT DATA=A.cerebvas_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="cerebvas"; RUN;
PROC EXPORT DATA=A.hemoStroke_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="hemoStroke"; RUN;
PROC EXPORT DATA=A.ischStroke_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="ischStroke"; RUN;
PROC EXPORT DATA=A.otherStroke_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="otherStroke"; RUN;
PROC EXPORT DATA=A.heatrelated_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="heatrelated"; RUN;
PROC EXPORT DATA=A.frostrelated_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="frostrelated"; RUN;
PROC EXPORT DATA=A.Hypothermia_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="Hypothemia"; RUN;
PROC EXPORT DATA=A.Electric_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="Electric"; RUN;
PROC EXPORT DATA=A.burn_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="burn"; RUN;
PROC EXPORT DATA=A.inj_others_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="inj_others"; RUN;
PROC EXPORT DATA=A.accd_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="accd"; RUN;
PROC EXPORT DATA=A.tot_injury_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="tot_injury"; RUN;
PROC EXPORT DATA=A.fracture_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="fracture"; RUN;
PROC EXPORT DATA=A.traumatic_brain_table outfile="D:\�Ѿ��\NEDIS\out\frequency_table2.XLSX"    DBMS=EXCEL REPLACE; SHEET="traumatic_brain"; RUN;
