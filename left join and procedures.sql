select * from CITY

select * from employee

select *, ROW_NUMBER() over (order by employee_id ) as ID into temp_employee from employee

select * from temp_employee
select * from CITY

select * from CITY
right join temp_employee 
on city.ID  = temp_employee.ID


create procedure proc_name
as 
select * from CITY
right join temp_employee 
on city.ID  = temp_employee.ID
go

exec proc_name