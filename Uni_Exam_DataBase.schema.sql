create database uni_Exam_DB;
use uni_Exam_DB;

CREATE TABLE Person (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dob DATE,
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50),
    zip_code VARCHAR(10),
    street VARCHAR(100)
);

CREATE TABLE Student (
    s_ssn INT PRIMARY KEY,
    program VARCHAR(50),
    cgpa DECIMAL(3,2),
    person_id INT,
    FOREIGN KEY (person_id) REFERENCES Person(id)
);

CREATE TABLE Instructor (
    i_ssn INT PRIMARY KEY,
    salary INT,
    rankI VARCHAR(30),
    person_id INT,
    FOREIGN KEY (person_id) REFERENCES Person(id)
);

CREATE TABLE Teacher (
    t_ssn INT PRIMARY KEY,
    salary INT,
    position VARCHAR(30),
    person_id INT,
    FOREIGN KEY (person_id) REFERENCES Person(id)
);

CREATE TABLE Department (
    d_id INT PRIMARY KEY,
    d_name VARCHAR(50),
    location VARCHAR(100),
    head INT,
    FOREIGN KEY (head) REFERENCES Instructor(i_ssn)
);

CREATE TABLE Course (
    c_id INT PRIMARY KEY,
    c_name VARCHAR(50),
    credit_hours INT,
    d_id INT,
    FOREIGN KEY (d_id) REFERENCES Department(d_id)
);

CREATE TABLE Classroom (
    room_id INT PRIMARY KEY,
    building VARCHAR(50),
    capacity INT
);

CREATE TABLE Result (
    r_id INT PRIMARY KEY,
    grade VARCHAR(2),
    marks INT,
    gpa DECIMAL(3,2),
    s_ssn INT,
    c_id INT,
    FOREIGN KEY (s_ssn) REFERENCES Student(s_ssn),
    FOREIGN KEY (c_id) REFERENCES Course(c_id)
);

CREATE TABLE Enrollment (
    e_id INT PRIMARY KEY,
    semester VARCHAR(20),
    s_ssn INT,
    c_id INT,
    FOREIGN KEY (s_ssn) REFERENCES Student(s_ssn),
    FOREIGN KEY (c_id) REFERENCES Course(c_id)
);

CREATE TABLE Exam_Attendance (
    ea_id INT PRIMARY KEY,
    s_ssn INT,
    c_id INT,
    FOREIGN KEY (s_ssn) REFERENCES Student(s_ssn),
    FOREIGN KEY (c_id) REFERENCES Course(c_id)
);

CREATE TABLE Course_Classroom (
    c_id INT,
    room_id INT,
    PRIMARY KEY (c_id, room_id),
    FOREIGN KEY (c_id) REFERENCES Course(c_id),
    FOREIGN KEY (room_id) REFERENCES Classroom(room_id)
);



-- =========================
-- 1. PERSON TABLE DATA
-- =========================

INSERT INTO Person (id, name, dob, email, phone, city, zip_code, street) VALUES
(1, 'Ali Khan', '2002-05-10', 'ali@gmail.com', '03001234567', 'Lahore', '54000', 'Model Town'),
(2, 'Sara Ahmed', '2001-08-15', 'sara@gmail.com', '03011234567', 'Karachi', '75000', 'Gulshan'),
(3, 'Ahmed Raza', '2000-03-20', 'ahmed@gmail.com', '03021234567', 'Islamabad', '44000', 'F-10'),
(4, 'Usman Tariq', '1999-11-25', 'usman@gmail.com', '03031234567', 'Multan', '60000', 'Cantt'),
(5, 'Hina Noor', '2002-01-18', 'hina@gmail.com', '03041234567', 'Faisalabad', '38000', 'D Ground'),
(6, 'Bilal Haider', '1980-07-12', 'bilal@gmail.com', '03051234567', 'Lahore', '54000', 'Johar Town'),
(7, 'Ayesha Malik', '1985-09-05', 'ayesha@gmail.com', '03061234567', 'Karachi', '75000', 'Defence'),
(8, 'Kashif Ali', '1978-06-30', 'kashif@gmail.com', '03071234567', 'Peshawar', '25000', 'University Road'),
(9, 'Fatima Zahra', '1982-04-14', 'fatima@gmail.com', '03081234567', 'Quetta', '87300', 'Jinnah Road');


-- =========================
-- 2. STUDENT TABLE DATA
-- =========================

INSERT INTO Student (s_ssn, program, cgpa, person_id) VALUES
(101, 'BSCS', 3.50, 1),
(102, 'BSIT', 3.80, 2),
(103, 'BSSE', 3.20, 3),
(104, 'BSAI', 3.60, 4),
(105, 'BSDS', 3.90, 5);


-- =========================
-- 3. INSTRUCTOR TABLE DATA
-- =========================

INSERT INTO Instructor (i_ssn, salary, rankI, person_id) VALUES
(201, 120000, 'Professor', 6),
(202, 100000, 'Associate Professor', 7);


-- =========================
-- 4. TEACHER TABLE DATA
-- =========================

INSERT INTO Teacher (t_ssn, salary, position, person_id) VALUES
(301, 70000, 'Lecturer', 8),
(302, 75000, 'Senior Lecturer', 9);


-- =========================
-- 5. DEPARTMENT TABLE DATA
-- =========================

INSERT INTO Department (d_id, d_name, location, head) VALUES
(1, 'Computer Science', 'Block A', 201),
(2, 'Information Technology', 'Block B', 202);


-- =========================
-- 6. COURSE TABLE DATA
-- =========================

INSERT INTO Course (c_id, c_name, credit_hours, d_id) VALUES
(11, 'Database Systems', 3, 1),
(12, 'Operating Systems', 4, 1),
(13, 'Web Development', 3, 2),
(14, 'Data Structures', 4, 1),
(15, 'Artificial Intelligence', 3, 1);


-- =========================
-- 7. CLASSROOM TABLE DATA
-- =========================

INSERT INTO Classroom (room_id, building, capacity) VALUES
(1, 'Main Building', 50),
(2, 'IT Block', 40),
(3, 'Engineering Block', 60);


-- =========================
-- 8. ENROLLMENT TABLE DATA
-- =========================

INSERT INTO Enrollment (e_id, semester, s_ssn, c_id) VALUES
(1, 'Fall 2025', 101, 11),
(2, 'Fall 2025', 102, 12),
(3, 'Spring 2026', 103, 13),
(4, 'Spring 2026', 104, 14),
(5, 'Fall 2025', 105, 15);


-- =========================
-- 9. RESULT TABLE DATA
-- =========================

INSERT INTO Result (r_id, grade, marks, gpa, s_ssn, c_id) VALUES
(1, 'A', 85, 3.70, 101, 11),
(2, 'B+', 78, 3.30, 102, 12),
(3, 'A-', 82, 3.50, 103, 13),
(4, 'B', 74, 3.00, 104, 14),
(5, 'A', 90, 4.00, 105, 15);


-- =========================
-- 10. EXAM ATTENDANCE TABLE DATA
-- =========================

INSERT INTO Exam_Attendance (ea_id, s_ssn, c_id) VALUES
(1, 101, 11),
(2, 102, 12),
(3, 103, 13),
(4, 104, 14),
(5, 105, 15);


-- =========================
-- 11. TEACHES TABLE DATA
-- =========================

INSERT INTO Teaches (t_ssn, c_id) VALUES
(301, 11),
(301, 12),
(302, 13),
(302, 14),
(301, 15);


-- =========================
-- 12. COURSE_CLASSROOM TABLE DATA
-- =========================

INSERT INTO Course_Classroom (c_id, room_id) VALUES
(11, 1),
(12, 1),
(13, 2),
(14, 3),
(15, 2);