-- 1. Hannið viðbætur við ProgressTracker gagnagrunninn þannig að nú sé hægt að skrá nemanda og að
-- sá nemandi geti valið sér námsleið(innan námsbrautar).

	create table students(
		student_id int(11) not null primary key auto_increment,
		name varchar(40) not null,
		age int(11),
		email varchar(30) unique key,
		phoneNo varchar(7),
		schoolID int(11) default 1,
		divisionID int(11),
		trackID int(11)
	);
	INSERT INTO `students` (`student_id`, `name`, `age`, `email`, `phoneNo`, `schoolID`, `divisionID`, `trackID`) VALUES
	(1, 'Hilmar', 18, 'hillisnillig@gmail.com', '8455622', 1, 11, 9),
	(2, 'James', 18, 'bla', '8455622', 1, 11, 9),
	(3, 'Stella', 18, 'abc', '8455622', 1, 11, 9),
	(4, 'Jenny', 18, 'qwerty', '8455622', 1, 11, 9);
	
	create table studentCourses(
		studentID int(11),
		courseNumber char(10),
		mandatory  char(10),
		lokið tinyint(1),
		primary key (studentID , CourseNumber),
		foreign key (studentID) references students(student_id)
	);
	INSERT INTO `studentcourses` (`studentID`, `courseNumber`, `Lokið`) VALUES
	(1, 'EÐL403', 1),
	(1, 'FOR3G3U', 1),
	(1, 'GSF3A3U', 1),
	(1, 'STÆ403', 1),
	(2, 'EÐL203', 0),
	(2, 'FOR3D3U', 1),
	(2, 'GSF2B3U', 1),
	(3, 'EÐL303', 1),
	(3, 'GSF2B3U', 0),
	(4, 'EÐL103', 1);

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
	
	
-- 2. Skrifið trigger fyrir insert aðgerð í töfluna Restrictors. Triggerinn kemur í veg fyrir að
-- courseNumber og RestrictorID séu sami kúrsinn. Sé um sama kúrs að ræða, kastar triggerinn villu,
-- skrifar út villutexta og kemur í veg fyrir insert.

Delimiter //
create trigger before_resistors_insert
before insert on restrictors
for each row
begin
    if (NEW.courseNumber = NEW.restrictorID) then
		signal sqlstate '45000' set message_text = 'The course number cannot be the same as the Restrictor ID';
    end if;
end //
delimiter ;


insert into restrictors
Values
('FOR','FOR',1)
-- 3. Skrifið samskonar trigger fyrir update aðgerð í töfluna Restrictors.

Delimiter //
create trigger before_resistors_update
before update on restrictors
for each row
begin
    if (NEW.courseNumber = NEW.restrictorID) then
		signal sqlstate '45000' set message_text = 'The course number cannot be the same as the Restrictor ID';
    end if;
end //
delimiter ;

update restrictors set courseNumber  = 'GSF', restrictorID = 'GSF', restrictorType = 1 where restrictorID = 'STÆ103'

-- 4. Skrifið stored procedure sem leggur saman allar einingar sem nemandinn hefur lokið á ákv. námskeiðum

Delimiter //
create procedure samtals_einingar(
student int(11)
)
begin
select students.name, sum(courseCredits) from courses
join studentcourses
on studentcourses.courseNumber = courses.courseNumber
join students
on studentcourses.studentID = students.student_ID
where studentID = student and studentcourses.lokið = 1;
end //
delimiter ;

call samtals_einingar(2);

-- 5. Skrifið cursor sem sækir alla skylduáfanga sem nemandi þarf að taka og setur þá í töfluna sem
-- geymir áfanga sem hann hefur valið. Setjið cursorinn í stored procedure sem gæti heitið eitthvað
-- "AddMandtoryCourses” og er keyrður þegar nemandinn velur sér námsleið(sú aðgerð gæti verið í
-- SP sem heitir "NewStudent”)




