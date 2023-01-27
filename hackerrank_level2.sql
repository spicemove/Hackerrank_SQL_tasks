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


select CITY,len(CITY) as length from STATION