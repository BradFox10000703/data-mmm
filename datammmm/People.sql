CREATE DATABASE people
GO

USE people
GO


CREATE TABLE peeps(
id int PRIMARY KEY,
fname varchar(20) NOT NULL,
lname varchar(30) NOT NULL,
gender char(1),
birthdate date,
fatherid int,
motherid int)


insert into peeps values(1, 'Peter','Thompson','M','10/1/1920',NULL,NULL)
insert into peeps values(2, 'Ann', 'Thompson','F','11/17/1925',NULL,NULL)
insert into peeps values(3, 'Jane','Smith','F','8/3/1947',1,2)
insert into peeps values(4, 'John','Smith','M','5/15/1945',NULL,NULL)
insert into peeps values(5, 'Mary','Smith','M','5/15/1970',4,3)
insert into peeps values(6, 'Joe','Smith','M','3/19/1968',4,3)

Select * from peeps