/* Name : Gaurav Sanjeev Taneja mail: gauravsrtaneja2416@gmail.com */

/*The code is written for oracle 11g sql.*/
/* Create Query */
CREATE TABLE SNMASTER (
SERIAL_NUMBER VARCHAR2(50) NOT NULL PRIMARY KEY,
WORK_ORDER NUMBER(5)NOT NULL,
ASSY_ID NUMBER(3)NOT NULL
);

CREATE TABLE TRANSACTIONS (
SERIAL_NUMBER VARCHAR2(50) NOT NULL ,
OPERATION_ID NUMBER(5)NOT NULL,
CREATED_ON TIMESTAMP WITH LOCAL TIME ZONE NOT NULL,
FOREIGN KEY (SERIAL_NUMBER) REFERENCES SNMASTER(SERIAL_NUMBER)
);

/* Insert Query*/
INSERT ALL
    INTO SNMASTER (SERIAL_NUMBER, WORK_ORDER, ASSY_ID) VALUES('0910A40877', 56794, 841)
    INTO SNMASTER (SERIAL_NUMBER,WORK_ORDER,ASSY_ID)VALUES('0910A40886',56794,841)
    INTO SNMASTER (SERIAL_NUMBER,WORK_ORDER,ASSY_ID)VALUES('0910A40895',56794,841)
    INTO SNMASTER (SERIAL_NUMBER,WORK_ORDER,ASSY_ID)VALUES('0910A40902',56794,841)
    INTO SNMASTER (SERIAL_NUMBER,WORK_ORDER,ASSY_ID)VALUES('0910A40911',56794,841)
    INTO SNMASTER (SERIAL_NUMBER,WORK_ORDER,ASSY_ID)VALUES('0910A40920',88545,841)
    INTO SNMASTER (SERIAL_NUMBER,WORK_ORDER,ASSY_ID)VALUES('0910A40939',88545,841)
    INTO SNMASTER (SERIAL_NUMBER,WORK_ORDER,ASSY_ID)VALUES('0910A40948',88545,841)
    INTO SNMASTER (SERIAL_NUMBER,WORK_ORDER,ASSY_ID)VALUES('0910A40957',97846,842)
    INTO SNMASTER (SERIAL_NUMBER,WORK_ORDER,ASSY_ID)VALUES('0910A40966',97846,842)
SELECT
    * FROM dual;


INSERT ALL
    INTO TRANSACTIONS (SERIAL_NUMBER,OPERATION_ID,CREATED_ON)Values('0910A40886',113,TO_DATE('2/27/2020 13:39:46','MM/DD/YYYY HH24:MI:SS'))
    INTO TRANSACTIONS (SERIAL_NUMBER,OPERATION_ID,CREATED_ON)Values('0910A40877',116,TO_DATE('2/27/2020 13:39:48','MM/DD/YYYY HH24:MI:SS'))
    INTO TRANSACTIONS (SERIAL_NUMBER,OPERATION_ID,CREATED_ON)Values('0910A40886',116,TO_DATE('2/27/2020 13:40:03','MM/DD/YYYY HH24:MI:SS'))
    INTO TRANSACTIONS (SERIAL_NUMBER,OPERATION_ID,CREATED_ON)Values('0910A40939',113,TO_DATE('2/27/2020 13:40:20','MM/DD/YYYY HH24:MI:SS'))
    INTO TRANSACTIONS (SERIAL_NUMBER,OPERATION_ID,CREATED_ON)Values('0910A40886',160,TO_DATE('2/27/2020 13:40:48','MM/DD/YYYY HH24:MI:SS'))
SELECT
    * FROM dual;
    
/* Display ROws and Columns */

 SELECT	sn.serial_number,
 CASE
	          WHEN EXISTS (select t.operation_id from transactions t where t.operation_id = 113 AND  t.serial_number = sn.serial_number)
          THEN  1
		  ELSE  0
	      END
	     AS "113",
         CASE
	          WHEN  EXISTS (select t.operation_id from transactions t where t.operation_id = 116 AND  t.serial_number = sn.serial_number)
          THEN  1
		  ELSE  0
	      END
	     AS "116",
          CASE
	          WHEN EXISTS (select t.operation_id from transactions t where t.operation_id = 160 AND  t.serial_number = sn.serial_number)
          THEN  1
		  ELSE  0
	      END
	     AS "160"
FROM	 SNMASTER sn
FETCH FIRST 5 ROWS ONLY;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


