/*
 -Percent % -> for mathcing any sequence of characters.
 -underscore _ ->
 */

 --display all employees where first_name startwith B
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'B%';

--display all employees where firstname startswith B and length of it
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'B____';

--display 5 letter firstname from employees where middle char is Z
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME like '__z__';

--display firstname endswith 'e'
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME like '%e';

--display all employees where job id contains IT
SELECT * FROM EMPLOYEES
WHERE JOB_ID LIKE '%IT%';


--DISPLAY ALL INFO WHERE FISTNAME STARTWITH H AND ENDING WITH L
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE "H%L";


