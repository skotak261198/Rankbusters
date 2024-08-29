DROP TABLE IF EXISTS [Rankbusters.Ranking];
DROP TABLE IF EXISTS [Rankbusters.RankFactor];
DROP TABLE IF EXISTS [Rankbusters.Source];
DROP TABLE IF EXISTS [Rankbusters.Program];
DROP TABLE IF EXISTS [Rankbusters.Department];

CREATE TABLE [Rankbusters.Department] (
 dptId CHAR(3) NOT NULL,
 dptName VARCHAR(100),
 dptChair VARCHAR(50),
 dptBuilding VARCHAR(50),
 dptOffice VARCHAR(4),
 CONSTRAINT pk_Department_dptId PRIMARY KEY (dptId)
);

CREATE TABLE [Rankbusters.Program] (
 pgmId CHAR(4) NOT NULL,
 pgmName VARCHAR(50),
 pgmDirector VARCHAR(50),
 pgmLevel VARCHAR(20),
 pgmDuration VARCHAR(50),
 pgmCredits INTEGER,
 dptId CHAR(3) NOT NULL,
 CONSTRAINT pk_Program_pgmId PRIMARY KEY (pgmId),
 CONSTRAINT fk_Program_dptId FOREIGN KEY (dptId)
 REFERENCES [Rankbusters.Department] (dptId)
ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE [Rankbusters.Source] (
srcName VARCHAR(50) NOT NULL,
srcLink VARCHAR(250),
srcType VARCHAR(30)
CONSTRAINT pk_Source_srcName PRIMARY KEY (srcName)
);

CREATE TABLE [Rankbusters.RankFactor] (
rnfYear INTEGER NOT NULL,
pgmId CHAR(4) NOT NULL,
rnkStudentIntake INTEGER,
rnfTuitionFees DECIMAL(10,2),
rnfAvgSalary DECIMAL(10,2),
CONSTRAINT pk_RankFactor_rnfYear_pgmId PRIMARY KEY (rnfYear,
pgmId),
CONSTRAINT fk_RankFactor_pgmId FOREIGN KEY (pgmId)
 REFERENCES [Rankbusters.Program] (pgmId),
); 

CREATE TABLE [Rankbusters.Ranking] (
rnkScore INTEGER NOT NULL,
pgmId CHAR(4) NOT NULL,
rnfYear INTEGER NOT NULL,
srcName VARCHAR(50) NOT NULL,
CONSTRAINT pk_Ranking_pgmId_rnfYear_srcName PRIMARY KEY
(pgmId, rnfYear, srcName),
CONSTRAINT fk_Ranking_srcName FOREIGN KEY (srcName)
 REFERENCES [Rankbusters.Source] (srcName),
 CONSTRAINT fk_Ranking_rnfYear_pgmId FOREIGN KEY (rnfYear, pgmId)
 REFERENCES [Rankbusters.RankFactor] (rnfYear, pgmId)
); 

INSERT INTO [Rankbusters.Department] VALUES
('001', 'Decision, Operations & Information Logistics', 'Ilya Ryzhov', 'Van
Munching Hall', '4340'),
('002', 'Accounting & Information Assurance', 'Michael Kimborough', 'Van
Munching Hall', '4332'),
('003', 'Finance', 'Russell Wermers', 'Van Munching Hall', '4471'),
('004', 'Logistics, Business & Public Policy', 'Cristian Dezso', 'Van Munching
Hall', '3409'),
('005', 'Management & Organization', 'Subra Tangirala', 'Van Munching Hall',
'4540'),
('006', 'Marketing', 'Amna Kirmani', 'Van Munching Hall', '3467');
INSERT INTO [Rankbusters.Program] VALUES
(1001, 'Information Systems', 'Tejwansh (Tej) Singh Anand', 'MS', '2-3
semesters', 30, '001'),
(1002, 'Business Analytics', 'Suresh Acharya', 'MS', '2-3 semesters', 30,
'001'),
(1003, 'Accounting', 'Emanuel Zur', 'MS', '2-3 semesters', 30, '002'),
(1004, 'Finance', 'Michael Cichello', 'MFin', '2-3 semesters', 30, '003'),
(1005, 'Marketing Analytics', 'Judy Frels', 'MS', '2-3 semesters', 30, '006'),
(1006, 'Management Studies', 'Rellie Derfler-Rozin', 'MiM', '2 semesters', 30,
'005'),
(1007, 'Supply Chain Management', 'Thomas M. Corsi', 'MS', '2-3 semesters',
30, '004'),
(1008, 'Quantitative Finance', 'Michael Chichello', 'MQF', '3-4 semesters', 36,
'003');
INSERT INTO [Rankbusters.Source] VALUES
('QS Top Universities', 'https://www.topuniversities.com/university-rankings',
'Website'),
('Times Higher Education', 'https://www.timeshighereducation.com/worlduniversity-rankings', 'Website'),
('US News', 'https://www.usnews.com/best-colleges', 'News Media'),
('Academic Ranking of World Universities',
'https://www.shanghairanking.com', 'Website'),
('Round University Ranking', 'https://roundranking.com', 'Website'); 

INSERT INTO [Rankbusters.RankFactor] VALUES
(2023, 1001, NULL, 26770, 83000),
(2023, 1002, NULL, 26800, 83000),
(2023, 1003, NULL, 27000, 66000),
(2023, 1004, NULL, 26800, 83000),
(2023, 1005, NULL, 26770, NULL),
(2023, 1006, NULL, 26800, 80000),
(2023, 1007, NULL, 27000, 77000),
(2023, 1008, NULL, 33730, 85000),
(2022, 1001, NULL, 24675, 83000),
(2022, 1002, NULL, 24000, 83000),
(2022, 1003, NULL, 24675, 65000),
(2022, 1004, NULL, 24700, 81000),
(2022, 1005, NULL, 24675, NULL),
(2022, 1006, NULL, 24500, 80000),
(2022, 1007, NULL, 25000, 75000),
(2022, 1008, NULL, 29283, 83000),
(2021, 1001, NULL, 23565, 80000),
(2021, 1002, NULL, 23565, 80000),
(2021, 1003, NULL, 23565, 65000),
(2021, 1004, NULL, 23565, 81000),
(2021, 1005, NULL, 23565, NULL),
(2021, 1006, NULL, 23565, 80000),
(2021, 1007, NULL, 23565, 76500),
(2021, 1008, NULL, 27951, 80000),
(2020, 1001, NULL, 23565, 78500),
(2020, 1002, NULL, 23565, 78500),
(2020, 1003, NULL, 23565, 65000),
(2020, 1004, NULL, 23565, 80500),
(2020, 1005, NULL, 23565, NULL),
(2020, 1006, NULL, 23565, 79250),
(2020, 1007, NULL, 23565, 76500),
(2020, 1008, NULL, 27951, 78000)
; 

INSERT INTO [Rankbusters.Ranking] VALUES
(79, 1003, 2023, 'Times Higher Education'),
(98, 1003, 2022, 'Times Higher Education'),
(79, 1003, 2021, 'Times Higher Education'),
(65, 1003, 2020, 'Times Higher Education'),
(7, 1001, 2023, 'Academic Ranking of World Universities'),
(10, 1001, 2022, 'Academic Ranking of World Universities'),
(9, 1001, 2021, 'Academic Ranking of World Universities'),
(46, 1004, 2021, 'Academic Ranking of World Universities'),
(42, 1004, 2022, 'Academic Ranking of World Universities'),
(51, 1004, 2023, 'Academic Ranking of World Universities'),
(57, 1006, 2023, 'QS Top Universities'),
(125, 1006, 2022, 'QS Top Universities'),
(125, 1006, 2021, 'QS Top Universities'),
(56, 1001, 2023, 'QS Top Universities'),
(59, 1001, 2022, 'QS Top Universities'),
(16, 1002, 2023, 'QS Top Universities'),
(31, 1002, 2022, 'QS Top Universities'),
(39, 1005, 2023, 'QS Top Universities'),
(37, 1005, 2022, 'QS Top Universities'),
(28, 1007, 2023, 'QS Top Universities'),
(26, 1007, 2022, 'QS Top Universities'),
(46, 1008, 2021, 'Academic Ranking of World Universities'),
(42, 1008, 2022, 'Academic Ranking of World Universities'),
(51, 1008, 2023, 'Academic Ranking of World Universities'); 