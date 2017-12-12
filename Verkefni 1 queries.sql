-- ********************** -- Skrifið eftirfarandi stored procedures: --**********************

-- 1:	CourseList()
-- Birtir lista(yfirlit) af öllum áföngum sem geymdir eru í gagnagrunninum.
-- Áfangarnir eru birtir í stafrófsröð 
	Delimiter //
create procedure Courselist()
	begin
		select * from courses
		order by courseNumber;
	end //
Delimiter ;

call CourseList()
-- 2:	SingleCourse()
-- 	Birtir upplýsingar um einn ákveðin kúrs.
--  Færibreytan er áfanganúmerið
Delimiter //
create procedure SingleCourse(course char(10))
    begin
		select * from Courses
		where coursenumber = course;
	end //
Delimiter ;

call SingleCourse('STÆ403')
-- 3:   NewCourse()
--  Nýskráir áfanga í gagnagrunninn.
--  Skoðið ERD myndina til að finna út hvaða gögn á að vista(hvaða færibreytur á að nota)
--  NewCourse er með out parameterinn number_of_inserted_rows sem skilar fjölda þeirra
--  raða sem vistaðar voru í gagnagrunninum.  Til þess notið þið MySQL function: row_count()	
Delimiter //
create procedure NewCourse(
in course_number char(10),
in course_name varchar(75),
in course_credits int,
OUT number_of_inserted_rows int)
    begin    
    Insert into courses
    values(course_number,course_name,course_credits);
    set number_of_inserted_rows = row_count();
end //
Delimiter ;

call NewCourse('GSF','GSF',3,@v); SELECT @v AS 'Number of Inserted Rows';
   

-- 4:	UpdateCourse()
--  Hér eru notaðar sömu færibreytur og í lið 3.  Áfanganúmerið er notað til að uppfæra réttan kúrs.alter
-- row_count( fallið er hér notað líka.

	Delimiter //
create procedure UpdateCourse(old_course_number char(10),course_number char(10),course_name varchar(75),course_credits int)
	begin
    update courses
    set coursenumber = course_number,coursecredits = course_credits,coursename = course_name
    where old_course_number = coursenumber;
    end //
    delimiter ;
	
	call UpdateCourse('GSF','For','For',3);
-- 5:	DeleteCourse()
-- Áfanganúmer(courseNumber) er notað hérna til að eyða réttum kúrs.
-- ATH: Ef verið er að nota kúrsinn einhversstaðar(sé hann skráður á TrackCourses) þá má EKKI eyða honum.
-- Sé hins vegar hvergi verið að nota hann má eyða honum úr Courses töflunni og einnig Restrictors töflunni.alter
-- sem fyrr er out parameter notaður til að "skila" fjölda þeirra raða sem eytt var úr töflunni COurses

	Delimiter //
	create procedure DeleteCourse(course_number char(10))
	begin
    Delete from courses
    where coursenumber = course_number;
    end //
    delimiter ;
    
call DeleteCourse('For')
-- ********************** -- Skrifið eftirfarandi functions: --**********************

-- 6:	NumberOfCourses()
-- fallið skilar heildarfjölda allra áfanga í grunninum
	Delimiter //
create Function NumberOfCourses()
    RETURNS int
    begin
    declare Amount_of_Corses int;
    set Amount_of_Corses = (
    select count(*)
    from courses);
    return Amount_of_Corses;
end //
Delimiter ;

select NumberOfCourses()
-- 7:	TotalTrackCredits()
--  Fallið skilar heildar einingafjölda ákveðinnar námsbrautar(track)
--  Senda þarf trackID inn sem færibreytu
	Delimiter //
create function TotalTrackCredits(trackid int)
    returns int
    begin
    declare total_credits int;
    set total_credits = (
    select sum(coursecredits) from courses
join trackcourses on trackcourses.courseNumber = courses.courseNumber
join tracks on trackcourses.trackID = tracks.trackID
where trackcourses.trackID = trackid);
return total_credits;
end //
Delimiter ;

select TotalTrackCredits(9)
-- 8:   HighestCredits()
-- Fallið skilar einingafjölda þess námskeiðs(þeirra námskeiða) sem hafa flestar eininar.
-- ATH:  Það geta fleiri en einn kúrs verið með sama einingafjöldann. :að á ekki að hafa 
-- áhfri á niðurstöðuna.


-- 9:  TopTracksDivision()
-- Fallið skilað toppfjölda námsbrauta(tracks) sem tilheyra námsbrautum(Divisions)

-- 10:  leastRestrictedCourseNumber()
-- Fallið skilar minnsta fjölda kúrsa í Restrictors töflunni.
-- ATH:  Ef kúrs eða kúrsar eru t.d. með einn undanfara þog ekkert meir þá myndi fallið skila 1 
