
--CREATE DATABASE--
CREATE DATABASE SchoolManagementSystem;
GO
USE SchoolManagementSystem;


--Design and Create Tables--
-- Students table--
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    GradeLevel INT
);

-- Courses table--
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255)
);

-- Enrolments table--
CREATE TABLE Enrolments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID)
);
-- Insert sample students
INSERT INTO Students VALUES
(1, 'Oluwatobi', 'Adeyi', 10),
(2, 'Joseph', 'Sanwolu', 11),
(3, 'Ezra', 'Kings', 9),
(4, 'James', 'Oba', 11),
(5, 'Ruth', 'Quadri', 10),
(6, 'Bisola', 'Adeoye', 10),
(7, 'Michael', 'Olalekan', 11),
(8, 'Joy', 'Uche', 9),
(9, 'Chisom', 'Ugbonna', 10),
(10, 'Dolapo', 'Dina', 9)

-- Insert sample courses--
INSERT INTO Courses VALUES
(101, 'Math'),
(102, 'English'),
(104, 'Physics'),
(106, 'Biology')

-- Enrol students in courses--
INSERT INTO Enrolments VALUES
(1, 1, 101),
(2, 4, 101),
(3, 6, 104),
(4, 7, 102),
(5, 8, 101),
(6, 10, 106),
(7, 5, 104),
(8, 3, 102),
(9, 1, 106),
(10, 2, 102)

-- Update student information
UPDATE Students SET FirstName = 'Oluwatobilola' WHERE StudentID = 1;

-- Remove a course
DELETE FROM Courses WHERE CourseID = 106;

--List all students
SELECT * FROM Students;

--Filter students based on grade level
SELECT * FROM Students WHERE GradeLevel = 10;

--List courses with the number of enrolled students
SELECT
    C.CourseName,
    COUNT(E.EnrollmentID) AS EnrolledStudents
FROM Courses C
LEFT JOIN Enrolments E ON C.CourseID = E.CourseID
GROUP BY C.CourseName;

--Find student enrolled in a course
SELECT S.*
FROM Students S
JOIN Enrolments E ON S.StudentID = E.StudentID
WHERE E.CourseID = 102;

