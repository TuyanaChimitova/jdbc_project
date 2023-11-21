-- TASK 1
-- From the employees table, find those employees whose first name
-- contains the letters C, Y, or D. Return all fields.
SELECT * FROM EMPLOYEES
WHERE LOWER(FIRST_NAME) LIKE '%c%' OR
        LOWER(FIRST_NAME) LIKE '%y%' OR
        LOWER(FIRST_NAME) LIKE '%d%';


-- TASK 2
-- From the employees table, find those employees whose first name does not contain the letter ‘M’.
-- Sort the result-set in ascending order by department ID.
-- Return full name (first and last name together), salary and department_id.

SELECT  FIRST_NAME || ' ' || LAST_NAME AS FULLNAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
WHERE UPPER(FIRST_NAME) NOT LIKE '%M%'
ORDER BY DEPARTMENT_ID ASC;


-- TASK 3
-- From the job history table, find those employees
-- who worked more than two jobs in the past. Return employee id.

SELECT *
FROM JOB_HISTORY
ORDER BY EMPLOYEE_ID;

SELECT EMPLOYEE_ID, COUNT(*)
FROM JOB_HISTORY
GROUP BY EMPLOYEE_ID
HAVING COUNT(*)>1
ORDER BY EMPLOYEE_ID;


-- TASK 4
-- Get me how many employees getting more than employees avg

-- GET ME AVG
SELECT AVG(SALARY) FROM EMPLOYEES;


-- WHO IS GETTING MORE THAN AVG
SELECT * FROM EMPLOYEES
WHERE SALARY > 6461;


-- DYNAMIC
SELECT COUNT(*) FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);



-- TASK 5
-- Get me all employees who is jobtitle is  'Sales Manager'
SELECT * FROM EMPLOYEES;

SELECT * FROM JOBS;

-- FIND ME SALES MANAGER JOB ID
SELECT JOB_ID FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';

-- EMPLOYEES WHO IS WORKING AS SALES MANAGER
SELECT * FROM EMPLOYEES
WHERE  JOB_ID = (SELECT JOB_ID FROM JOBS
                               WHERE  JOB_TITLE='Sales Manager');


-- get me all employees firstname and jobtitle
SELECT * FROM EMPLOYEES
WHERE JOB_ID='SA_MAN';

-- DYNAMIC
SELECT * FROM EMPLOYEES
WHERE JOB_ID=(SELECT JOB_ID FROM JOBS
                            WHERE JOB_TITLE='Sales Manager');

-- get me all employees firatname and jobtitle
SELECT FIRST_NAME, JOB_TITLE FROM EMPLOYEES E INNER JOIN JOBS J on J.JOB_ID = E.JOB_ID;




-- TASK 6
-- Get me all employees who is manager name is Neena Kocchar
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,MANAGER_ID FROM EMPLOYEES;

-- FIND ME Neena Kochhar manager_id
SELECT EMPLOYEE_ID FROM EMPLOYEES
WHERE FIRST_NAME='Neena' AND LAST_NAME='Kochhar'; --101

-- WHO IS WORKING FOR MANAGER ID 101
SELECT * FROM EMPLOYEES
WHERE MANAGER_ID=101;

-- DYNAMIC
SELECT * FROM EMPLOYEES
WHERE MANAGER_ID=(SELECT EMPLOYEE_ID FROM EMPLOYEES
                  WHERE FIRST_NAME='Neena' AND LAST_NAME='Kochhar');

--- JOINS
-- TASK  1
-- From the employees and jobs tables,
-- find the difference between maximum salary of the job and
-- salary of the employees.
-- Return job title, employee name, and salary difference.
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME='Neena';

-- AD_VP

SELECT * FROM JOBS
WHERE JOB_ID='AD_VP';

SELECT JOB_TITLE, FIRST_NAME, MAX_SALARY-SALARY AS SALARY_DIFF
FROM EMPLOYEES E
    INNER JOIN JOBS J on J.JOB_ID = E.JOB_ID;



--TASK 2-1
-- From the departments and locations tables,
-- display the department name, city, and state province for each department.
SELECT DEPARTMENT_NAME, CITY, STATE_PROVINCE
FROM DEPARTMENTS D JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID
WHERE DEPARTMENT_NAME LIKE '%Sales';





--TASK 2-2
-- display only department names ends with Sales
SELECT CITY,COUNT(*)
FROM DEPARTMENTS D
         JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID
GROUP BY CITY;
--TASK 2-3
-- How many department we have for each city
SELECT CITY,COUNT(*)
FROM DEPARTMENTS D
         JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID
GROUP BY CITY
HAVING COUNT(*)>1;

-- TASK 2-4
-- GET ME CITY NAMES WHERE WE HAVE MORE THAN ONE DEPARTMENT
SELECT CITY,COUNT(*)
FROM DEPARTMENTS D
         JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID
GROUP BY CITY
HAVING COUNT(*)>1;

-- TASK 3
-- From employees, departments, and locations tables,
-- find those employees whose first name contains a letter 'z'.
-- Return first name, last name, department, city, and state province.
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_NAME,CITY,STATE_PROVINCE
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
         INNER JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE LOWER(FIRST_NAME) LIKE '%z%';

--TASK 3-1
-- how many employees are working for each city
SELECT CITY,COUNT(*)
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
         INNER JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
GROUP BY CITY;

--TASK 3-2
-- get me cities where we have more than 10 employees
SELECT CITY,COUNT(*)
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
         INNER JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
GROUP BY CITY
HAVING COUNT(*)>10
ORDER BY COUNT(*) DESC;

--TASK 3-3
-- From the employees, departments, and locations tables,
-- find full name (first and last name), and salary of those employees
-- who work in any department located in Oxford .
SELECT FIRST_NAME||' '||LAST_NAME as FULLNAME, SALARY,CITY
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
         INNER JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE CITY='Oxford';

-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers.
SELECT WORKERS.FIRST_NAME,WORKERS.LAST_NAME,WORKERS.MANAGER_ID,WORKERS.SALARY,
       MANAGERS.EMPLOYEE_ID,MANAGERS.FIRST_NAME,MANAGERS.LAST_NAME,MANAGERS.SALARY
FROM EMPLOYEES WORKERS
         LEFT JOIN EMPLOYEES MANAGERS ON WORKERS.MANAGER_ID=MANAGERS.EMPLOYEE_ID
WHERE WORKERS.SALARY>MANAGERS.SALARY;
