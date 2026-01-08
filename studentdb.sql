CREATE DATABASE studentdb;

USE studentdb;

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    department VARCHAR(30),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE student_login (
    login_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    username VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(60) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    credits INT NOT NULL
);

CREATE TABLE enrollment (
    enroll_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students (name, email, department)
VALUES 
('Rahul', 'rahul@gmail.com', 'CSE'),
('Anita', 'anita@gmail.com', 'ECE'),
('Karan', 'karan@gmail.com', 'IT');

INSERT INTO student_login (student_id, username, password)
VALUES 
(1, 'rahul_cse', 'rahul123'),
(2, 'anita_ece', 'anita123'),
(3, 'karan_it', 'karan123');

INSERT INTO courses (course_name, credits)
VALUES 
('Database Systems', 4),
('Web Technologies', 3),
('Software Engineering', 4);

INSERT INTO enrollment (student_id, course_id, semester)
VALUES 
(1, 1, 'SEM4'),
(1, 2, 'SEM4'),
(2, 2, 'SEM4'),
(3, 3, 'SEM4');

SELECT * FROM students;

SELECT * FROM courses;

SELECT s.name, c.course_name, e.semester
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;
