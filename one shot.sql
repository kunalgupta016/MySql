create database organisation;
SHOW DATABASES;
USE organisation;
CREATE TABLE Worker(
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

insert into Worker
	(WORKER_ID , FIRST_NAME , LAST_NAME , SALARY , JOINING_DATE , DEPARTMENT) VALUES
		(001,'Kunal','Gupta',1000000,'14-02-26 09.00.00','HR'),
        (002,'Tushar','Gupta',1000000,'14-06-27 09.00.00','Admin'),
        (3, 'Robert', 'Johnson', 55000, '2023-03-10 09.00.00', 'Engineering'),
		(4, 'Emily', 'Davis', 62000, '2020-11-05 09.00.00', 'Marketing'),
		(5, 'Michael', 'Brown', 48000, '2022-06-19 09.00.00', 'IT'),
		(6, 'Sarah', 'Wilson', 72000, '2021-09-13 09.00.00', 'Sales'),
		(7, 'David', 'Taylor', 53000, '2022-12-25 09.00.00', 'Logistics'),
		(8, 'Laura', 'Anderson', 51000, '2023-02-01 09.00.00', 'Finance'),
		(9, 'James', 'Martinez', 59000, '2021-07-07 09.00.00', 'Engineering'),
		(10, 'Olivia', 'Thomas', 56000, '2020-10-11 09.00.00', 'CA');
        
Create table Bonus (
	WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BOUNS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus
	(Worker_REF_ID , BONUS_AMOUNT, BOUNS_DATE) VALUES
		(001,5000,'16-02-26'),
        (002,3000,'19-02-27'),
        (003,4000,'16-02-26'),
        (001,5500,'19-02-26'),
        (002,3500,'16-02-27');
        
Create table Title (
	WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES
    (1, 'Manager', '2022-01-01 09:00:00'),
    (2, 'Senior Analyst', '2021-08-15 10:00:00'),
    (3, 'Lead Developer', '2023-03-01 08:30:00'),
    (4, 'Marketing Director', '2020-11-01 09:15:00'),
    (5, 'IT Specialist', '2022-06-20 11:00:00'),
    (6, 'Sales Executive', '2021-09-20 14:00:00'),
    (7, 'Logistics Manager', '2022-12-26 10:30:00'),
    (8, 'Finance Analyst', '2023-02-01 12:00:00'),
    (9, 'Software Engineer', '2021-07-08 13:00:00'),
    (10, 'HR Coordinator', '2020-10-12 09:45:00');

Select FIRST_NAME from Worker;
Select FIRST_NAME,SALARY from Worker;
Select 55+11;
Select now();
Select ucase("Kunal");
Select WORKER_TITLE from Title;
desc Title;-- describe the type and null ho sakta hai ki  nahi


-- 	WHERE

select * from worker where SALARY>60000;
select * from worker;

-- BETWEEEN
select * from worker where SALARY between 70000 and 1000000;
-- agar hum chahte hai ki worker jo Hr air admin department me hai vo hi dikhaye 
-- select * from worker where DEPARTMENT='HR' or DEPARTMENT='Admin';
--  lekin agar jayada department ho to nahi chalega isliye 

-- IN
select * from worker where DEPARTMENT in ('HR','Admin');

-- NOT
select * from worker where DEPARTMENT not in ('HR','Admin');    

-- like me wildcard
select * from worker where FIRST_NAME like ('%a'); -- last me a aana chahiye 
select * from worker where FIRST_NAME like ('a%'); -- first me a 
select * from worker where FIRST_NAME like ('%a%'); -- kahi bhi a 
select * from worker where FIRST_NAME like ('_a%'); -- a se phle sirf ek akshar means second me a aana 


-- sorting using order by
select * from worker order by SALARY; -- ascending by default
select * from worker order by SALARY desc; --  descending 

-- distinct 
select distinct department from worker;

-- group by
select department from worker group by department; -- by default is same as distinct if no aggregation funtion apaply
	-- use count(*)
		select department,count(department) from worker group by department;
	-- use avg(*)
		select department,avg(salary) from worker group by department;
	-- use min(*)
		select department,min(salary) from worker group by department;
	-- use max(*)
		select department,max(salary) from worker group by department;
	-- use sum(*)
		select department,sum(salary) from worker group by department;

-- group by having
select department,count(department) from worker group by department having count(department)=2;
	

-- DDL
-- unique check default
    
create table account(
id int not null primary key,
name varchar(25) unique,
balance int,
constraint acc_bal_chk check(balance>=1000)
);

insert into account values(1,"Kunal",1234);
-- insert into account values(2,"Kunal",1235); GIVES ERROR BECAUSE NAME IS UNIQUE BUT I GIVE 2 SAME NAME
-- insert into account values(3,"Tushar",123); GIVES ERROR BECAUSE BALANCE IS LESS TAHN 1000
insert into account values(2,"Tushar",12343);


-- Alter 
	-- ADD
    alter table account add interest float not null default 0;
    -- Modify
    alter table account modify interest double not null default 0;
    -- change column
    alter table account change column interest saving_interest float not null default 0;
    -- drop column
	alter table account drop column saving_interest;
    -- rename
    alter table account rename to account_details;

    
