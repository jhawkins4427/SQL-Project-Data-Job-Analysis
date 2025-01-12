/*
Find job postings from the first quarter that have a salary greater than $70K
- Combine job posting tables from the first quarter of 2023 (Jan-Mar)
- Gets job postings with an average yearly salary > $70,000 
- Filter for Data Analyst Jobs and order by salary
*/

WITH Quarter1 AS (
    SELECT * FROM january2023
    UNION ALL 
    SELECT * FROM february2023
    UNION ALL
    SELECT * FROM march2023
)

SELECT
    Quarter1.job_id,
    Quarter1.job_title_short,
    Quarter1.job_location,
    Quarter1.job_via,
    Quarter1.job_posted_date :: DATE,
    s.skills as skill_name,
    s.type as skill_type
FROM Quarter1
LEFT JOIN skills_job_dim sj ON Quarter1.job_id = sj.job_id
INNER JOIN skills_dim s ON sj.skill_id = s.skill_id
WHERE salary_year_avg > 70000;
