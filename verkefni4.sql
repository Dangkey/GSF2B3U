Insert Skipun
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
	call AddStudent('Dav��',18,'Dav��@gmail.com','8455622',1,11,9);

Select Skipun
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



Update skipun
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



Delete Skipun

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
