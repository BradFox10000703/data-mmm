CREATE DATABASE Sample_EG 
GO


USE sample_EG
GO

;
CREATE TABLE employee  (emp_no INTEGER NOT NULL, 
                        emp_fname CHAR(20) NOT NULL,
                        emp_lname CHAR(20) NOT NULL,
                        dept_no CHAR(4) NULL);

CREATE TABLE department(dept_no CHAR(4) NOT NULL,
                        dept_name CHAR(25) NOT NULL,
                        location CHAR(30) NULL);

CREATE TABLE project   (project_no CHAR(4) NOT NULL,
                        project_name CHAR(15) NOT NULL,
                        budget FLOAT NULL);

CREATE TABLE works_on	(emp_no INTEGER NOT NULL,
                        project_no CHAR(4) NOT NULL,
                        job CHAR (15) NULL,
                        enter_date DATE NULL);

insert into employee values(25348, 'Matthew', 'Smith',    'd3');
insert into employee values(10102, 'Ann',     'Jones',    'd3');
insert into employee values(18316, 'John',    'Barrimore','d1');
insert into employee values(29346, 'James',   'James',    'd2');
insert into employee values(9031,  'Elke',    'Hansel',   'd2');
insert into employee values(2581,  'Elsa',    'Bertoni',  'd2');
insert into employee values(28559, 'Sybill',  'Moser',    'd1');

insert into department values ('d1', 'Research',   'Dallas');
insert into department values ('d2', 'Accounting', 'Seattle');
insert into department values ('d3', 'Marketing',  'Dallas');

insert into project values ('p1', 'Apollo', 120000.00);
insert into project values ('p2', 'Gemini', 95000.00);
insert into project values ('p3', 'Mercury', 186500.00);

insert into works_on values (10102, 'p1',  'Analyst',   '2006.10.1');
insert into works_on values (10102, 'p3',  'Manager',   '2008.1.1');
insert into works_on values (25348, 'p2',  'Clerk',     '2007.2.15');
insert into works_on values (18316, 'p2',  NULL,        '2007.6.1');
insert into works_on values (29346, 'p2',  NULL,        '2006.12.15');
insert into works_on values (2581,  'p3',  'Analyst',   '2007.10.15');
insert into works_on values (9031,  'p1',  'Manager',   '2007.4.15');
insert into works_on values (28559, 'p1',  NULL,        '2007.8.1');
insert into works_on values (28559, 'p2',  'Clerk',     '2008.2.1')
insert into works_on values (9031,  'p3',  'Clerk',     '2006.11.15');  
insert into works_on values (29346, 'p1',  'Clerk',     '2007.1.4');



SELECT dept_no, dept_name, location
 FROM department


 SELECT project_name
   FROM project
   WHERE budget*0.51 > 60000;


  --Example of an Illegal Statement
   SELECT emp_fname, DISTINCT emp_no
        FROM employee
       WHERE emp_lname = 'Moser';



SELECT emp_no, emp_fname, emp_lname
   FROM employee
   WHERE emp_no = 25348 AND emp_lname = 'Smith'
   OR emp_fname = 'Matthew' AND dept_no = 'd1';

SELECT emp_no, emp_fname, emp_lname
   FROM employee
   WHERE ((emp_no = 25348 AND emp_lname = 'Smith')
   OR emp_fname ='Matthew') AND dept_no = 'd1';

SELECT project_name, budget
   FROM project
   WHERE budget BETWEEN 95000 AND 120000;


     --another
  SELECT project_name, budget
   FROM project
   WHERE budget NOT BETWEEN 95000 AND 120000;


--Example 6.12
SELECT project_name, budget
   FROM project
   WHERE budget >= 95000 AND budget <= 120000;


   --another
SELECT project_name, budget
   FROM project
   WHERE budget > 95000 AND budget <120000;



--Example 6.13
SELECT project_name
  FROM project
   WHERE budget NOT BETWEEN 100000 AND 150000;
