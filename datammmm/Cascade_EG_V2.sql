CREATE DATABASE CASCADER
GO
USE CASCADER
GO


/*
DROP TABLE MODULE
DROP TABLE STUDENT

*/


CREATE TABLE student(
	sno varchar(2) NOT NULL,
	sname varchar(10) NULL,
	address varchar(50) NULL,
 CONSTRAINT stu_sno_pk PRIMARY KEY(sno)
);

CREATE TABLE module(
	 mno varchar(10) NOT NULL,
	 marks int NULL,
	 sno varchar(2) NOT NULL,
CONSTRAINT module_mno_pk PRIMARY KEY (mno),
--CONSTRAINT FK_student_moduleU FOREIGN KEY(sno) REFERENCES student(sno)ON UPDATE CASCADE,
CONSTRAINT FK_student_moduleD FOREIGN KEY(sno) REFERENCES student(sno)ON DELETE CASCADE,
CONSTRAINT FK_student_moduleSN FOREIGN KEY(sno) REFERENCES student(sno)ON update cascade
);

/*
Try the following commands 
BEGIN TRAN

SELECT * FROM STUDENT
SELECT * FROM MODULE

UPDATE STUDENT
SET sno = 'S2'
WHERE sno = 'S5'

SELECT * FROM STUDENT
SELECT * FROM MODULE

ROLLBACK
;


BEGIN TRAN

SELECT * FROM STUDENT
SELECT * FROM MODULE

DELETE FROM STUDENT
WHERE sno = 's2'

SELECT * FROM STUDENT
SELECT * FROM MODULE

ROLLBACK
;
*/


INSERT INTO STUDENT VALUES ('S1','John', '4 High Street Rotorua');

INSERT INTO STUDENT VALUES ('S2','Peter', '345 Old Taupo Road Rotorua');

INSERT INTO STUDENT VALUES ('S3','Sam', '2 Mokoia Drive Rotorua');

INSERT INTO STUDENT VALUES ('S4','Tim', '45, Fenton street Rotorua');
INSERT INTO MODULE VALUES (' Comp5111',67, 'S1'); 
INSERT INTO MODULE VALUES (' Comp6101',89, 'S2');
INSERT INTO MODULE VALUES (' Comp7101',76, 'S4');
INSERT INTO MODULE VALUES (' Comp7118',87, 'S3');
INSERT INTO MODULE VALUES (' Comp5101',45, 'S4');
INSERT INTO MODULE VALUES (' Comp6102',90, 'S2');




/*
other example

DROP TABLE inventory
DROP TABLE products

CREATE TABLE products
( product_id INT PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  category VARCHAR(25)
);

CREATE TABLE inventory
( inventory_id INT PRIMARY KEY,
  product_id INT,
  quantity INT,
  min_level INT,
  max_level INT,
  CONSTRAINT fk_inv_product_id
    FOREIGN KEY (product_id)
    REFERENCES products (product_id)
    ON DELETE SET NULL
);




*/

