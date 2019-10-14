/*--------------------------------------------------*/
/*   CREATED BY Jo Bloggs                           */ 
/*   DATE  10/10/00                                 */
/*   PURPOSE: creates and populates MOVIE database  */
/*--------------------------------------------------*/

/* --------  drop tables ---------------------      */
/* --------  in case they exist --------------      */

CREATE DATABASE movies
Go

USE Movies
GO



DROP TABLE booking;
DROP TABLE rental;
DROP TABLE movie;
DROP TABLE supplier;
DROP TABLE category;
DROP TABLE customer;

/* --------  create tables -----------------      */

CREATE TABLE customer
(cust_id 		INT 		NOT NULL,
name			varchar(25),
address			VARCHAR(25),
phone			varchar(8),
ytd				money,
discount		INT,
CONSTRAINT customer_pk PRIMARY KEY (cust_id) );

CREATE TABLE category
(cat			varchar(3)		NOT NULL,
description		varchar(20),
CONSTRAINT category_pk PRIMARY KEY (cat));

CREATE TABLE supplier
(supplier_id	varchar(5)		NOT NULL,
name			varchar(25),	
address			varchar(25),
phone			varchar(8),
CONSTRAINT supplier_pk PRIMARY KEY (supplier_id));

CREATE TABLE movie
(movie_id		INT		NOT NULL,
title			varchar(40),
cat				varchar(3)		NOT NULL,
qty				INT,
qtyout			INT,
purchase_price	MONEY,
rental_price	MONEY,
supllier_id		varchar(5)		NOT NULL,
CONSTRAINT movie_pk PRIMARY KEY (movie_id) ,
CONSTRAINT movie_category_fk FOREIGN KEY (cat) REFERENCES category(cat),
CONSTRAINT movie_supplier_fk FOREIGN KEY (supllier_id)
			REFERENCES supplier (supplier_id));

CREATE TABLE rental
(cust_id		INT		NOT NULL,
movie_id		INT		NOT NULL,
copy_id			INT		NOT NULL,
due_date		DATE,
CONSTRAINT rental_pk PRIMARY KEY (cust_id, movie_id,copy_id),
CONSTRAINT rental_customer_fk FOREIGN KEY(cust_id) REFERENCES customer(cust_id),
CONSTRAINT rental_movie_fk FOREIGN KEY(movie_id) REFERENCES movie(movie_id));

CREATE TABLE booking
(cust_id		INT		NOT NULL,
movie_id		INT		NOT NULL,
date_required	DATE			NOT NULL,
date_booked		DATE,
date_returned	DATE,
CONSTRAINT booking_pk PRIMARY KEY(cust_id, movie_id,date_required),
CONSTRAINT booking_customer_fk FOREIGN KEY(cust_id) REFERENCES customer(cust_id),
CONSTRAINT booking_movie_fk FOREIGN KEY (movie_id) REFERENCES movie(movie_id));


/* --------  populate tables -----------------      */

INSERT INTO customer VALUES
(8922, 'Al Knight', '1 Ohio St.','345-3454',367.5, 15);
INSERT INTO customer VALUES
(8923, 'I. Strain', '2 Missisippi Rd.','767-6566',45, 5);
INSERT INTO customer VALUES
(8924, 'C Story', '3 Alaska Dv.','445-5444',112.5, 10);

INSERT INTO category VALUES
('DRA', 'Drama');
INSERT INTO category VALUES
('WES', 'Western');
INSERT INTO category VALUES
('COM', 'Comedy');
INSERT INTO category VALUES
('CHI', 'Children');
INSERT INTO category VALUES
('CLA', 'Classic');
INSERT INTO category VALUES
('MUS', 'Music');
INSERT INTO category VALUES
('ACT', 'Action');

INSERT INTO supplier VALUES
('VWEST', 'Captain Darth', '111 Midcity Plaza', '123-4567');
INSERT INTO supplier VALUES
('ABC', 'Mr Pennyfather', '2Duncan St, OH', '987-6543');
INSERT INTO supplier VALUES
('TAROT', 'June Lockhart', '99 Lucky Lane', '007-1212');

INSERT INTO movie VALUES
(0001,'The night the lights went out in Clutha','DRA',2,0,40,3.5,'ABC');                                                                                    
INSERT INTO movie VALUES
(0002,'Showdown at the triple moon saloon','WES',4,1,35,2,'VWEST');                                                                                 
INSERT INTO movie VALUES
(0003,'Romancing the brick','DRA',6,3,40,5,'VWEST');                                                                                 
INSERT INTO movie VALUES
(0004,'Live at the Beehive','COM',4,1,40,7,'ABC');                                                                                    
INSERT INTO movie VALUES
(0005,'Super-Thunder-Sting-car','CHI',5,5,30,7,'ABC');                                                                                    
INSERT INTO movie VALUES
(0006,'Goofy and Pluto and the dog','CHI',5,2,35,3.5,'VWEST');                                                                                  
INSERT INTO movie VALUES
(0007,'Who Flung Yu','ACT',2,2,30,5.5,'ABC');                                                                                    
INSERT INTO movie VALUES
(0008,'Gone with the breeze','CLA',6,1,25,4,'TAROT');                                                                                  
INSERT INTO movie VALUES
(0009,'Beethoven live','CLA',1,0,30,5,'TAROT');                                                                                  
INSERT INTO movie VALUES
(0010,'The Freddy Elvis reunion concert','MUS',2,2,40,5,'VWEST');                                                                                  

INSERT INTO rental VALUES
(8922,0001,1,'09-JUL-92');
INSERT INTO rental VALUES
(8922,0002,2,'08-JUL-92');
INSERT INTO rental VALUES
(8924,0010,1,'10-AUG-92');

INSERT INTO booking VALUES
(8922,0007, '11-JUL-92','13-JUL-92','14-JUL-92');
INSERT INTO booking VALUES
(8922,0003, '11-JUL-92','13-JUL-92','14-JUL-92');
INSERT INTO booking VALUES
(8924,0007, '11-JUL-92','14-JUL-92','15-JUL-92');
