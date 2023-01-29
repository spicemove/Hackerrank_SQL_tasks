create table STATION(
id int,
city varchar(21),
state varchar(2),
lat_n int,
lat_w int
)

select * from STATION

---Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

select ((select count(city) from station)-(select count(distinct city) from station));

---Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name).
---If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.


with ct1 as (select city, len(city) as Leng, ROW_NUMBER() OVER (ORDER BY len(city),city ASC) as RowNum from station)
(select CITY,len(CITY) from ct1 where RowNum = (select count(id) from station) or RowNum=1)

---OR 

select top 1 city, len(city) from station order by len(city) ASC, city ASC; 
select top 1 city, len(city) from station order by len(city) DESC, city ASC; 

---Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

select distinct city from STATION where left(city,1) in ('a', 'e', 'i', 'o', 'u')

---Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

select distinct city from STATION where right(city,1) in ('a','e','i','o','u')

---Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters.
---Your result cannot contain duplicates.

select distinct city from STATION where left(city,1) in ('a', 'e', 'i', 'o', 'u') and right(city,1) in ('a','e','i','o','u')

---Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

select distinct city from STATION where left(city,1) not in ('a', 'e', 'i', 'o', 'u')

---Query the list of CITY names from STATION that do not ends with vowels. Your result cannot contain duplicates.

select distinct city from STATION where right(city,1) not in ('a', 'e', 'i', 'o', 'u')

---Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

select distinct city from STATION where left(city,1) not in ('a', 'e', 'i', 'o', 'u') or right(city,1) not in ('a','e','i','o','u')

---Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

select distinct city from STATION where left(city,1) not in ('a', 'e', 'i', 'o', 'u') and right(city,1) not in ('a','e','i','o','u')


---Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. 
---If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

create table student(
id int,
name varchar(20),
markes int
)

select * from student

insert into student values (1, 'Ashley', 81), (2, 'Samantha', 75), (3, 'Julia', 76), (4, 'Belvet', 84)

select name from student where markes > 75 order by right(name,3) Asc, id Asc

---Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
---where employee_id is an employee's ID number, name is their name, 
---months is the total number of months they've been working for the company, and salary is their monthly salary

create table employee(
employee_id int,
name nvarchar(30),
months int,
salary int
)

select * from employee

insert into employee values (12228,'Rose',15,1968),(33645,'Angela',1,3443),(45692,'Frank',17,1608),(56118,'Patrick',7,1345),(59725,'Lisa',11,2330),(74197,'Kimberly',16,4372),
(78454,'Bonnie',8,1771),(83565,'Michael',6,2017),(98607,'Todd',5,3396),(99989,'Joe',9,3573)

select name from employee order by name Asc

---Write a query that prints a list of employee names (i.e.: the name attribute) 
---for employees in Employee having a salary greater than 2000 per month who have been employees for less than 10 months.
---Sort your result by ascending employee_id

select name from employee where salary > 2000 and months < 10 order by employee_id Asc