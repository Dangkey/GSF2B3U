--Procedure sem kallar í nemandan með ID sem er kallað í og sýnir áfangana
Delimiter //
create procedure ElectedCourses(
student int(11)
)
begin
 
select studentID, studentcourses.courseNumber, students.name from courses
join studentcourses
on studentcourses.coursenumber = courses.courseNumber
join students
on studentcourses.studentid = students.student_id
where studentcourses.lokið = 0  and studentcourses.studentID = student
limit 5;
end //
delimiter ;
 
call ElectedCourses(2);
