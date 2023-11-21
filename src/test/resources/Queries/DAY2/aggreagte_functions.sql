SELECT * FROM EMPLOYEES;


/*
 AGGREAGATE FUNCTIONS - MULTI ROWS - GROUP FUNCTIONS
 - count -> it will count rows
 - max -> it will max value
 - min -> it will min value
 - sum -> it will give total value
 - avg -> it will give average value

 Aggregate functions takes multi row and return one result
 ALL of them ignore null values.

 */


-- how many departments we have?
 SELECT * FROM DEPARTMENTS;
SELECT COUNT(*) FROM DEPARTMENTS;

--How many locations we have?
SELECT * FROM LOCATIONS;
SELECT COUNT(*) FROM LOCATIONS;

SELECT * FROM EMPLOYEES;


--null values
SELECT COUNT(DEPARTMENT_ID)
FROM EMPLOYEES;

--task :
-- HOW MANY DIFFERENT FIRSTNAME WE HAVE?
select count(distinct FIRST_NAME) from EMPLOYEES;

--how many employees working as IT_PROG or SA_REP
SELECT count(*) from EMPLOYEES
WHERE JOB_ID IN('IT_PROG', 'SA_REP');

--MAX
SELECT MAX(SALARY)
FROM EMPLOYEES;

--MIN
SELECT MIN(SALARY)
FROM EMPLOYEES;

--AVG

SELECT AVG(SALARY)
FROM EMPLOYEES;

SELECT ROUND(AVG(SALARY))FROM EMPLOYEES;


--SUM
SELECT sum(SALARY) FROM EMPLOYEES;



