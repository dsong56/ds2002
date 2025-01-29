-- SQL Exercises (With Answers)

-- 1. Retrieve all students who enrolled in 2023.
SELECT * FROM students
WHERE enrollmentdate LIKE "%2023%";

-- 2. Find students whose email contains 'gmail.com'.
SELECT * FROM students
WHERE email LIKE "%gmail.com%";

-- 3. Count how many students are enrolled in the database.
SELECT COUNT(*) FROM students;


-- 4. Find students born between 2000 and 2005.
SELECT * FROM students
WHERE YEAR(dateofbirth) BETWEEN 2000 AND 2005;

-- 5. List students sorted by last name in descending order.
SELECT * FROM students
ORDER BY lastname DESC;

-- 6. Find the names of students and the courses they are enrolled in.
SELECT students.FirstName, students.LastName, courses.CourseName FROM students
INNER JOIN enrollments ON students.studentID = enrollments.studentID
INNER JOIN courses on enrollments.courseID = courses.courseID;


-- 7. List all students and their courses, ensuring students without courses are included (LEFT JOIN).
SELECT students.*, courses.CourseName FROM students
LEFT JOIN enrollments ON students.studentID = enrollments.studentID
LEFT JOIN courses on enrollments.courseID = courses.courseID;

-- 8. Find all courses with no students enrolled (LEFT JOIN).
SELECT courses.* FROM courses
LEFT JOIN enrollments ON courses.courseID = enrollments.courseID
WHERE enrollments.studentID IS NULL;





-- 10. List courses and show the number of students enrolled in each course.
SELECT courses.*, COUNT(enrollments.studentID) as TotalStudents from courses
LEFT JOIN enrollments ON courses.courseID = enrollments.courseID
GROUP BY courses.courseID;

