-- Practice Problem 6
-- January 2023
CREATE TABLE January2023 AS
SELECT * FROM job_postings_fact
WHERE job_posted_date BETWEEN '2023-01-01' AND '2023-01-31';

-- February 2023
CREATE TABLE February2023 AS
SELECT * FROM job_postings_fact
WHERE job_posted_date BETWEEN '2023-02-01' AND '2023-02-28';

-- March 2023
CREATE TABLE March2023 AS
SELECT * FROM job_postings_fact
WHERE job_posted_date BETWEEN '2023-03-01' AND '2023-03-31';
