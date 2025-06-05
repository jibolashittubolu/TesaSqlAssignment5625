
-- 1. University Table
CREATE TABLE TESA_JB_UNIVERSITY_SCHOOLY (
    universityId INT IDENTITY(1,1) PRIMARY KEY,
    universityName VARCHAR(255),
    universityStatus VARCHAR(50),
    universityCreatedAt DATETIME,
    universityUpdatedAt DATETIME
);
-- DROP TABLE  TESA_JB_UNIVERSITY_SCHOOLY;

-- 7. Room Table
CREATE TABLE TESA_JB_ROOM_SCHOOLY (
    roomId INT IDENTITY(1,1) PRIMARY KEY,
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

-- 4. Course Table
CREATE TABLE TESA_JB_COURSE_SCHOOLY (
    courseId INT IDENTITY(1,1) PRIMARY KEY,
    courseUniversityId INT,
    courseName VARCHAR(255),
    courseCourseCode VARCHAR(50),
    courseStatus VARCHAR(50),
    courseCreatedAt DATETIME,
    courseUpdatedAt DATETIME,
    FOREIGN KEY (courseUniversityId) REFERENCES TESA_JB_UNIVERSITY_SCHOOLY(universityId)
);
-- DROP TABLE  TESA_JB_COURSE_SCHOOLY;


-- 2. Student Table
CREATE TABLE TESA_JB_STUDENT_SCHOOLY (
    studentId INT IDENTITY(1,1) PRIMARY KEY,
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

-- 10. Assignment Table
CREATE TABLE TESA_JB_ASSIGNMENT_SCHOOLY (
    assignmentId INT IDENTITY(1,1) PRIMARY KEY,
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

-- 3. Scores Table
CREATE TABLE TESA_JB_SCORES_SCHOOLY (
    scoresId INT IDENTITY(1,1) PRIMARY KEY,
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

-- 5. Material Table
CREATE TABLE TESA_JB_MATERIAL_SCHOOLY (
    materialId INT IDENTITY(1,1) PRIMARY KEY,
    materialCourseId INT,
    materialMaterialType VARCHAR(100),
    materialMaterialName VARCHAR(255),
    materialStatus VARCHAR(50),
    materialCreatedAt DATETIME,
    materialUpdatedAt DATETIME,
    FOREIGN KEY (materialCourseId) REFERENCES TESA_JB_COURSE_SCHOOLY(courseId)
);
-- DROP TABLE  TESA_JB_MATERIAL_SCHOOLY;

-- 6. Submission Table
CREATE TABLE TESA_JB_SUBMISSION_SCHOOLY (
    submissionId INT IDENTITY(1,1) PRIMARY KEY,
    submissionStudentId INT,
    submissionAssignmentId INT,
    submissionStatus VARCHAR(50),
    submissionCreatedAt DATETIME,
    submissionUpdatedAt DATETIME,
    FOREIGN KEY (submissionStudentId) REFERENCES TESA_JB_STUDENT_SCHOOLY(studentId),
    FOREIGN KEY (submissionAssignmentId) REFERENCES TESA_JB_ASSIGNMENT_SCHOOLY(assignmentId)
);
-- DROP TABLE  TESA_JB_SUBMISSION_SCHOOLY;


-- 8. Fee Table
CREATE TABLE TESA_JB_FEE_SCHOOLY (
    feeId INT IDENTITY(1,1) PRIMARY KEY,
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

-- 9. Payment Table
CREATE TABLE TESA_JB_PAYMENT_SCHOOLY (
    paymentId INT IDENTITY(1,1) PRIMARY KEY,
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

-- POPULATE UNIVERSITIES
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


-- POPULATE ROOMS
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
--



