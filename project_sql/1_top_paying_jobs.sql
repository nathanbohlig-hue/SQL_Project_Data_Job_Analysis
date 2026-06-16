/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles (between 70k and 100k) that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
= Why? Highlight the top-paying (between 70k and 100k) opportunitites for Data Analysts,
    offering insights into employemnt trends and salary expectations in the field.
*/

SELECT
    job_id,
    job_title,
    salary_year_avg,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
    AND job_title_short NOT LIKE '%Senior%'
    AND salary_year_avg < 100000
    AND salary_year_avg > 70000
ORDER BY
    salary_year_avg DESC
LIMIT 10


