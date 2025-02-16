create database job;
use job;

create table employee(
id int primary key not null,
fname varchar(25),
lname varchar(25),
age int,
email_id varchar(200),
phone_no int(25),
city varchar(25)
);

alter table employee modify phone_no bigint;
desc employee;

create table project(
id int primary key not null,
empID int,
name varchar(25),
startdate date,
clientID int,
foreign key (empID)
	references employee(id)
    on delete cascade
);

create table client(
id int primary key not null,
first_name varchar(20),
last_name varchar(20),
age int,
emailID varchar(20),
phoneNo int(20),
city varchar(20),
empId int,
foreign key (empId)
	references employee(id)
    on delete cascade
);

alter table client modify phoneNo bigint;
alter table client modify emailID varchar(200);

INSERT INTO employee (id, fname, lname, age, email_id, phone_no, city)
VALUES 
(1, 'John', 'Doe', 30, 'john.doe@example.com', 1234567890, 'New York'),
(2, 'Jane', 'Smith', 25, 'jane.smith@example.com', 9876543210, 'Los Angeles'),
(3, 'Alex', 'Johnson', 35, 'alex.johnson@example.com', 1122334455, 'Chicago'),
(4, 'Emily', 'Davis', 28, 'emily.davis@example.com', 5566778899, 'San Francisco'),
(5, 'Michael', 'Wilson', 40, 'michael.wilson@example.com', 6677889900, 'Seattle');




INSERT INTO project (id, empID, name, startdate, clientID)
VALUES 
(1, 1, 'Project Alpha', '2025-01-01', 3),
(2, 2, 'Project Beta', '2025-02-01', 1),
(3, 3, 'Project Gamma', '2025-03-01', 5),
(4, 4, 'Project Delta', '2025-04-01', 2),
(5, 5, 'Project Epsilon', '2025-05-01', 4);

update project set empID = 3 where id = 4;

INSERT INTO client (id, first_name, last_name, age, emailID, phoneNo, city, empId)
VALUES 
(1, 'Alice', 'Brown', 50, 'alice.brown@example.com', 1231231234, 'Houston', 3),
(2, 'Bob', 'Taylor', 45, 'bob.taylor@example.com', 2342342345, 'Dallas', 3),
(3, 'Cathy', 'Miller', 38, 'cathy.miller@example.com', 3453453456, 'Austin', 1),
(4, 'David', 'Anderson', 55, 'david.anderson@example.com', 4564564567, 'San Antonio', 5),
(5, 'Eva', 'Thomas', 42, 'eva.thomas@example.com', 5675675678, 'Fort Worth', 2);

update client set city = 'Chicago' where id = 1;
update client set city = 'Chicago' where id = 2;
update client set city = 'New York' where id = 3;


select * from employee;
select * from client;
select * from project;


-- INNER JOIN
-- Enlist all the employee ID's , names along with Project allocated to them.
select e.id,e.fname,e.lname,p.name,p.id from employee as e 
inner join project as p on e.id = p.empId;



-- Fetch out all the employeeID's and their contact details who have been working from Seattle with 
-- the clients from working in San Antonio
select e.id , e.phone_no ,e.email_id , c.first_name , c.last_name from employee as e 
inner join client as c on e.id = c.empId where e.city = 'Seattle' and c.city ='San Antonio';

-- left join
-- fetch out each project allocated to each employee
select * from Employee as e 
left join project as p on e.id = p.empID;

-- Right join
-- list out all the project along with the employee's name and their respective allocated email ID.
select p.id,p.name , e.fname ,e.lname, e.email_id from Employee as e 
right join project as p on e.id = p.empID;

-- cross join
-- list out all the combinations possible for the employees's name and projects that can exist.
select e.fname , e.lname , p.id , p.name from employee as e 
cross join project as p;

-- use join without using join keyword
select e.id,e.fname,e.lname,p.name,p.id from employee as e ,project as p where e.id = p.empId;





