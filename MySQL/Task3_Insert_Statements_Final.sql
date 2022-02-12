Use `InternationalStudents`;

/*1. Country*/
INSERT INTO InternationalStudents.Country VALUES ('United States', 'English', 'Washington, D.C.', 'White');
INSERT INTO InternationalStudents.Country VALUES ('India', 'Hindi', 'New Delhi', 'Asian');
INSERT INTO InternationalStudents.Country VALUES ('United Kingdom', 'English', 'London', 'White');
INSERT INTO InternationalStudents.Country VALUES ('France', 'French', 'Paris', 'White');
INSERT INTO InternationalStudents.Country VALUES ('Japan', 'Japanese', 'Tokyo', 'Asian');
INSERT INTO InternationalStudents.Country VALUES ('China', 'Mandarin', 'Beijing', 'Asian');
INSERT INTO InternationalStudents.Country VALUES ('Italy', 'Italian', 'Rome', 'White');

/*2. College*/
INSERT INTO InternationalStudents.College VALUES (4029, 'Bellevue College', '3000 Landerholm Cir SE, Bellevue, WA 98007', 'Michael Kaptik', 'michael.kaptik@bellevuecollege.edu');
INSERT INTO InternationalStudents.College VALUES (2927, 'University of Pittsburgh', '4200 Fifth Ave, Pittsburgh, PA 15260', 'Kathleen Blee', 'kblee@pitt.edu');
INSERT INTO InternationalStudents.College VALUES (4854, 'University of Washington', '1410 NE Campus Parkway, Seattle, WA 98195', 'Mia Tuan', 'mtuan@uw.edu');
INSERT INTO InternationalStudents.College VALUES (4467, 'University of Washington Bothell', '18115 Campus Way NE, Bothell, WA 98011', 'Sandeep Krishnamurthy', 'sandeep@uw.edu');
INSERT INTO InternationalStudents.College VALUES (4445, 'University of Washington Tacoma', '1900 Commerce St, Tacoma, WA 98402', 'Rajendra Katti', 'rajkatti@uw.edu');
INSERT INTO InternationalStudents.College VALUES (4833, 'University of California Berkeley', '200 California Hall Ste 1500, Berkeley, CA 94720', 'Tsu-Jae King Liu', 'engineeringdean@berkeley.edu');
INSERT INTO InternationalStudents.College VALUES (4837, 'University of California Los Angeles', '405 Hilgard Ave, Los Angeles, CA 90095', 'Adriana Galván', 'agalvan@psych.ucla.edu');

/*9. Department*/
INSERT INTO InternationalStudents.Department VALUES (1, 'Extreme Sporting', '123 Extreme Sporting Rd', 'Extremo Memo', 'extremo@skoolz.edu', 4029);
INSERT INTO InternationalStudents.Department VALUES (2, 'Extreme Sciencing', '123 Extreme Sciencing Rd', 'Extremo Nemo', 'extremo2@skoolz.edu', 2927);
INSERT INTO InternationalStudents.Department VALUES (3, 'Extreme Arting', '123 Extreme Arting Rd', 'Extremo Screamo', 'extremo3@skoolz.edu', 4854);
INSERT INTO InternationalStudents.Department VALUES (4, 'Extreme Business', '123 Extreme Business Rd', 'Extremo Dreamo', 'extremo4@skoolz.edu', 4467);
INSERT INTO InternationalStudents.Department VALUES (5, 'Extreme Knitting', '123 Extreme Knitting Rd', 'Extremo Creamo', 'extremo5@skoolz.edu', 4445);
INSERT INTO InternationalStudents.Department VALUES (6, 'Extreme Kitten Care', '123 Extreme Kitten Rd', 'Extremo Beamo', 'extremo6@skoolz.edu', 4833);
INSERT INTO InternationalStudents.Department VALUES (7, 'Extreme Exercising', '123 Extreme Exercising Rd', 'Extremo Teamo', 'extremo7@skoolz.edu', 4837);

/*3. Student*/
INSERT INTO InternationalStudents.Student VALUES (111111111, 'Jimmi Bob', 20000101, 'M', '1234 go hawks rd',1);
INSERT INTO InternationalStudents.Student VALUES (111111112, 'Jenni Bop', 20000201, 'F', '4321 go hawks rd',2);
INSERT INTO InternationalStudents.Student VALUES (111111113, 'Denni Gob', 20000301, 'F', '111 go hawks rd',3);
INSERT INTO InternationalStudents.Student VALUES (111111114, 'Yenni Gop', 20000401, 'M', '222 go hawks rd',4);
INSERT INTO InternationalStudents.Student VALUES (111111115, 'Benni Bup', 20000501, 'M', '333 go hawks rd',5);
INSERT INTO InternationalStudents.Student VALUES (111111116, 'Bimmi Buc', 20000601, 'M', '434 go hawks rd',6);
INSERT INTO InternationalStudents.Student VALUES (111111117, 'Mimmi Bob', 20000701, 'F', '555 go hawks rd',7);

/*4. Job*/
INSERT INTO InternationalStudents.JOB VALUES ('Jim\'s Engineering Co', 'Software Engineer', 20, 'Jim', '1234 Jim Rd', 1234567899, 1);
INSERT INTO InternationalStudents.JOB VALUES ('Dong\'s Art Co', 'Artist', 23, 'Dong', '1234 Dong Rd', 1234567898, 0);
INSERT INTO InternationalStudents.JOB VALUES ('Jonny\'s Boxing Co', 'Athlete', 6, 'Jonny', '1234 Jonny Rd', 1234567897, 1);
INSERT INTO InternationalStudents.JOB VALUES ('Holly\'s Auto Body Co', 'Mechanic', 26, 'Holly', '1234 Holly Rd', 1234567896, 0);
INSERT INTO InternationalStudents.JOB VALUES ('Yolanda\'s Business Analytics Co', 'Analyst', 10, 'Yolanda', '1234 Yolanda Rd', 1234567895, 1);
INSERT INTO InternationalStudents.JOB VALUES ('Nelly\'s Cleaning Co', 'Associate', 15, 'Nelly', '1234 Nelly Rd', 1234567894, 1);
INSERT INTO InternationalStudents.JOB VALUES ('Raj\'s Food Co', 'Food Handler', 14, 'Raj', '1234 Raj Rd', 1234567893, 1);

/*5. Undergrad_Visa*/
INSERT INTO InternationalStudents.Undergrad_Visa VALUES (1, 'H-1B', 'Allows US employers to temporarily employ foreign workers');
INSERT INTO InternationalStudents.Undergrad_Visa VALUES (2, 'F-1', 'Allows entry into US as a student, cannot have a job');
INSERT INTO InternationalStudents.Undergrad_Visa VALUES (3, 'J-1', 'Allows entry into US as a student, can have an on campus job');
INSERT INTO InternationalStudents.Undergrad_Visa VALUES (4, 'K-1', 'Allows entry into US as a student, can have an off campus job');
INSERT INTO InternationalStudents.Undergrad_Visa VALUES (5, 'M-2', 'Allows entry into US as a student, can have any job under 20 hours/week');
INSERT INTO InternationalStudents.Undergrad_Visa VALUES (6, 'M-3B', 'Allows entry into US as a student, can have any job under 40 hours/week');
INSERT INTO InternationalStudents.Undergrad_Visa VALUES (7, 'J-2A', 'Allows entry into US as a student, can have any job for any amount of hours');

/*6. Graduate_Visa */
INSERT INTO InternationalStudents.Graduate_Visa VALUES (1, 'H-1B', 'Allows US employers to temporarily employ foreign workers');
INSERT INTO InternationalStudents.Graduate_Visa VALUES (2, 'F-1', 'Allows entry into US as a student, cannot have a job');
INSERT INTO InternationalStudents.Graduate_Visa VALUES (3, 'J-1', 'Allows entry into US as a student, can have an on campus job');
INSERT INTO InternationalStudents.Graduate_Visa VALUES (4, 'K-1', 'Allows entry into US as a student, can have an off campus job');
INSERT INTO InternationalStudents.Graduate_Visa VALUES (5, 'M-2', 'Allows entry into US as a student, can have any job under 20 hours/week');
INSERT INTO InternationalStudents.Graduate_Visa VALUES (6, 'M-3B', 'Allows entry into US as a student, can have any job under 40 hours/week');
INSERT INTO InternationalStudents.Graduate_Visa VALUES (7, 'J-2A', 'Allows entry into US as a student, can have any job for any amount of hours');

/*7. Undergrad*/
INSERT INTO InternationalStudents.Undergrad VALUES (111111111, 4029, 1);
INSERT INTO InternationalStudents.Undergrad VALUES (111111112, 4029, 2);
INSERT INTO InternationalStudents.Undergrad VALUES (111111113, 2927, 3);
INSERT INTO InternationalStudents.Undergrad VALUES (111111114, 4029, 4);
INSERT INTO InternationalStudents.Undergrad VALUES (111111115, 4854, 5);
INSERT INTO InternationalStudents.Undergrad VALUES (111111116, 4833, 6);
INSERT INTO InternationalStudents.Undergrad VALUES (111111117, 4837, 7);

/*8. Grad*/
INSERT INTO InternationalStudents.Grad VALUES (111111111, 4837, 1);
INSERT INTO InternationalStudents.Grad VALUES (111111112, 4029, 2);
INSERT INTO InternationalStudents.Grad VALUES (111111113, 4029, 3);
INSERT INTO InternationalStudents.Grad VALUES (111111114, 2927, 4);
INSERT INTO InternationalStudents.Grad VALUES (111111115, 4029, 5);
INSERT INTO InternationalStudents.Grad VALUES (111111116, 4854, 6);
INSERT INTO InternationalStudents.Grad VALUES (111111117, 4833, 7);

/*19. Visa_Has_Grads */
INSERT INTO InternationalStudents.GradVisa_Has_GradStudent VALUES (111111111, 1, 20160615, 20210915);
INSERT INTO InternationalStudents.GradVisa_Has_GradStudent VALUES (111111112, 2, 20170915, 20220915);
INSERT INTO InternationalStudents.GradVisa_Has_GradStudent VALUES (111111113, 3, 20180315, 20230915);
INSERT INTO InternationalStudents.GradVisa_Has_GradStudent VALUES (111111114, 4, 20190215, 20240915);
INSERT INTO InternationalStudents.GradVisa_Has_GradStudent VALUES (111111115, 5, 20120815, 20160915);
INSERT INTO InternationalStudents.GradVisa_Has_GradStudent VALUES (111111116, 6, 20131015, 20170915);
INSERT INTO InternationalStudents.GradVisa_Has_GradStudent VALUES (111111117, 7, 20111115, 20160915);

INSERT INTO InternationalStudents.GradVisa_Has_GradStudent VALUES (111111115, 3, 20151215, 20201215);
UPDATE InternationalStudents.Grad SET Visa_ID = 3 WHERE G_SSN = 111111115;
INSERT INTO InternationalStudents.GradVisa_Has_GradStudent VALUES (111111116, 3, 20160715, 20210915);
UPDATE InternationalStudents.Grad SET Visa_ID = 3 WHERE G_SSN = 111111116;
INSERT INTO InternationalStudents.GradVisa_Has_GradStudent VALUES (111111117, 3, 20151229, 20201229);
UPDATE InternationalStudents.Grad SET Visa_ID = 3 WHERE G_SSN = 111111117; /*this should be a trigger*/


/*10. Course*/
INSERT INTO InternationalStudents.Course VALUES (1, 'Sporting 101', 3, 1);
INSERT INTO InternationalStudents.Course VALUES (2, 'Science 101', 4, 2);
INSERT INTO InternationalStudents.Course VALUES (3, 'Art 101', 5, 3);
INSERT INTO InternationalStudents.Course VALUES (4, 'Business 101', 4, 4);
INSERT INTO InternationalStudents.Course VALUES (5, 'Knitting 101', 4, 5);
INSERT INTO InternationalStudents.Course VALUES (6, 'Kitten Care 101', 3, 6);
INSERT INTO InternationalStudents.Course VALUES (7, 'Exercising 101', 5, 7);

/*11. Degree*/
INSERT INTO InternationalStudents.Degree VALUES (1, 'B.S.', 'Sporting', 1);
INSERT INTO InternationalStudents.Degree VALUES (2, 'B.S.', 'Science 101', 2);
INSERT INTO InternationalStudents.Degree VALUES (3, 'B.S.', 'Art', 3);
INSERT INTO InternationalStudents.Degree VALUES (4, 'B.S.', 'Business', 4);
INSERT INTO InternationalStudents.Degree VALUES (5, 'B.S.', 'Knitting', 5);
INSERT INTO InternationalStudents.Degree VALUES (6, 'B.S.', 'Kitten Care', 6);
INSERT INTO InternationalStudents.Degree VALUES (7, 'B.S.', 'Exercising', 7);

/*12. Regulations and Laws*/
INSERT INTO InternationalStudents.Regulations_and_Laws VALUES (1, 'No_Visa', 'No work, no school, no entry to country');
INSERT INTO InternationalStudents.Regulations_and_Laws VALUES (2, 'Has_Visa', 'Work,School in the country OK');
INSERT INTO InternationalStudents.Regulations_and_Laws VALUES (3, 'Visa_Work_Hours', 'Can work up to 20 hours per week');
INSERT INTO InternationalStudents.Regulations_and_Laws VALUES (4, 'Has_I-20_Visa', 'Cannot be expired');
INSERT INTO InternationalStudents.Regulations_and_Laws VALUES (5, 'International_Undergrad_Credits', '12 credit hours per semester required');
INSERT INTO InternationalStudents.Regulations_and_Laws VALUES (6, 'International_Grad_Credits', '9 credit hours per semester required');
INSERT INTO InternationalStudents.Regulations_and_Laws VALUES (7, 'OffCampusPermission', 'Can work off-campus');

/*13. St_From_Country*/
INSERT INTO InternationalStudents.St_From_Country VALUES (111111111, 'United States');
INSERT INTO InternationalStudents.St_From_Country VALUES (111111112, 'India');
INSERT INTO InternationalStudents.St_From_Country VALUES (111111113, 'France');
INSERT INTO InternationalStudents.St_From_Country VALUES (111111114, 'Italy');
INSERT INTO InternationalStudents.St_From_Country VALUES (111111114, 'United States');
INSERT INTO InternationalStudents.St_From_Country VALUES (111111115, 'Japan');
INSERT INTO InternationalStudents.St_From_Country VALUES (111111116, 'China');
INSERT INTO InternationalStudents.St_From_Country VALUES (111111117, 'United Kingdom');
INSERT INTO InternationalStudents.St_From_Country VALUES (111111117, 'United States');

/*14. Student Has Job*/
INSERT INTO InternationalStudents.Student_Has_Job VALUES (111111111, 'Jim\'s Engineering Co');
INSERT INTO InternationalStudents.Student_Has_Job VALUES (111111112, 'Dong\'s Art Co');
INSERT INTO InternationalStudents.Student_Has_Job VALUES (111111113, 'Jonny\'s Boxing Co');
INSERT INTO InternationalStudents.Student_Has_Job VALUES (111111114, 'Holly\'s Auto Body Co');
INSERT INTO InternationalStudents.Student_Has_Job VALUES (111111115, 'Yolanda\'s Business Analytics Co');
INSERT INTO InternationalStudents.Student_Has_Job VALUES (111111116, 'Nelly\'s Cleaning Co');
INSERT INTO InternationalStudents.Student_Has_Job VALUES (111111117, 'Raj\'s Food Co');

/*15. Student_has_Course*/
INSERT INTO InternationalStudents.Student_has_Course VALUES (111111111, 1, 3.5);
INSERT INTO InternationalStudents.Student_has_Course VALUES (111111111, 2, 4);
INSERT INTO InternationalStudents.Student_has_Course VALUES (111111111, 3, 3.2);
INSERT INTO InternationalStudents.Student_has_Course VALUES (111111112, 1, 3.9);
INSERT INTO InternationalStudents.Student_has_Course VALUES (111111113, 1, 3.3);
INSERT INTO InternationalStudents.Student_has_Course VALUES (111111114, 7, 4);
INSERT INTO InternationalStudents.Student_has_Course VALUES (111111115, 5, 4);

/*16. Educational History*/
INSERT INTO InternationalStudents.Educational_History VALUES (111111111, 4029, 4, 20150915, 20190515);
INSERT INTO InternationalStudents.Educational_History VALUES (111111112, 4029, 4, 20150915, 20190515);
INSERT INTO InternationalStudents.Educational_History VALUES (111111113, 2927, 3.4, 20150915, 20190515);
INSERT INTO InternationalStudents.Educational_History VALUES (111111114, 4029, 3.8, 20150915, 20190515);
INSERT INTO InternationalStudents.Educational_History VALUES (111111115, 4854, 2.9, 20150915, 20190515);
INSERT INTO InternationalStudents.Educational_History VALUES (111111116, 4833, 1, 20150915, 20190515);
INSERT INTO InternationalStudents.Educational_History VALUES (111111117, 4837, 4, 20150915, NULL);

/*17. Educational History has Degree*/
INSERT INTO InternationalStudents.Educational_History_has_Degree VALUES (111111111, 4029, 1);
INSERT INTO InternationalStudents.Educational_History_has_Degree VALUES (111111112, 4029, 2);
INSERT INTO InternationalStudents.Educational_History_has_Degree VALUES (111111113, 2927, 3);
INSERT INTO InternationalStudents.Educational_History_has_Degree VALUES (111111114, 4029, 4);
INSERT INTO InternationalStudents.Educational_History_has_Degree VALUES (111111115, 4854, 5);
INSERT INTO InternationalStudents.Educational_History_has_Degree VALUES (111111116, 4833, 6);
INSERT INTO InternationalStudents.Educational_History_has_Degree VALUES (111111117, 4837, 7);

/*18. Student has reg/laws*/
INSERT INTO InternationalStudents.Student_has_Regulations_and_Laws VALUES (111111111, 1, 1);
INSERT INTO InternationalStudents.Student_has_Regulations_and_Laws VALUES (111111112, 2, 0);
INSERT INTO InternationalStudents.Student_has_Regulations_and_Laws VALUES (111111113, 3, 1);
INSERT INTO InternationalStudents.Student_has_Regulations_and_Laws VALUES (111111114, 4, 1);
INSERT INTO InternationalStudents.Student_has_Regulations_and_Laws VALUES (111111115, 5, 0);
INSERT INTO InternationalStudents.Student_has_Regulations_and_Laws VALUES (111111116, 6, 1);
INSERT INTO InternationalStudents.Student_has_Regulations_and_Laws VALUES (111111117, 7, 1);
