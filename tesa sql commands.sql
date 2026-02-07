-- DROP SCHOOLY TABLES FROM DEPENDENT TO NON-DEPENDENT
-- DROP TABLE  TESA_JB_PAYMENT_SCHOOLY;
-- DROP TABLE  TESA_JB_FEE_SCHOOLY;
-- DROP TABLE  TESA_JB_SUBMISSION_SCHOOLY;
-- DROP TABLE  TESA_JB_MATERIAL_SCHOOLY;
-- DROP TABLE  TESA_JB_SCORES_SCHOOLY;
-- DROP TABLE  TESA_JB_ASSIGNMENT_SCHOOLY;
-- DROP TABLE  TESA_JB_STUDENT_SCHOOLY;
-- DROP TABLE  TESA_JB_COURSE_SCHOOLY;
-- DROP TABLE  TESA_JB_ROOM_SCHOOLY;
-- DROP TABLE  TESA_JB_UNIVERSITY_SCHOOLY;

-- 1. University Table
CREATE SEQUENCE dbo.universityIdSeq
    START WITH 1
    INCREMENT BY 1;
CREATE TABLE TESA_JB_UNIVERSITY_SCHOOLY (
    universityId INT PRIMARY KEY DEFAULT NEXT VALUE FOR dbo.universityIdSeq,
    universityName VARCHAR(255),
    universityStatus VARCHAR(50),
    universityCreatedAt DATETIME,
    universityUpdatedAt DATETIME
);
-- DROP TABLE  TESA_JB_UNIVERSITY_SCHOOLY;


-- 2. Room Table
CREATE SEQUENCE dbo.roomIdSeq
    START WITH 1
    INCREMENT BY 1;
CREATE TABLE TESA_JB_ROOM_SCHOOLY (
    roomId INT PRIMARY KEY DEFAULT NEXT VALUE FOR dbo.roomIdSeq,
    roomRoomNumber VARCHAR(50),
    roomRoomHostel VARCHAR(255),
    roomRoomUniversityId INT,
    roomRoomCapacity INT,
    roomStatus VARCHAR(50),
    roomCreatedAt DATETIME,
    roomUpdatedAt DATETIME,
    FOREIGN KEY (roomRoomUniversityId) REFERENCES TESA_JB_UNIVERSITY_SCHOOLY(universityId)
);
-- DROP TABLE  TESA_JB_ROOM_SCHOOLY;

-- 3. Course Table
CREATE SEQUENCE dbo.courseIdSeq
    START WITH 1
    INCREMENT BY 1;
CREATE TABLE TESA_JB_COURSE_SCHOOLY (
    courseId INT PRIMARY KEY DEFAULT NEXT VALUE FOR dbo.courseIdSeq,
    courseUniversityId INT,
    courseName VARCHAR(255),
    courseCourseCode VARCHAR(50),
    courseStatus VARCHAR(50),
    courseCreatedAt DATETIME,
    courseUpdatedAt DATETIME,
    FOREIGN KEY (courseUniversityId) REFERENCES TESA_JB_UNIVERSITY_SCHOOLY(universityId)
);
-- DROP TABLE  TESA_JB_COURSE_SCHOOLY;


-- 4. Student Table
CREATE SEQUENCE dbo.studentIdSeq
    START WITH 1
    INCREMENT BY 1;
CREATE TABLE TESA_JB_STUDENT_SCHOOLY (
    studentId INT PRIMARY KEY DEFAULT NEXT VALUE FOR dbo.studentIdSeq,
    studentName VARCHAR(255),
    studentAge INT,
    studentMatricNo VARCHAR(50),
    studentRoomId INT,
    studentUniversityId INT,
    studentStatus VARCHAR(50),
    studentCreatedAt DATETIME,
    studentUpdatedAt DATETIME,
    FOREIGN KEY (studentRoomId) REFERENCES TESA_JB_ROOM_SCHOOLY(roomId),
    FOREIGN KEY (studentUniversityId) REFERENCES TESA_JB_UNIVERSITY_SCHOOLY(universityId)
);
-- DROP TABLE  TESA_JB_STUDENT_SCHOOLY;

-- 5. Assignment Table
CREATE SEQUENCE dbo.assignmentIdSeq
    START WITH 1
    INCREMENT BY 1;
CREATE TABLE TESA_JB_ASSIGNMENT_SCHOOLY (
    assignmentId INT PRIMARY KEY DEFAULT NEXT VALUE FOR dbo.assignmentIdSeq,
    assignmentName VARCHAR(255),
    assignmentTopic VARCHAR(255),
    assignmentSubject VARCHAR(255),
    assignmentCourseId INT,
    assignmentStatus VARCHAR(50),
    assignmentCreatedAt DATETIME,
    assignmentUpdatedAt DATETIME,
    FOREIGN KEY (assignmentCourseId) REFERENCES TESA_JB_COURSE_SCHOOLY(courseId)
);
-- DROP TABLE  TESA_JB_ASSIGNMENT_SCHOOLY;

-- 6. Scores Table
CREATE SEQUENCE dbo.scoresIdSeq
    START WITH 1
    INCREMENT BY 1;
CREATE TABLE TESA_JB_SCORES_SCHOOLY (
    scoresId INT PRIMARY KEY DEFAULT NEXT VALUE FOR dbo.scoresIdSeq,
    scoresStudentId INT,
    scoresCourseId INT,
    scoresScore INT,
    scoresType VARCHAR(50),
    scoresMaxScore INT,
    scoresStatus VARCHAR(50),
    scoresCreatedAt DATETIME,
    scoresUpdatedAt DATETIME,
    FOREIGN KEY (scoresStudentId) REFERENCES TESA_JB_STUDENT_SCHOOLY(studentId),
    FOREIGN KEY (scoresCourseId) REFERENCES TESA_JB_COURSE_SCHOOLY(courseId)
);
-- DROP TABLE  TESA_JB_SCORES_SCHOOLY;

-- 7. Material Table
CREATE SEQUENCE dbo.materialIdSeq
    START WITH 1
    INCREMENT BY 1;
CREATE TABLE TESA_JB_MATERIAL_SCHOOLY (
    materialId INT PRIMARY KEY DEFAULT NEXT VALUE FOR dbo.materialIdSeq,
    materialCourseId INT,
    materialMaterialType VARCHAR(100),
    materialMaterialName VARCHAR(255),
    materialStatus VARCHAR(50),
    materialCreatedAt DATETIME,
    materialUpdatedAt DATETIME,
    FOREIGN KEY (materialCourseId) REFERENCES TESA_JB_COURSE_SCHOOLY(courseId)
);
-- DROP TABLE  TESA_JB_MATERIAL_SCHOOLY;

-- 8. Submission Table
CREATE SEQUENCE dbo.submissionIdSeq
    START WITH 1
    INCREMENT BY 1;
CREATE TABLE TESA_JB_SUBMISSION_SCHOOLY (
    submissionId INT PRIMARY KEY DEFAULT NEXT VALUE FOR dbo.submissionIdSeq,
    submissionStudentId INT,
    submissionAssignmentId INT,
    submissionStatus VARCHAR(50),
    submissionCreatedAt DATETIME,
    submissionUpdatedAt DATETIME,
    FOREIGN KEY (submissionStudentId) REFERENCES TESA_JB_STUDENT_SCHOOLY(studentId),
    FOREIGN KEY (submissionAssignmentId) REFERENCES TESA_JB_ASSIGNMENT_SCHOOLY(assignmentId)
);
-- DROP TABLE  TESA_JB_SUBMISSION_SCHOOLY;


-- 9. Fee Table
CREATE SEQUENCE dbo.feeIdSeq
    START WITH 1
    INCREMENT BY 1;
CREATE TABLE TESA_JB_FEE_SCHOOLY (
    feeId INT PRIMARY KEY DEFAULT NEXT VALUE FOR dbo.feeIdSeq,
    feeDescription VARCHAR(255),
    feeStudentId INT,
    feeAmount DECIMAL(10,2),
    feeAcademicSession VARCHAR(50),
    feeFeeType VARCHAR(50),
    feeStatus VARCHAR(50),
    feeCreatedAt DATETIME,
    feeUpdatedAt DATETIME,
    FOREIGN KEY (feeStudentId) REFERENCES TESA_JB_STUDENT_SCHOOLY(studentId)
);
-- DROP TABLE  TESA_JB_FEE_SCHOOLY;

-- 10. Payment Table
CREATE SEQUENCE dbo.paymentIdSeq
    START WITH 1
    INCREMENT BY 1;
CREATE TABLE TESA_JB_PAYMENT_SCHOOLY (
    paymentId INT PRIMARY KEY DEFAULT NEXT VALUE FOR dbo.paymentIdSeq,
    paymentDescription VARCHAR(255),
    paymentFeeId INT,
    paymentAmount DECIMAL(10,2),
    paymentStatus VARCHAR(50),
    paymentCreatedAt DATETIME,
    paymentUpdatedAt DATETIME,
    FOREIGN KEY (paymentFeeId) REFERENCES TESA_JB_FEE_SCHOOLY(feeId)
);
-- DROP TABLE  TESA_JB_PAYMENT_SCHOOLY;


-- POPULATE MODELS

-- POPULATE UNIVERSITIES !!!
INSERT INTO TESA_JB_UNIVERSITY_SCHOOLY (universityName, universityStatus, universityCreatedAt, universityUpdatedAt) VALUES
('Obafemi Awolowo University', 'session', GETDATE(), GETDATE()),
('University of Ibadan', 'break', GETDATE(), GETDATE()),
('Benue State University', 'defunct', GETDATE(), GETDATE()),
('Federal University Sokoto', 'defunct', GETDATE(), GETDATE()),
('Unversity of Nsukka', 'session', GETDATE(), GETDATE())

-- SET IDENTITY_INSERT TESA_JB_UNIVERSITY_SCHOOLY Off;
-- INSERT INTO TESA_JB_UNIVERSITY_SCHOOLY (universityId, universityName, universityStatus, universityCreatedAt, universityUpdatedAt) VALUES
-- (1,'Obafemi Awolowo University', 'session', GETDATE(), GETDATE());

SELECT * FROM TESA_JB_UNIVERSITY_SCHOOLY;
-- DELETE FROM TESA_JB_UNIVERSITY_SCHOOLY WHERE universityId IN (6,7,8,9,10);




-- POPULATE ROOMS !!!
INSERT INTO TESA_JB_ROOM_SCHOOLY (roomRoomNumber, roomRoomHostel, roomRoomUniversityId, roomRoomCapacity, roomStatus, roomCreatedAt, roomUpdatedAt) VALUES
('1', 'a', 1, 2, 'full', GETDATE(), GETDATE()),
('2', 'b', 2, 6, 'full', GETDATE(), GETDATE()),
('3', 'c', 3, 8, 'empty', GETDATE(), GETDATE()),
('4', 'd', 4, 12, 'partial', GETDATE(), GETDATE()),
('5', 'e', 1, 9, 'defunct', GETDATE(), GETDATE()),
('6', 'f', 1, 1, 'empty', GETDATE(), GETDATE()),
('7', 'g', 2, 3, 'partial', GETDATE(), GETDATE()),
('8', 'h', 3, 18, 'empty', GETDATE(), GETDATE()),
('9', 'i', 4, 7, 'partial', GETDATE(), GETDATE()),
('10', 'j', 5, 6, 'full', GETDATE(), GETDATE());


SELECT * FROM TESA_JB_ROOM_SCHOOLY;
-- DELETE FROM TESA_JB_ROOM_SCHOOLY WHERE roomId IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25);
-- SELECT * FROM TESA_JB_ROOM_SCHOOLY FULL JOIN TESA_JB_UNIVERSITY_SCHOOLY ON TESA_JB_ROOM_SCHOOLY.roomRoomUniversityId = TESA_JB_UNIVERSITY_SCHOOLY.universityId;




-- POPULATE COURSE
INSERT INTO TESA_JB_COURSE_SCHOOLY(courseUniversityId, courseName, courseCourseCode, courseStatus, courseCreatedAt, courseUpdatedAt)
VALUES
(1, 'Physics', 'phy100', 'active', GETDATE(), GETDATE() ),
(2, 'Chemistry', 'che400', 'inactive', GETDATE(), GETDATE() ),
(3, 'Biology', 'bio300', 'active', GETDATE(), GETDATE() ),
(4, 'English', 'eng400', 'inactive', GETDATE(), GETDATE() ),
(5, 'Mathematics', 'mat500', 'active', GETDATE(), GETDATE() ),
(1, 'Marketing', 'mar600', 'active', GETDATE(), GETDATE() ),
(2, 'Economics', 'eco700', 'active', GETDATE(), GETDATE() ),
(3, 'Agric', 'agr800', 'active', GETDATE(), GETDATE() ),
(4, 'Computer', 'com900', 'inactive', GETDATE(), GETDATE() ),
(2, 'Spanish', 'spa100', 'active', GETDATE(), GETDATE() ),
(1, 'Yoruba', 'yor200', 'active', GETDATE(), GETDATE() );

SELECT * FROM TESA_JB_COURSE_SCHOOLY;





-- POPULATE STUDENTS !!!
INSERT INTO TESA_JB_STUDENT_SCHOOLY (studentName, studentAge, studentMatricNo, studentRoomId, studentUniversityId, studentStatus, studentCreatedAt, studentUpdatedAt)
VALUES
('Ade', 15, '1', 1, 1, 'active', GETDATE(), GETDATE()),
('Bolu', 100, '2', 2, 1, 'active', GETDATE(), GETDATE()),
('Chidi', 28, '3', 3, 1, 'inactive', GETDATE(), GETDATE()),
('Dare', 45, '4', 4, 1, 'active', GETDATE(), GETDATE()),
('Ebaboy', 20, '5', 5, 1, 'inactive', GETDATE(), GETDATE()),
('Fufugirl', 23, '6', 6, 1, 'active', GETDATE(), GETDATE()),
('Grace', 19, '7', 3, 1, 'active', GETDATE(), GETDATE()),
('Helena', 12, '8', 1, 1, 'inactive', GETDATE(), GETDATE()),
('Indiana', 30, '9', 1, 1, 'active', GETDATE(), GETDATE()),
('Justobey', 50, '10', 2, 1, 'active', GETDATE(), GETDATE());

SELECT * FROM TESA_JB_STUDENT_SCHOOLY;


-- SKIP 5 ASSIGNMENT



INSERT INTO TESA_JB_SCORES_SCHOOLY (scoresStudentId, scoresCourseId, scoresScore, scoresType, scoresMaxScore, scoresStatus, scoresCreatedAt, scoresUpdatedAt)
VALUES
(1, 1, 100, 'ca', 100, 'active', GETDATE(), GETDATE()),
(2, 1, 70, 'ca', 100, 'active', GETDATE(), GETDATE()),
(3, 2, 80, 'ca', 100, 'active', GETDATE(), GETDATE()),
(4, 2, 50, 'ca', 100, 'inactive', GETDATE(), GETDATE()),
(5, 3, 22, 'ca', 100, 'active', GETDATE(), GETDATE()),
(1, 3, 90, 'ca', 100, 'active', GETDATE(), GETDATE()),
(1, 1, 10, 'ca', 100, 'active', GETDATE(), GETDATE()),
(2, 1, 100, 'ca', 100, 'active', GETDATE(), GETDATE()),
(2, 2, 77, 'ca', 100, 'inactive', GETDATE(), GETDATE()),
(3, 4, 35, 'ca', 100, 'active', GETDATE(), GETDATE());

SELECT * FROM TESA_JB_SCORES_SCHOOLY;




-- SOLUTION FOR QUESTION 1
-- Get all students in a room.
SELECT  universitySchooly.universityName, roomSchooly.roomId, roomSchooly.roomRoomHostel, studentSchooly.studentName, studentSchooly.studentId
FROM TESA_JB_ROOM_SCHOOLY AS roomSchooly
JOIN TESA_JB_STUDENT_SCHOOLY AS studentSchooly on roomSchooly.roomId = studentSchooly.studentRoomId
JOIN TESA_JB_UNIVERSITY_SCHOOLY AS universitySchooly on roomSchooly.roomRoomUniversityId = universitySchooly.universityId
ORDER BY universitySchooly.universityName ASC;



-- SOLUTION FOR QUESTION 2
-- Get university with the most rooms (count of each room in university)
SELECT
    TOP 1
    universitySchooly.universityId, universitySchooly.universityName,
    COUNT(DISTINCT roomSchooly.roomId) as roomCount
FROM TESA_JB_UNIVERSITY_SCHOOLY AS universitySchooly
JOIN TESA_JB_ROOM_SCHOOLY AS roomSchooly
    on universitySchooly.universityId = roomSchooly.roomRoomUniversityId
GROUP BY universitySchooly.universityId, universitySchooly.universityName
ORDER BY roomCount DESC;



-- SOLUTION FOR QUESTION 3
-- Get all students doing a course
SELECT
    courseSchooly.courseId, courseSchooly.courseName,
    studentSchooly.studentId, studentSchooly.studentName, studentSchooly.studentMatricNo
FROM TESA_JB_COURSE_SCHOOLY AS courseSchooly
JOIN TESA_JB_SCORES_SCHOOLY AS scoresSchooly
    on courseSchooly.courseId = scoresSchooly.scoresCourseId
JOIN TESA_JB_STUDENT_SCHOOLY AS studentSchooly
    on scoresSchooly.scoresStudentId = studentSchooly.studentId
ORDER BY
    courseSchooly.courseId ASC;



-- SOLUTION FOR QUESTION 4
-- Get count of students doing each course
SELECT courseId, courseName, count(DISTINCT scoreSchooly.scoresStudentId) AS studentCount
FROM TESA_JB_COURSE_SCHOOLY AS courseSchooly
LEFT JOIN TESA_JB_SCORES_SCHOOLY AS scoreSchooly
    ON courseSchooly.courseId = scoreSchooly.scoresCourseId
GROUP BY courseId, courseName
ORDER BY studentCount DESC;




-- SOLUTION FOR QUESTION 5
-- Get the course with the least amount of students
SELECT TOP 10 courseId, courseName, count(DISTINCT scoreSchooly.scoresStudentId) AS studentCount
FROM TESA_JB_COURSE_SCHOOLY AS courseSchooly
LEFT JOIN TESA_JB_SCORES_SCHOOLY AS scoreSchooly
    ON courseSchooly.courseId = scoreSchooly.scoresCourseId
GROUP BY courseId, courseName
ORDER BY studentCount ASC;



-- SOLUTION FOR QUESTION 6
-- Get the course with the most amount of students
SELECT TOP 1 courseId, courseName, COUNT(DISTINCT scoresStudentId) as studentCount
FROM TESA_JB_COURSE_SCHOOLY AS courseSchooly
LEFT JOIN TESA_JB_SCORES_SCHOOLY AS scoresSchooly on courseSchooly.courseId = scoresSchooly.scoresCourseId
GROUP BY courseId, courseName
ORDER BY studentCount DESC;



-- SOLUTION FOR QUESTION 7
-- Number of courses offered by each university.
SELECT  universityId, universityName, COUNT(DISTINCT cs.courseId ) as totalCourses
FROM TESA_JB_UNIVERSITY_SCHOOLY AS us
JOIN TESA_JB_COURSE_SCHOOLY as cs
ON us.universityId = cs.courseUniversityId
GROUP BY universityId, universityName
ORDER BY totalCourses DESC ;








