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


select distinct CITY,len(CITY) as length from STATION 

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