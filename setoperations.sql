create database company;
use company;
create table Dept1(
empid int ,
name varchar(255),
role varchar(255)
);
insert into Dept1 (empid,name,role) values
(1,'A','Engineer'),
(2,'B','Salesman'),
(3,'C','Manager'),
(4,'D','Salesman'),
(5,'E','Engineer');
create table Dept2(
empid int ,
name varchar(255),
role varchar(255)
);
insert into Dept2 (empid,name,role) values
(3,'C','Manager'),
(6,'F','Marketing'),
(7,'G','Salesman');

-- SET Operations
-- List out all the Employees in the company
select * from Dept1 union select * from Dept2;
-- List out all the Employees in all departments who work as Salesman
select * from Dept1 where role = 'Salesman' union select * from Dept2 where role = 'Salesman';
-- List out all the Employees who work for both the departments
select dept1.* from Dept1 INNER JOIN Dept2 using (empid);
-- List out all the employeees working in dept1 but not in dept2
select dept1.* from dept1 left join dept2 using(empid) where dept2.empid is null;

