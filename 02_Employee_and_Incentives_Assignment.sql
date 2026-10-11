-- SQL Assignment Portfolio
-- Prepared for: Tusher Nikam
-- Topic: SQL practice, queries, joins, aggregation, and database management

----------------------CREATE TABLE EMPLOYEE---------------------------------------------------------------------
CREATE TABLE EMPLOYEE
(Emp_id INT(10),
First_name varchar2(50),
Last_Name Varchar2(50),
SALARY INT(20),
Joining_Date DATE; 

SELECT*FROM EMPLOYEE;

TRUNCATE TABLE EMPLOYEE;

DELETE FROM EMPLOYEE
WHERE EMP_ID=2;

INSERT INTO EMPLOYEE VALUES(1,'John','Abraham',1000000,To_DATE ('01-JAN-2013','DD-MON-YYYY'),'Banking');
INSERT INTO EMPLOYEE VALUES(2,'Michael','Clarke',800000,TO_DATE('01-JAN-2013','DD-MON-YYYY'),'INSURANCE');
INSERT INTO EMPLOYEE VALUES(3,'Roy','Thomas',700000,To_DATE ('01-FEB-2013','DD-MON-YYYY'),'Banking');  
INSERT INTO EMPLOYEE VALUES(4,'Tom','Jose',600000,To_DATE ('01-FEB-2013','DD-MON-YYYY'),'INSURANCE');
INSERT INTO EMPLOYEE VALUES(5,'Jerry','Pinto',650000,To_DATE ('01-FEB-2013','DD-MON-YYYY'),'Insurance');
INSERT INTO EMPLOYEE VALUES(6,'Philip','Mathew',750000,To_DATE ('01-JAN-2013','DD-MON-YYYY'),'Services');

-------------------------------------CREATE TABLE INCENTIVES------------------------

CREATE TABLE INCENTIVES
(Employee_ref_id INT,
incentive_date DATE,
incentive_amount INT);

SELECT*FROM INCENTIVES;

INSERT INTO INCENTIVES VALUES (1,TO_DATE('01-FEB-2013','DD-MON-YYYY'),5000);
INSERT INTO INCENTIVES VALUES (2,TO_DATE('01-FEB-2013','DD-MON-YYYY'),3000);
INSERT INTO INCENTIVES VALUES (3,TO_DATE('01-FEB-2013','DD-MON-YYYY'),4000);
INSERT INTO INCENTIVES VALUES (1,TO_DATE('01-JAN-2013','DD-MON-YYYY'),4500);
INSERT INTO INCENTIVES VALUES (2,TO_DATE('01-JAN-2013','DD-MON-YYYY'),3500);

---SOLVE THE QUESTIONS FROM TABLE EMPLOYEE AND INCENTIVES-----------------------------------------------------------

----1.  Write create table syntax for employee table and Incentive table

CREATE TABLE EMPLOYEE
(Emp_id INT(10),
First_name varchar2(50),
Last_Name Varchar2(50),
SALARY INT(20),
Joining_Date DATE);

select * from EMPLOYEE
-------------------------------------

CREATE TABLE INCENTIVES
(Employee_ref_id INT,
incentive_date DATE,
incentive_amount INT);


----2.  Write syntax for insert data into table of employee table and Incentive table

    INSERT INTO employee (emp_id, first_name, last_name, salary, joining_date, department)
    VALUES (1, 'John', 'Abraham', 1000000, TO_DATE('01-JAN-2013','DD-MON-YYYY'), 'Banking');

    INSERT INTO employee (emp_id, first_name, last_name, salary, joining_date, department)
    VALUES (2, 'Michael', 'Clarke', 800000, TO_DATE('01-JAN-2013','DD-MON-YYYY'), 'Insurance');

    INSERT INTO employee (emp_id, first_name, last_name, salary, joining_date, department)
    VALUES (3, 'Roy', 'Thomas', 700000, TO_DATE('01-FEB-2013','DD-MON-YYYY'), 'Banking');

    INSERT INTO employee (emp_id, first_name, last_name, salary, joining_date, department)
    VALUES (4, 'Tom', 'Jose', 600000, TO_DATE('01-FEB-2013','DD-MON-YYYY'), 'Insurance');

    INSERT INTO employee (emp_id, first_name, last_name, salary, joining_date, department)
    VALUES (5, 'Jerry', 'Pinto', 650000, TO_DATE('01-FEB-2013','DD-MON-YYYY'), 'Insurance');

    INSERT INTO employee (emp_id, first_name, last_name, salary, joining_date, department)
    VALUES (6, 'Philip', 'Mathew', 750000, TO_DATE('01-JAN-2013','DD-MON-YYYY'), 'Services');
------------------------------------------------------------------------------------------------

    INSERT INTO incentive (employee_ref_id, incentive_date, incentive_amount)
    VALUES (1, TO_DATE('01-FEB-2013','DD-MON-YYYY'), 5000);

    INSERT INTO incentive (employee_ref_id, incentive_date, incentive_amount)
    VALUES (2, TO_DATE('01-FEB-2013','DD-MON-YYYY'), 3000);

    INSERT INTO incentive (employee_ref_id, incentive_date, incentive_amount)
    VALUES (3, TO_DATE('01-FEB-2013','DD-MON-YYYY'), 4000);

    INSERT INTO incentive (employee_ref_id, incentive_date, incentive_amount)
    VALUES (1, TO_DATE('01-JAN-2013','DD-MON-YYYY'), 4500);

    INSERT INTO incentive (employee_ref_id, incentive_date, incentive_amount)
    VALUES (2, TO_DATE('01-JAN-2013','DD-MON-YYYY'), 3500);
    
----3.  Get all employee details from the employee table

SELECT * FROM EMPLOYEE;

----4.  Get First_Name,Last_Name from employee table

SELECT First_Name,Last_name FROM Employee;

----5.  Get First_Name from employee table using alias name �Employee Name�

select First_name AS Employee_name from Employee;

----6.  Get First_Name from employee table in upper case

SELECT UPPER (FIRST_NAME) FROM EMPLOYEE;

----7.  Select first 3 characters of FIRST_NAME from EMPLOYEE

SELECT SUBSTR(FIRST_NAME, 1, 3)
FROM EMPLOYEE;

SELECT SUBSTR(FIRST_NAME, 1, 3) AS first_three_chars
FROM EMPLOYEE;

---8.  Get position of 'o' in name 'John' from employee table

SELECT INSTR(first_name, 'o') AS position_of_o
FROM employee
WHERE first_name = 'John';

---9.  Get FIRST_NAME from employee table after removing white spaces from right side.
Select* from employee;

SELECT RTRIM (FIRST_NAME)AS trimmed_name FROM EMPLOYEE;

SELECT RTRIM(FIRST_NAME)AS
TRIMMED_SPACES FROM EMPLOYEE;

----10. Get First_Name from employee table after replacing 'o' with '$'

SELECT REPLACE (FIRST_NAME,'o','$') AS Modified_name
       FROM EMPLOYEE;
       
----11. Get First_Name and Last_Name as single column from employee table separated by a '_'

SELECT FIRST_NAME ||'_'|| LAST_NAME AS FULL_NAME FROM EMPLOYEE;

SELECT CONCAT(FIRST_NAME, CONCAT('_', LAST_NAME)) AS full_name
FROM EMPLOYEE;

SELECT CONCAT(CONCAT(FIRST_NAME, '_'), LAST_NAME) AS full_name
FROM EMPLOYEE;
----12. Get FIRST_NAME, Joiningyear, Joining Month and Joining Date from employee table
SELECT FIRST_NAME,
       EXTRACT(YEAR FROM JOINING_DATE ) AS Joining_Year,
       EXTRACT(MONTH FROM JOINING_DATE) AS Joining_Month,
       EXTRACT(DAY FROM JOINING_DATE) AS Joining_Date
FROM EMPLOYEE;

SELECT FIRST_NAME,
       TO_CHAR(JOINING_DATE, 'YYYY') AS Joining_Year,
       TO_CHAR(JOINING_DATE, 'MONTH') AS Joining_Month,
       TO_CHAR(JOINING_DATE, 'DD') AS Joining_Date
FROM EMPLOYEE;
----13. Get all employee details from the employee table order by First_Name Ascending

SELECT * FROM EMPLOYEE
       ORDER BY FIRST_NAME ASC;
       
----14. Get all employee details from the employee table order by First_Name Ascending and Salary Descending?

Select *from employee
       order by FIRST_NAME ASC ,SALARY DESC;
       
----15. Get employee details from employee table whose employee name is �John�
Select * FROM EMPLOYEE
WHERE EMP_id=1;

----16. Get employee details from employee table whose employee name are �John� and �Roy�
Select * FROM EMPLOYEE
WHERE EMP_id IN (1,3);

----17. Get employee details from employee table whose employee name are not �John� and �Roy�.
Select * FROM EMPLOYEE
WHERE EMP_id NOT IN (1,3);

----18. Get employee details from employee table whose first name starts with 'J'.
Select * FROM EMPLOYEE
WHERE FIRST_NAME LIKE 'J%';

----19. Get employee details from employee table whose first name contains 'o'.
Select * FROM EMPLOYEE
WHERE FIRST_NAME LIKE '%o%';

----20. Get employee details from employee table whose first name ends with 'n'.
Select * FROM EMPLOYEE
WHERE FIRST_NAME LIKE '%n';

----21. Get employee details from employee table whose first name ends with 'n' and name contains 4 letters.
Select * FROM EMPLOYEE
WHERE FIRST_NAME LIKE '___n';

----22. Get employee details from employee table whose first name starts with 'J' and name contains 4 letters.
Select * FROM EMPLOYEE
WHERE FIRST_NAME LIKE 'J___';

----23. Get employee details from employee table who�s Salary greater than 600000.
Select * FROM EMPLOYEE
WHERE salary >600000;

---24. Get employee details from employee table whose joining year is �2013�
SELECT *FROM EMPLOYEE
WHERE EXTRACT(YEAR FROM JOINING_DATE) = 2013;

---25. Get employee details from employee table whose joining month is �January�.
SELECT *FROM EMPLOYEE
WHERE EXTRACT(MONTH FROM JOINING_DATE) = 1;

---26. Get employee details from employee table who joined before January 1st 2013.

SELECT *FROM EMPLOYEE
WHERE JOINING_DATE < TO_DATE ('01-01-2013','DD-MM-YYYY');

SELECT *FROM EMPLOYEE
WHERE JOINING_DATE < DATE '2013-01-01';

SELECT *FROM EMPLOYEE
WHERE JOINING_DATE < TO_DATE('01-JAN-2013','DD-MON-YYYY');

---27. Get employee details from employee table who joined after January 31st
SELECT *FROM EMPLOYEE
WHERE JOINING_DATE > TO_DATE('31-JAN-2013','DD-MON-YYYY');

---28. Get Joining Date and Time from employee table
SELECT *FROM EMPLOYEE;

SELECT JOINING_DATE, TO_CHAR(JOINING_DATE, 'DD-MON-YYYY HH24:MI:SS') AS date_time
FROM EMPLOYEE;

---29. Get Joining Date, Time including milliseconds from employee table

SELECT CAST(JOINING_DATE AS TIMESTAMP) AS joining_ts
FROM EMPLOYEE;

---30. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table.
select* from employee ;
select * from incentives;

SELECT e.EMP_ID,
       e.FIRST_NAME,
       e.JOINING_DATE,
       i.INCENTIVE_DATE,
       i.INCENTIVE_DATE - e.JOINING_DATE AS difference_in_days
FROM EMPLOYEE e
INNER JOIN INCENTIVES i
ON e.EMP_ID = i.EMPLOYEE_REF_ID;


---31. Get department, total salary with respect to a department from employee table.
SELECT DEPARTMENT,
sum (salary)as total_salary
FROM EMPLOYEE
GROUP BY DEPARTMENT;


---32. Get department, total salary with respect to a department from employee table order by total salary descending.
SELECT DEPARTMENT,
sum (salary)as total_salary FROM EMPLOYEE
GROUP BY DEPARTMENT 
ORDER BY TOTAL_SALARY ASC;

---33. Get department, no of employees in a department, total salary with respect to a department from employee table order by total salary descending.
SELECT DEPARTMENT,
sum (salary)as total_salary 
FROM EMPLOYEE
GROUP BY DEPARTMENT 
ORDER BY TOTAL_SALARY DESC;

---34. Get department wise average salary from employee table order by salary ascending?
SELECT DEPARTMENT,
AVG (salary)as AVG_salary 
FROM EMPLOYEE
GROUP BY DEPARTMENT 
ORDER BY AVG_SALARY ASC;

---35. Get department wise maximum salary from employee table order by salary ascending?
SELECT DEPARTMENT,
MAX (salary)as MAX_salary 
FROM EMPLOYEE
GROUP BY DEPARTMENT 
ORDER BY MAX_SALARY ASC;

---36. Get department wise minimum salary from employee table order by salary ascending?
SELECT DEPARTMENT,
MIN (salary)as MIN_salary 
FROM EMPLOYEE
GROUP BY DEPARTMENT 
ORDER BY MIN_SALARY ASC;

---37. Select no of employees joined with respect to year and month from employee table.
SELECT * FROM EMPLOYEE;

SELECT EXTRACT(YEAR FROM JOINING_date)  AS joining_year,
       EXTRACT(MONTH FROM JOINING_date) AS joining_month,
       COUNT(*) AS no_of_employees
FROM employee
GROUP BY EXTRACT(YEAR FROM JOINING_date),
         EXTRACT(MONTH FROM JOINING_date)
ORDER BY joining_year, joining_month;

----38. Select department,total salary with respect to a department from employee table where total salary greater than 800000 order by Total_Salary descending
SELECT DEPARTMENT,
SUM (salary)as TOTAL_SALARY
FROM EMPLOYEE
HAVING SUM (salary)>800000
GROUP BY DEPARTMENT 
ORDER BY TOTAL_SALARY DESC;

----39. Select employee details from employee table if data in incentive table?
SELECT e.*
FROM employee e
JOIN incentives i
ON e.emp_id = i.empLOYEE_REF_id;

SELECT * FROM INCENTIVES;

SELECT *
FROM employee e
WHERE EXISTS (SELECT 1
    FROM incentives i
    WHERE e.emp_id = i.empLOYEE_REF_id);
    
---40. Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of salary from employee table
SELECT 
    First_name,
    salary,
    CASE
        WHEN First_name = 'John' THEN salary * 20 / 100
        WHEN First_name = 'Roy'  THEN salary * 10 / 100
        ELSE salary * 15 / 100
    END AS salary_percentage
FROM EMPLOYEE;

 select * from EMPLOYEE;
 
---41. Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as 'Services Dept' from employee table.
SELECT DEPARTMENT ,
       CASE
         WHEN department = 'Banking' THEN 'BANK DEPT'
         WHEN department = 'Insurance' THEN 'INSURANCE DEPT'
         WHEN department = 'Services' THEN 'SERVICES DEPT'
       END AS DEPARTMENT_NAME
FROM EMPLOYEE;


---42. Delete employee data from employee table who got incentives in incentive table
select*from employee;
select*from incentives;

DELETE from employee e
       where exists(select 1 
       FROM INCENTIVES i
       where e.emp_id= i. EMPLOYEE_REF_ID);
       
 rollback ; 
---43. Select first_name, incentive amount from employee and incentives table for those employees who have incentives.

select first_name ,
       incentive_amount
       from employee e,incentives i
       where e.emp_id= i. EMPLOYEE_REF_ID;

SELECT 
    e.first_name,
    i.incentive_amount
FROM employee e
INNER JOIN incentives i
    ON i.employee_ref_id = e.emp_id;

---44. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000                                                                                         
SELECT 
    e.first_name,
    i.incentive_amount
FROM employee e
INNER JOIN incentives i
    ON e.employee_ref_id = i.emp_id
WHERE i.incentive_amount > 3000;


---45. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives
SELECT first_name,
       incentive_amount
FROM employee e
LEFT JOIN incentives i
    ON i.employee_ref_id = e.emp_id;
    

---46. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives and set incentive amount as 0 for those employees who didn't get incentives.
SELECT 
    e.first_name,
    COALESCE(i.incentive_amount, 0) AS incentive_amount
FROM employee e
LEFT JOIN incentives i
    ON i.employee_ref_id = e.emp_id;
    
    SELECT 
    e.first_name,
    NVL(i.incentive_amount, 0) AS incentive_amount
FROM employee e
LEFT JOIN incentives i
    ON i.employee_ref_id = e.emp_id;
---47. Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join
SELECT 
    e.first_name,
    incentive_amount
FROM employee e
LEFT JOIN incentives i
    ON i.employee_ref_id = e.emp_id
    where i.incentive_amount is not null;
    
---48. Select max incentive with respect to employee from employee and incentives table using sub query.

SELECT 
    e.first_name,
 (SELECT MAX(i.incentive_amount)
         FROM incentives i
         WHERE e.emp_id = i.employee_ref_id)
         AS max_incentive
FROM employee e;

==========00000000000=================0000000000000===============0000000000000=============00000000============0000000000===========
