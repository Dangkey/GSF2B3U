--Skipun sem býr til nemanda
Delimiter //
create procedure AddStudent(
name varchar(40),
age int(11),
email varchar(30),
phoneNo varchar(7),
schoolID int(11),
divisionID int(11),
trackID int(11)
)		
begin
insert into students(name,age,email,phoneNo,schoolID,divisionID,trackID)
Values(name,age,email,phoneNo,schoolID,divisionID,trackID);
end //
Delimiter ;
	-- test student
call AddStudent('Davíð',18,'Davíð@gmail.com','8455622',1,11,9);

--Skipun til að sýna upplýsingar um nemanda
Delimiter //
create procedure SelectStudents(
studentname varchar(50)
)
begin	
select * from students   
where name = studentname;  
end //
delimiter ;    


call SelectStudents('Hilmar')



--Skipun sem breytir nafninu á nemanda
Delimiter //
create procedure UpdateStudents(
oldstudentname varchar(50),
studentname varchar(50)
)
begin    
update students    
set name = studentname    
where oldstudentname = name;    
end //  
delimiter ;
	

call UpdateStudents('Hilmar','Bob');



--Skipun sem eyðir nemanda með nafninu sem þú kallar í

Delimiter //
create procedure DeleteStudents(
studentname varchar(50)
)	
begin	
delete from students   
where name = studentname;  
end //  
delimiter ;


call DeleteStudents('Jenny')
