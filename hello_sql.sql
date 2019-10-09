--Relational Schema
/* TASK 1

SUBJECT(SubjCode, Description)
PK: SubjCode

TEACHER(StaffID, Surname, GivenName)
PK: StaffID

SUBJECTOFFERING(SubjCode, Year, Semester, Fee, StaffId)
PK: SubjCode, Year, Semester
FK1: SubjCode Reference SUBJECT
FK2: StaffID Reference TEACHER

STUDENT(StudentID, Surname, GivenName, Gender)
PK:StudentID

ENROLLMENT(DateEnrolled, Grade,StudentID,SubjCode, Year,Semester)
PK: StudentID, Year, Semester
FK1: StudentID References STUDENT
FK2: SubjCode, Year, Semester References SUBJECTOFFERING


*/

--TASK 2
DROP TABLE IF EXISTS dbo.ENROLLMENT;
DROP TABLE IF EXISTS dbo.SUBJECTOFFERING;
DROP TABLE IF EXISTS dbo.SUBJECT;
DROP TABLE IF EXISTS dbo.TEACHER;
DROP TABLE IF EXISTS dbo.STUDENT;


-- drop
-- drop
-- drop


--limit 5 or  where rownum<=5 

CREATE TABLE [SUBJECT] (
SubjCode VARCHAR(30)
,[Description] VARCHAR(100)
PRIMARY KEY(SubjCode)
);
go

CREATE TABLE TEACHER (
StaffID INT
,Surname VARCHAR(10)
,Givenname VARCHAR(20)
PRIMARY KEY(StaffID)
);

CREATE TABLE STUDENT (
StudentID VARCHAR(20)
,Surname VARCHAR(10)
,Givenname VARCHAR(20)
,Gender VARCHAR(10)
PRIMARY KEY(StudentID)
);
	
CREATE TABLE SUBJECTOFFERING(
SubjCode VARCHAR(30)
,Year INT
,Semester INT
,EventFee INT
,StaffID INT
,PRIMARY KEY(SubjCode,Year,Semester)
,FOREIGN KEY(SubjCode) REFERENCES [SUBJECT]
,FOREIGN KEY(StaffID) REFERENCES TEACHER
);

CREATE TABLE ENROLLMENT (
--DateEnrolled DATE
StudentID VARCHAR(20)
,Subjcode VARCHAR(30)
,Year INT
,Semester INT
,Grade VARCHAR(10)
,PRIMARY KEY(StudentID, SubjCode,Year, Semester)
,FOREIGN KEY(StudentID) REFERENCES STUDENT
,FOREIGN KEY(SubjCode,Year,Semester) REFERENCES SUBJECTOFFERING
);

select * from [SUBJECT];
select * from TEACHER;
select * from STUDENT;
select * from SUBJECTOFFERING;
select * from ENROLLMENT;


-- task 3

INSERT INTO [SUBJECT](SubjCode,[Description]) VALUES('ICTWEB425', 'Apply SQL to extract & manipulate data');
INSERT INTO [SUBJECT](SubjCode,[Description]) VALUES('ICTDBS403', 'Create Basic Databases');
INSERT INTO [SUBJECT](SubjCode,[Description]) VALUES('ICTDBS502', 'Design a Database');

INSERT INTO TEACHER(StaffID,Surname,Givenname) VALUES ('98776655','Starr','Ringo')
INSERT INTO TEACHER(StaffID,Surname,Givenname) VALUES ('87665544','Lennon','John')
INSERT INTO TEACHER(StaffID,Surname,Givenname) VALUES ('76554433','McCartney','Paul')

INSERT INTO STUDENT(StudentID,Surname,GivenName,Gender) VALUES('s12233445','Morrison','Scott','M');
INSERT INTO STUDENT(StudentID,Surname,GivenName,Gender) VALUES('s23344556','Gillard','Julia','F');
INSERT INTO STUDENT(StudentID,Surname,GivenName,Gender) VALUES('s34455667','Whitlam','Gough','M');

INSERT INTO SUBJECTOFFERING(SubjCode,Year,Semester,EventFee,StaffID) VALUES('ICTWEB425',2018,1,200,98776655);
INSERT INTO SUBJECTOFFERING(SubjCode,Year,Semester,EventFee,StaffID) VALUES('ICTWEB425',2019,1,225,98776655);
INSERT INTO SUBJECTOFFERING(SubjCode,Year,Semester,EventFee,StaffID) VALUES('ICTDBS403',2019,1,200,87665544);
INSERT INTO SUBJECTOFFERING(SubjCode,Year,Semester,EventFee,StaffID) VALUES('ICTDBS403',2019,2,200,76554433);
INSERT INTO SUBJECTOFFERING(SubjCode,Year,Semester,EventFee,StaffID) VALUES('ICTDBS502',2018,2,225,87665544);

INSERT INTO ENROLLMENT(StudentId,SubjCode,Year,Semester,Grade) VALUES('s12233445','ICTWEB425',2018,1,'D');
INSERT INTO ENROLLMENT(StudentId,SubjCode,Year,Semester,Grade) VALUES('s23344556','ICTWEB425',2018,1,'P');
INSERT INTO ENROLLMENT(StudentId,SubjCode,Year,Semester,Grade) VALUES('s12233445','ICTWEB425',2019,1,'C');
INSERT INTO ENROLLMENT(StudentId,SubjCode,Year,Semester,Grade) VALUES('s23344556','ICTWEB425',2019,1,'HD');
INSERT INTO ENROLLMENT(StudentId,SubjCode,Year,Semester,Grade) VALUES('s34455667','ICTWEB425',2019,1,'P');
INSERT INTO ENROLLMENT(StudentId,SubjCode,Year,Semester,Grade) VALUES('s12233445','ICTDBS403',2019,1,'C');
INSERT INTO ENROLLMENT(StudentId,SubjCode,Year,Semester,Grade) VALUES('s23344556','ICTDBS403',2019,2,Null);
INSERT INTO ENROLLMENT(StudentId,SubjCode,Year,Semester,Grade) VALUES('s34455667','ICTDBS403',2019,2,Null);
INSERT INTO ENROLLMENT(StudentId,SubjCode,Year,Semester,Grade) VALUES('s23344556','ICTDBS502',2018,2,'P');
INSERT INTO ENROLLMENT(StudentId,SubjCode,Year,Semester,Grade) VALUES('s34455667','ICTDBS502',2018,2,'N');

select * from [SUBJECT];
select * from TEACHER;
select * from SUBJECTOFFERING;
select * from STUDENT;
select * from ENROLLMENT;