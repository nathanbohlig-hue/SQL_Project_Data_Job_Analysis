/*
Answer: What are the most optimal skills to learn for data analysts?
- Identify skills in demand associated with high average salaries
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and
    offering strategic insights for career development in data analysis.
*/






SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND company_id IS NOT NULL
    AND salary_year_avg IS NOT NULL
    AND salary_year_avg < 100000
    AND salary_year_avg > 70000
GROUP BY
    skills_dim.skill_id
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY 
    demand_count DESC,
    avg_salary DESC
LIMIT 25;