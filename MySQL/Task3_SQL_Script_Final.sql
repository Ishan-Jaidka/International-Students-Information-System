Create SCHEMA if not exists `InternationalStudents`;
USE `InternationalStudents`;

CREATE TABLE IF NOT EXISTS Student (
    Student_SSN INT NOT NULL PRIMARY KEY,
    St_Name VARCHAR(45) NOT NULL,
    St_Birthday DATE,
    St_Gender VARCHAR(10),
    St_Addr VARCHAR(60),
    Dep_Major INT
    
);

CREATE TABLE IF NOT EXISTS College (
    College_ID INT NOT NULL PRIMARY KEY,
    Col_Name VARCHAR(45) NOT NULL,
    Col_Addr VARCHAR(60) NOT NULL,
    Dean_Name VARCHAR(45) NOT NULL,
    Dean_Addr VARCHAR(60) NOT NULL
);


CREATE TABLE IF NOT EXISTS Undergrad_Visa
(
Visa_ID INT NOT NULL PRIMARY KEY,
Visa_Name VARCHAR(20) NOT NULL,
Visa_Description VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Graduate_Visa
(
Visa_ID INT NOT NULL PRIMARY KEY,
Visa_Name VARCHAR(20) NOT NULL,
Visa_Description VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Undergrad (
    U_SSN INT NOT NULL PRIMARY KEY,
    College_ID INT NOT NULL,
    Visa_Status INT NOT NULL,
    FOREIGN KEY (College_ID)
        REFERENCES College (College_ID)
        ON DELETE CASCADE ON UPDATE CASCADE, 
        /*If the college is deleted or updated, this table needs to reflect that college existing or having a different ID*/
        
    FOREIGN KEY (U_SSN)
        REFERENCES Student (Student_SSN)
        ON DELETE CASCADE ON UPDATE CASCADE,
        /*If the student is deleted or updated, this table needs to reflect that student existing or having a different ID*/
        
	FOREIGN KEY (Visa_Status)
        REFERENCES Undergrad_Visa (Visa_ID)
        ON DELETE CASCADE ON UPDATE CASCADE 
        /*If the visa is deleted or updated, this table needs to reflect that visa existing or having a different ID*/
);

CREATE TABLE IF NOT EXISTS Grad (
    G_SSN INT NOT NULL PRIMARY KEY,
    College_ID INT NOT NULL,
    Visa_ID INT NOT NULL,
    FOREIGN KEY (College_ID)
        REFERENCES College (College_ID)
        ON DELETE CASCADE ON UPDATE CASCADE, 
        /*If the college is deleted or updated, this table needs to reflect that college existing or having a different ID*/
        
    FOREIGN KEY (G_SSN)
        REFERENCES Student (Student_SSN)
        ON DELETE CASCADE ON UPDATE CASCADE,
        /*If the student is deleted or updated, this table needs to reflect that student existing or having a different ID*/
        
	FOREIGN KEY (Visa_ID)
        REFERENCES Graduate_Visa (Visa_ID)
        ON DELETE CASCADE ON UPDATE CASCADE 
        /*If the visa is deleted or updated, this table needs to reflect that visa existing or having a different ID*/
);

CREATE TABLE IF NOT EXISTS GradVisa_Has_GradStudent(
	G_SSN INT NOT NULL,
    Visa_ID INT NOT NULL,
    Start_Date DATE NOT NULL,
    Expiration DATE NOT NULL,
    PRIMARY KEY (G_SSN, Visa_ID),
    FOREIGN KEY (G_SSN)
        REFERENCES Grad (G_SSN)
        ON DELETE CASCADE ON UPDATE CASCADE, 
        /*If the student is deleted or updated, this table needs to reflect that student existing or having a different ID*/
        
    FOREIGN KEY (Visa_ID)
        REFERENCES Graduate_Visa (Visa_ID)
        ON DELETE CASCADE ON UPDATE CASCADE 
        /*If the job is deleted or updated, this table needs to reflect that job existing or having a different ID*/
);

CREATE TABLE IF NOT EXISTS Country (
    Country_Name VARCHAR(45) NOT NULL PRIMARY KEY,
    C_Language VARCHAR(45),
    Capital_City VARCHAR(45) NOT NULL,
    Ethnicity VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS St_From_Country (
    Student_SSN INT NOT NULL,
    Country_Name VARCHAR(45) NOT NULL,
    FOREIGN KEY (Student_SSN)
        REFERENCES Student (Student_SSN)
        ON DELETE CASCADE ON UPDATE CASCADE, 
        /*If the student is deleted or updated, this table needs to reflect that student existing or having a different ID*/
        
    FOREIGN KEY (Country_Name)
        REFERENCES Country (Country_Name)
        ON DELETE CASCADE ON UPDATE CASCADE, 
        /*If the country is deleted or updated, this table needs to reflect that country existing or having a different ID*/
        
    PRIMARY KEY (Student_SSN , Country_Name)
);

CREATE TABLE IF NOT EXISTS JOB (
    Job_Name VARCHAR(45) NOT NULL PRIMARY KEY,
    Job_Type VARCHAR(45),
    Job_Hours_Week INT NOT NULL,
    Employer_Name VARCHAR(45) NOT NULL,
    Employer_Addr VARCHAR(60) NOT NULL,
    Employer_Phone INT NOT NULL,
    On_Campus TINYINT NOT NULL
);

CREATE TABLE IF NOT EXISTS Student_Has_Job (
    Student_SSN INT NOT NULL,
    Job_Name VARCHAR(45) NOT NULL,
    PRIMARY KEY (Student_SSN , Job_name),
    FOREIGN KEY (Student_SSN)
        REFERENCES Student (Student_SSN)
        ON DELETE CASCADE ON UPDATE CASCADE, 
        /*If the student is deleted or updated, this table needs to reflect that student existing or having a different ID*/
        
    FOREIGN KEY (Job_Name)
        REFERENCES JOB (Job_Name)
        ON DELETE CASCADE ON UPDATE CASCADE 
        /*If the job is deleted or updated, this table needs to reflect that job existing or having a different ID*/
);



CREATE TABLE IF NOT EXISTS Department (
    Department_ID INT NOT NULL PRIMARY KEY,
    Dep_Name VARCHAR(45) NOT NULL,
    Dep_Addr VARCHAR(60),
    Head_Name VARCHAR(45),
    Head_Addr VARCHAR(60),
    College_ID INT NOT NULL,
    FOREIGN KEY (College_ID)
        REFERENCES College (College_ID)
        ON DELETE CASCADE ON UPDATE CASCADE 
        /*If the college is deleted or updated, this table needs to reflect that college existing or having a different ID*/
);

ALTER TABLE Student
ADD FOREIGN KEY (Dep_Major)
        REFERENCES Department (Department_ID)
        ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE IF NOT EXISTS Degree (
    Degree_ID INT NOT NULL PRIMARY KEY,
    Degree_Name VARCHAR(45) NOT NULL,
    Deg_Description VARCHAR(45),
    Department_ID INT NOT NULL,
    FOREIGN KEY (Department_ID)
        REFERENCES Department (Department_ID)
        ON DELETE CASCADE ON UPDATE CASCADE 
        /*If the deparment is deleted or updated, this table needs to reflect that department existing or having a different ID*/
);

CREATE TABLE IF NOT EXISTS Educational_History (
    Student_SSN INT NOT NULL,
    College_ID INT NOT NULL,
    GPA DECIMAL(4,3) NOT NULL,
    Enroll_Date DATE NOT NULL,
    Grad_Date DATE,
    PRIMARY KEY (Student_SSN , College_ID, Enroll_Date),
    FOREIGN KEY (Student_SSN)
        REFERENCES Student (Student_SSN)
        ON DELETE CASCADE ON UPDATE CASCADE, 
        /*If the student is deleted or updated, this table needs to reflect that student existing or having a different ID*/
        
    FOREIGN KEY (College_ID)
        REFERENCES College (College_ID)
        ON DELETE CASCADE ON UPDATE CASCADE 
        /*If the college is deleted or updated, this table needs to reflect that college existing or having a different ID*/
);

CREATE TABLE IF NOT EXISTS Course (
    Course_ID INT NOT NULL PRIMARY KEY,
    Course_Name VARCHAR(45) NOT NULL,
    Course_Credits INT,
    Department_ID INT,
    FOREIGN KEY (Department_ID)
        REFERENCES Department (Department_ID)
        ON DELETE CASCADE ON UPDATE CASCADE 
        /*If the course is deleted or updated, this table needs to reflect that course existing or having a different ID*/
);

CREATE TABLE IF NOT EXISTS Student_has_Course (
    Student_SSN INT NOT NULL,
    Course_ID INT NOT NULL,
    GPA DECIMAL(4,3) NOT NULL,
    PRIMARY KEY (Student_SSN , Course_ID),
    FOREIGN KEY (Student_SSN)
        REFERENCES Student (Student_SSN)
        ON DELETE CASCADE ON UPDATE CASCADE, 
        /*If the student is deleted or updated, this table needs to reflect that student existing or having a different ID*/
        
    FOREIGN KEY (Course_ID)
        REFERENCES Course (Course_ID)
        ON DELETE CASCADE ON UPDATE CASCADE 
        /*If the course is deleted or updated, this table needs to reflect that course existing or having a different ID*/
);

CREATE TABLE IF NOT EXISTS Regulations_and_Laws (
    RL_ID INT NOT NULL PRIMARY KEY,
    RL_Name VARCHAR(45) NOT NULL,
    RL_Description VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Student_has_Regulations_and_Laws (
    Student_SSN INT NOT NULL,
    RL_ID INT NOT NULL,
	Satisfied TINYINT NOT NULL,
    PRIMARY KEY (Student_SSN , RL_ID),
    FOREIGN KEY (Student_SSN)
        REFERENCES Student (Student_SSN)
        ON DELETE CASCADE ON UPDATE CASCADE, 
        /*If the student is deleted or updated, this table needs to reflect that student existing or having a different ID*/
        
    FOREIGN KEY (RL_ID)
        REFERENCES Regulations_and_Laws (RL_ID)
        ON DELETE CASCADE ON UPDATE CASCADE 
        /*If the Regulation is deleted or updated, this table needs to reflect that regulation existing or having a different ID*/
);

CREATE TABLE IF NOT EXISTS Educational_History_has_Degree
(
	Student_SSN INT NOT NULL,
	College_ID INT NOT NULL,
	Degree_ID INT NOT NULL,
	PRIMARY KEY (Student_SSN, College_ID, Degree_ID),
	FOREIGN KEY (Student_SSN, College_ID) 
		REFERENCES Educational_History(Student_SSN, College_ID) 
        ON DELETE CASCADE ON UPDATE CASCADE, 
        /*If the student or college is deleted or updated, this table needs to reflect that student/college existing or having a different ID*/
	
    FOREIGN KEY (Degree_ID) 
		REFERENCES Degree(Degree_ID) 
        ON DELETE CASCADE ON UPDATE CASCADE
        /*If the degree is deleted or updated, this table needs to reflect that degree existing or having a different ID*/
);

DROP TABLE IF EXISTS Educational_History_has_Degree;
DROP TABLE IF EXISTS Student_has_Regulations_and_Laws;
DROP TABLE IF EXISTS Regulations_and_Laws;
DROP TABLE IF EXISTS Student_has_Course;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Educational_History;
DROP TABLE IF EXISTS Degree;
DROP TABLE IF EXISTS Student_Has_Job;
DROP TABLE IF EXISTS JOB;
DROP TABLE IF EXISTS St_From_Country;
DROP TABLE IF EXISTS Country;
DROP TABLE IF EXISTS GradVisa_Has_GradStudent;
DROP TABLE IF EXISTS Grad;
DROP TABLE IF EXISTS Undergrad;
DROP TABLE IF EXISTS Graduate_Visa;
DROP TABLE IF EXISTS Undergrad_Visa;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS College;

DROP SCHEMA IF EXISTS InternationalStudents;