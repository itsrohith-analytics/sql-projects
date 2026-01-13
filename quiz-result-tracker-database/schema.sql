create database quiz_results_tracker;
use quiz_results_tracker;
-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS QuizTracker;
USE QuizTracker;

-- Step 2: Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    registration_date datetime DEFAULT current_timestamp
);

-- Step 3: Create Quizzes Table
CREATE TABLE Quizzes (
    quiz_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    subject VARCHAR(50),
    total_marks INT,
    quiz_date DATE
);

-- Step 4: Create Questions Table
CREATE TABLE Questions (
    question_id INT PRIMARY KEY AUTO_INCREMENT,
    quiz_id INT,
    question_text TEXT,
    correct_option VARCHAR(100),
    FOREIGN KEY (quiz_id) REFERENCES Quizzes(quiz_id) ON DELETE CASCADE
);

-- Step 5: Create Answers Table (student answers)
CREATE TABLE Answers (
    answer_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    question_id INT,
    selected_option VARCHAR(100),
    is_correct BOOLEAN,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES Questions(question_id) ON DELETE CASCADE
);

-- Step 6: Create Results Table
CREATE TABLE Results (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    quiz_id INT,
    score INT,
    total INT,
    result_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (quiz_id) REFERENCES Quizzes(quiz_id)
);
