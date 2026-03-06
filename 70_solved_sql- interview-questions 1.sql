drop database if exists sql_questions;
create database sql_questions;
use sql_questions;

create table employees1(
      emp_id int primary key,
      emp_name varchar (50),
      department varchar(50),
      salary decimal(10,2),
      manager_id int,
      hire_date date
      );
      
      insert into employees1(emp_id,emp_name,department,salary,manager_id,hire_date)
      values
      (1,'adam','hr',55000,null,'2018-03-15'),
      (2,'bella','finance',72000,1,'2019-06-21'),
      (3,'chris','it',85000,1,'2020-02-10'),
      (4,'david','finance',72000,2,'2021-04-12'),
      (5,'ella','it',95000,3,'2022-08-23'),
      (6,'fiona','hr',60000,1,'2020-11-30'),
      (7,'george','it',95000,3,'2023-07-15'),
      (8,'alicia','finance',65000,2,'2020-05-09'),
      (9,'hank','it',85000,3,'2019-10-04'),
      (10,'ian','finance',72000,2,'2020-09-19');
      
      select*from employees1;
      
      
      -- 1 how to retrieve the second highest salary of an employee(without subqueery)
      
      select distinct salary from employees1
      order by salary desc
      limit 1
      offset 1;
      
-- without subquery
 
 select max(salary) as second_highest_salary
 from employees1
 where salary<(select max(salary) from employees1);
 
 -- 2 how do you fecth all employees whose salary is greater than the average salary
 
 select avg(salary) as average_salary
 from employees1
 where salary>(select avg(salary) from employees1);
 
 -- 3 write a query to dispaly the current date and time insert
 
 select current_timestamp();
 
 -- 4 how to find duplicate records in a table
 
 select department,count(*) as count
 from employees1
 group by department
 having count(*)>1;
 
 -- 5 how to retrive the last 10 records from a table
 
 select *from employees1
 order by salary desc
 limit 4;
 
 -- 6 how do you fecth the top 5 employees with the highest salaries
 
 select*from employees1
 order by emp_id desc
 limit 5;
 
 -- 7 how do you calculate the total salary of all employees
 
 select sum(salary) as total_salary
 from employees1;
 
 -- 8 how to write a query to find all employees who joined in the year 2020
 
 select* from employees1
 where year(hire_date) = '2020';
 
 -- 9 how to write a query to find all employees whose name starts with A
 
 select*from employees1
 where emp_name like 'a%';
 
 -- 10 how can you find the employees who do not have a manager
 
 select* from employees1
 where manager_id is null;
 
 -- 11 how to find the department with the highest number of employees
 
 select department,count(*) as count
 from employees1
 group by department
 order by count(*) desc 
 limit 4;
 
 -- 12 how to get the count of employees in each department
 
 select department,count(*)
 from employees1
 group by department;
 
 -- 3 how to write a query to update the salary of all employees by 10%
set sql_safe_updates=0;
 update employees1
 set salary=salary*1.10;
 
 -- 14 how can you find employees whose salary is between 50000 and 100000
 
 select* from employees1
 where salary between 50000 and 100000;
 
--  15 how to find the youngest employee in the organization
 
 select * from employees1
 order by hire_date desc
 limit 1;

 -- 16 write a query to find all employees who report to a specific manager
 
 select*from employees1
 where manager_id =1;
 
 -- 17 how can you find the total number of departments in the company
 
 select count(distinct department)as total_department
 from employees1;
 
 -- 18 how to find the department with the lowest average salary
 
 select department,avg(salary)
 from employees1
 group by department
 order by avg(salary) asc
 limit 1;
 
 -- 19 how to delete all employees from a department in one query
 
 delete from employees1
 where department='it';
 
-- 20 how to write a query to remove all records from a table but keep the table structure

truncate table employees1;

-- 21 how to write a SQL query to dispaly the current month name

select monthname(curdate());

-- 22 how to convert a string to lowercase

select lower(emp_name) as lower_name from employees1;

-- 23 write a query to fetch employees whose salary is a multiple of 10000
 
 select*from employees1
 where salary % 10000=0;
 
 -- 24 how to fetch records where a column has null values
 
 select*from employees1
 where manager_id is null;
 
 -- 25 write a query to fetch all employees whose names end with n
 
 select* from employees1
 where emp_name like 'n';
 
 -- 26 how to write a query to list all employees without a department
 
 select*from employees1
 where department is null;
 
 -- 27 write a query to find the maximum salary and minimum salary in each department
 
 select department,max(salary),min(salary)
 from employees1
 group by department;
 
 -- 28 write a query to display department wise total salary and average salary
 
 select department,
      sum(salary) as total_salary,
      avg(salary) as average_salary
 from employees1
 group by department;
 
 create table employees11(
        emp_id int primary key,
        emp_name varchar(50),
        department varchar(50),
        salary decimal(10,2),
        manager_id int,
        hire_date date
        );
        
        insert into employees11(emp_id,emp_name,department,salary,manager_id,hire_date)values
	  (1,'adam','hr',55000,null,'2018-03-15'),
      (2,'bella','finance',75000,6,'2022-01-12'),
      (3,'chris','finance',90000,6,'2020-08-19'),
      (4,'daisy','it',120000,8,'2019-06-11'),
      (5,'evan','it',85000,8,'2024-07-01'),
      (6,'fiona','finance',95000,null,'2017-09-05'),
      (7,'george','hr',50000,1,'2021-05-22'),
      (8,'henry','it',150000,null,'2016-02-13'),
      (9,'ivy','hr',55000,1,'2023-03-17'),
      (10,'jack','sales',60000,11,'2020-04-02'),
      (11,'kate','sales',100000,null,'2017-11-28'),
      (12,'liam','sales',60000,11,'2023-10-01'),
      (13,'mia','finance',90000,6,'2021-03-09'),
      (14,'nina','it',120000,8,'2022-08-20');
      
      select*from employees11;
      
      -- 29 write a query to fetch employees having the highest salary in each department
      /* first, find the maximum salary per department,
      then, compare each employee' s salary with the max using subquery.*/
      
      select emp_name,department,salary
      from employees11 e
      where salary=(
           select max(salary)
           from  employees11 d
		  where d.department=e.department
      );
      
      -- 30 how to find the second largest value from a table?
      /*find the maximum salary that is smaller than the overall highest salary
      inner query gets highest salary.
      outer query finds the next maximum below that (i.e., second highest).*/
      
      select max(salary) as second_highest_salary
      from employees11
      where salary<(
           select max(salary) as second_highest_salary 
           from employees11
           );
           
           -- 31 how to find employees who do nothave and subordinates(manager,supervisior)?
           /*
           1. inner query find all manager_ids (people who have subordinates)
           2. outer query: pick employees whose emp_id not in that list result:
           employees with no subordinates
           */
           
           select emp_id , emp_name
           from employees11
           where emp_id not in(
                 select distinct manager_id
                 from employees11
                 where manager_id is not null
                 );
                 
                 -- 32 write a query to fetch the details of employees with the same salary (salary occurs more than once)
                 /* 
                 step 1: think in words
                 1. identify salaries that appear more than once.
                 use group by salary and having count(*)>1
                 2. get all employees whose salary is in that list. 
                 */
                 
                 -- 1. inner query find salaries occurring more than once
                 -- 2. outer query fetch employee details whose salary matches these repeated salaries
                 -- result: employees sharing the same salary
                 
                 select* from employees11
                 where salary in(select salary 
                 from employees11
                 group by salary
                 having count(*)>1
                 );
                 
                 -- 33. how to write a query to find employees with the same first name?
                 
                 -- (this only works when our table have separate first_name column) our table does not have so query will show error
                 
                 select*
                 from employees11
                 where emp_name in(
                 select emp_name
                 from employees11
                 group by emp_name
                 having count(*)>1
                 );
                 
                 -- 34. how to list all employees in departments that have not hired in past 2 years?
                 -- problem: find all employees who belong to departments that haven t hired anyone in the past 2 years. 
                 
                 -- inner query:
                 -- groups employees by department and finds the latest hire date per department.
                 -- keeps only those departments where the latest hire date is older than 2 years.
                 -- outer query:
                 -- fetches all employees belonging to those departments
                 -- result:
                 -- employees working in departments that haven t hired anyone in the last 2 years. 
                 -- having filters departments based on their most recent hire date.
                 -- it keeps only those where the last hire was more than 2 years ago. 
                 
                 select* 
                 from employees11
                 where department in(
                 select department
                 group by department
                 having max(hire_date)<date_sub(curdate(),interval 2 year)
                 );
                 
                 -- 35 write a query to find all employees who earn more than the average salary of their department.
                 
                 -- step 1:think in words
                 -- for each employee: inner query depends on outer s department.
                 -- then check if the employee s salary> that department s average.
                 
                 /*
                 correlated subquery: inner query depends on outer query s department.
                 for each employee, inner query calculates the average salary of that department.
                 outer query compares employee s salary with that average.
                 result: employees earning more than their department s average salary. 
                 */
                 
                 select emp_id,emp_name, department,salary
                 from employees11  e 
                 where salary > (
                 select avg(salary)
                 from employees11 d 
                 where d. department=e.department
                 );
                 
                 -- 36  how to list all managers who have more than 5 subordinates?
                 
                 /*
                 step 1: what does it mean?
                 let s understand the terms first:
                 term meaning
                 manager a person who supervises or  manager other employees.
                 subordinates an employee who reports to a manager ( their manager_id = that manager s emp_id). 
                 so basically:
                 each employee has a manager_id.
                 that manager_id is the emp_id of another employee ( that manager)
                 if many employees have the same manager_id, that means they all report to the same manager. 
                 we need to find all managers who have more than 5 people reporting to them. 
                 */
                 
                 -- inner query groups employees by manager_id and counts subordinates. 
                 -- having count(*)>5 filters managers with more than 5 subordinates. 
                 -- outer query finds names of those managers using emp_id in (subquery). 
                 
                 select emp_name,emp_id
                 from employees11
                 where emp_id in(
                 select manager_id
                 from employees11
                 where manager_id is not null
                 group by manager_id
                 having count(*)>5
                 );
                 
                 -- 37 how to find employees whose salary is in top 10% (classic n% problem)
                 
                 
                 -- SQL DATASET SCRIPT FOR EMPLOYEE QUERIES
                 
                 drop table if exists employees2;
                 
                 create table employees2(
                        employeeid int auto_increment primary key,
                        first_name varchar(50),
                        last_name varchar(50),
                        birthdate date,
                        hiredate date,
                        salary decimal (10,2),
                        departmentid int
                        );
                        
                        insert into employees2(first_name,last_name,birthdate,hiredate,salary, departmentid)
                        values
                        ('ajay','kumar','1998-01-15','2010-06-01',60000.28,1),
                        ('ashish','tyagi','1985-02-20','2012-09-15',75000.60,2),
                        ('sachin','dixit','1979-03-10','2011-04-20',80000.01,1),
                        ('richa','mittal','1990-07-12','2015-01-05',70000.90,3),
                        ('aditi','bhardwaj','1988-11-30','2013-10-10',68000.10,2),
                        ('rohit','sharma','1994-05-22','2019-07-19',72000.50,3),
                        ('priya','singh','1996-11-05','2021-10-25',56000.00,1),
                        ('vikas','mehta','1980-04-02','2008-02-11',95000.75,4),
                        ('neha','rao','1992-03-14','2020-10-25',63000.20,4),
                        ('deepak','patel','1999-08-19','2023-05-15',40000.00,2),
                        ('sunita','verma','1983-12-22','2007-11-28',105000.00,1),
                        ('ankit','gupta','1990-09-30','2018-03-10',67000.00,1),
                        ('meena','chopra','1987-06-18','2016-02-05',89000.50,3),
                        ('rahul','nair','1993-01-09','2020-01-22',64000.40,2),
                        ('tanya','kaur','1997-12-01','2024-04-17',52000.00,4);
                        
                        select*from employees2;
                        
                        -- 38 write a query to find the employees who joined in the year 2020
                        
                        select first_name,last_name,hiredate
                        from employees2
                        where year(hiredate)=2020;
                        
                        -- 39 write a query to display all employees who have been in the company for more than 5 years,
                        
                        -- preferred way
                        
                        select*from employees2
                        where timestampdiff(year,hiredate,curdate())>5;
                        
                        -- other way 
                        select*
                        from employees2
                        where datediff(curdate(),hiredate)>1825;
                        
                        -- 40 write a query to list employees hired in the last 6 months,
                        
                        -- date_sub(curdate(),interval 6 month) returns the date six month ago
                        
                        select* 
                        from employees2
                        where hiredate>= date_sub(curdate(),interval 6 month);
                        
                        -- 41 count employees whose names start and end with the same letter
                        -- left() and right() extract first and last characters of the first name
                        
                        select count(*) as same_start_end_name
                        from employees2
                        where lower(left(first_name,1))=lower(right(first_name,1));
                        
                        -- 42 retrieve employees names and salaries in a single string
                        -- concat() merges first name,last name and salary into one filed
                        
                        select concat(first_name,'___',last_name, 'and', salary)as employeesalary
                        from employees2;
                        
                        -- 43 write a query delete employees who have been in the  company for more than 15 years
                        -- be cautious this permanentiy removes rows
                        
                       
 from emplo delete from employees2
                        where timestampdiff(year,hiredate, curdate())>15;
                        
                        -- other way 
                        delete from employees2
                        where datediff(curdate(),hiredate)>5475;
                        
                        -- 44 list employees with more than 5 years experience in each departmet
                        -- group by departmentid to categorize by department
                        
                        -- 45 display employees grouped by their agr (20-30, 30-40,etc)
                        
                        -- when we have column named age so we can use  this query
                        
                        /*
                        select case
                            when age between 20 and 30 then '20-30'
                            when age between 31 and 40 then '31-40'
                            else '41+'
                            end as age_bracket
                            count(*)
                            from employees1
                            group by age_bracket
                            */
                            
                            /* timestampdiff (year, birthdate, curdate()) calculates the age in years by comparing the birth date with the current date
                            it doesn t depend on an existing age column.
                            this is more dynamic and accurate especially when  ages change every year
                            works perfectly even if your table only has birthdate.
                            automatically updates with time _ no need to update  age manually.
                            */
                            
                            -- timestampdiff (year, birthdate, curdate()) calculates age
                            
                            select 
                                case 
                                   when timestampdiff(year, hire_date, curdate()) between 20 and 29 then  '20-29'
                                   when timestampdiff(year, hire_date, curdate()) between 30 and 39 then '30-39'
                                   when timestampdiff(year, hire_date, curdate()) between  40 and 49 then '40-49'
                                   else '50+'
                                   end as agerange,
                                   count(*) as totalemployees
                                   from employees1
                                   group by agerange;
                                   
 
 -- 46 write a query to display the hire date and day of the week for each employees
 -- dyname() returns the weekday name (e.g., manday)
 
 select emp_name, department,
 hire_date,
 dayname(hire_date) as day_of_week
 from employees1;
 
 
 -- 47  how to find employees who are older than 30 years
 
 -- preferred way 
 -- use timestampdiff to compute current age
 
 select* 
 from employees1
 where timestampdiff( year, hire_date, curdate())>30;
 
 -- another way it doesnt handle leap years
 select *
 from employees2
 where datediff(curdate(), birthdate) / 365 > 30;
 
 
 
 -- 48 display employees grouped by salary range (e.g.,0-20k. 20k-50k, etc)
 
 -- salary grouping done via case expressions
 
 select
      case
        when salary between 0 and  20000 then '0-20k'
        when salary between 20001 and 50000 then '20k-50k'
        when salary between 50000 and 100000 then '50k-100k'
        else '100k+'
        end as salaryrange,
        count(*) as employeecount
        from employees1
        group by salaryrange;
        
        -- 49 write a query to  display employee name and hire dates in the format "name - mm/dd/yyyy".
        
        select concat(emp_name, ' ', date_format(hire_date, '%m%d%y')) as employee_info
        from employees1;
        
        -- if we have to combine first_name , last_name(two difference columns)
        
        select 
        concat(emp_name, ' ', department, date_format(hire_date,'%m%d%y')) as employee_info
        from employees1;
        
        
        -- 50 write to fetch the first and last record from a table ?
        -- 51 write a query to calculate the total sales per customer in a sales table.
        -- 52 write a query to find  the total number of employees in each job title.
        -- 53 write a query to updates salaries of employees based on the department.
        -- 54 write a query to list all employees working under the same manager.
        -- 55 write a query to find all employees whose email contains the domain @example . com .
        -- 56 write  a query to list all employees who do  not have a bouns.
        -- 57 write a query to display the highest lowest, and average salary for each job title.
        
        
        drop table if exists employees;
        drop table if exists sales;
        set sql_safe_updates=0;
        
        -- =====================================================================================================
        -- creates sales table (for toatl sales per customer )
        -- =====================================================================================================
        create table sales2(
               sales_id int auto_increment primary key,
               customer_id int,
               amount decimal(10,2)
               );
               
               insert into sales2(customer_id , amount) values
               (1,250.00),
               (1,150.00),
               (2,400.00),
               (2,75.25),
               (3,500.00),
               (3,120.75);
               
               select * from sales2;
               
               -- ============================================================================
               -- create employees12 table ( for all other queries)
               -- ============================================================================
        
        create table employees12(
               employee_id int auto_increment primary key,
               name varchar(100),
               job_title varchar(50),
               department varchar(50),
               manager_id int,
               email varchar(100),
               salary decimal(10,2),
               bonus decimal(10,2)
               );
               
insert into employees12(name,job_title,department,manager_id,email,salary,bonus) values
('Alice', 'Data Analyst', 'IT', 5, 'alice@example.com', 55000, 5000),
('Bob', 'Data Analyst', 'IT', 5, 'bob@example.com', 52000, NULL),
('Charlie', 'HR Executive', 'HR', 6, 'charlie@companymail.com', 45000, 0),
('David', 'HR Manager', 'HR', NULL, 'david@example.com', 70000, 8000),
('Evelyn', 'IT Manager', 'IT', NULL, 'evelyn@example.com', 85000, 10000),
('Frank', 'Sales Executive', 'Sales', 7, 'frank@example.com', 48000, NULL),
('Grace', 'Sales Manager', 'Sales', NULL, 'grace@example.com', 90000, 12000),
('Hannah', 'Developer', 'IT', 5, 'hannah@example.com', 60000, 0),
('Ivy', 'Developer', 'IT', 5, 'ivy@companymail.com', 61000, 2000);

select * from employees12;

 -- 50 how to fetch the first and last record from a table?
 
 -- first record ( based on employees_id)
 
 select*yees12
 order by employee_id asc
 limit 1;
 
 -- last record ( based on employee_id)
 
 select*
 from employees12
 order by employee_id desc
 limit 1;
 
 -- both together
 (select*from employees12 order by employee_id asc limit 1)
 union all
 (select* from employees12 order by employee_id desc limit 1);
 
 -- 51 write a query to calculate the total sales per customer in a sales table.
 
 select
     customer_id,
     sum(amount) as total_sales
     from sales2
     group by customer_id;
 
-- 52 write a query to find the total number of employees in each job  title

select 
job_title,
count(*) as total_employees
from employees12
group by job_title;
 
 -- 53 write a query to update salaries of employees based on  their department. 
 -- example: 10% raise for it, 5% for hr, no change for others,
 
update employees
 set salary=
    case
       when department ='it' then salary * 1.10
       when department = 'hr' then salary * 1.05
       else salary
       end;
   
   -- see updates records
   select * from employees12;
   
   -- 54 write a query to list all employees working under the same manager . ( example working under the manager who has id 5)
   
   select*
   from employees12
   where manager_id =5;
   
   
   -- 55 write a query to find all  employees whose email comtains then domain @example.com.
   
   select*
   from employees12
   where email like '%@example .com';
   
   
   -- 56 write a query to list all employees who do  not have a bouns ,
   -- returns all employees missing a bouns (null or 0),
   
   -- one way 
   select* 
   from employees12
   where bonus is null;
   
   -- other way both depends on column
   select * 
   from employees12
   where bonus =0;
   
   -- 57 write a query to display the highest , lowest and average salary  for each job title,
   
   select 
   job_title,
   max(salary) as highest_salary,
   min(salary) as lowest_salary,
   avg(salary) as average_salary
   from employees12
   group by job_title;
   
   
   -- 58 how to get the nth highest salary?
   -- 59 how can you delete duplicate rows?
   -- 60 how to find the second highest salary for each department?
   -- 61 how to find the top 3 highest  paid employees in each department?
   -- 63 how to find the average salary of top 5 highest paid  employees in each department?
   
   -- create table
   create table employees13(
          emp_id int primary key,
          emp_name varchar(50),
          department varchar(50),
          salary decimal(10,2),
          hire_date date
      );    
	
      
      
      -- insert sample recorda
insert into employees13( emp_id,emp_name,department,salary, hire_date)values
(101, 'John Smith', 'IT', 90000, '2020-01-10'),
(102, 'Alice Brown', 'IT', 85000, '2019-11-02'),
(103, 'Robert King', 'IT', 75000, '2021-03-22'),
(104, 'Emma Jones', 'HR', 65000, '2018-06-12'),
(105, 'Olivia Davis', 'HR', 70000, '2020-08-09'),
(106, 'Liam Miller', 'Finance', 95000, '2019-02-19'),
(107, 'Noah Wilson', 'Finance', 85000, '2021-09-14'),
(108, 'Ava Taylor', 'IT', 90000, '2018-07-30'),
(109, 'Sophia White', 'HR', 65000, '2019-05-03'),
(110, 'Mason Lee', 'Finance', 90000, '2022-05-25');

select* from employees13;

-- 58 how to get the nth highest salary? ( 3rd highest salary)

-- using limit/ offset
select distinct salary
from employees13
order by salary desc
limit 1
offset 2;


-- using DENSE_RANK() WINDOW FUNCTIONS + SUNQUERY

select salary
from(
select salary,
         dense_rank() over (order by salary desc) as rnk
         from employees13
         ) ranked_salaries
         where rnk = 3;
         
         
	-- using CTE WITH DENSE_RANK()
    with salary_ranks as (
          select salary,
                    dense_rank() over (order by salary desc) as rnk
                    from employees13
                 )
                 select salary -- use distinct if want unique salary where people share same salary
                 from salary_ranks
                 where rnk = 3;
                 
                 
                 -- 59 how can you delete duplicate rows
                 
                 -- 60 how to find the second highest salary for  each dpartment?
                 -- if we have to find highest paid employee  per department just write - (where rnk =1)
                 
                 -- using subquery + dense_rank()
                 
                 select department,salary
                 from(
                    select department,
                            salary,
                            dense_rank() over(partition by department order by salary desc) as rnk
                            from employees13
                            )as ranked_salaries
                            where rnk = 2;
                            
                            
                            -- using CTE + DENSE_RANK()
                            with ranked_salaries as(
                                   select department,
                                          emp_name,
                                          salary,
                                          dense_rank() over(partition by department order by salary desc) as rnk
                                          from employees13
                                          )
                                          select department, emp_name, salary
                                          from ranked_salaries
                                          where rnk = 2;
                                          
                                          -- 61 how to find the top 3 highest paid employees in each department?
                                          
                                          select* 
                                          from(
                                              select *,
                                                    dense_rank() over(partition by department order by salary desc) as rnk
                                                    from employees13
                                                    )as ranked_employees
                                                    where rnk <= 3;
                                                    
       --  Q62. How to find the average salary of top 5 highest paid employees in each department? 



-- Goal: Find the average salary of the top 5 highest-paid employees in each department
-- Step 1: Assign a DENSE_RANK to each employee within their department
-- based on salary in descending order (highest first)
with rankes_employees as (
                     select department,
                              salary,
                              dense_rank() over(partition by department order by salary desc) as rnk
                              from employees13
                              )  
                              
   -- step 2: filter only top 5 salaries ( rank <= 5) in each department
   -- step 3: group by department and calculate the average of those top salaries
   select
       department,
        avg(salary) as avg_top_5_salary
        from ranked_employees
        where rnk <= 5
        group by department;
                              
         -- logic summary:
         -- 1. dense_rank() assigns ranks like 1,2,3 per department, skipping duplicates correctly,
         -- 2 where rank <=5 keeps only top 5 unique salary levels per department,
         -- 3 avg(salary) then computes the mean salary of those top 5 salaries per department,
         
         
         -- complete query
         select department,
         avg(salary) as avg_top_5_salary
         from(
            select department,
                    salary,
                    dense_rank() over(partition by department order by salary desc) as rnk
                    from employees13
                    ) as ranked_employees
                    where rnk <= 5
                    group by department;
                    
   -- 63 how to get the common records from two tables,
   -- (we could have used set operator intersect tp get common records from two tables but it does not work in mysql we can use inner join)
   
   -- create first table: table1
   CREATE TABLE table1 (
  id INT,
  name VARCHAR(50),
  department VARCHAR(50),
  salary INT
);

-- Create second table: table2
CREATE TABLE table2 (
  id INT,
  name VARCHAR(50),
  department VARCHAR(50),
  salary INT
);

-- Insert sample data into table1
INSERT INTO table1 (id, name, department, salary) VALUES
(1, 'Sameer', 'IT', 50000),
(2, 'Ayesha', 'HR', 60000),
(3, 'Ravi', 'Finance', 55000),
(4, 'Neha', 'IT', 50000);

-- Insert sample data into table2
INSERT INTO table2 (id, name, department, salary) VALUES
(2, 'Ayesha', 'HR', 60000),
(3, 'Ravi', 'Finance', 55000),
(5, 'John', 'IT', 40000),
(6, 'Ali', 'Marketing', 45000);

-- Using INNER JOIN to find records that exist in both tables
select 
    t1.*             -- select all coiumns from table1
    from 
    table1 t1
  inner join            -- alias 't1' represents table1
  table2 t2             -- alias 't2' represents table2
  on
  t1.id = t2.id         -- match based on id column
  and t1 .name = t2. name   -- match based on name column
  and t1 . department = t2.department   -- match basedd on departmnet
  and t1.salary = t2.salary;             -- match based on salary
  
  
  -- 1. INNER JOIN returns only rows that exist in BOTH tables.
-- 2. The ON condition checks equality for each column that defines a "common record".
-- 3. t1.* means "show all columns from table1" (not from both).
-- 4. You can add or remove AND conditions depending on how many columns should match.
-- 5. This query works as an INTERSECT equivalent in MySQL.

-- Expected Output:
-- id | name  | department | salary
--  2 | Ayesha | HR        | 60000
--  3 | Ravi   | Finance   | 55000


-- Q64 How to write a query to check if a table is empty or not?
-- (method one preferred)

select 
    case
       when count(*) =0 then 'table is empty'
       else 'table has data'
       end as status
       from table1;
       
       
       -- Explanation:
-- COUNT(*) counts all rows in table1.
-- If the count is 0, that means the table has no data.
-- The CASE expression returns a human-readable message.

-- (method two) Simple check using LIMIT

-- If you just want to know whether at least one record exists (without counting all rows):

SELECT 1 
FROM table1 
LIMIT 1;

-- If this returns one row (1) → table has data.
-- If it returns no rows → table is empty.
-- This is faster than counting, especially for big tables, because MySQL stops scanning after finding one record.


-- Q65 How to find all employees who work in both departments 101 and 102?

-- GOAL: Find employees who work in BOTH departments 101 and 102

-- Step 1: Create a sample table for demonstration
CREATE TABLE employeesN (
    employee_id INT,
    department_id INT
);

-- Step 2: Insert sample data
INSERT INTO employeesN (employee_id, department_id) VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 102),
(4, 103),
(5, 101),
(5, 102),
(6, 101);


SELECT employee_id                            -- Select employee_id to identify employees
FROM employeesN
WHERE department_id IN (101, 102)            -- Step 4: Consider only departments 101 and 102
GROUP BY employee_id                            -- Step 5: Group all records by each employee
HAVING COUNT(DISTINCT department_id) = 2;     -- Step 6: Keep only employees who appear in BOTH departments
                                           
-- LOGIC EXPLANATION:
-- 1. The WHERE clause filters records to only departments 101 and 102.
-- 2. GROUP BY groups all rows belonging to the same employee together.
-- 3. COUNT(DISTINCT department_id) counts how many unique departments each employee belongs to.
-- 4. If that count = 2 (both 101 and 102), the employee qualifies.
-- 5. Output shows only employees working in BOTH departments.
-- =====================================================

-- Expected Output:
-- +--------------+
-- | employee_id  |
-- +--------------+
-- |      1       |
-- |      5       |
-- +--------------+

-- Q66 How to find employees who joined the company in the same month and year as their manager?
-- (we have to use self join if employees and manager are in same table) even if we have two tables for employee and manager query will be same

-- GOAL: Find employees who joined in the same month and year as their manager

-- Step 1: Create the employees table
CREATE TABLE employees111 (
    employee_id INT,
    name VARCHAR(50),
    manager_id INT,
    join_date DATE
);

-- Step 2: Insert sample data
INSERT INTO employees111 (employee_id, name, manager_id, join_date) VALUES
(1, 'Ravi', NULL, '2020-05-10'),   -- Manager (no manager_id)
(2, 'Neha', 1, '2020-05-25'),      -- Same month/year as Ravi (May 2020)
(3, 'Amit', 1, '2020-06-12'),      -- Different month
(4, 'Priya', 2, '2020-05-15'),     -- Same as her manager Neha
(5, 'Sameer', 1, '2021-05-05');    -- Different year

SELECT * FROM employees111;
-- =====================================================
-- Step 3: Self JOIN to compare employees and their managers
-- =====================================================

select
    e.name as employees_name,
    m.name as manager_name,
    e.join_date as employees_join_date,
    m.join_date as manager_join_date
 from employees111 e 
 join employees111 m 
 on 
      e.manager_id = m. employee_id
      and month(e.join_date) = month(m.join_date)
      and year(e.join_date) = year(m.join_date);
      
      -- =====================================================
-- LOGIC EXPLANATION:
-- 1. 'e' represents employees, 'm' represents managers (both from the same table).
-- 2. e.manager_id = m.employee_id links each employee to their manager.
-- 3. MONTH() and YEAR() functions extract month and year parts of the join date.
-- 4. Only employees whose joining month and year match their manager’s are returned.
-- =====================================================

-- Expected Output:
-- +---------------+--------------+-------------------+-------------------+
-- | employee_name | manager_name | employee_join_date| manager_join_date |
-- +---------------+--------------+-------------------+-------------------+
-- | Neha          | Ravi         | 2020-05-25        | 2020-05-10        |
-- | Priya         | Neha         | 2020-05-15        | 2020-05-25        |
-- +---------------+--------------+-------------------+-------------------+

-- Q67 How to find employees whose salary is higher than their managers salary?

CREATE TABLE employees22 (
    employee_id INT,
    name VARCHAR(50),
    manager_id INT,
    salary DECIMAL(10,2)
);

INSERT INTO employees22 (employee_id, name, manager_id, salary) VALUES
(1, 'Ravi', NULL, 90000),   -- Manager (no manager)
(2, 'Neha', 1, 85000),
(3, 'Amit', 1, 95000),      -- Higher than manager Ravi
(4, 'Priya', 2, 80000),
(5, 'Sameer', 1, 87000);

SELECT * FROM employees22;

-- Find employees whose salary is higher than their manager's salary

SELECT
    e.name AS employee_name,       -- Employee's name
    e.salary AS employee_salary,   -- Employee's salary
    m.name AS manager_name,        -- Manager's name (from same table)
    m.salary AS manager_salary     -- Manager's salary
FROM employees22 e                   -- 'e' is alias for employee table
JOIN employees22 m                    -- 'm' is alias for same table (manager side)
    ON e.manager_id = m.employee_id -- Match each employee to their manager
WHERE e.salary > m.salary;          -- Filter: only employees earning more than their manager

-- Q68 How to calculate the percentage of employees in each department?

CREATE TABLE employees4 (
    employee_id INT,
    name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO employees4 (employee_id, name, department) VALUES
(1, 'Ravi', 'HR'),
(2, 'Neha', 'IT'),
(3, 'Amit', 'IT'),
(4, 'Priya', 'Finance'),
(5, 'Sameer', 'IT'),
(6, 'Kiran', 'Finance'),
(7, 'Anjali', 'HR');

SELECT * FROM employees4;

select
    department,
    count(*) as total_employees, -- step 1: count how many employees are in each department
    
-- step 2: calculate percentageof total employees
-- (department count _ total employees) * 100
round((count(*) * 100.0 / (select count(*) from employees)),2)
    as percentage_of_total
 from employees0
 group by department;  -- step 3: group by department to aggregate counts
 
 -- we  could have solve this without using round() function
 
 -- step 1: count total employees in each department using group by
 -- step 2: divide department count by total employees * 100 to get percentage
 -- step 3: no round() used _ showing full decimal result as in notes
 
 select
     department,
     count(*) as total_employees,
	(count(*) * 100.0 /(select count(*) from employees)) as percentage_of_total
     from employees4
     group by department;
     

-- Q69 How to retrieve the year-to-date sales from each customer?

CREATE TABLE sales1 (
    sale_id INT,
    customer_id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO sales1 (sale_id, customer_id, sale_date, amount) VALUES
(1, 101, '2025-01-15', 1200.00),
(2, 101, '2025-03-12', 800.00),
(3, 102, '2025-02-05', 1500.00),
(4, 103, '2024-12-20', 950.00),   -- Previous year (not part of 2025 YTD)
(5, 102, '2025-05-25', 700.00),
(6, 103, '2025-04-02', 400.00);

SELECT * FROM sales1;


SELECT 
    customer_id, 
    SUM(amount) AS year_to_date_sales  -- Step 1: Sum all sales for the year per customer
FROM sales1
WHERE YEAR(sale_date) = YEAR(CURDATE()) -- Step 2: Include only records from the current year
GROUP BY customer_id;                   -- Step 3: Group by customer to get total per person


-- less dynamic because we are mentoning year manually (24-01-01)
SELECT 
    customer_id, 
    SUM(amount)
FROM sales1
WHERE sale_date BETWEEN '2024-01-01' AND CURDATE()
GROUP BY customer_id;


-- Q70 Write a query to get all employee records in XML format

-- Q70: Retrieve all employee records in XML format
-- Step 1: Select the required columns from the employees table
-- Step 2: Use FOR XML AUTO to automatically convert the result into XML
-- Note: FOR XML is supported in SQL Server, not MySQL

SELECT 
    employee_id, 
    name, 
    salary
   FROM employees
-- FOR  XML AUTO;   # XML keyword is not supported in MYSQL thats why i commented it
 