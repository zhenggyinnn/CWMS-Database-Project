-- database created for CWMS 
CREATE DATABASE assignment_1;

-- use database
USE assignment_1;

-- create new tables and insert records
CREATE TABLE communities (
	community_id VARCHAR(5) NOT NULL,
    community_name VARCHAR(30) NOT NULL,
    community_admin VARCHAR(30) NOT NULL,
    community_city VARCHAR(30) NOT NULL,
    community_pop INT(8) NOT NULL,
    CONSTRAINT comm_pk PRIMARY KEY(community_id),
    CONSTRAINT comm_city_spec CHECK(community_city IN ("Klang","Cheras", "Petaling Jaya", "Puchong")));
    
INSERT INTO communities(community_id, community_name, community_admin, community_city, community_pop)
VALUES
("C1", "Community A", "Alice Lim", "Klang", 4000),
("C2", "Community B", "Brian Tan", "Cheras", 3200),
("C3", "Community C", "Clara Wong", "Petaling Jaya", 5000),
("C4", "Community D", "David Lee", "Puchong", 2800),
("C5", "Community E", "Evelyn Tan", "Klang", 3500);
    
CREATE TABLE users (
	user_id VARCHAR(5) NOT NULL,
	community_id VARCHAR(5) NOT NULL,
    user_name VARCHAR(30) NOT NULL,
    user_phone VARCHAR(15) NOT NULL,
    user_email VARCHAR(50),
    user_dob DATE,
    user_race VARCHAR(10),
    user_street VARCHAR(50) NOT NULL,
    user_postcode INT(5),
    user_city VARCHAR(30) NOT NULL,
    user_password VARCHAR(30) NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY(user_id),
	CONSTRAINT user_comm_fk FOREIGN KEY (community_id) REFERENCES communities(community_id) ON DELETE CASCADE,
    CONSTRAINT user_email_uk UNIQUE(user_email),
    CONSTRAINT user_race_spec CHECK(user_race IN("Chinese", "Malay", "Indian", "Other")),
	CONSTRAINT user_city_spec CHECK(user_city IN("Klang", "Cheras", "Petaling Jaya", "Puchong")));
    
INSERT INTO USERS (user_id, community_id, user_name, user_phone, user_email, user_dob, user_race, user_street, user_postcode, user_city, user_password)
VALUES
('U1', 'C1', 'Alice Lim', '011-2233445', 'alice@gmail.com', '1990-05-12', 'Chinese', 'Jalan Angkasa', 10001, 'Klang', 'passAlice'),
('U2', 'C2', 'Brian Tan', '012-3456789', 'brian@gmail.com', '1985-08-20', 'Chinese', 'Jalan Ampang', 10002, 'Klang', 'passBrian'),
('U3', 'C3', 'Clara Wong', '015-6789101', 'clara@gmail.com', '1992-11-15', 'Chinese', 'Crystal Avenue', 10003, 'Cheras', 'passClara'),
('U4', 'C4', 'David Lee', '013-7788991', 'david@gmail.com', '1988-01-30', 'Chinese', 'Jalan 5/10', 10004, 'Cheras', 'passDavid'),
('U5', 'C1', 'Evelyn Tan', '014-2345678', 'ella@gmail.com', '1995-03-25', 'Chinese', 'Jalan Masjid', 10005, 'Petaling Jaya', 'passEvelyn'),
('U6', 'C2', 'Fahim Khan', '019-8765432', 'fahim@yahoo.com', '1991-07-22', 'Indian', 'Jalan Hang Tuah', 10006, 'Petaling Jaya', 'passFahim'),
('U7', 'C3', 'Qistina', '010-2244558', 'tina@hotmail.com', '1989-12-10', 'Malay', 'Elmina', 10007, 'Puchong', 'passQist'),
('U8', 'C4', 'Henry Tan', '013-3389001', 'henry@yahoo.com', '1993-06-05', 'Chinese', 'Kanpung Baharu Puchong', 10008, 'Puchong', 'passHenry'),
('U9', 'C5', 'Ivy Chua', '018-6433221', 'ivy@hotmail.com', '1994-10-18', 'Other', 'Meru', 10009, 'Klang', 'passIvy'),
('U10', 'C5', 'Preethi', '017-9900992', 'jack@hotmail.com', '1987-04-02', 'Indian', 'Jalan 10', 10010, 'Klang', 'passPreet'),
('U11', 'C1', 'Emily Chan', '012-3456789', 'emilyc@gmail.com', '1990-11-12', 'Other', 'River Drive', 43000, 'Klang', 'passEmily'),
('U12', 'C2', 'Abdullah', '013-9876543', 'kevin@gmail.com', '1986-01-09', 'Malay', 'Setia Alam', 360000, 'Klang', 'passKevin'),
('U13', 'C3', 'Anitha', '014-5678910', 'anitha@gmail.com', '1993-02-23', 'Indian', 'Crystal Street', 58010, 'Petaling Jaya', 'passAnitha'),
('U14', 'C4', 'Megan Wong', '012-7654321', 'megan@gmail.com', '1992-07-18', 'Chinese', 'Connaught', 77430, 'Cheras', 'passMeg'),
('U15', 'C5', 'Oliver Tan', '019-3452123', 'oliver@gmail.com', '1987-04-04', 'Other', 'Maple Park', 360000, 'Puchong', 'passOliver'),
('U16', 'C1', 'Raquel binti Alif', '012-1234567', 'raq@gmail.com', '1996-01-15', 'Malay', 'Hilltop Avenue', 41000, 'Petaling Jaya', 'passrRaq'),
('U17', 'C2', 'Jack Lee', '012-2222222', 'jack@gmail.com', '1973-09-19', 'Chinese', 'Kelana Jaya', 45700, 'Petaling Jaya', 'passJack'),
('U18', 'C3', 'Shivaness', '013-4567890', 'benny@gmail.com', '1990-12-01', 'Indian', 'Garden Lan', 360000, 'Klang', 'passShiv'),
('U19', 'C4', 'Fiona', '013-9876543', 'fiona@gmail.com', '1986-06-09', 'Malay', 'Subang', 360000, 'Petaling Jaya', 'passFiona'),
('U20', 'C5', 'Steven Yong', '012-5678123', 'steven@gmail.com', '1997-03-14', 'Chinese', 'Subang', 360000, 'Petaling Jaya', 'passSteven'),
('U21', 'C1', 'Alliya Mahfuz', '013-8765432', 'ally@gmail.com', '1991-05-27', 'Malay', 'First World', 43501, 'Cheras', 'passAlly'),
('U22', 'C2', 'Jezemy', '012-7654321', 'jez@gmail.com', '1986-06-15', 'Other', 'Jalan Universiti', 78000, 'Puchong', 'passJez'),
('U23', 'C3', 'Khloe', '013-3333333', 'khloe@gmail.com', '1990-08-25', 'Indian', 'Jalan Kerinchi', 78000, 'Cheras', 'passKlhoe'),
('U24', 'C4', 'Lucy Dwayne', '014-5678910', 'lucy@gmail.com', '1988-04-12', 'Other', 'Jalan Tinna', 78000, 'Puchong', 'passLucy'),
('U25', 'C5', 'Gary', '018-6666666', 'gary@gmail.com', '1986-03-23', 'Other', 'Jalan Hang Jebat', 43200, 'Petaling Jaya', 'passGary'),
('U26', 'C1', 'Toni Simone Lee', '019-3451234', 'toni@gmail.com', '1986-06-15', 'Other', 'Maple Street', 78000, 'Cheras', 'passToni'),
('U27', 'C2', 'Jasmine Quek', '012-1234579', 'jasmine@gmail.com', '1995-02-11', 'Chinese', 'Taman Megah', 47500, 'Petaling Jaya', 'passJas'),
('U28', 'C3', 'Sammi', '013-4567890', 'sammi@gmail.com', '1991-05-18', 'Malay', 'Taipan', 34500, 'Puchong', 'passSammi'),
('U29', 'C4', 'Anthony Lim', '011-1111111', 'ant@gmail.com', '1983-07-20', 'Chinese', 'Orchid Road', 45601, 'Klang', 'passAnt'),
('U30', 'C5', 'Indra Putra', '014-5677899', 'indra@gmail.com', '1999-02-14', 'Other', 'Jalan Yes Day', 78000, 'Petaling Jaya', 'passIndra'),
('U31', 'C1', 'Chris Cheong', '012-3333555', 'chris@gmail.com', '1999-06-22', 'Chinese', 'Jalan Mahogani', 78000, 'Klang', 'passChris'),
('U32', 'C2', 'Elleria', '010-7895432', 'elle@gmail.com', '1995-12-13', 'Chinese', 'Jalan Einstein', 60530, 'Puchong', 'passElle'),
('U33', 'C3', 'Mai ', '010-5566900', 'mai@gmail.com', '2000-07-20', 'Indian', 'Jalan Universiti', 78000, 'Puchong', 'passMai'),
('U34', 'C4', 'Tiana Loo', '012-3322445', 'tiana@gmail.com', '1957-10-15', 'Chinese', 'Jalan Timber', 45701, 'Cheras', 'passTiana'),
('U35', 'C5', 'Alysha Arif', '013-4414441', 'aly@gmail.com', '1993-04-15', 'Malay', 'Jalan River', 68000, 'Petaling Jaya', 'passAly');

CREATE TABLE schedules (
	schedule_id VARCHAR(5) NOT NULL,    
    community_id VARCHAR(5) NOT NULL,
    schedule_date DATE NOT NULL,
    schedule_time TIME NOT NULL,
    schedule_status VARCHAR(20) NOT NULL,
    CONSTRAINT schedule_pk PRIMARY KEY(schedule_id),
	CONSTRAINT schedule_comm_fk FOREIGN KEY(community_id) REFERENCES communities(community_id) ON DELETE CASCADE,
    CONSTRAINT schedule_time_spec CHECK(schedule_time IN("08:00:00", "18:00:00")),
    CONSTRAINT schedule_status_spec CHECK(schedule_status IN("Completed", "In progress", "Cancelled")));
    
INSERT INTO schedules(schedule_id, community_id, schedule_date, schedule_time, schedule_status)
VALUES
('S1', 'C1', '2024-09-01', '08:00:00', 'Completed'),
('S2', 'C2', '2024-09-02', '18:00:00', 'Completed'),
('S3', 'C3', '2024-09-03', '08:00:00', 'Cancelled'),
('S4', 'C4', '2024-09-03', '18:00:00', 'Completed'),
('S5', 'C5', '2024-09-05', '08:00:00', 'Cancelled'),
('S6', 'C1', '2024-09-05', '18:00:00', 'Completed'),
('S7', 'C2', '2024-09-06', '08:00:00', 'Completed'),
('S8', 'C3', '2024-09-06', '18:00:00', 'Completed'),
('S9', 'C4', '2024-09-07', '08:00:00', 'Cancelled'),
('S10', 'C5', '2024-09-07', '18:00:00', 'Cancelled'),
('S11', 'C1', '2024-09-08', '08:00:00', 'Completed'),
('S12', 'C2', '2024-09-08', '18:00:00', 'Completed'),
('S13', 'C3', '2024-09-09', '08:00:00', 'Completed'),
('S14', 'C4', '2024-09-09', '18:00:00', 'Completed'),
('S15', 'C5', '2024-09-10', '08:00:00', 'Completed'),
('S16', 'C1', '2024-09-10', '18:00:00', 'Cancelled'),
('S17', 'C2', '2024-09-11', '08:00:00', 'Completed'),
('S18', 'C3', '2024-09-11', '18:00:00', 'Completed'),
('S19', 'C4', '2024-09-12', '08:00:00', 'Cancelled'),
('S20', 'C5', '2024-09-12', '18:00:00', 'Cancelled'),
('S21', 'C1', '2024-09-13', '08:00:00', 'Cancelled'),
('S22', 'C2', '2024-09-13', '18:00:00', 'Cancelled'),
('S23', 'C3', '2024-09-14', '08:00:00', 'Completed'),
('S24', 'C3', '2024-09-14', '18:00:00', 'Completed'),
('S25', 'C4', '2024-09-15', '08:00:00', 'Completed'),
('S26', 'C5', '2024-09-15', '18:00:00', 'Completed'),
('S27', 'C1', '2024-09-16', '08:00:00', 'Completed'),
('S28', 'C2', '2024-09-16', '18:00:00', 'Completed'),
('S29', 'C3', '2024-09-17', '08:00:00', 'Cancelled'),
('S30', 'C4', '2024-09-17', '18:00:00', 'Cancelled'),
('S31', 'C5', '2024-09-18', '08:00:00', 'In Progress'),
('S32', 'C1', '2024-09-18', '18:00:00', 'In Progress'),
('S33', 'C2', '2024-09-19', '08:00:00', 'In Progress'),
('S34', 'C3', '2024-09-19', '18:00:00', 'In Progress'),
('S35', 'C4', '2024-09-20', '08:00:00', 'In Progress'),
('S36', 'C5', '2024-09-20', '18:00:00', 'In Progress'),
('S37', 'C1', '2024-09-21', '08:00:00', 'Cancelled'),
('S38', 'C2', '2024-09-21', '18:00:00', 'Cancelled'),
('S39', 'C3', '2024-09-22', '08:00:00', 'In Progress'),
('S40', 'C4', '2024-09-22', '18:00:00', 'In Progress');

CREATE TABLE issues (
	issue_id VARCHAR(5) NOT NULL,
    user_id VARCHAR(5) NOT NULL,
    issue_type VARCHAR(30) NOT NULL,
    issue_description VARCHAR(50),
    issue_date DATE NOT NULL,
    issue_time TIME NOT NULL,
    issue_status VARCHAR(20) NOT NULL,
    issue_city VARCHAR(30) NOT NULL,
    issue_photo_url VARCHAR(3500),
    CONSTRAINT issue_pk PRIMARY KEY(issue_id),
    CONSTRAINT issue_user_fk FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    CONSTRAINT issue_type_spec CHECK(issue_type IN("Missed Pickup", "Overflowing Bin","Illegal Dumping", "Other")),
    CONSTRAINT issue_status_spec CHECK(issue_status IN("Pending", "Solved")),
    CONSTRAINT issue_city_spec CHECK(issue_city IN("Klang", "Cheras", "Petaling Jaya", "Puchong")));
    
INSERT INTO issues(issue_id, user_id, issue_type, issue_description, issue_date, issue_time, issue_status, issue_city, issue_photo_url)
VALUES
('I1', 'U3', 'Missed Pickup', 'Trash not picked up', '2024-09-01', '08:30:00', 'Solved', 'Petaling Jaya', 'https://example.com/issue1'),
('I2', 'U7', 'Overflowing Bin', 'Bin is overflowing', '2024-09-01', '09:15:00', 'Solved', 'Cheras', 'https://example.com/issue2'),
('I3', 'U12', 'Illegal Dumping', 'In alley', '2024-09-03', '14:20:00', 'Pending', 'Cheras', 'https://example.com/issue3'),
('I4', 'U9', 'Other', 'Damaged Bin', '2024-09-04', '11:50:00', 'Solved', 'Puchong', 'https://example.com/issue4'),
('I5', 'U5', 'Overflowing Bin', 'Bin full', '2024-09-05', '16:40:00', 'Solved', 'Klang', 'https://example.com/issue5'),
('I6', 'U16', 'Missed Pickup', 'Missed weekly pickup', '2024-09-06', '08:15:00', 'Solved', 'Klang', 'https://example.com/issue6'),
('I7', 'U14', 'Illegal Dumping', 'Dumping in the park', '2024-09-07', '18:10:00', 'Solved', 'Klang', 'https://example.com/issue7'),
('I8', 'U19', 'Other', 'Broken waste container', '2024-09-08', '10:25:00', 'Pending', 'Puchong', 'https://example.com/issue8'),
('I9', 'U23', 'Missed Pickup', 'Waste truck missed house', '2024-09-08', '08:00:00', 'Pending', 'Petaling Jaya', 'https://example.com/issue9'),
('I10', 'U29', 'Overflowing Bin', 'for 2 days already', '2024-09-09', '18:10:00', 'Solved', 'Puchong', 'https://example.com/issue10'),
('I11', 'U2', 'Illegal Dumping', 'Dumped in alley', '2024-09-10', '12:30:00', 'Solved', 'Cheras', 'https://example.com/issue11'),
('I12', 'U11', 'Missed Pickup', ' ', '2024-09-10', '17:45:00', 'Solved', 'Klang', 'https://example.com/issue12'),
('I13', 'U4', 'Overflowing Bin', 'Public bin overflowing', '2024-09-11', '13:50:00', 'Solved', 'Puchong', 'https://example.com/issue13'),
('I14', 'U10', 'Other', 'Wrong type of waste bin', '2024-09-12', '13:00:00', 'Pending', 'Klang', 'https://example.com/issue14'),
('I15', 'U25', 'Illegal Dumping', 'Near road', '2024-09-13', '09:10:00', 'Solved', 'Klang', 'https://example.com/issue15'),
('I16', 'U8', 'Missed Pickup', 'Garbage not collected', '2024-09-16', '07:50:00', 'Pending', 'Petaling Jaya', 'https://example.com/issue16'),
('I17', 'U20', 'Overflowing Bin', 'Bin at max capacity', '2024-09-17', '12:30:00', 'Pending', 'Klang', 'https://example.com/issue17'),
('I18', 'U26', 'Illegal Dumping', 'Dumped behind store', '2024-09-18', '19:00:00', 'Solved', 'Klang', 'https://example.com/issue18'),
('I19', 'U6', 'Missed Pickup', 'Missed stop', '2024-09-19', '07:10:00', 'Pending', 'Klang', 'https://example.com/issue19'),
('I20', 'U13', 'Other', 'Spilled waste on street', '2024-09-20', '11:25:00', 'Solved', 'Petaling Jaya', 'https://example.com/issue20');


CREATE TABLE wastes(
	waste_id VARCHAR(5) NOT NULL,
    community_id VARCHAR(5) NOT NULL,
    waste_type VARCHAR(30) NOT NULL,
    CONSTRAINT waste_pk PRIMARY KEY(waste_id),
    CONSTRAINT waste_comm_pk FOREIGN KEY(community_id) REFERENCES communities(community_id) ON DELETE CASCADE,
    CONSTRAINT waste_type_spec CHECK(waste_type IN("Household Wastes", "Recycable Wastes", "Hazardous Wastes")));
    
INSERT INTO wastes(waste_id, community_id, waste_type)
VALUES
('W1', 'C1', 'Household Wastes'),
('W2', 'C1', 'Recycable Wastes'),
('W3', 'C2', 'Hazardous Wastes'),
('W4', 'C2', 'Household Wastes'),
('W5', 'C3', 'Recycable Wastes'),
('W6', 'C3', 'Hazardous Wastes'),
('W7', 'C4', 'Household Wastes'),
('W8', 'C4', 'Recycable Wastes'),
('W9', 'C5', 'Hazardous Wastes'),
('W10', 'C5', 'Recycable Wastes');
    
CREATE TABLE notifications(
	notification_id VARCHAR(5) NOT NULL,
    community_id VARCHAR(5) NOT NULL,
    notification_type VARCHAR(30) NOT NULL,
    notification_description VARCHAR(50),
    notification_date DATE NOT NULL,
    notification_time TIME NOT NULL,
    CONSTRAINT noti_pk PRIMARY KEY(notification_id),
    CONSTRAINT notif_comm_fk FOREIGN KEY(community_id) REFERENCES communities(community_id) ON DELETE CASCADE,
    CONSTRAINT noti_type_spec CHECK(notification_type IN("Announcement", "Reminder")));

INSERT INTO notifications(notification_id, community_id, notification_type, notification_description, notification_date, notification_time)
VALUES
('N1', 'C1', 'Reminder', 'Waste collection tomorrow', '2024-09-01', '08:00:00'),
('N2', 'C2', 'Announcement', 'New Recycling bin installed', '2024-09-02', '09:00:00'),
('N3', 'C3', 'Reminder', 'Hazardous waste disposal day', '2024-09-03', '10:00:00'),
('N4', 'C4', 'Announcement', 'Bin maintenance schedule', '2024-09-04', '11:00:00'),
('N5', 'C5', 'Reminder', 'Community cleanup event', '2024-09-05', '14:00:00'),
('N6', 'C1', 'Announcement', 'New collection schedule', '2024-09-06', '16:00:00'),
('N7', 'C2', 'Reminder', 'Monthly waste pickup', '2024-09-07', '08:00:00'),
('N8', 'C3', 'Announcement', 'Hazardous waste guide update', '2024-09-08', '09:00:00'),
('N9', 'C4', 'Reminder', 'Bin overflowing alert', '2024-09-09', '12:00:00'),
('N10', 'C5', 'Announcement', 'Recycling day announcement', '2024-09-10', '13:00:00'),
('N11', 'C1', 'Reminder', 'Waste collection tomorrow', '2024-09-01', '08:00:00'),
('N12', 'C2', 'Announcement', 'Updated waste policy', '2024-09-12', '17:00:00'),
('N13', 'C3', 'Reminder', 'Reminder to separate waste', '2024-09-13', '08:30:00'),
('N14', 'C4', 'Announcement', 'Waste truck maintenance', '2024-09-13', '09:30:00'),
('N15', 'C5', 'Reminder', 'Waste pickup rescheduled', '2024-09-14', '10:30:00'),
('N16', 'C1', 'Announcement', 'Public bins replaced', '2024-09-15', '13:30:00'),
('N17', 'C2', 'Reminder', 'Recycling pickup tomorrow', '2024-09-16', '12:00:00'),
('N18', 'C3', 'Announcement', 'Special bulky item pickup spot', '2024-09-16', '15:30:00'),
('N19', 'C4', 'Reminder', 'Prepare hazardous wastes', '2024-09-17', '17:30:00'),
('N20', 'C5', 'Announcement', 'New disposal guidelines', '2024-09-18', '15:00:00'),
('N21', 'C1', 'Reminder', 'Schedule for bin cleaning', '2024-09-19', '09:00:00'),
('N22', 'C2', 'Announcement', 'Community Waste Awareness Day', '2024-09-19', '10:00:00'),
('N23', 'C3', 'Reminder', 'Household waste pickup alert', '2024-09-20', '11:00:00'),
('N24', 'C4', 'Announcement', 'Bin cleaning event', '2024-09-21', '13:00:00'),
('N25', 'C5', 'Reminder', 'Bin repair service coming', '2024-09-22', '14:00:00');
    
CREATE TABLE reports(
	report_id VARCHAR(5) NOT NULL,
    community_id VARCHAR(5) NOT NULL,
    report_type VARCHAR(30) NOT NULL,
    report_date DATE NOT NULL,
    report_time TIME NOT NULL,
    CONSTRAINT report_pk PRIMARY KEY(report_id),
    CONSTRAINT report_comm_fk FOREIGN KEY(community_id) REFERENCES communities(community_id) ON DELETE CASCADE,
    CONSTRAINT report_type_spec CHECK(report_type IN("Pickup statistics", "Issues reported", "Recycling rates")));  

INSERT INTO reports(report_id, community_id, report_type, report_date, report_time)
VALUES
('R1', 'C1', 'Pickup statistics', '2024-09-01', '08:00:00'),
('R2', 'C2', 'Issues reported', '2024-09-02', '09:00:00'),
('R3', 'C3', 'Recycling rates', '2024-09-03', '10:00:00'),
('R4', 'C4', 'Pickup statistics', '2024-09-04', '15:30:00'),
('R5', 'C5', 'Issues reported', '2024-09-04', '17:20:00'),
('R6', 'C1', 'Recycling rates', '2024-09-05', '18:00:00'),
('R7', 'C2', 'Pickup statistics', '2024-09-06', '17:30:00'),
('R8', 'C3', 'Pickup statistics', '2024-09-06', '16:30:00'),
('R9', 'C4', 'Issues reported', '2024-09-07', '15:45:00'),
('R10', 'C5', 'Recycling rates', '2024-09-07', '17:30:00'),
('R11', 'C1', 'Issues reported', '2024-09-08', '12:30:00'),
('R12', 'C2', 'Pickup statistics', '2024-09-09', '18:10:00'),
('R13', 'C3', 'Issues reported', '2024-09-10', '18:20:00'),
('R14', 'C4', 'Recycling rates', '2024-09-11', '20:30:00'),
('R15', 'C5', 'Pickup statistics', '2024-09-12', '17:40:00'),
('R16', 'C1', 'Issues reported', '2024-09-15', '08:30:00'),
('R17', 'C2', 'Issues reported', '2024-09-16', '10:40:00'),
('R18', 'C3', 'Recycling rates', '2024-09-17', '21:30:00'),
('R19', 'C4', 'Pickup statistics', '2024-09-18', '15:30:00'),
('R20', 'C5', 'Pickup statistics', '2024-09-20', '16:20:00');

CREATE TABLE histories(
	history_id VARCHAR(5) NOT NULL,
    schedule_id VARCHAR(5) NOT NULL,
    history_date DATE NOT NULL,
    history_time TIME NOT NULL,
    CONSTRAINT histories_pk PRIMARY KEY(history_id),
    CONSTRAINT histories_fk FOREIGN KEY (schedule_id) REFERENCES schedules(schedule_id) ON DELETE CASCADE);
    
INSERT INTO histories(history_id, schedule_id, history_date, history_time)
VALUES
('H1', 'S1', '2024-08-20', '08:00:00'),
('H2','S2', '2024-08-21', '18:00:00'),
('H3','S3', '2024-08-22', '08:00:00'),
('H4','S4', '2024-08-22', '18:00:00'),
('H5','S5', '2024-08-25', '08:00:00'),
('H6','S6', '2024-08-25', '18:00:00'),
('H7','S7', '2024-08-26', '08:00:00'),
('H8','S8', '2024-08-26', '18:00:00'),
('H9','S9', '2024-08-27', '08:00:00'),
('H10','S10', '2024-08-27', '18:00:00'),
('H11','S11', '2024-08-28', '08:00:00'),
('H12','S12', '2024-08-28', '18:00:00'),
('H13','S13', '2024-08-29', '08:00:00'),
('H14','S14', '2024-08-29', '18:00:00'),
('H15','S15', '2024-08-30', '08:00:00'),
('H16','S16', '2024-08-30', '18:00:00'),
('H17','S17', '2024-08-31', '08:00:00'),
('H18','S18', '2024-08-31', '18:00:00'),
('H19','S19', '2024-09-01', '08:00:00'),
('H20','S20', '2024-09-01', '18:00:00'),
('H21','S21', '2024-09-02', '08:00:00'),
('H22','S22', '2024-09-02', '18:00:00'),
('H23','S23', '2024-09-03', '08:00:00'),
('H24','S24', '2024-09-03', '18:00:00'),
('H25','S25', '2024-09-04', '08:00:00'),
('H26','S26', '2024-09-04', '18:00:00'),
('H27','S27', '2024-09-05', '08:00:00'),
('H28','S28', '2024-09-05', '18:00:00'),
('H29','S29', '2024-09-06', '08:00:00'),
('H30','S30', '2024-09-06', '18:00:00'),
('H31','S31', '2024-09-07', '08:00:00'),
('H32','S32', '2024-09-07', '18:00:00'),
('H33','S33', '2024-09-08', '08:00:00'),
('H34','S34', '2024-09-08', '18:00:00'),
('H35','S35', '2024-09-09', '08:00:00'),
('H36','S36', '2024-09-09', '18:00:00'),
('H37','S37', '2024-09-10', '08:00:00'),
('H38','S38', '2024-09-10', '18:00:00'),
('H39','S39', '2024-09-11', '08:00:00'),
('H40','S40', '2024-09-11', '18:00:00');

DROP TABLE communities;
DROP TABLE users;
DROP TABLE schedules;
DROP TABLE issues;
DROP TABLE reports;
DROP TABLE notifications;
DROP TABLE wastes; 

-- SQL query on displaying number of issues reported based on community
SELECT c.community_name, COUNT(i.issue_id) AS Issues_Reported
FROM communities c
JOIN users u ON c.community_id = u.community_id
JOIN issues i ON u.user_id = i.user_id
GROUP BY c.community_name
ORDER BY Issues_Reported DESC;

-- SQL query on display number of schedules created in each community
SELECT c.community_name, COUNT(s.schedule_id) AS total_schedules
FROM communities c
JOIN schedules s ON c.community_id = s.community_id
GROUP BY c.community_name
ORDER BY total_schedules DESC;

-- SQL query on displaying the latest schedule for each community
SELECT c.community_name, w.waste_type, s.schedule_time, s.schedule_date
FROM communities c
JOIN schedules s ON c.community_id = s.community_id
JOIN wastes w ON c.community_id = w.community_id
WHERE (c.community_id, s.schedule_date) IN (
    SELECT s1.community_id, MAX(s1.schedule_date)
    FROM schedules s1
    GROUP BY s1.community_id
)
ORDER BY c.community_name ,s.schedule_date DESC, s.schedule_time;

-- SQL query to display the resolution rate of the issues in each community
SELECT C.community_name, 
       COUNT(I.issue_id) AS total_issues, 
       SUM(CASE WHEN I.issue_status = 'Solved' THEN 1 ELSE 0 END) AS solved_issues,
       (SUM(CASE WHEN I.issue_status = 'Solved' THEN 1 ELSE 0 END) / COUNT(I.issue_id) * 100) AS resolution_rate
FROM COMMUNITIES C
JOIN USERS U ON C.community_id = U.community_id
JOIN ISSUES I ON U.user_id = I.user_id
GROUP BY C.community_name
HAVING resolution_rate > 50
ORDER BY resolution_rate DESC;

-- SQL query to display number of cancelled schedule in each community
SELECT community_name, cancelled_schedules
FROM (
    SELECT c.community_name, COUNT(s.schedule_id) AS cancelled_schedules
    FROM communities c
    JOIN schedules s ON c.community_id = s.community_id
    WHERE s.schedule_status = 'Cancelled'
    GROUP BY c.community_name
) AS subquery
ORDER BY cancelled_schedules DESC;

-- Create trigger
DELIMITER //

CREATE TRIGGER prevent_user_deletion
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    DECLARE issue_count INT;

    -- Count the number of issues reported by the user
    SELECT COUNT(*) INTO issue_count
    FROM issues
    WHERE user_id = OLD.user_id AND issue_status = 'Pending';

    -- If the user has reported any issues, raise an error
    IF issue_count > 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot delete user with reported issues';
    END IF;
END //

DELIMITER ;


SELECT * 
FROM issues;

-- Test trigger
DELETE FROM users
WHERE user_id = 'u10';


-- Create function
DELIMITER //

CREATE FUNCTION calculate_resolution_rate(p_community_id VARCHAR(5))
RETURNS DECIMAL(5, 2)
DETERMINISTIC
BEGIN
    DECLARE total_issues INT;
    DECLARE solved_issues INT;
    DECLARE resolution_rate DECIMAL(5, 2);

    SELECT COUNT(*) INTO total_issues
    FROM issues i
    JOIN users u ON i.user_id = u.user_id
    WHERE u.community_id = p_community_id;

    SELECT COUNT(*) INTO solved_issues
    FROM issues i
    JOIN users u ON i.user_id = u.user_id
    WHERE u.community_id = p_community_id AND i.issue_status = 'Solved';

    IF total_issues > 0 THEN
        SET resolution_rate = (solved_issues / total_issues) * 100;
    ELSE
        SET resolution_rate = 0;
    END IF;

    RETURN resolution_rate;
END//

DELIMITER ;

DROP FUNCTION IF EXISTS calculate_resolution_rate;

SELECT community_name, calculate_resolution_rate('c3') AS resolution_rate
FROM communities
WHERE community_id = 'c3';

-- Create stored procedure
DELIMITER //

CREATE PROCEDURE waste_collection_schedule (
	IN p_schedule_id VARCHAR(5),
    IN p_community_id VARCHAR(5),
    IN p_schedule_date DATE,
    IN p_schedule_time TIME,
    IN p_schedule_status ENUM('Completed', 'In progress', 'Cancelled')
)
BEGIN
    DECLARE existing_schedule INT;

    -- Check if a schedule already exists for the same community, date, and time
    SELECT COUNT(*) INTO existing_schedule
    FROM schedules
    WHERE community_id = p_community_id
    AND schedule_date = p_schedule_date
    AND schedule_time = p_schedule_time;

    IF existing_schedule = 0 THEN
        -- Insert a new schedule if no conflict
        INSERT INTO schedules (schedule_id, community_id, schedule_date, schedule_time, schedule_status)
        VALUES (p_schedule_id, p_community_id, p_schedule_date, p_schedule_time, p_schedule_status);
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Schedule already exists';
    END IF;
END//

DELIMITER ;

-- Test stored procedure with existing schedule
CALL waste_collection_schedule('S41','C1', '2024-09-01', '08:00:00', 'Completed');

-- Test stored procedure with new schedule
CALL waste_collection_schedule('S41','C5', '2024-09-25', '08:00:00', 'In Progress');
































    