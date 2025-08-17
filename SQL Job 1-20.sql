use jobdata;

#1. Total number of records.
SELECT COUNT(*) AS total_records FROM job;

#2. Count of unique companies.
SELECT COUNT(DISTINCT company) AS unique_company_count FROM job;

#3. Count of unique job titles.
SELECT COUNT(DISTINCT positionName) AS unique_job_title FROM job;

#4. Count of distinct locations.
SELECT COUNT(DISTINCT location) AS distinct_location_count FROM job;

#5. Count of jobs per location.
SELECT location, COUNT(*) AS job_count 
FROM job
GROUP BY location
ORDER BY job_count DESC;

#6. Total number of jobs by each jobType column (full-time, etc.).
SELECT job_type, COUNT(*) AS total_job
FROM (
      SELECT `jobType/0` AS job_type FROM job
      UNION ALL 
      SELECT `jobType/1` AS job_type FROM job
      UNION ALL
      SELECT `jobType/2` AS job_type FROM job
      UNION ALL 
      SELECT `jobType/3` AS job_type FROM job
) AS all_types
WHERE job_type IS NOT NULL AND job_type <> ''
GROUP BY job_type
ORDER BY total_job DESC;

#7. Number of jobs with missing salary.
SELECT COUNT(*) AS missing_salary_count
FROM job
WHERE salary IS NULL;

#8. Number of jobs with missing rating.
SELECT COUNT(*) AS missing_rating_count
FROM job
WHERE rating IS NULL;

#9. Top 10 companies with most job postings.
SELECT company, COUNT(*) AS job_count
FROM job
GROUP BY company
ORDER BY job_count DESC
LIMIT 10;

#10. Most frequent job position name.
SELECT positionName, COUNT(*) AS count
FROM job
GROUP BY positionName
ORDER BY count DESC
LIMIT 1;

#11. Average rating of companies.
SELECT AVG(rating) AS average_company_rating
from job
WHERE rating IS NOT NULL;

#12. Maximum and minimum salary offered.
SELECT 
	MAX(salary) AS max_salary, 
    MIN(salary) AS min_salary
FROM job
WHERE salary IS NOT NULL;

#13. Average salary by job location.
SELECT location, AVG(salary) AS average_salary 
FROM job
WHERE salary IS NOT NULL
GROUP BY location
ORDER BY average_salary DESC;

#14. Count of jobs per searchInput/country.
SELECT `searchInput/country` AS country,
       COUNT(*) AS job_count
FROM job
GROUP BY `searchInput/country`
ORDER BY job_count DESC;

#15. Count of jobs per searchInput/position.
SELECT `searchInput/position` AS position,
        COUNT(*) AS job_count
FROM job
GROUP BY `searchInput/position` 
ORDER BY job_count DESC;

#16. Jobs with salary above 10 LPA.
SELECT * 
FROM job
WHERE salary > 1000000;

#17. Jobs with rating below 3.
SELECT * 
FROM job
WHERE rating < 3;

#18. Jobs with both high salary and high rating.
SELECT *
FROM job
WHERE salary > 1000000 AND rating >=4;

#19. Jobs in a specific city (e.g., 'Pune').
SELECT *
FROM job
WHERE locatio = 'Pune';

#20. Jobs by a specific company (e.g., 'Google').
SELECT * 
FROM job
WHERE company = 'Google';

#21. Count jobs per company sorted by most jobs.
SELECT company, COUNT(*) AS job_count
FROM job
GROUP BY company 
ORDER BY job_count DESC;

#22. Average rating per job type.
SELECT job_type, AVG(rating) AS average_rating
FROM(
    SELECT `jobType/0` AS job_type, rating FROM job
    UNION ALL
    SELECT `jobType/1` AS job_type, rating FROM job
    UNION ALL
    SELECT `jobType/2` AS job_type, rating FROM job
    UNION ALL
    SELECT `jobType/3` AS job_type, rating FROM job
) AS all_type_type
WHERE job_type IS NOT NULL AND job_type <> '' AND rating IS NOT NULL
GROUP BY job_type
ORDER BY average_rating DESC;
 