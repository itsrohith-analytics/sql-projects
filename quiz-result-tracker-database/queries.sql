-- =========================================
-- QUIZ RESULT TRACKER DATABASE : QUERIES
-- =========================================

-- 1. View all students
SELECT * FROM Student;

-- 2. View all quizzes
SELECT * FROM Quiz;

-- 3. View all quiz results
SELECT * FROM Result;

-- 4. Student-wise quiz scores
SELECT 
    s.StudentName,
    q.QuizName,
    r.Score
FROM Result r
JOIN Student s
ON r.StudentID = s.StudentID
JOIN Quiz q
ON r.QuizID = q.QuizID;

-- 5. Average score for each quiz
SELECT 
    q.QuizName,
    AVG(r.Score) AS AverageScore
FROM Result r
JOIN Quiz q
ON r.QuizID = q.QuizID
GROUP BY q.QuizName;

-- 6. Students who scored more than 80
SELECT 
    s.StudentName,
    r.Score
FROM Result r
JOIN Student s
ON r.StudentID = s.StudentID
WHERE r.Score > 80;

-- 7. Number of students who attempted each quiz
SELECT 
    q.QuizName,
    COUNT(r.StudentID) AS StudentCount
FROM Result r
JOIN Quiz q
ON r.QuizID = q.QuizID
GROUP BY q.QuizName;

-- 8. Quizzes with average score below 50
SELECT 
    q.QuizName,
    AVG(r.Score) AS AverageScore
FROM Result r
JOIN Quiz q
ON r.QuizID = q.QuizID
GROUP BY q.QuizName
HAVING AVG(r.Score) < 50;

-- 9. Students who scored above the overall average
SELECT 
    s.StudentName,
    r.Score
FROM Result r
JOIN Student s
ON r.StudentID = s.StudentID
WHERE r.Score >
(
    SELECT AVG(Score)
    FROM Result
);

-- 10. Highest score in each quiz
SELECT 
    q.QuizName,
    MAX(r.Score) AS HighestScore
FROM Result r
JOIN Quiz q
ON r.QuizID = q.QuizID
GROUP BY q.QuizName;
