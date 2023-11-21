--SELECT * FROM EMPLOYESS;

/*
 it show different values from query result based provided column
 */

-- IT RETURN 107
SELECT FIRST_NAME FROM EMPLOYEES;

-- IT REVOMED DUBLICATES AND RETURNED 91 RESULT
SELECT DISTINCT FIRST_NAME FROM EMPLOYEES;

SELECT DISTINCT * FROM EMPLOYEES;

select * from jobs;

select job_id from jobs;

--since primary key cannot dublicates
select distinct job_id from jobs;


