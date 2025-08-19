USE jobdata;

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

#23. Number of jobs with all jobType fields as NULL.
SELECT COUNT(*) AS job_with_no_job_type
FROM job
WHERE `jobType/0` IS NULL
   AND `jobType/1` IS NULL
   AND `jobType/2` IS NULL
   AND`jobType/3` IS NULL;
   
#24. Top 5 locations with highest average salary.
SELECT location, AVG(salary) AS average_salary
FROM job
WHERE salary IS NOT NULL
GROUP BY location 
ORDER BY average_salary DESC
LIMIT 5;
   
#25. Top 5 job titles with most postings.
SELECT positionName, COUNT(*) AS job_count
FROM job
GROUP BY positionName
ORDER BY job_count DESC
LIMIT 5;
   
#26. Jobs where description contains 'remote'.
SELECT *
FROM job
WHERE description LIKE '%remote%';
   
#27. Jobs with title containing ‘intern’ or ‘analyst’.
SELECT *
FROM job
WHERE LOWER(positionName) LIKE '%intern%'
      OR LOWER(positionName) LIKE '%analyst%';
      
#28. Count of jobs starting with a specific job prefix (e.g., 'Data').
SELECT COUNT(*) AS job_count
FROM job
WHERE positionName LIKE 'Data%';

#29. Count of jobs ending with ‘Manager’.
SELECT COUNT(*) AS job_count
FROM job
WHERE positionName LIKE '%Manager';

#30. Count of jobs by length of job description (e.g., > 500 characters).
SELECT COUNT(*) AS long_description
FROM job
WHERE CHAR_LENGTH(description) > 500;



