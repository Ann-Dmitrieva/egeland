# egeland
Test Assignment 'EGELand'
The project consists of 3 main parts: data extraction (SQL), data processing (Python) and data visualization (Datalens dashboard).


## Task 1
*Objective:*
Extract information from the database using an SQL query for the following users:

Students enrolled in annual courses for the Unified State Exam (EGE) and Basic State Exam (OGE).

Required fields for the final dataset:
Course ID
Course name
Subject
Subject type
Course type
Course start date
Student ID
Student last name
Student city
Indication that the student is not expelled from the course
Date the course was opened for the student
Number of full months the course has been available to the student
Number of homework assignments completed by the student in the course

Database schema:
![db_schema](https://github.com/user-attachments/assets/406bf3a7-b711-4223-858b-d8e040e2864d)


## Task 2
*Objective:*
Process the dataset prepared in Task 1 using Python scripts.

Steps:

Dataset validation: Check for duplicates, missing values, data types, and outliers. Perform necessary preprocessing.
Segment students into waves:
Wave criteria:
Wave 0: Joined the course on or before the course start date.
Wave 1: Joined the course within one week (inclusive) after the course start date.
Wave 2: Joined the course between 1 and 2 weeks (inclusive) after the course start date.
Wave 3: Joined the course between 2 and 3 weeks (inclusive) after the course start date.
Wave 4: Joined the course between 3 and 4 weeks (inclusive) after the course start date.
Wave 5: Joined the course more than 4 weeks after the course start date.

## Task 3
*Objective:*
Build a dashboard in Yandex DataLens using the dataset prepared in Task 2.

Dashboard goals:

Monitor which courses have the highest/lowest renewal rates.
Identify students who have not renewed their courses based on additional criteria, to enable follow-ups and improve renewal rates.
Dashboard requirements:

Ability to compare courses using two metrics:
Number of renewals for a specified month.
Percentage of renewals for a specified month.
Example: A course has 1,000 students, and 800 renewed for the second month. The number of renewals is 800, and the percentage of renewals is 80%.
Ability to retrieve detailed information on students who meet the following criteria:
Not expelled from the course.
Filters for selecting students:

From specified courses.
Belonging to specific waves.
From specified cities.
Who did not renew for the specified course month.
Who completed fewer homework assignments than a specified number.





