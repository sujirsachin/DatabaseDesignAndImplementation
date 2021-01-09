/* Sachin Mohan Sujir ss1037 */


create database sujir_ACMEOnline;
Use sujir_ACMEOnline;

/* Tables */

/* Table ITEM */

create table ITEM(Item_Number int auto_increment,Item_Name varchar(35) not null,Description varchar(255),Model varchar(50) not null,Price decimal(6,2) not null,Constraint pk_ITEM primary key(Item_Number));


/* Table Customer */

create table CUSTOMER(CustomerID int unsigned auto_increment,CustomerName varchar(50) not null,Address varchar(50) not null,Email varchar(80),customer_type Enum('HOME', 'BUSINESS'),Constraint CUSTOMER_pk primary key(CustomerID));


/* Table HOME */

create table HOME(CustomerID int(10) unsigned,CreditCardNum bigint(16) not null,CardExpirationDate varchar(6) not null,constraint HOME_pk primary key(CustomerID),constraint HOME_CustomerID_fk foreign key(CustomerID) References CUSTOMER(CustomerID) On update cascade on delete cascade);

/* Table BUSINESS */

create table BUSINESS(CustomerID int(10) unsigned,PaymentTerms varchar(50) not null, Constraint BUSINESS_pk primary key(CustomerID), Constraint BUSINESS_CustomerID_fk foreign key(CustomerID) references CUSTOMER(CustomerID) on update cascade on delete cascade);

/* Table ORDERED */

create table ORDERED(OrderID int unsigned auto_increment,Total_Cost decimal(8,2),CustomerID int(10) unsigned, Constraint ORDERED_pk primary key(OrderID),Constraint ORDERED_CustomerID_fk foreign key(CustomerID) references CUSTOMER(CustomerID) on update cascade on delete cascade);


/* Table LINE_ITEM */

create table LINE_ITEM(Item_Number int(11), OrderID int(10) unsigned, Quantity int(255), constraint LINE_ITEM_pk primary key(Item_Number,OrderID), constraint LINE_ITEM_ITEM_Number_fk foreign key(Item_Number) references ITEM(Item_Number) on update cascade on delete cascade,constraint LINE_OrderID_fk foreign key(OrderID) references ORDERED(OrderID) on update cascade on delete cascade);

/* Adding Data */

insert into ITEM(Item_name,Description,Model,Price) values('Cabbage Patch Doll','Baby boy doll','Boy',39.95);

insert into ITEM(Item_name,Model,Price) values('The Last Lecture','Hardcover',9.95);

insert into ITEM(Item_name,Description,Model,Price) values('Keurig Beverage Maker','Keurig Platinum Edition Beverage Maker in Red','Platinum Edition',299.95);


/* Update Address Attribute in CUSTOMER */

alter table CUSTOMER change Address Address varchar(100);


/* Adding new Attributes to CUSTOMER */

alter table CUSTOMER add column City varchar(60), add column State varchar(2),add column Zip_Code varchar(10);

/* Deleting a Tuple from ITEM */

delete from ITEM where Item_Name='Keurig Beverage Maker';

/* Adding a Description in the table ITEM */

update ITEM set Description='Written by Randy Pausch' where Item_Name='The Last Lecture';

/* Inserting Janine Jeffers Details */

Start Transaction;

insert into CUSTOMER(CustomerName,Address,City,State,Zip_code,Email)values('Janine Jeffers','152 Lomb Memorial Dr.','Rochester','NY','14623','jxj1234@rit.edu');

/* Inserting Credit Card Details into Home without Customer ID */

insert into HOME(CustomerID, CreditCardNum,CardExpirationDate) select CustomerID, 1234567890123456,012014 from CUSTOMER where CustomerName='Janine Jeffers' and Email='jxj1234@rit.edu' and State='NY';




/* Updating Janine Jeffers as HOME Customer */

update CUSTOMER set customer_type='HOME' where CustomerName='Janine Jeffers';

/* Inserting Order Details into ORDERED */

 insert into ORDERED(OrderID,Total_Cost,CustomerID) select 1,113.74,CustomerID from CUSTOMER where CustomerName='Janine Jeffers' and Email='jxj1234@rit.edu' and State='NY';


/* Inserting Line ITEMS */

Insert into LINE_ITEM(Item_Number,OrderID,Quantity)values(1,1,2);

Insert into LINE_ITEM(Item_Number,OrderID,Quantity)values(2,1,3);

Commit;
/* ******************* END ******************** */











