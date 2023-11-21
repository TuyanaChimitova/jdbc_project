CREATE TABLE scrumteam_jamal(
    emp_id Integer PRIMARY KEY ,
    first_name varchar(30) not null,
    last_name varchar(20) not null,
    job_title varchar(20),
    salary Integer
);

SELECT * FROM SCRUMTEAM;

/*
 insert into tableName (column1, column2,...)
 VALUE (value1, value2, ...);

 */

INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (1, 'Severus', 'Snape', 'Tester', 130000);

INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (2, 'Harold', 'Finch', 'Developer', 140000);

INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (3, 'Phoebe', 'Butterfly', 'Scurm Master', 90000);

INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (4, 'Michael', 'Scofield', 'PO', 150000);

--save changes that other people, connections can get the updates.
commit;

SELECT * FROM SCRUMTEAM;
