CREATE DATABASE College;
USE College;
GO
create table Department(
D_Name Varchar(50) primary key,
Location varchar(100) not null,
Head_Instructor_ID int);

create table Instructor(
Instructor_ID int primary key,
Fname varchar(50) not null,
Lname varchar(50) not null,
phone varchar (20),
D_Name varchar(50),
FOREIGN KEY (D_Name) references Department(D_Name));

alter table Department
add constraint FK_Dept_Head FOREIGN KEY ( Head_Instructor_ID)references Instructor(Instructor_ID);

ALTER TABLE Department 
ADD CONSTRAINT UC_Head_Instructor UNIQUE (Head_Instructor_ID);

create table student(
Student_ID int primary key,
Fname varchar(50) not null,
Lname varchar(50) not null,
phone varchar (20));

create table Course(
C_ID int primary key,
C_name varchar(100) not null,
Duration int,
D_Name varchar (50),
Instructor_ID int,
FOREIGN KEY(D_Name) references
 Department(D_Name),
  FOREIGN KEY(Instructor_ID)references Instructor(Instructor_ID)); 

create table Enrollment(
student_ID int,
C_ID int,
primary key (Student_ID,C_ID),
FOREIGN KEY (Student_ID) references Student(Student_ID),
FOREIGN KEY (C_ID) references Course(C_ID));

GO

insert into student(Student_ID,Fname,Lname,phone)values(5,'salma','ahmed','010985364');


INSERT INTO Department (D_Name, Location) VALUES 
('Computer Science', 'Building A - Floor 1'),
('Information Systems', 'Building A - Floor 2'),
('Software Engineering', 'Building B - Floor 1');

INSERT INTO Instructor (Instructor_ID, Fname, Lname, phone, D_Name) VALUES 
(101, 'Ahmed', 'Ibrahim', '0101111111', 'Computer Science'),
(102, 'Lamiaa', 'Hassaan', '0102222222', 'Information Systems'),
(103, 'Mohamed', 'Ali', '0103333333', 'Software Engineering'),
(104, 'Samy', 'Youssef', '0104444444', 'Computer Science');

UPDATE Department SET Head_Instructor_ID = 101 WHERE D_Name = 'Computer Science';
UPDATE Department SET Head_Instructor_ID = 102 WHERE D_Name = 'Information Systems';
UPDATE Department SET Head_Instructor_ID = 103 WHERE D_Name = 'Software Engineering';

INSERT INTO student (Student_ID, Fname, Lname, phone) VALUES 
(1, 'Mariam', 'Zaid', '0111000222'),
(2, 'Ali', 'Ehab', '0111000333'),
(3, 'Sara', 'Omar', '0111000444'),
(4, 'Bassem', 'Nader', '0111000555');

INSERT INTO Course (C_ID, C_name, Duration, D_Name, Instructor_ID) VALUES 
(201, 'Database Systems', 45, 'Computer Science', 101),
(202, 'Java Programming', 60, 'Computer Science', 104),
(203, 'System Analysis', 40, 'Information Systems', 102),
(204, 'Web Development', 50, 'Software Engineering', 103);

INSERT INTO Enrollment (student_ID, C_ID) VALUES 
(1, 201), (1, 202),
(2, 201), (3, 203),
(4, 204), (2, 202);
GO

SELECT * FROM student ORDER BY Fname ASC;

SELECT C.C_name, I.Fname + ' ' + I.Lname AS Instructor_Name, C.D_Name
FROM Course C
JOIN Instructor I ON C.Instructor_ID = I.Instructor_ID
ORDER BY C.C_name ASC;


update student set Fname='fatma',Lname='salm',phone='0978676466' where Student_ID=6;
delete from student where Student_ID=5;
select*from student where Fname like 'm%' order by Fname asc;
select*from student order by Fname asc;
select*from Instructor order by Fname asc;
select*from Course order by C_name asc;

