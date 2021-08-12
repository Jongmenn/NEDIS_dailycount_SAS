/*SAS 자료 정리용 폴더 */
libname a'D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outdata';

/*원시 자료 불러오기 */
/*proc import out=A.NEDIS1415 DATAFILE="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\제20210501호_ptmi_1415.CSV"*/
/*DBMS= CSV REPLACE;RUN;*/
/*proc import out=A.NEDIS16 DATAFILE="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\제20210501호_ptmi_16.CSV"*/
/*DBMS= CSV REPLACE;RUN;*/
/*proc import out=A.NEDIS17 DATAFILE="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\제20210501호_ptmi_17.CSV"*/
/*DBMS= CSV REPLACE;RUN;*/
/*proc import out=A.NEDIS18 DATAFILE="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\제20210501호_ptmi_18.CSV"*/
/*DBMS= CSV REPLACE;RUN;*/
/*proc import out=A.NEDIS19 DATAFILE="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\제20210501호_ptmi_19.CSV"*/
/*DBMS= CSV REPLACE;RUN;*/

/*****************************************************************************************/
/*****************************************************************************************/
/* 변수 테이블 
PTMIEMAR	    응급의료기관지역(시군구코드)            ->E_SGG
PTMIEMNM	    응급의료기관명                                 ->HOSPT
PTMIINDT     	내원일자                                           ->E_DATE
PTMIBRTD	    연령                                                 ->AGE_GROUP
PTMISEXX	    성별                                                 ->SEX
PTMIGUCD   	환자주소지(시군구코드)                      ->P_SGG ** (애로 맞추기) 
PTMIAKDT    	발병일자                                           ->DATE  
DGOTDIAG	   "퇴실진단코드 (최대 20개까지만 제공)"  ->DIS_A
DGOTDGGB 	퇴실진단구분                                     ->DIS_B
DGDCDIAG	   "퇴원진단코드 (응급실 경유한 경우)"      ->DIS_E_A
DGDCDGGB 	퇴원진단구분(응급실 경유한 경우)"       ->DIS_E_B
*/

/*원시자료 MERGE 후 변수 정리 */
DATA A.NEDIS; SET A.NEDIS1415 A.NEDIS16 A.NEDIS17 A.NEDIS18 A.NEDIS19;

RENAME PTMIEMAR=E_SGG PTMIEMNM=HOSPT PTMIINDT=E_DATE PTMIBRTD=AGE_GROUP PTMISEXX=SEX PTMIGUCD=P_SGG PTMIAKDT=DATE
/*응급실 퇴실 진단 코드 */
DGOTDIAG01=DIS_A01    DGOTDGGB01=DIS_B01 
DGOTDIAG02=DIS_A02    DGOTDGGB02=DIS_B02
DGDCDIAG01=DIS_E_A01 DGDCDGGB01=DIS_E_B01
DGDCDIAG02=DIS_E_A02 DGDCDGGB02=DIS_E_B02
;

/*시도 변수 추가 */
SIDO =SUBSTR(left(PTMIEMAR),1,2);

/*응급실(내원) 방문년원일 */
E_YR   =SUBSTR(LEFT(PTMIINDT),1,4);
E_MON=SUBSTR(LEFT(PTMIINDT),5,2);
E_DAY =SUBSTR(LEFT(PTMIINDT),7,2);

/*발병일자 (응급실 방문일 보다 빠를 수 있음) */
YR   =SUBSTR(LEFT(PTMIAKDT),1,4);
MON=SUBSTR(LEFT(PTMIAKDT),5,2);
DAY  =SUBSTR(LEFT(PTMIAKDT),7,2);

/*퇴실진단 코드 정리 3단 상병 */
ICD1_3=SUBSTR(DGOTDIAG01,1,3);
ICD2_3=SUBSTR(DGOTDIAG02,1,3); 

/*퇴실진단 코드 정리 4단 상병 (질환 중 일부 4단 상병 존재) */
ICD1_4=SUBSTR(DGOTDIAG01,1,4);
ICD2_4=SUBSTR(DGOTDIAG02,1,4); 

/*ICD missing 확인용 대문자만 */
I1=SUBSTR(DGOTDIAG01,1,1);
I2=SUBSTR(DGOTDIAG02,1,1);

KEEP PTMIEMAR PTMIEMNM PTMIINDT PTMIBRTD PTMISEXX PTMIGUCD PTMIAKDT DGOTDIAG01 DGOTDGGB01 DGDCDIAG01 DGDCDGGB01 
DGOTDIAG02 DGOTDGGB02 DGDCDIAG02 DGDCDGGB02 SIDO E_YR E_MON E_DAY YR MON DAY ICD1_3 ICD2_3 ICD1_4 ICD2_4 I1 I2 ; 
RUN;

/*****************************************************************************************/
/*****************************************************************************************/
/*데이터 대략적인 빈도, 결측 있는거 제거 후 재확인하기 */
PROC FREQ DATA=A.NEDIS; TABLES E_SGG HOSPT AGE_GROUP SEX P_SGG E_YR YR I1 I2 DIS_B01 DIS_B02 SIDO ; RUN;

/*데이터 클리닝 및 자료 정리 */
DATA A.NEDIS_R; SET A.NEDIS;
IF AGE_GROUP^=".";   /*연령 미상 제외*/
IF P_SGG="." THEN SGG=E_SGG; ELSE SGG=P_SGG; /*환자의 거주지 정보 없는 경우는 응급실 내원 거주지로 넣어주기 (오분류 있을수 있지만)*/
IF P_SGG="." THEN SGG_TF=1; ELSE SGG_TF=0;       /*환자의 거주지 정보 없는 경우는 1, 존재하면 0*/
SIDO_R= SUBSTR(LEFT(SGG),1,2);                        /*새로 정의한 시군구에 해당하는 시도 자료로 변경*/

/*연령 그룹 자료 만들기 */
/*5세 단위로 연령 그룹 */
IF AGE_GROUP <=2  THEN AG=1;     /*0-4세*/
IF AGE_GROUP =3    THEN AG=2;     /*5-9세*/
IF AGE_GROUP =4    THEN AG=3;     /*10-14세*/
IF AGE_GROUP =5    THEN AG=4;     /*15-19세*/
IF AGE_GROUP =6    THEN AG=5;     /*20-24세*/
IF AGE_GROUP =7    THEN AG=6;     /*25-29세*/
IF AGE_GROUP =8    THEN AG=7;     /*30-34세*/
IF AGE_GROUP =9    THEN AG=8;     /*35-39세*/
IF AGE_GROUP =10  THEN AG=9;     /*40-44세*/
IF AGE_GROUP =11  THEN AG=10;   /*45-49세*/
IF AGE_GROUP =12  THEN AG=11;   /*50-54세*/
IF AGE_GROUP =13  THEN AG=12;   /*55-59세*/
IF AGE_GROUP =14  THEN AG=13;   /*60-64세*/
IF AGE_GROUP =15  THEN AG=14;   /*65-69세*/
IF AGE_GROUP =16  THEN AG=15;   /*70-74세*/
IF AGE_GROUP =17  THEN AG=16;   /*75-79세*/
IF AGE_GROUP =18  THEN AG=17;   /*80-84세*/
IF AGE_GROUP>=19 THEN AG=18;   /*85+ */

/*15세 미만, 15-64세 ,65세 이상 */
IF AGE_GROUP <=4 THEN AG2=1; 
IF AGE_GROUP >=5 & AGE_GROUP <=14 THEN AG2=2;
IF AGE_GROUP >=15 THEN AG2=3;

/*사용안하기로한 변수들 제거하기 */
DROP HOSPT DIS_A01 DIS_B01 DIS_A02 DIS_B02 DIS_E_A01 DIS_E_B01 DIS_E_A02 DIS_E_B02 I1 I2 SIDO;
RUN;


PROC FREQ DATA=A.NEDIS_R ; TABLES AGE_GROUP AG AG2 SGG SIDO_R E_YR; RUN;
/*****************************************************************************************/
/*****************************************************************************************/
/*시도, 시군구 레이블 자료 불러와서 연계하기 */
PROC IMPORT OUT=A.SGG DATAFILE="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\시군구코드.CSV" DBMS=CSV REPLACE; RUN;
PROC IMPORT OUT=A.SIDO DATAFILE="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\시도코드.CSV" DBMS=CSV REPLACE; RUN;

/*시도자료 속성 변경 */
DATA A.SIDO; SET A.SIDO;
SIDO_R=INPUT(SIDO,$12.);
DROP SIDO;
RUN;

/*NEDIS자료와 시군구, 시도 자료 연계 (한글 레이블)*/
PROC SQL; CREATE TABLE A.NEDIS_R2 AS SELECT * FROM A.NEDIS_R AS A LEFT JOIN A.SGG AS B ON A.SGG=B.SGG; QUIT;
PROC SQL; CREATE TABLE A.NEDIS_R2 AS SELECT * FROM A.NEDIS_R2 AS A LEFT JOIN A.SIDO AS B ON A.SIDO_R =B.SIDO_R;QUIT;

/*****************************************************************************************/
/*****************************************************************************************/
DATA A.DAT ; 
RETAIN E_DDATE E_YR  SIDO_R SIDO_KR SGG SGG_KR SGG SEX ICD1 ICD2 DDATE DIFF_DATE;
SET A.NEDIS_R2;
FORMAT E_DDATE YYMMDD10. DDATE YYMMDD10.;

/*해당 질환 ICD 코드 추출 */
IF ICD1_3>="I00" & ICD1_3 <="I99" OR ICD2_3>="I00" & ICD2_3 <="I99" ;

/*발병일자 미상인 경우 MISSING 처리 */
IF DATE=11111111  THEN YR=".";
IF DATE=11111111  THEN MON=".";
IF DATE=11111111  THEN DAY=".";
IF DATE=11111111  THEN DATE=".";

/*날짜 형식 변경 해서 응급실 내원일자- 발병일자 차이 비교 */
E_DDATE =MDY(E_MON,E_DAY,E_YR); /*응급실 내원일자*/
DDATE    =MDY(MON,DAY,YR);           /*발병일자*/

IF DDATE="-" THEN DDATE=".";
DIFF_DATE=E_DDATE-DDATE;
DROP E_MON E_DAY YR MON DAY SGG_TF E_SGG P_SGG E_DATE DATE;
RUN;

/*입내원일자-발병일자 차이 크게 나는 경우 찾아보기 */
PROC FREQ DATA=A.DAT; TABLES DIFF_DATE; RUN;
DATA A.DAT2; SET A.DAT; IF DIFF_DATE >1000; RUN;

/*****************************************************************************************/
/*****************************************************************************************/

/*날짜 자료 일일 건수 자료 missing인 날 없이 채우기 위해  */
DATA A.DDATE ; 
FORMAT DATE YYMMDD10.;
DO I = 1 to 2191 BY 1;       
DATE=MDY(01,01,2014)+I-1; /* 반복문으로 날짜 만들기 2014년 1월 1일부터 2019년 12월 31일 까지 */
OUTPUT;
END;
DROP I;
RUN;
DATA A.DDATE; SET A.DDATE;
DATE2= PUT(DATE,YYMMDDN8.);RUN; /*날짜 -> 문자로 형식 변경 */

/*위에서 생성한 기준연도 날짜 자료랑 시도 자료 MERGE하기 (이때 CROSS JOIN)*/
proc sql; create table a.SIDODATE as select * from a.ddate cross join  a.SIDO; quit;

/*KEY값 만 남기기 KEY=날짜+시군구  (날짜와 시군구 조합별 일자 계산, 3652일 * 250 =913000) */
DATA a.SIDOdate; SET a.SIDOdate; KEY=COMPRESS(DATE2)||("-")||COMPRESS(SIDO_R); KEEP KEY SIDO_KR; RUN;


/*표로 옮길때 공백 미리 만들어주기 */
data a.null_tb; 
Options obs=max;
input category$ Y_2014 Y_2015 Y_2016 Y_2017 Y_2018 Y_2019;

CARDS;
"" "" "" "" "" "" "" 
;
RUN;

/*****************************************************************************************/
/*****************************************************************************************/
/*4단 상병도 있으니 다시할때 변수 추가하기 */
%MACRO DISEASE_COUNT(DISEASE,S_CODE,E_CODE);
DATA A.DAT ; 
RETAIN E_DDATE E_DATE E_YR  SIDO_R SIDO_KR SGG SGG_KR SGG SEX ICD1_3 ICD2_3 ICD1_4 ICD_2_4 ;
SET A.NEDIS_R2;
FORMAT E_DDATE YYMMDD10. ;

/*해당 질환 ICD 코드 추출 */
IF (ICD1_3>=&S_CODE. & ICD1_3 <=&E_CODE.) OR (ICD2_3>=&S_CODE. & ICD2_3 <=&E_CODE.) ;

/*날짜 형식 변경 해서 응급실 내원일자- 발병일자 차이 비교 */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP E_MON E_DAY YR MON DAY SGG_TF E_SGG P_SGG  DATE;
RUN;

/*데이터 정렬 */
PROC SORT DATA=A.DAT; BY E_DDATE SIDO_R AG; RUN;

/*변수 카운트 목적으로 재정리 */
DATA A.DAT ;SET A.DAT;

/*전체 */
TOT=1; 

/*성별*/
IF SEX="M" THEN MALE=1; ELSE MALE=0;
IF SEX="F" THEN FEMALE=1; ELSE FEMALE=0;

/*연령 그룹별, 5세 단위 */
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

/*연령 그룹 5세, 15-64, 65세 이상*/
IF AG2=1 THEN AG2_01=1; ELSE AG2_01=0;
IF AG2=2 THEN AG2_02=1; ELSE AG2_02=0;
IF AG2=3 THEN AG2_03=1; ELSE AG2_03=0;

/*성 연령 조합 1*/
IF SEX="M" & AG=1   THEN M_AG01=1; ELSE M_AG01=0; /*0-4세 & 남성 */
IF SEX="M" & AG=2   THEN M_AG02=1; ELSE M_AG02=0; /*5-9세 & 남성 */
IF SEX="M" & AG=3   THEN M_AG03=1; ELSE M_AG03=0; /*10-14세 & 남성 */
IF SEX="M" & AG=4   THEN M_AG04=1; ELSE M_AG04=0; /*15-19세 & 남성 */
IF SEX="M" & AG=5   THEN M_AG05=1; ELSE M_AG05=0; /*20-24세 & 남성 */
IF SEX="M" & AG=6   THEN M_AG06=1; ELSE M_AG06=0; /*25-29세 & 남성 */
IF SEX="M" & AG=7   THEN M_AG07=1; ELSE M_AG07=0; /*30-34세 & 남성 */
IF SEX="M" & AG=8   THEN M_AG08=1; ELSE M_AG08=0; /*35-39세 & 남성 */
IF SEX="M" & AG=9   THEN M_AG09=1; ELSE M_AG09=0; /*40-44세 & 남성 */
IF SEX="M" & AG=10 THEN M_AG10=1; ELSE M_AG10=0; /*45-49세 & 남성 */
IF SEX="M" & AG=11 THEN M_AG11=1; ELSE M_AG11=0; /*50-54세 & 남성 */
IF SEX="M" & AG=12 THEN M_AG12=1; ELSE M_AG12=0; /*55-59세 & 남성 */
IF SEX="M" & AG=13 THEN M_AG13=1; ELSE M_AG13=0; /*60-64세 & 남성 */
IF SEX="M" & AG=14 THEN M_AG14=1; ELSE M_AG14=0; /*65-69세 & 남성 */
IF SEX="M" & AG=15 THEN M_AG15=1; ELSE M_AG15=0; /*70-74세 & 남성 */
IF SEX="M" & AG=16 THEN M_AG16=1; ELSE M_AG16=0; /*75-79세 & 남성 */
IF SEX="M" & AG=17 THEN M_AG17=1; ELSE M_AG17=0; /*80-84세 & 남성 */ 
IF SEX="M" & AG=18 THEN M_AG18=1; ELSE M_AG18=0; /*85세 이상 & 남성 */

IF SEX="F" & AG=1   THEN F_AG01=1; ELSE F_AG01=0; /*0-4세 & 여성 */
IF SEX="F" & AG=2   THEN F_AG02=1; ELSE F_AG02=0; /*5-9세 & 여성 */
IF SEX="F" & AG=3   THEN F_AG03=1; ELSE F_AG03=0; /*10-14세 & 여성 */
IF SEX="F" & AG=4   THEN F_AG04=1; ELSE F_AG04=0; /*15-19세 & 여성 */
IF SEX="F" & AG=5   THEN F_AG05=1; ELSE F_AG05=0; /*20-24세 & 여성 */
IF SEX="F" & AG=6   THEN F_AG06=1; ELSE F_AG06=0; /*25-29세 & 여성 */
IF SEX="F" & AG=7   THEN F_AG07=1; ELSE F_AG07=0; /*30-34세 & 여성 */
IF SEX="F" & AG=8   THEN F_AG08=1; ELSE F_AG08=0; /*35-39세 & 여성 */
IF SEX="F" & AG=9   THEN F_AG09=1; ELSE F_AG09=0; /*40-44세 & 여성 */
IF SEX="F" & AG=10 THEN F_AG10=1; ELSE F_AG10=0; /*45-49세 & 여성 */
IF SEX="F" & AG=11 THEN F_AG11=1; ELSE F_AG11=0; /*50-54세 & 여성 */
IF SEX="F" & AG=12 THEN F_AG12=1; ELSE F_AG12=0; /*55-59세 & 여성 */
IF SEX="F" & AG=13 THEN F_AG13=1; ELSE F_AG13=0; /*60-64세 & 여성 */
IF SEX="F" & AG=14 THEN F_AG14=1; ELSE F_AG14=0; /*65-69세 & 여성 */
IF SEX="F" & AG=15 THEN F_AG15=1; ELSE F_AG15=0; /*70-74세 & 여성 */
IF SEX="F" & AG=16 THEN F_AG16=1; ELSE F_AG16=0; /*75-79세 & 여성 */
IF SEX="F" & AG=17 THEN F_AG17=1; ELSE F_AG17=0; /*80-84세 & 여성 */ 
IF SEX="F" & AG=18 THEN F_AG18=1; ELSE F_AG18=0; /*85세 이상 & 여성 */

/*성 연령 조합 2*/
IF SEX="M" & AG2=1   THEN M_AG2_01=1; ELSE M_AG2_01=0; /*0-4세 & 남성 */
IF SEX="M" & AG2=2   THEN M_AG2_02=1; ELSE M_AG2_02=0; /*15-64세 & 남성 */
IF SEX="M" & AG2=3   THEN M_AG2_03=1; ELSE M_AG2_03=0; /*65세이상 & 남성 */

IF SEX="F" & AG2=1   THEN F_AG2_01=1; ELSE F_AG2_01=0; /*0-4세 & 여성 */
IF SEX="F" & AG2=2   THEN F_AG2_02=1; ELSE F_AG2_02=0; /*15-64세 & 여성 */
IF SEX="F" & AG2=3   THEN F_AG2_03=1; ELSE F_AG2_03=0; /*65세이상 & 여성 */

/*날짜별+시도 key */
KEY=COMPRESS(E_DATE)||("-")||COMPRESS(SIDO_R); 
RUN;

/*개별 항목별로 데일리 카운트 산출 */
PROC SQL;CREATE TABLE A.TOT AS SELECT KEY, 
/*전체*/
SUM(TOT) AS TOT, 

/*성별*/
SUM(MALE) AS MALE, SUM(FEMALE) AS FEMALE,

/*연령 그룹 5세별 */
SUM(AG01) AS AG01, SUM(AG02) AS AG02,  SUM(AG03) AS AG03,  SUM(AG04) AS AG04, 
SUM(AG05) AS AG05, SUM(AG06) AS AG06,  SUM(AG07) AS AG07,  SUM(AG08) AS AG08, 
SUM(AG09) AS AG09, SUM(AG10) AS AG10,  SUM(AG11) AS AG11,  SUM(AG12) AS AG12, 
SUM(AG13) AS AG13, SUM(AG14) AS AG14,  SUM(AG15) AS AG15,  SUM(AG16) AS AG16, 
SUM(AG17) AS AG17, SUM(AG18) AS AG18, 

/*연령 그룹 5세 미만, 15-64세 65세 이상*/
SUM(AG2_01) AS AG2_01, SUM(AG2_02) AS AG2_02,  SUM(AG2_03) AS AG2_03, 

/*남성 연령 그룹별 5세단위 */
SUM(M_AG01) AS M_AG01, SUM(M_AG02) AS M_AG02,  SUM(M_AG03) AS M_AG03,  SUM(M_AG04) AS M_AG04, 
SUM(M_AG05) AS M_AG05, SUM(M_AG06) AS M_AG06,  SUM(M_AG07) AS M_AG07,  SUM(M_AG08) AS M_AG08, 
SUM(M_AG09) AS M_AG09, SUM(M_AG10) AS M_AG10,  SUM(M_AG11) AS M_AG11,  SUM(M_AG12) AS M_AG12, 
SUM(M_AG13) AS M_AG13, SUM(M_AG14) AS M_AG14,  SUM(M_AG15) AS M_AG15,  SUM(M_AG16) AS M_AG16, 
SUM(M_AG17) AS M_AG17, SUM(M_AG18) AS M_AG18, 

/*여성 연령 그룹별 5세 단위*/
SUM(F_AG01) AS F_AG01, SUM(F_AG02) AS F_AG02,  SUM(F_AG03) AS F_AG03,  SUM(F_AG04) AS F_AG04, 
SUM(F_AG05) AS F_AG05, SUM(F_AG06) AS F_AG06,  SUM(F_AG07) AS F_AG07,  SUM(F_AG08) AS F_AG08, 
SUM(F_AG09) AS F_AG09, SUM(F_AG10) AS F_AG10,  SUM(F_AG11) AS F_AG11,  SUM(F_AG12) AS F_AG12, 
SUM(F_AG13) AS F_AG13, SUM(F_AG14) AS F_AG14,  SUM(F_AG15) AS F_AG15,  SUM(F_AG16) AS F_AG16, 
SUM(F_AG17) AS F_AG17, SUM(F_AG18) AS F_AG18, 

/*남성 연령 그룹별 5세 미만, 15-64세, 65세 이상  */
SUM(M_AG2_01) AS M_AG2_01, SUM(M_AG2_02) AS M_AG2_02,  SUM(M_AG2_03) AS M_AG2_03, 
/*여성 연령 그룹별 5세 미만, 15-64세, 65세 이상  */
SUM(F_AG2_01) AS F_AG2_01, SUM(F_AG2_02) AS F_AG2_02,  SUM(F_AG2_03) AS F_AG2_03 FROM

A.DAT GROUP BY KEY ;QUIT;

/*날짜자료와 카운트 자료 연계 */
PROC SQL; CREATE TABLE A.TOT_final as select * from a.sidodate as a left join a.tot as b on a.key=b.key; quit;

/*최종 자료 정리*/
DATA A.&DISEASE._Dailycount; 

/*변수명 순서 정리 */
RETAIN DATE YEAR MONTH DAY  SIDO SIDO_KR &DISEASE. &DISEASE._M &DISEASE._F &DISEASE._AG01-&DISEASE._AG18 &DISEASE._AG2_01-&DISEASE._AG2_03 
&DISEASE._M_AG01-&DISEASE._M_AG18 &DISEASE._F_AG01-&DISEASE._F_AG18 &DISEASE._M_AG2_01-&DISEASE._M_AG2_03 &DISEASE._F_AG2_01-&DISEASE._F_AG2_03;

LENGTH YEAR $4. MONTH $2. DAY $2. SIDO $2.;

SET A.TOT_FINAL;

/*레이블명 매크로명에 맞춰서 변경 */
RENAME TOT=&DISEASE. MALE=&DISEASE._M FEMALE=&DISEASE._F 

AG01-AG18=&DISEASE._AG01-&DISEASE._AG18

AG2_01-AG2_03 =&DISEASE._AG2_01-&DISEASE._AG2_03

M_AG01-M_AG18=&DISEASE._M_AG01-&DISEASE._M_AG18
F_AG01-F_AG18  =&DISEASE._F_AG01-&DISEASE._F_AG18

M_AG2_01-M_AG2_03=&DISEASE._M_AG2_01-&DISEASE._M_AG2_03
F_AG2_01-F_AG2_03  =&DISEASE._F_AG2_01-&DISEASE._F_AG2_03
;

/*날짜랑 시도 변수 생성 */
DATE=CAT(SUBSTR(KEY,1,4),"-",SUBSTR(KEY,5,2),"-",SUBSTR(KEY,7,2));
YEAR=SUBSTR(DATE,1,4);
MONTH=SUBSTR(DATE,6,2);
DAY=SUBSTR(DATE,9,2);

SIDO=SUBSTR(KEY,10,2);

/* MISSING인날들은 0으로 메꿔주기 */
IF TOT       ="." THEN TOT       =0;
IF MALE     ="." THEN MALE     =0;
IF FEMALE  ="." THEN FEMALE =0;
IF AG01      ="." THEN AG01     =0;
IF AG02     ="." THEN AG02      =0;
IF AG03     ="." THEN AG03      =0;
IF AG04     ="." THEN AG04      =0;
IF AG05     ="." THEN AG05      =0;
IF AG06     ="." THEN AG06      =0;
IF AG07     ="." THEN AG07      =0;
IF AG08     ="." THEN AG08      =0;
IF AG09     ="." THEN AG09      =0;
IF AG10     ="." THEN AG10      =0;
IF AG11     ="." THEN AG11      =0;
IF AG12     ="." THEN AG12      =0;
IF AG13     ="." THEN AG13      =0;
IF AG14     ="." THEN AG14      =0;
IF AG15     ="." THEN AG15      =0;
IF AG16     ="." THEN AG16      =0;
IF AG17     ="." THEN AG17      =0;
IF AG18     ="." THEN AG18      =0;
IF AG2_01   ="." THEN AG2_01  =0;
IF AG2_02   ="." THEN AG2_02  =0;
IF AG2_03   ="." THEN AG2_03  =0;
IF M_AG01   ="." THEN M_AG01 =0;
IF M_AG02   ="." THEN M_AG02 =0;
IF M_AG03   ="." THEN M_AG03 =0;
IF M_AG04   ="." THEN M_AG04 =0;
IF M_AG05   ="." THEN M_AG05 =0;
IF M_AG06   ="." THEN M_AG06 =0;
IF M_AG07   ="." THEN M_AG07 =0;
IF M_AG08   ="." THEN M_AG08 =0;
IF M_AG09   ="." THEN M_AG09 =0;
IF M_AG10   ="." THEN M_AG10 =0;
IF M_AG11   ="." THEN M_AG11 =0;
IF M_AG12   ="." THEN M_AG12 =0;
IF M_AG13   ="." THEN M_AG13 =0;
IF M_AG14   ="." THEN M_AG14 =0;
IF M_AG15   ="." THEN M_AG15 =0;
IF M_AG16   ="." THEN M_AG16 =0;
IF M_AG17   ="." THEN M_AG17 =0;
IF M_AG18   ="." THEN M_AG18 =0;
IF F_AG01   ="." THEN F_AG01  =0;
IF F_AG02   ="." THEN F_AG02  =0;
IF F_AG03   ="." THEN F_AG03  =0;
IF F_AG04   ="." THEN F_AG04  =0;
IF F_AG05   ="." THEN F_AG05  =0;
IF F_AG06   ="." THEN F_AG06  =0;
IF F_AG07   ="." THEN F_AG07  =0;
IF F_AG08   ="." THEN F_AG08  =0;
IF F_AG09   ="." THEN F_AG09  =0;
IF F_AG10   ="." THEN F_AG10  =0;
IF F_AG11   ="." THEN F_AG11  =0;
IF F_AG12   ="." THEN F_AG12  =0;
IF F_AG13   ="." THEN F_AG13  =0;
IF F_AG14   ="." THEN F_AG14  =0;
IF F_AG15   ="." THEN F_AG15  =0;
IF F_AG16   ="." THEN F_AG16  =0;
IF F_AG17   ="." THEN F_AG17  =0;
IF F_AG18   ="." THEN F_AG18  =0;
IF M_AG2_01 ="." THEN M_AG2_01=0;
IF M_AG2_02 ="." THEN M_AG2_02=0;
IF M_AG2_03 ="." THEN M_AG2_03=0;
IF F_AG2_01 ="." THEN F_AG2_01=0;
IF F_AG2_02 ="." THEN F_AG2_02=0;
IF F_AG2_03 ="." THEN F_AG2_03=0;

DROP KEY;
RUN;

/*자료 정렬*/
PROC SORT DATA=A.&DISEASE._Dailycount; BY SIDO DATE ; RUN;

/*카테고리별로 집계 (전체, 성별, 연령, 시도별)*/
PROC SQL; 
/*연도별 */
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
/*label 변경*/
data a.z_t; set a.z_t; rename _name_=category; run;

/*테이블 분할 */
DATA A.Z_T1; OPTIONS FIRSTOBS=1 OBS=1 ; SET A.Z_T; RUN; /*전체*/
DATA A.Z_T2; OPTIONS FIRSTOBS=2 OBS=3 ; SET A.Z_T; RUN; /*성별*/
DATA A.Z_T3; OPTIONS FIRSTOBS=4 OBS=21; SET A.Z_T; RUN; /*연령 그룹별*/

Options firstobs=1 obs=max;

/*연도별 시도 합계 */
PROC SQL;  CREATE TABLE A.Z2 AS SELECT YEAR, SIDO, SUM(&DISEASE.) AS TOT FROM A.&DISEASE._DAILYCOUNT GROUP BY YEAR, SIDO; QUIT;

/*테이블 전치, 전치 전 정렬 */
PROC SORT DATA=A.Z2; BY SIDO;
PROC TRANSPOSE DATA=A.Z2 PREFIX=Y_ OUT=A.Z_T4;
BY SIDO; ID YEAR; 
RUN;

data a.z_t4; set a.z_t4;
rename sido=category;
drop _name_; 
run;

/*연도별 월별 합계 */
PROC SQL;  CREATE TABLE A.Z3 AS SELECT YEAR, month, SUM(&DISEASE.) AS TOT FROM A.&DISEASE._DAILYCOUNT GROUP BY YEAR, month; QUIT;

/*테이블 전치, 전치 전 정렬 */
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

/*매크로 적용 */
%DISEASE_COUNT(circ               ,"I00","I99");     /*순환기계 전체 (전체 심혈관) I00-I99*/
%DISEASE_COUNT(ischHD           ,"I20","I25");    /*허혈성 심질환 I20-I25*/
%DISEASE_COUNT(angina           ,"I20","I20");    /*협심증 I20*/
%DISEASE_COUNT(MI                 ,"I21","I25");    /*심근경색 I21-I25*/
%DISEASE_COUNT(resp              ,"J00","J99");   /*호흡기계 전체  J00-J99*/
%DISEASE_COUNT(acuteup         ,"J00","J06");  /*급성 상기도감염 J00-J06*/
%DISEASE_COUNT(pneum           ,"J09","J18");  /*인플루엔자 및 폐렴 J09-J18*/
%DISEASE_COUNT(acutelow        ,"J20","J22");  /*급성 하부호흡기감염 J20-J22*/
%DISEASE_COUNT(copd             ,"J40","J44");  /*만성폐쇄성폐질환 J40-J44*/
%DISEASE_COUNT(asthma          ,"J45","J46");  /*천식 J45-J46*/
%DISEASE_COUNT(heat              ,"T67","T67"); /*고온관련질환 T67*/
%DISEASE_COUNT(voldep           ,"E86","E86"); /*용적고갈탈수 E86*/
%DISEASE_COUNT(frost              ,"T33","T35"); /*동상 T33-T35*/
%DISEASE_COUNT(hypothermia   ,"T68","T68"); /*저체온증 T68*/
%DISEASE_COUNT(otherredutemp,"T69","T69"); /*비동결 및 기타 (Other effects of reduced temperature) T69*/
%DISEASE_COUNT(aki                ,"N17","N17"); /*급성 신손상 N17*/
%DISEASE_COUNT(kidney           ,"N00","N29"); /*신장질환 N00-N29*/
%DISEASE_COUNT(dm                ,"E10","E14"); /*당뇨 E10-E14*/
%DISEASE_COUNT(mental           ,"F31","F39"); /*우울증 F31-F39*/
%DISEASE_COUNT(suicide          ,"X60","X84"); /*자살관련, 고의적 자해 X60-X84*/
%DISEASE_COUNT(intestinal_infec,"A00","A09"); /*장감염 A00-A09*/
%DISEASE_COUNT(cholera        ,"A00","A00"); /*콜레라 A00*/
%DISEASE_COUNT(typhoid_para  ,"A01","A01"); /*장티푸스 및 파라티푸스 A01*/
%DISEASE_COUNT(othersalmone ,"A02","A02"); /*기타 살모넬라감염 A02*/
%DISEASE_COUNT(shigellosis      ,"A03","A03"); /*시겔라증 A03*/
%DISEASE_COUNT(otherbac        ,"A04","A04"); /*기타 세균성 장감염 A04*/
%DISEASE_COUNT(otherbac_food,"A05","A05"); /*달리 분류되지 않은 기타 세균성 음식 매개중독 A05*/
%DISEASE_COUNT(amoebiasis     ,"A06","A06"); /*아메바증 A06*/
%DISEASE_COUNT(otherprotozoal,"A07","A07"); /*기타 원충성 장질환 A07*/
%DISEASE_COUNT(viral_intestinal ,"A08","A08"); /*바이러스성 및 기타 명시된 장감염 A08*/
%DISEASE_COUNT(othergast_coli,"A09","A09"); /*감염성 및 상세불명 기원의 기타 위장염 및 결장염 A09*/
%DISEASE_COUNT(zoster           ,"B02","B02"); /*대상포진 B02*/
%DISEASE_COUNT(vasomotor_allerg,"J30","J30"); /*꽃가루, 혈관운동성 및 앨러지성 비염 J30*/

/*****************************************************************************************/
/*****************************************************************************************/
/*질환코드가 4단 상병이거나  연속적이지 않은 경우  위 코드 수정하기  */

/*뇌혈관질환 전체 I60-I67, I690-I694,G458-G459 */
DATA A.cerebvas ; 
RETAIN E_DDATE E_DATE E_YR  SIDO_R SIDO_KR SGG SGG_KR SGG SEX ICD1_3 ICD2_3 ICD1_4 ICD_2_4 ;
SET A.NEDIS_R2; FORMAT E_DDATE YYMMDD10. ;

/*해당 질환 ICD 코드 추출 */
IF ICD1_3 in ("I60","I61","I62","I63","I64","I65","I66","I67") or ICD2_3 in ("I60","I61","I62","I63","I64","I65","I66","I67") or 
   ICD1_4 in ("I690","I691","I692","I693","I694","G458","G459") or ICD2_4 in ("I690","I691","I692","I693","I694","G458","G459");

/*날짜 형식 변경 해서 응급실 내원일자- 발병일자 차이 비교 */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP E_MON E_DAY YR MON DAY SGG_TF E_SGG P_SGG  DATE;
RUN;

/*출혈성 뇌졸중 I60-I62, I690-I692*/
DATA A.hemoStroke ; 
RETAIN E_DDATE E_DATE E_YR  SIDO_R SIDO_KR SGG SGG_KR SGG SEX ICD1_3 ICD2_3 ICD1_4 ICD_2_4 ;
SET A.NEDIS_R2; FORMAT E_DDATE YYMMDD10. ;

/*해당 질환 ICD 코드 추출 */
IF ICD1_3 in ("I60","I61","I62") or ICD2_3 in ("I60","I61","I62") or 
   ICD1_4 in ("I690","I691","I692") or ICD2_4 in ("I690","I691","I692");

/*날짜 형식 변경 해서 응급실 내원일자- 발병일자 차이 비교 */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP E_MON E_DAY YR MON DAY SGG_TF E_SGG P_SGG  DATE;
RUN;

/*허혈성 뇌졸중 I63, I65-I67, I693*/
DATA A.ischStroke ; 
RETAIN E_DDATE E_DATE E_YR  SIDO_R SIDO_KR SGG SGG_KR SGG SEX ICD1_3 ICD2_3 ICD1_4 ICD_2_4 ;
SET A.NEDIS_R2; FORMAT E_DDATE YYMMDD10. ;

/*해당 질환 ICD 코드 추출 */
IF ICD1_3 in ("I63","I65","I66","I67") or ICD2_3 in ("I63","I65","I66","I67") or 
   ICD1_4 in ("I693") or ICD2_4 in ("I693");

/*날짜 형식 변경 해서 응급실 내원일자- 발병일자 차이 비교 */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP E_MON E_DAY YR MON DAY SGG_TF E_SGG P_SGG  DATE;
RUN;

/*기타 뇌졸중 I64, I694*/
DATA A.otherStroke ; 
RETAIN E_DDATE E_DATE E_YR  SIDO_R SIDO_KR SGG SGG_KR SGG SEX ICD1_3 ICD2_3 ICD1_4 ICD_2_4 ;
SET A.NEDIS_R2; FORMAT E_DDATE YYMMDD10. ;

/*해당 질환 ICD 코드 추출 */
IF ICD1_3 in ("I64") or ICD2_3 in ("I64") or 
   ICD1_4 in ("I694") or ICD2_4 in ("I694");

/*날짜 형식 변경 해서 응급실 내원일자- 발병일자 차이 비교 */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP E_MON E_DAY YR MON DAY SGG_TF E_SGG P_SGG  DATE;
RUN;

/*일과성 허혈성 뇌졸중 G458-G459*/
DATA A.TIA; 
RETAIN E_DDATE E_DATE E_YR  SIDO_R SIDO_KR SGG SGG_KR SGG SEX ICD1_3 ICD2_3 ICD1_4 ICD_2_4 ;
SET A.NEDIS_R2; FORMAT E_DDATE YYMMDD10. ;

/*해당 질환 ICD 코드 추출 */
IF (ICD1_4>="G458" & ICD1_4 <="G459") OR (ICD2_4>="G458"  & ICD2_4 <="G459") ;

/*날짜 형식 변경 해서 응급실 내원일자- 발병일자 차이 비교 */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP E_MON E_DAY YR MON DAY SGG_TF E_SGG P_SGG  DATE;
RUN;
/*온열질환 관련 E86,T67*/
DATA A.heatrelated ; 
RETAIN E_DDATE E_DATE E_YR  SIDO_R SIDO_KR SGG SGG_KR SGG SEX ICD1_3 ICD2_3 ICD1_4 ICD_2_4 ;
SET A.NEDIS_R2; FORMAT E_DDATE YYMMDD10. ;

/*해당 질환 ICD 코드 추출 */
IF ICD1_3 in ("E86","T67") or ICD2_3 in ("E86","T67") ;

/*날짜 형식 변경 해서 응급실 내원일자- 발병일자 차이 비교 */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP E_MON E_DAY YR MON DAY SGG_TF E_SGG P_SGG  DATE;
RUN;

/*한랭질환 관련 T33-T35,T68,T69*/
DATA A.frostrelated ; 
RETAIN E_DDATE E_DATE E_YR  SIDO_R SIDO_KR SGG SGG_KR SGG SEX ICD1_3 ICD2_3 ICD1_4 ICD_2_4 ;
SET A.NEDIS_R2; FORMAT E_DDATE YYMMDD10. ;

/*해당 질환 ICD 코드 추출 */
IF ICD1_3 in ("T33","T34","T35","T68","T69") or ICD2_3 in ("T33","T34","T35","T68","T69") ;

/*날짜 형식 변경 해서 응급실 내원일자- 발병일자 차이 비교 */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP E_MON E_DAY YR MON DAY SGG_TF E_SGG P_SGG  DATE;
RUN;

/*감염병 쯔쯔가무시  A753*/
DATA A.tsutsugamushi; 
RETAIN E_DDATE E_DATE E_YR  SIDO_R SIDO_KR SGG SGG_KR SGG SEX ICD1_3 ICD2_3 ICD1_4 ICD_2_4 ;
SET A.NEDIS_R2; FORMAT E_DDATE YYMMDD10. ;

/*해당 질환 ICD 코드 추출 */
IF  ICD1_4 in ("A753") or ICD2_4 in ("A753");
/*날짜 형식 변경 해서 응급실 내원일자- 발병일자 차이 비교 */
E_DDATE =MDY(E_MON,E_DAY,E_YR);
DROP E_MON E_DAY YR MON DAY SGG_TF E_SGG P_SGG  DATE;
RUN;
/*****************************************************************************************/
/*****************************************************************************************/

%MACRO DISEASE_COUNT2(DISEASE);

/*변수 카운트 목적으로 재정리 */
DATA A.DAT ;SET A.&DISEASE.;

/*전체 */
TOT=1; 

/*성별*/
IF SEX="M" THEN MALE=1; ELSE MALE=0;
IF SEX="F" THEN FEMALE=1; ELSE FEMALE=0;

/*연령 그룹별, 5세 단위 */
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

/*연령 그룹 5세, 15-64, 65세 이상*/
IF AG2=1 THEN AG2_01=1; ELSE AG2_01=0;
IF AG2=2 THEN AG2_02=1; ELSE AG2_02=0;
IF AG2=3 THEN AG2_03=1; ELSE AG2_03=0;

/*성 연령 조합 1*/
IF SEX="M" & AG=1   THEN M_AG01=1; ELSE M_AG01=0; /*0-4세 & 남성 */
IF SEX="M" & AG=2   THEN M_AG02=1; ELSE M_AG02=0; /*5-9세 & 남성 */
IF SEX="M" & AG=3   THEN M_AG03=1; ELSE M_AG03=0; /*10-14세 & 남성 */
IF SEX="M" & AG=4   THEN M_AG04=1; ELSE M_AG04=0; /*15-19세 & 남성 */
IF SEX="M" & AG=5   THEN M_AG05=1; ELSE M_AG05=0; /*20-24세 & 남성 */
IF SEX="M" & AG=6   THEN M_AG06=1; ELSE M_AG06=0; /*25-29세 & 남성 */
IF SEX="M" & AG=7   THEN M_AG07=1; ELSE M_AG07=0; /*30-34세 & 남성 */
IF SEX="M" & AG=8   THEN M_AG08=1; ELSE M_AG08=0; /*35-39세 & 남성 */
IF SEX="M" & AG=9   THEN M_AG09=1; ELSE M_AG09=0; /*40-44세 & 남성 */
IF SEX="M" & AG=10 THEN M_AG10=1; ELSE M_AG10=0; /*45-49세 & 남성 */
IF SEX="M" & AG=11 THEN M_AG11=1; ELSE M_AG11=0; /*50-54세 & 남성 */
IF SEX="M" & AG=12 THEN M_AG12=1; ELSE M_AG12=0; /*55-59세 & 남성 */
IF SEX="M" & AG=13 THEN M_AG13=1; ELSE M_AG13=0; /*60-64세 & 남성 */
IF SEX="M" & AG=14 THEN M_AG14=1; ELSE M_AG14=0; /*65-69세 & 남성 */
IF SEX="M" & AG=15 THEN M_AG15=1; ELSE M_AG15=0; /*70-74세 & 남성 */
IF SEX="M" & AG=16 THEN M_AG16=1; ELSE M_AG16=0; /*75-79세 & 남성 */
IF SEX="M" & AG=17 THEN M_AG17=1; ELSE M_AG17=0; /*80-84세 & 남성 */ 
IF SEX="M" & AG=18 THEN M_AG18=1; ELSE M_AG18=0; /*85세 이상 & 남성 */

IF SEX="F" & AG=1   THEN F_AG01=1; ELSE F_AG01=0; /*0-4세 & 여성 */
IF SEX="F" & AG=2   THEN F_AG02=1; ELSE F_AG02=0; /*5-9세 & 여성 */
IF SEX="F" & AG=3   THEN F_AG03=1; ELSE F_AG03=0; /*10-14세 & 여성 */
IF SEX="F" & AG=4   THEN F_AG04=1; ELSE F_AG04=0; /*15-19세 & 여성 */
IF SEX="F" & AG=5   THEN F_AG05=1; ELSE F_AG05=0; /*20-24세 & 여성 */
IF SEX="F" & AG=6   THEN F_AG06=1; ELSE F_AG06=0; /*25-29세 & 여성 */
IF SEX="F" & AG=7   THEN F_AG07=1; ELSE F_AG07=0; /*30-34세 & 여성 */
IF SEX="F" & AG=8   THEN F_AG08=1; ELSE F_AG08=0; /*35-39세 & 여성 */
IF SEX="F" & AG=9   THEN F_AG09=1; ELSE F_AG09=0; /*40-44세 & 여성 */
IF SEX="F" & AG=10 THEN F_AG10=1; ELSE F_AG10=0; /*45-49세 & 여성 */
IF SEX="F" & AG=11 THEN F_AG11=1; ELSE F_AG11=0; /*50-54세 & 여성 */
IF SEX="F" & AG=12 THEN F_AG12=1; ELSE F_AG12=0; /*55-59세 & 여성 */
IF SEX="F" & AG=13 THEN F_AG13=1; ELSE F_AG13=0; /*60-64세 & 여성 */
IF SEX="F" & AG=14 THEN F_AG14=1; ELSE F_AG14=0; /*65-69세 & 여성 */
IF SEX="F" & AG=15 THEN F_AG15=1; ELSE F_AG15=0; /*70-74세 & 여성 */
IF SEX="F" & AG=16 THEN F_AG16=1; ELSE F_AG16=0; /*75-79세 & 여성 */
IF SEX="F" & AG=17 THEN F_AG17=1; ELSE F_AG17=0; /*80-84세 & 여성 */ 
IF SEX="F" & AG=18 THEN F_AG18=1; ELSE F_AG18=0; /*85세 이상 & 여성 */

/*성 연령 조합 2*/
IF SEX="M" & AG2=1   THEN M_AG2_01=1; ELSE M_AG2_01=0; /*0-4세 & 남성 */
IF SEX="M" & AG2=2   THEN M_AG2_02=1; ELSE M_AG2_02=0; /*15-64세 & 남성 */
IF SEX="M" & AG2=3   THEN M_AG2_03=1; ELSE M_AG2_03=0; /*65세이상 & 남성 */

IF SEX="F" & AG2=1   THEN F_AG2_01=1; ELSE F_AG2_01=0; /*0-4세 & 여성 */
IF SEX="F" & AG2=2   THEN F_AG2_02=1; ELSE F_AG2_02=0; /*15-64세 & 여성 */
IF SEX="F" & AG2=3   THEN F_AG2_03=1; ELSE F_AG2_03=0; /*65세이상 & 여성 */

/*날짜별+시도 key */
KEY=COMPRESS(E_DATE)||("-")||COMPRESS(SIDO_R); 
RUN;

/*개별 항목별로 데일리 카운트 산출 */
PROC SQL;CREATE TABLE A.TOT AS SELECT KEY, 
/*전체*/
SUM(TOT) AS TOT, 

/*성별*/
SUM(MALE) AS MALE, SUM(FEMALE) AS FEMALE,

/*연령 그룹 5세별 */
SUM(AG01) AS AG01, SUM(AG02) AS AG02,  SUM(AG03) AS AG03,  SUM(AG04) AS AG04, 
SUM(AG05) AS AG05, SUM(AG06) AS AG06,  SUM(AG07) AS AG07,  SUM(AG08) AS AG08, 
SUM(AG09) AS AG09, SUM(AG10) AS AG10,  SUM(AG11) AS AG11,  SUM(AG12) AS AG12, 
SUM(AG13) AS AG13, SUM(AG14) AS AG14,  SUM(AG15) AS AG15,  SUM(AG16) AS AG16, 
SUM(AG17) AS AG17, SUM(AG18) AS AG18, 

/*연령 그룹 5세 미만, 15-64세 65세 이상*/
SUM(AG2_01) AS AG2_01, SUM(AG2_02) AS AG2_02,  SUM(AG2_03) AS AG2_03, 

/*남성 연령 그룹별 5세단위 */
SUM(M_AG01) AS M_AG01, SUM(M_AG02) AS M_AG02,  SUM(M_AG03) AS M_AG03,  SUM(M_AG04) AS M_AG04, 
SUM(M_AG05) AS M_AG05, SUM(M_AG06) AS M_AG06,  SUM(M_AG07) AS M_AG07,  SUM(M_AG08) AS M_AG08, 
SUM(M_AG09) AS M_AG09, SUM(M_AG10) AS M_AG10,  SUM(M_AG11) AS M_AG11,  SUM(M_AG12) AS M_AG12, 
SUM(M_AG13) AS M_AG13, SUM(M_AG14) AS M_AG14,  SUM(M_AG15) AS M_AG15,  SUM(M_AG16) AS M_AG16, 
SUM(M_AG17) AS M_AG17, SUM(M_AG18) AS M_AG18, 

/*여성 연령 그룹별 5세 단위*/
SUM(F_AG01) AS F_AG01, SUM(F_AG02) AS F_AG02,  SUM(F_AG03) AS F_AG03,  SUM(F_AG04) AS F_AG04, 
SUM(F_AG05) AS F_AG05, SUM(F_AG06) AS F_AG06,  SUM(F_AG07) AS F_AG07,  SUM(F_AG08) AS F_AG08, 
SUM(F_AG09) AS F_AG09, SUM(F_AG10) AS F_AG10,  SUM(F_AG11) AS F_AG11,  SUM(F_AG12) AS F_AG12, 
SUM(F_AG13) AS F_AG13, SUM(F_AG14) AS F_AG14,  SUM(F_AG15) AS F_AG15,  SUM(F_AG16) AS F_AG16, 
SUM(F_AG17) AS F_AG17, SUM(F_AG18) AS F_AG18, 

/*남성 연령 그룹별 5세 미만, 15-64세, 65세 이상  */
SUM(M_AG2_01) AS M_AG2_01, SUM(M_AG2_02) AS M_AG2_02,  SUM(M_AG2_03) AS M_AG2_03, 
/*여성 연령 그룹별 5세 미만, 15-64세, 65세 이상  */
SUM(F_AG2_01) AS F_AG2_01, SUM(F_AG2_02) AS F_AG2_02,  SUM(F_AG2_03) AS F_AG2_03 FROM

A.DAT GROUP BY KEY ;QUIT;

/*날짜자료와 카운트 자료 연계 */
PROC SQL; CREATE TABLE A.TOT_final as select * from a.sidodate as a left join a.tot as b on a.key=b.key; quit;

/*최종 자료 정리*/
DATA A.&DISEASE._Dailycount; 

/*변수명 순서 정리 */
RETAIN DATE YEAR MONTH DAY  SIDO SIDO_KR &DISEASE. &DISEASE._M &DISEASE._F &DISEASE._AG01-&DISEASE._AG18 &DISEASE._AG2_01-&DISEASE._AG2_03 
&DISEASE._M_AG01-&DISEASE._M_AG18 &DISEASE._F_AG01-&DISEASE._F_AG18 &DISEASE._M_AG2_01-&DISEASE._M_AG2_03 &DISEASE._F_AG2_01-&DISEASE._F_AG2_03;

LENGTH YEAR $4. MONTH $2. DAY $2. SIDO $2.;

SET A.TOT_FINAL;

/*레이블명 매크로명에 맞춰서 변경 */
RENAME TOT=&DISEASE. MALE=&DISEASE._M FEMALE=&DISEASE._F 

AG01-AG18=&DISEASE._AG01-&DISEASE._AG18

AG2_01-AG2_03 =&DISEASE._AG2_01-&DISEASE._AG2_03

M_AG01-M_AG18=&DISEASE._M_AG01-&DISEASE._M_AG18
F_AG01-F_AG18  =&DISEASE._F_AG01-&DISEASE._F_AG18

M_AG2_01-M_AG2_03=&DISEASE._M_AG2_01-&DISEASE._M_AG2_03
F_AG2_01-F_AG2_03  =&DISEASE._F_AG2_01-&DISEASE._F_AG2_03
;

/*날짜랑 시도 변수 생성 */
DATE=CAT(SUBSTR(KEY,1,4),"-",SUBSTR(KEY,5,2),"-",SUBSTR(KEY,7,2));
YEAR=SUBSTR(DATE,1,4);
MONTH=SUBSTR(DATE,6,2);
DAY=SUBSTR(DATE,9,2);

SIDO=SUBSTR(KEY,10,2);

/* MISSING인날들은 0으로 메꿔주기 */
IF TOT       ="." THEN TOT       =0;
IF MALE     ="." THEN MALE     =0;
IF FEMALE  ="." THEN FEMALE =0;
IF AG01      ="." THEN AG01     =0;
IF AG02     ="." THEN AG02      =0;
IF AG03     ="." THEN AG03      =0;
IF AG04     ="." THEN AG04      =0;
IF AG05     ="." THEN AG05      =0;
IF AG06     ="." THEN AG06      =0;
IF AG07     ="." THEN AG07      =0;
IF AG08     ="." THEN AG08      =0;
IF AG09     ="." THEN AG09      =0;
IF AG10     ="." THEN AG10      =0;
IF AG11     ="." THEN AG11      =0;
IF AG12     ="." THEN AG12      =0;
IF AG13     ="." THEN AG13      =0;
IF AG14     ="." THEN AG14      =0;
IF AG15     ="." THEN AG15      =0;
IF AG16     ="." THEN AG16      =0;
IF AG17     ="." THEN AG17      =0;
IF AG18     ="." THEN AG18      =0;
IF AG2_01   ="." THEN AG2_01  =0;
IF AG2_02   ="." THEN AG2_02  =0;
IF AG2_03   ="." THEN AG2_03  =0;
IF M_AG01   ="." THEN M_AG01 =0;
IF M_AG02   ="." THEN M_AG02 =0;
IF M_AG03   ="." THEN M_AG03 =0;
IF M_AG04   ="." THEN M_AG04 =0;
IF M_AG05   ="." THEN M_AG05 =0;
IF M_AG06   ="." THEN M_AG06 =0;
IF M_AG07   ="." THEN M_AG07 =0;
IF M_AG08   ="." THEN M_AG08 =0;
IF M_AG09   ="." THEN M_AG09 =0;
IF M_AG10   ="." THEN M_AG10 =0;
IF M_AG11   ="." THEN M_AG11 =0;
IF M_AG12   ="." THEN M_AG12 =0;
IF M_AG13   ="." THEN M_AG13 =0;
IF M_AG14   ="." THEN M_AG14 =0;
IF M_AG15   ="." THEN M_AG15 =0;
IF M_AG16   ="." THEN M_AG16 =0;
IF M_AG17   ="." THEN M_AG17 =0;
IF M_AG18   ="." THEN M_AG18 =0;
IF F_AG01   ="." THEN F_AG01  =0;
IF F_AG02   ="." THEN F_AG02  =0;
IF F_AG03   ="." THEN F_AG03  =0;
IF F_AG04   ="." THEN F_AG04  =0;
IF F_AG05   ="." THEN F_AG05  =0;
IF F_AG06   ="." THEN F_AG06  =0;
IF F_AG07   ="." THEN F_AG07  =0;
IF F_AG08   ="." THEN F_AG08  =0;
IF F_AG09   ="." THEN F_AG09  =0;
IF F_AG10   ="." THEN F_AG10  =0;
IF F_AG11   ="." THEN F_AG11  =0;
IF F_AG12   ="." THEN F_AG12  =0;
IF F_AG13   ="." THEN F_AG13  =0;
IF F_AG14   ="." THEN F_AG14  =0;
IF F_AG15   ="." THEN F_AG15  =0;
IF F_AG16   ="." THEN F_AG16  =0;
IF F_AG17   ="." THEN F_AG17  =0;
IF F_AG18   ="." THEN F_AG18  =0;
IF M_AG2_01 ="." THEN M_AG2_01=0;
IF M_AG2_02 ="." THEN M_AG2_02=0;
IF M_AG2_03 ="." THEN M_AG2_03=0;
IF F_AG2_01 ="." THEN F_AG2_01=0;
IF F_AG2_02 ="." THEN F_AG2_02=0;
IF F_AG2_03 ="." THEN F_AG2_03=0;

DROP KEY;
RUN;

/*자료 정렬*/
PROC SORT DATA=A.&DISEASE._Dailycount; BY SIDO DATE ; RUN;

/*카테고리별로 집계 (전체, 성별, 연령, 시도별)*/
PROC SQL; 
/*연도별 */
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
/*label 변경*/
data a.z_t; set a.z_t; rename _name_=category; run;

/*테이블 분할 */
DATA A.Z_T1; OPTIONS FIRSTOBS=1 OBS=1 ; SET A.Z_T; RUN; /*전체*/
DATA A.Z_T2; OPTIONS FIRSTOBS=2 OBS=3 ; SET A.Z_T; RUN; /*성별*/
DATA A.Z_T3; OPTIONS FIRSTOBS=4 OBS=21; SET A.Z_T; RUN; /*연령 그룹별*/

Options firstobs=1 obs=max;

/*연도별 시도 합계 */
PROC SQL;  CREATE TABLE A.Z2 AS SELECT YEAR, SIDO, SUM(&DISEASE.) AS TOT FROM A.&DISEASE._DAILYCOUNT GROUP BY YEAR, SIDO; QUIT;

/*테이블 전치, 전치 전 정렬 */
PROC SORT DATA=A.Z2; BY SIDO;
PROC TRANSPOSE DATA=A.Z2 PREFIX=Y_ OUT=A.Z_T4;
BY SIDO; ID YEAR; 
RUN;

data a.z_t4; set a.z_t4;
rename sido=category;
drop _name_; 
run;

/*연도별 월별 합계 */
PROC SQL;  CREATE TABLE A.Z3 AS SELECT YEAR, month, SUM(&DISEASE.) AS TOT FROM A.&DISEASE._DAILYCOUNT GROUP BY YEAR, month; QUIT;

/*테이블 전치, 전치 전 정렬 */
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

%DISEASE_COUNT2(cerebvas);         /*뇌혈관 질환 전체 I60-I67, I690-I694,G458-G459*/
%DISEASE_COUNT2(hemoStroke);     /*출혈성 뇌졸중 I60-I62, I690-I692 */
%DISEASE_COUNT2(ischStroke);       /*허혈성 뇌졸중 I60-I62, I690-I692*/
%DISEASE_COUNT2(otherStroke);      /*기타 뇌졸중 I64, I694*/
%DISEASE_COUNT2(TIA);                 /*일과성 허혈뇌졸중 G458-G459*/
%DISEASE_COUNT2(heatrelated);      /*온열질환 E86,T67*/
%DISEASE_COUNT2(frostrelated);      /*한랭질환 T33-T35,T68,T69*/
%DISEASE_COUNT2(tsutsugamushi); /*쯔쯔가무시 A753*/
/*****************************************************************************************/
/*****************************************************************************************/
/*데일리 카운트 질환별로 산출한 결과 merge 하기 */
/*아무거나 질환 자료 잡고 날짜만 가져오기 ,key는 연계 키 (날짜+시도)*/
data daily; set a.circ_dailycount;
KEY=COMPRESS(DATE)||("-")||COMPRESS(SIDO);
keep KEY date YEAR month day SIDO SIDO_KR ;
RUN;
proc sort data=daily ; by key; run;

/*질환별로 merge할 key값과 질환 편집해서 가져오기 전체, 남,여, 5세미만, 15세미만, 15-64세, 65세 이상 */
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

/*NEDIS 연계목적 기상자료 불러오기*/
data WORK.ENV ; %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
infile 'D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\NEDIS연계기상자료.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
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


DATA ENV; SET ENV;
DATE=PUT(DDATE,YYMMDDN8.);
KEY=COMPRESS(SUBSTR(DATE,1,4))||("-")||COMPRESS(SUBSTR(DATE,5,2))||("-")||COMPRESS(SUBSTR(DATE,7,2))||("-")||COMPRESS(SIDO);
DROP DDATE DATE ENV SIDO;
RUN;

PROC SQL; CREATE TABLE A.DAILYCOUNT AS SELECT * FROM DAILYCOUNT AS A LEFT JOIN ENV AS B ON A.KEY=B.KEY; QUIT;

/*연계키 삭제*/
DATA A.DAILYCOUNT; SET A.DAILYCOUNT;
DROP KEY; RUN;

/*자료 정렬*/
proc sort data=a.dailycount; by sido date ; run;

/*일별 자료+기상자료 정리자료 내보내기 */
proc export data=a.dailycount outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\dailycount.csv" dbms=csv replace; run;

/*****************************************************************************************/
/*****************************************************************************************/
/*빈도 테이블 반출 하기 */
PROC EXPORT DATA=A.intestinal_infec_table    outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="전체 장감염 질환 "; RUN;
PROC EXPORT DATA=A.cholera_table             outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="콜레라" ;RUN;
PROC EXPORT DATA=A.typhoid_para_table      outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="장티푸스 및 파라티푸스" ;RUN;
PROC EXPORT DATA=A.othersalmone_table     outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="기타 살모넬라감염" ;RUN;
PROC EXPORT DATA=A.shigellosis_table         outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"     DBMS=EXCEL REPLACE; SHEET="시겔라증"; RUN;
PROC EXPORT DATA=A.otherbac_table           outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"     DBMS=EXCEL REPLACE; SHEET="기타 세균성 장감염"; RUN;
PROC EXPORT DATA=A.otherbac_food_table    outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="기타 세균성 음식매개" ;RUN;
PROC EXPORT DATA=A.amoebiasis_table        outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="아메바증" ;RUN;
PROC EXPORT DATA=A.Otherprotozoal_table   outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="기타 원충성 장질환"; RUN;
PROC EXPORT DATA=A.viral_intestinal_table     outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="바이러스성  장감염" ;RUN;
PROC EXPORT DATA=A.othergast_coli_table     outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="상세불명_기타 위장_결장염" ;RUN;
PROC EXPORT DATA=A.tsutsugamushi_table    outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="쯔쯔가무시병"; RUN;
PROC EXPORT DATA=A.zoster_table               outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="대상포진" ;RUN;
PROC EXPORT DATA=A.circ_table                   outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="전체 심뇌혈관질환" ;RUN;
PROC EXPORT DATA=A.angina_table               outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="협심증" ;RUN;
PROC EXPORT DATA=A.ischHD_table               outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="전체 허혈성 심질환" ;RUN;
PROC EXPORT DATA=A.MI_table                     outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="심근경색" ;RUN;
PROC EXPORT DATA=A.cerebvas_table            outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"   DBMS=EXCEL REPLACE; SHEET="전체 뇌졸증" ;RUN;
PROC EXPORT DATA=A.hemoStroke_table        outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="출혈성 뇌졸중" ;RUN;
PROC EXPORT DATA=A.ischStroke_table          outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"    DBMS=EXCEL REPLACE; SHEET="허혈성 뇌졸중" ;RUN;
PROC EXPORT DATA=A.otherStroke_table         outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"   DBMS=EXCEL REPLACE; SHEET="기타 뇌졸중"; RUN;
PROC EXPORT DATA=A.TIA_table                    outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"   DBMS=EXCEL REPLACE; SHEET="일과성 허혈성 뇌졸중" ;RUN;
PROC EXPORT DATA=A.suicide_table               outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"   DBMS=EXCEL REPLACE; SHEET="자살" ;RUN;
PROC EXPORT DATA=A.mental_table                outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="우울증" ;RUN;
PROC EXPORT DATA=A.resp_table                   outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="전체 호흡기계질환" ;RUN;
PROC EXPORT DATA=A.acuteup_table              outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="급성 상기도 감염" ;RUN;
PROC EXPORT DATA=A.pneum_table                outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="인플루엔자 및 폐렴"; RUN;
PROC EXPORT DATA=A.asthma_table               outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="천식"; RUN;
PROC EXPORT DATA=A.copd_table                  outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="만성폐쇄성폐질환" ;RUN;
PROC EXPORT DATA=A.voldep_table                outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="용적고갈 탈수"; RUN;
PROC EXPORT DATA=A.frost_table                  outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="동상"; RUN;
PROC EXPORT DATA=A.heat_table                   outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX" DBMS=EXCEL REPLACE; SHEET="고온관련 질환(열사병, 열피로)"; RUN;
PROC EXPORT DATA=A.hypothermia_table        outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX" DBMS=EXCEL REPLACE; SHEET="저체온증"; RUN;
PROC EXPORT DATA=A.otherredutemp_table     outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX" DBMS=EXCEL REPLACE; SHEET="비동결 및 기타" ;RUN;
PROC EXPORT DATA=A.heatrelated_table          outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX" DBMS=EXCEL REPLACE; SHEET="온열질환 관련" ;RUN;
PROC EXPORT DATA=A.frostrelated_table          outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX" DBMS=EXCEL REPLACE; SHEET="한랭질환 관련" ;RUN;
PROC EXPORT DATA=A.aki_table                     outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="급성 신부전증"; RUN;
PROC EXPORT DATA=A.kidney_table                outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="신장질환" ;RUN;
PROC EXPORT DATA=A.dm_table                    outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX"  DBMS=EXCEL REPLACE; SHEET="당뇨" ;RUN;
PROC EXPORT DATA=A.vasomotor_allerg_table outfile="D:\SNU\연구\질병관리본부\기후보건영향평가_평가체계구축및시범사업\2021\자료\NEDIS\outtable\frequency_table.XLSX" DBMS=EXCEL REPLACE; SHEET="혈관운동성 및 앨러지성 비염" ;RUN;

/*****************************************************************************************/
/*****************************************************************************************/
