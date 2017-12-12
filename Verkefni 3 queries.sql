Delimiter //
create procedure get_schoolInfo(
school int
)
begin
select schoolName,schoolInfo from schools
where schoolID = school;
end //
delimiter ;

call get_schoolInfo(1);

Delimiter //
create procedure get_studentJSON(
student int
)
begin
select JSON_OBJECT('Name',name,'TrackID',students.trackid,"Semester",semesters.semesterName,"Course",courses.courseNumber) AS 'Student Info'from students
join trackcourses on trackcourses.trackID = students.trackID
join semesters on semesters.semesterID = trackcourses.semester
join courses on trackcourses.courseNumber = courses.courseNumber
where trackcourses.trackID = students.trackID and semesters.semesterID = trackcourses.semester and courses.courseNumber = trackcourses.courseNumber and semesters.semesterID = student;
end //
delimiter ;

call get_studentJSON(1)