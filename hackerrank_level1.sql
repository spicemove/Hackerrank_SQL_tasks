---Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

create table CITY(
ID INT,
NAME NVARCHAR(17),
COUNTRYCODE VARCHAR(3),
DISTIRICT VARCHAR(20),
POPULATION INT
)

select * from CITY

insert into CITY values(1661,'america','USA','TX', 5000),(2,'america','USA','TX', 10000),(3,'india','ID','TG', 20000),(4,'america','USA','TX', 100000),
(5,'america','USA','TX', 500000)

select * from CITY where COUNTRYCODE = 'USA' and POPULATION > 100000


---Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

select NAME from CITY where COUNTRYCODE = 'USA' and POPULATION > 120000


---Query all columns (attributes) for every row in the CITY table.

select * from CITY

---Query all columns for a city in CITY with the ID 1661.

select * from CITY where ID = 1661

---Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

select * from CITY where COUNTRYCODE = 'JPN'

---Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

select NAME from CITY where COUNTRYCODE = 'JPN'