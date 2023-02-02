---Write a query identifying the type of each record in the TRIANGLES table using its three side lengths.
---Output one of the following statements for each record in the table:

---Equilateral: It's a triangle with  sides of equal length.
---Isosceles: It's a triangle with  sides of equal length.
---Scalene: It's a triangle with  sides of differing lengths.
---Not A Triangle: The given values of A, B, and C don't form a triangle

create table triangles(
a int,
b int,
c int
)

select * from triangles

insert into triangles values (20,20,23), (20,20,20), (20,21,22), (13,14,30)

select case 
when (A+B<=C or B+C<=A or A+C<=B) then 'Not A Triangle' 
when (A=B and B=c) then 'Equilateral' 
when (A=B AND C<>B) or (B=C AND C<>A) or (A=C AND A<>B) then 'Isosceles' 
else 'Scalene'
end
from triangles


---Query an alphabetically ordered list of all names in OCCUPATIONS, 
---immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). 
---For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
---Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

---There are a total of [occupation_count] [occupation]s.
---where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name.
---If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
---Note: There will be at least two entries in the table for each type of occupation.

create table occcupations(
name nvarchar(50),
occupation nvarchar(50),
)
insert into occcupations values ('samantha','doctor'),('julia','actor'),('maria','actor'),('meera','singer'),('asheley','professor')
select * from occcupations

select name + '(' + left(occupation,1) + ')' from occcupations order by name ASc

SELECT CONCAT('There are a total of ', COUNT(occupation), ' ', LOWER(occupation), 's.')
FROM occcupationss
GROUP BY occupation
ORDER BY COUNT(occupation), occupation