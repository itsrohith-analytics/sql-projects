-- =========================================
-- COLLEGE DATABASE : ANALYSIS QUERIES
-- =========================================

-- 1. View all students
SELECT * FROM Student;

-- 2. View all departments
SELECT * FROM Department;

-- 3. View all courses
SELECT * FROM Course;

-- 4. Students with their department names
SELECT 
    s.Name AS StudentName,
    d.DepartmentName
FROM Student s
JOIN Department d
ON s.DepartmentID = d.DepartmentID;

-- 5. Courses offered by each department
SELECT 
    c.CourseName,
    d.DepartmentName
FROM Course c
JOIN Department d
ON c.DepartmentmentID = d.DepartmentID;

-- 6. Faculty and their departments
SELECT 
    f.Name AS FacultyName,
    d.DepartmentName
FROM Faculty f
JOIN Department d
ON f.DepartmentID = d.DepartmentID;

-- 7. Number of students in each department
SELECT 
    d.DepartmentName,
    COUNT(s.StudentID) AS TotalStudents
FROM Student s
JOIN Department d
ON s.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 8. Number of courses per department
SELECT 
    d.DepartmentName,
    COUNT(c.CourseID) AS TotalCourses
FROM Course c
JOIN Department d
ON c.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 9. Students enrolled in multiple courses
SELECT 
    s.Name,
    COUNT(e.CourseID) AS CourseCount
FROM Enrollment e
JOIN Student s
ON e.StudentID = s.StudentID
GROUP BY s.Name
HAVING COUNT(e.CourseID) > 1;

-- 10. Faculty count per department
SELECT 
    d.DepartmentName,
    COUNT(f.FacultyID) AS FacultyCount
FROM Faculty f
JOIN Department d
ON f.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;
