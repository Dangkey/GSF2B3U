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
where studentcourses.lokiğ = 0
limit 5;
end //
delimiter ;
 
call ElectedCourses(1);