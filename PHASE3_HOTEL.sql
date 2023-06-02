SET SQL_SAFE_UPDATES = 0;

/* The First Step : Create a new schema/database Then, name it HOTEL_PHASE3 and Create all the tables on schema*/

CREATE SCHEMA `hotel_phase3` ;


CREATE TABLE HOTEL
(
HID  INT NOT NULL,
HName varchar (50),
StarRata varchar (7),
Location varchar (50) ,
CONSTRAINT HOTEL_PK PRIMARY KEY (HID)
);


CREATE TABLE BILL    
(
Total decimal (7,2),
NameGuest varchar (50),
ReservNo int NOT NULL,
Service varchar (50),
CONSTRAINT BILL_PK PRIMARY KEY (ReservNo) 
);


CREATE TABLE EMPLOYEEY  (
EID  INT NOT NULL,
Salary decimal  (7,2),
Address  varchar (50) ,
FirstName varchar (50),
LastName  varchar (50),
HID int NOT NULL,
CONSTRAINT EMPLOYEEY_PK PRIMARY KEY (EID),
CONSTRAINT EMPLOYEEY_FK FOREIGN KEY (HID) REFERENCES HOTEL (HID)
);     


CREATE TABLE  GUEST 
(
Gender varchar (20),
Address varchar (50),
GID int NOT NULL,
FirstName varchar (50),
LastName varchar (50),
CONSTRAINT GUEST_PK PRIMARY KEY (GID)
);    


CREATE TABLE ROOM 
(
RoomNo int NOT NULL,
RoomType varchar (50),
HID  int NOT NULL,
CONSTRAINT ROOM_PK PRIMARY KEY (RoomNo,HID),
CONSTRAINT ROOM_FK FOREIGN KEY (HID) REFERENCES HOTEL (HID)
);


CREATE TABLE RECEPTIONST    
(
Email varchar (50),
RName  varchar (50),
WorkTime int,
EID int NOT NULL,
CONSTRAINT RECEPTIONST_PK PRIMARY KEY (EID),
CONSTRAINT RECEPTIONST_FK FOREIGN KEY (EID) REFERENCES EMPLOYEEY (EID)
);


CREATE TABLE RoomType
(
NameType varchar(50),
DayNO int,
Price decimal(7,2),
RoomNO int  NOT NULL,
CONSTRAINT RoomType_PK PRIMARY KEY (RoomNO),
CONSTRAINT RoomType_FK FOREIGN KEY (RoomNO) REFERENCES ROOM (RoomNO)
);   


CREATE TABLE HOTEL_Branch
(
HID int NOT NULL,
Branch int NOT NULL,
CONSTRAINT HOTEL_Branch_PK PRIMARY KEY (HID,Branch),
CONSTRAINT HOTEL_Branch_FK FOREIGN KEY (HID) REFERENCES HOTEL (HID)
);

             
CREATE TABLE GUEST_PhoneNo    
(
GID  int NOT NULL,
PhoneNo varchar (50) NOT NULL,
CONSTRAINT GUEST_PhoneNo_PK PRIMARY KEY (GID,PhoneNo),
CONSTRAINT GUEST_PhoneNo_FK FOREIGN KEY (GID) REFERENCES GUEST(GID)
);   


CREATE TABLE  EMPLOYEEY_PhoneNo    
(
EID int NOT NULL,
PhoneNo varchar (50) NOT NULL,
CONSTRAINT EMPLOYEEY_PhoneNo_PK PRIMARY KEY (EID,PhoneNo),
CONSTRAINT EMPLOYEEY_PhoneNo_FK FOREIGN KEY (EID) REFERENCES EMPLOYEEY (EID)
);


CREATE TABLE Reservation_Guest    
(
GID int NOT NULL,
ReservNo int NOT NULL,
StartDate VARCHAR (30),
EndDate VARCHAR (30) ,
CONSTRAINT Reservation_Guest_PK PRIMARY KEY (GID,ReservNo),
CONSTRAINT Reservation_Guest_FK1 FOREIGN KEY (GID) REFERENCES GUEST (GID),
CONSTRAINT Reservation_Guest_FK2 FOREIGN KEY (ReservNo) REFERENCES BILL (ReservNo)
);


CREATE TABLE Reservation_Info    
(
ReservNo INT NOT NULL,
NameType varchar (50),
DayNo VARCHAR (45),
Price decimal(7,2),
CONSTRAINT Reservation_Info_PK PRIMARY KEY (ReservNo),
CONSTRAINT Reservation_Info_FK FOREIGN KEY (ReservNo) REFERENCES BILL (ReservNo)
);



/* the Second Step : Insert all the data of tables */
/* Inserting data on HOTEL table */

insert into HOTEL 
values
('12234567','WIHC','four','Alhmra'),
('12297567','WIHC','five','Alhamdniya'),
('12398567','WIHC','five','Alruwduh'),
('12464567','WIHC','seven','AlSafa'),
('10534567','WIHC','five','AlRahmaniyah'),
('12234502','WIHC','five','ALTahlia'),
('12990767','WIHC','seven','AlAzizia');
                                
/* Inserting data on BILL table */


insert into BILL 
values 
('7000','WIHC','876','Breakfast'),
('2680','WIHC','222','Lunch'),
('5678','WIHC','111','Dinner'),
('1300','WIHC','333','Washing clothes'),
('1246','WIHC','113','Dinner'),
('3990','WIHC','622','Dinner'),
('1400','WIHC','262','Breakfast');


/* Inserting data on EMPLOYEEY table */

insert into EMPLOYEEY 
values 
('123453','4000.00','Jeddah','Roba','Abdullah','12234567'),
('123443','3000.00','Jeddah','Reema','Ahmed','12297567'),
('123336','3000.00','Jeddah','Nurah','Khalid','12398567'), 
('123116','4000.00','Jeddah','Thekra','Hamad','12464567'),
('123886','4000.00','Jeddah','Fahad','Mohammed','10534567'),
('112356','3000.00','Jeddah','alhanof','Faisal','12234502'),
('126546','3000.00','Jeddah','Asma','Saad','12990767');


/* Inserting data on GUEST table */

insert into GUEST 
values
('Male','Jeddah','12345','Abdullah','Ahmed'),
('Female','Riyadh','12346','Roba','Abdullah'),
('Male','Makkah','12333','Ahmed','Faisal'),
('Female','Riyadh','12344','alhanof','Saad'),
('Male','Yanbu','12337','Saad','Hamad'),
('Female','Makkah','13578','Reema','Abdullah'),
('Male','Jazan','13567','Faisal','Ahmed'); 


/* Inserting data on ROOM table */
										
insert into ROOM 
values
('603','Triple','12990767'),
('207','Double','12234502'),
('506','Double','12234567'),
('301','Triple','12398567'),
('403','Single','10534567'),
('102','Single','12464567'),
('401','Triple','12297567');  

/* Inserting data on RECEPTIONST table */

insert into RECEPTIONST 
values
('q2rt@hotmail.com','Reem',6,'126546'),
('yt4ej@hotmail.com','Roba','6','112356'),
('eyjt6e@hotmail.com','Abdullah','8','123886'),
('ary@hotmail.com','Saad','8','123116'),
('hyt54@hotmail.com','Ahmed','6','123336'),
('uy7f@hotmail.com','Lama','6','123443'),
('u4ygf@hotmail.com','Asma','8','123453');


/* Inserting data on RoomType table */

insert into RoomType 
values
('Standard','4','1600.00','603'),
('Standard','3','1300.00','301'),
('Suite','7','5600.00','207'),
('Standard','3','1200.00','403'),
('Deluxe','7','3500.00','506'),
('Suite','2','1600.00','401'),
('Junior Suite','1','4500.00','102');


/* Inserting data on HOTEL_Branch  table */

insert into HOTEL_Branch 
values
('12234567','1'),
('12398567','2'),
('12297567','3'),
('12234502','4'),
('12464567','5'),
('10534567','6'),
('12990767','7');


/* Inserting data on GUEST_PhoneNo table */

insert into GUEST_PhoneNo 
values
('12345','050765234'),
('12346','050763456'),
('12333','056666666'),
('12344','050222234'),
('12337','050763334'),
('13578','050761111'),
('13567','050767774');


/* Inserting data on EMPLOYEEY_PhoneNo table */

insert into EMPLOYEEY_PhoneNo 
values     
('126546','0539395969'),   
('112356','0539437493'),   
('123886','0501234567'),   
('123116','0507388983'),  
('123336','0502987654'),   
('123443','0523456789'),   
('123453','0539646796');

/* Inserting data on Reservation_Guest table */


insert into Reservation_Guest 
values
('12345','876','2020-10-20','2020-10-31'),
('12346','222','2020-11-1','2020-11-3'),
('12333','111','2020-11-4','2020-11-7'),
('12344','333','2020-9-4','2020-9-11'),
('12337','113','2020-5-3','2020-6-3'),
('13578','622','2020-9-2','2020-9-3'),
('13567','262','2020-10-4','2020-10-9');


/* Inserting data on Reservation_Info table */


insert into Reservation_Info 
values
('876','Hair stylist','11','1600.00'),
('222','Washing','2','1300.00'),
('111','cleaning','3','5600.00'),
('333','Sauna','7','1200.00'),
('113','car rental','30','3500.00'),
('622','Ironing','1','1600.00'),
('262','Concerts','5','4500.00');



/* the Third Step : List all All in Table EMPLOYEEY */

SELECT *
FROM hotel; 


SELECT *
FROM BILL
ORDER BY Total DESC; 


SELECT *
FROM EMPLOYEEY
ORDER BY FirstName,LastName DESC; 


SELECT *
FROM guest
ORDER BY Gender,Address DESC; 


SELECT *
FROM room
ORDER BY 2 DESC;   


SELECT *
FROM receptionst; 


SELECT *
FROM roomtype;


SELECT *
FROM hotel_branch
ORDER BY 1 DESC;  


SELECT *
FROM guest_phoneno; 


SELECT *
FROM employeey_phoneno;


SELECT *
FROM reservation_info;


SELECT *
FROM reservation_guest;

   
/*The forth Step : In Table EMPLOYEEY, Show the EMPLOYEEY 
after Update FirstName, LastName And Address to EID : '123886'
Then SHOW Table EMPLOYEEY  after update. . */

UPDATE EMPLOYEEY
SET FirstName = 'Roaa', LastName = 'Zaid', Address = 'jeddah'
WHERE EID = '123886'; 

SELECT *
FROM EMPLOYEEY;
  
/*The fifth Step : In Table EMPLOYEEY_PhoneNo, Show the EMPLOYEEY_PhoneNo 
after Update SET PhoneNo = '0507383262' Also, EID = '123116' of it;s PhoneNo = '0507388983'
Then SHOW Table EMPLOYEEY  after update. */

UPDATE EMPLOYEEY_PhoneNo
SET PhoneNo = '0507383262'
WHERE EID = '123116'; 

SELECT *
FROM EMPLOYEEY_PhoneNo;


/* The Sixth Step : Increase the Salary by 15% for EMPLOYEEY.
Then SHOW Table EMPLOYEEY  after update.*/

UPDATE  EMPLOYEEY
SET Salary = Salary*1.15
WHERE Salary = '3000.00'; 


SELECT *
FROM EMPLOYEEY;


/* The Seventh Step : Deleted GID ='12346' from GUEST_phoneno table.
Then SHOW Table GUEST_phoneno after update.*/

DELETE FROM GUEST_phoneno
WHERE GID ='12346';
   
SELECT *
FROM guest_phoneno; 

   
/* The Eighth Step : Deleted ReservNo = '876' from reservation_info table.
Then SHOW Table GUEST_phoneno after update.*/

DELETE FROM reservation_info
WHERE ReservNo = '876';
   
SELECT ReservNo
FROM reservation_info; 



/* The Eighth Step : SHOW Table HOTEL after update order.*/

SELECT *
FROM HOTEL
ORDER BY HID,HName,StarRata DESC; 



/* The Ninth Step : SHOW Table HOTEL after count StarRata and HID order and Groupd by starRata.*/

SELECT HID,StarRata,COUNT(StarRata) AS StarRataOfHotel
FROM HOTEL
GROUP BY StarRata
ORDER BY HID DESC; 


/* The Tenth Step : SHOW Table HOTEL after HAVAING count StarRata and Groupd by starRata.*/

SELECT HID,StarRata,COUNT(StarRata) AS StarRataOfHotel
FROM HOTEL
GROUP BY StarRata
HAVING COUNT(StarRata)>2 ; 




/* The Eleventh Step : SHOW Table EMPLOYEEY after EMPLOYEEY whose wages are greater 
than average salaries.*/


SELECT FirstName, LastName, Salary
FROM EMPLOYEEY
WHERE Salary > (SELECT AVG(Salary) FROM EMPLOYEEY);




/* The Twelfth Step : SHOW the ResrvNo of two table.*/


SELECT B.ReservNo, NameGuest, Total ,i.ReservNo, NameType, DayNo
FROM  bill B, reservation_info i
WHERE B.ReservNo = i.ReservNo
ORDER BY NameGuest ASC; 




/* The Thirteenth Step : SHOW the number and name of the branch in which 'alhanof' works.*/

 SELECT HID, HName
 FROM HOTEL
 WHERE HID IN ( SELECT HID 
				FROM EMPLOYEEY
				WHERE EID IN (SELECT EID
								FROM  EMPLOYEEY
								WHERE FirstName = 'alhanof'));
                                
                                
						
                        
/* The Fourteenth Step : SHOW from a Guest whose service is a free 'Dinner'.*/

 SELECT FirstName, LastName
 FROM GUEST
 WHERE GID IN ( SELECT GID 
				FROM reservation_guest
				WHERE ReservNo IN (SELECT ReservNo
								FROM  BILL
								WHERE Service = 'Dinner'));






