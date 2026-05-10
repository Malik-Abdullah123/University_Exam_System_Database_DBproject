# 📚 University Database Management System (SQL Project)

## 📌 Overview
This project is a relational database system designed for a **University Management System**. It manages core academic operations such as student records, courses, departments, enrollment, results, instructors, and classroom scheduling. The database is implemented using SQL with proper normalization and relationships (Primary Key & Foreign Key constraints).

---

## 🏗️ Database Features

- Student and Instructor management  
- Course and Department handling  
- Enrollment system for students  
- Exam results and attendance tracking  
- Classroom allocation for courses  
- Proper relational design using foreign keys  
- Aggregated queries for data analysis  

---

## 🧱 Database Structure

### Main Tables:
- Person  
- Student  
- Instructor  
- Teacher  
- Department  
- Course  
- Classroom  

### Relationship Tables:
- Enrollment (Student ↔ Course)  
- Result (Student ↔ Course)  
- Exam_Attendance  
- Teaches (Instructor ↔ Course)  
- Course_Classroom (Course ↔ Classroom)  

---

## 🔗 Relationships

- A Department has multiple Courses  
- A Student can enroll in multiple Courses  
- A Course can be taught by multiple Instructors/Teachers  
- A Course can be assigned to multiple Classrooms  
- All relationships are maintained using Foreign Keys  

---

## ⚙️ SQL Operations Included

- CREATE TABLE statements  
- INSERT statements with sample data  
- SELECT queries with JOIN, WHERE, GROUP BY, HAVING  
- Aggregate functions (COUNT, AVG, SUM, MAX, MIN)  
- UPDATE and DELETE operations  

---

## 📊 Technologies Used

- SQL (MySQL / PostgreSQL compatible)  
- Relational Database Design  
- ER Modeling Concepts  

---

## 🎯 Learning Outcomes

This project demonstrates:

- Database normalization  
- Relationship mapping (1:1, 1:M, M:M)  
- Data integrity using constraints  
- Query optimization and data analysis  

---

## 👨‍💻 Author

**Muhammad Abdullah**  
Purpose: Academic Database Project (University Level)

---

## 🚀 How to Use

1. Run the SQL file in MySQL / PostgreSQL  
2. Create database and tables  
3. Insert provided sample data  
4. Execute queries for testing  

---

## 📌 Note

This project is designed for educational purposes to understand real-world database systems in a university environment.
