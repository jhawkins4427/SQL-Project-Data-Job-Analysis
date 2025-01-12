-- Practice Problem 7

/*
Find the count of the number of remote job postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - Include skill ID, name, and count of postings requiring the skill
*/

 WITH skills_jobs_id AS (
    SELECT
        sj.job_id,
        s.skill_id,
        s.skills AS skill_name
    FROM
        skills_dim s
    JOIN skills_job_dim sj ON s.skill_id = sj.skill_id)

SELECT 
    skills_jobs_id.skill_id AS skill_id,
    skills_jobs_id.skill_name AS skill_name,
    COUNT(skills_jobs_id.job_id) AS job_count,
    j.job_work_from_home AS work_from_home
FROM job_postings_fact j
INNER JOIN skills_jobs_id ON j.job_id = skills_jobs_id.job_id
WHERE j.job_work_from_home = TRUE AND job_title_short = 'Data Analyst'
GROUP BY 
    skills_jobs_id.skill_name,
    skills_jobs_id.skill_id,
    j.job_work_from_home
ORDER BY COUNT(skills_jobs_id.job_id) DESC
LIMIT 5;