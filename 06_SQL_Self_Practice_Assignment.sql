-- SQL Assignment Portfolio
-- Prepared for: Tusher Nikam
-- Topic: SQL practice, queries, joins, aggregation, and database management


--************************Practice file**********************************************

1.  Write create table syntax for employee table and Incentive table

create table SELFemployee
(EMP_ID NUMBER,
FIRST_NAME VARCHAR2(50),
LAST_NAME VARCHAR2(40));

select * from SELFemployee;
TRUNCATE TABLE SELFEMPLOYEE;


2.  Writesyntax for insert data into table of employee table and Incentive table

INSERT INTO  SELFEMPLOYEE VALUES (1 ,'RAHUL','JADHAV');



---3.  Get all employee details from the employee table
 SELECT * FROM EMPLOYEE;
 
 
---4.  Get First_Name,Last_Name from employee table

 SELECT FIRST_NAME ,LAST_NAME FROM EMPLOYEE;

--5.  Get First_Name from employee table using alias name �Employee Name�
SELECT FIRST_NAME AS "EMPLOYEE NAME"
FROM EMPLOYEE;

--6.  Get First_Name from employee table in upper case
SELECT UPPER (FIRST_NAME) AS "FIRST NAME" FROM EMPLOYEE;

--7.  Select first 3 characters of FIRST_NAME from EMPLOYEE
SELECT SUBSTR (FIRST_NAME ,1,3) AS "FIRST 3 CHAR" FROM EMPLOYEE;

--8.  Get position of 'o' in name 'John' from employee table

SELECT INSTR(FIRST_NAME, 'o') AS POSITION_OF_O
FROM EMPLOYEE
WHERE FIRST_NAME = 'John';


--9.  Get FIRST_NAME from employee table after removing white spaces from right side.

select Rtrim (first_name)from employee;

--10. Get First_Name from employee table after replacing 'o' with '$'
select replace (FIRST_NAME ,'o','$')FROM EMPLOYEE;

---11. Get First_Name and Last_Name as single column from employee table separated by a '_'
SELECT  FIRST_NAME||'-'||LAST_NAME AS "FULL_NAME" FROM EMPLOYEE;

SELECT CONCAT(concat(FIRST_NAME,'-'),LAST_NAME) AS "FULL_NAME" FROM EMPLOYEE;


---12. Get FIRST_NAME, Joiningyear, Joining Month and Joining Date from employee table
select EXTRACT (YEAR FROM  (JOINING_DATE)) AS JOINING_YEAR ,
       EXTRACT(MONTH FROM  (JOINING_DATE))AS JOINING_MONTH, 
       EXTRACT (DAY FROM (JOINING_DATE))AS JOINING_DATE
 FROM EMPLOYEE;



select * from employee;

--13. Get all employee details from the employee table order by First_Name Ascending

SELECT * FROM EMPLOYEE
ORDER BY FIRST_NAME ASC;

--14. Get all employee details from the employee table order by First_Name Ascending and Salary Descending?
SELECT * FROM EMPLOYEE
ORDER BY FIRST_NAME ASC , SALARY DESC;

--15. Get employee details from employee table whose employee name is �John�
SELECT * FROM EMPLOYEE;
WHERE FIRST_NAME ='John';

--16. Get employee details from employee table whose employee name are �John� and �Roy�
SELECT * FROM EMPLOYEE
WHERE EMP_ID IN(1,3);

SELECT * FROM EMPLOYEE
WHERE FIRST_NAME IN ('John','Roy');


---17. Get employee details from employee table whose employee name are not �John� and �Roy�
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME NOT IN('John','Roy');


---18. Get employee details from employee table whose first name starts with 'J'.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE ('J%');

---19. Get employee details from employee table whose first name contains 'o'.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE ('%o%');

--20. Get employee details from employee table whose first name ends with 'n'.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE ('%n');

--21. Get employee details from employee table whose first name ends with 'n' and name contains 4 letters.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE ('___n');

--22. Get employee details from employee table whose first name starts with 'J' and name contains 4 letters.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE ('J___');

--23. Get employee details from employee table who�s Salary greater than 600000.
SELECT * FROM EMPLOYEE
WHERE salary >600000;

--24. Get employee details from employee table whose joining year is �2013�
 
select * from employee
where extract (year from joining_date)=2013;

--25. Get employee details from employee table whose joining month is �January�.
 SELECT *
FROM EMPLOYEE
WHERE EXTRACT(month FROM JOINING_DATE) = '01';

--26. Get employee details from employee table who joined before January 1st 2013.

SELECT *
FROM EMPLOYEE
WHERE JOINING_DATE < TO_DATE('01-Jan-2013','DD-MON-YYYY');


--27. Get employee details from employee table who joined after January 31st
    SELECT *
FROM EMPLOYEE
WHERE JOINING_DATE > TO_DATE('01-Jan-2013','DD-MON-YYYY');

--28. Get Joining Date and Time from employee table
SELECT TO_CHAR(JOINING_DATE, 'DD-MON-YYYY HH24:MI:SS') AS JOINING_DATE_TIME
FROM EMPLOYEE;

--29. Get Joining Date, Time including milliseconds from employee table
SELECT TO_CHAR(JOINING_DATE, 'DD-MON-YYYY HH24:MI:SS') AS JOINING_DATE_TIME
FROM EMPLOYEE;

SELECT
  EXTRACT(SECOND FROM CAST(JOINING_DATE AS TIMESTAMP)) * 1000
    AS milliseconds
FROM employee;



--30. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table.
SELECT
  e.emp_id,
  i.incentive_date - e.joining_date AS diff_in_days
FROM employee e
JOIN incentives i
ON e.emp_id = i.emp_id;

--31. Get department, total salary with respect to a department from employee table.
SELECT
  department,
  SUM(salary) AS total_salary
FROM employee
GROUP BY department;
  

SUBSTR 
SELECT SUBSTR ('COMPUTER',2)FROM DUAL;

 --32. Get department, total salary with respect to a department from employee table order by total salary descending.
 
 
 
 SELECT
  department,
  SUM(salary) AS total_salary
FROM employee
GROUP BY department
ORDER BY total_salary desc;

--33. Get department, no of employees in a department, total salary with respect to a department from employee table order by total salary descending.
 select  department ,
 count (emp_id) as no_of_employees ,
  SUM(salary) AS total_salary
FROM employee
GROUP BY department
ORDER BY total_salary desc;
 
34. Get department wise average salary from employee table order by salary ascending?

select department ,
AVG (salary)as avg_salary 
from employee
group by department 
order by avg_salary Asc;




35. Get department wise maximum salary from employee table order by salary ascending?
select now  * from employee;

select now from dual;

SELECT SYSDATE FROM dual;


--36. Get department wise minimum salary from employee table order by salary ascending?

SELECT DEPARTMENT ,MIN (SALARY)AS MIN_SAL
FROM EMPLOYEE
GROUP BY DEPARTMENT
ORDER BY MIN (SALARY)ASC;

--37. Select no of employees joined with respect to year and month from employee table.

    SELECT 
    EXTRACT(YEAR  FROM joining_date)  AS joining_year,
    EXTRACT(MONTH FROM joining_date)  AS joining_month,
    COUNT(*) AS no_of_employees
FROM employee
GROUP BY 
    EXTRACT(YEAR  FROM joining_date),
    EXTRACT(MONTH FROM joining_date)
ORDER BY 
    joining_year,
    joining_month;


--38. Select department,total salary with respect to a department from employee table where total salary greater than 800000 order by Total_Salary descending
SELECT 
    department,
    SUM(salary) AS total_salary
FROM employee
GROUP BY department
HAVING SUM(salary) > 800000
ORDER BY total_salary DESC;



--39. Select employee details from employee table if data in incentive table?



--40. Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of salary from employee table
   
   
   SELECT FIRST_NAME,SALARY,
   CASE
       WHEN FIRST_NAME ='JOHN' THEN SALARY  *0.20
       WHEN FIRST_NAME ='ROY'THEN SALARY *0.10
    ELSE SALARY *0.15 
      END AS CAL_SAL
      FROM EMPLOYEE;   

---41. Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as    'Services Dept' from employee table.


SELECT 
case 
  when department = 'Banking' then 'Bank_dept'
 when department = 'INSURANCE' then 'insurance_dept'
 when department = 'Services' then 'services_dept'
end as department_name
from employee;
SELECT * FROM EMPLOYEE;
--42. Delete employee data from employee table who got incentives in incentive table
   DELETE FROM employee
WHERE emp_id IN 
( SELECT emp_id 
    FROM incentives);
    
    select * from employee;

--43. Select first_name, incentive amount from employee and incentives table for those employees who have incentives.

44. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
45. Select first_name, incentive amount from employee and incentives table for all employees even if they didnt get incentives
46. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives and set incentive amount as 0 for those employees who didn't get incentives.
47. Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join
---48. Select max incentive with respect to employee from employee and incentives table using sub query.
--------------------------------------------------------------------------------------------------------------------

SELECT SALARY
FROM (
    SELECT SALARY
    FROM employee
    ORDER BY SALARY DESC
)
WHERE ROWNUM > 2;

SELECT salary
FROM employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

SELECT MAX(salary) AS second_last_salary
FROM employee
WHERE salary < (SELECT MAX(salary)
FROM employee);

select max(salary) from hr.employees
where salary < (select max(salary) from hr.employees
                 where salary < (select max(salary) from hr.employees));

select * from employee;

SELECT SALARY
FROM (select salary,
     dense_rank() over(order by salary desc) as rank_sal
     from hr.employees)
where rank_sal = 50;

 
select salary 
from(select salary,
     denSe_rank ()over(order by salary desc)AS RN
     FROM EMPLOYEE)
WHERE rn=5;

SELECT SALARY 
FROM (SELECT SALARY ,
      DENSE_RANK() OVER (ORDER BY SALARY DESC)AS RNK
      FROM EMPLOYEE)
WHERE RNK =4;



SELECT SALARY 
FROM (SELECT SALARY ,
      DENSE_RANK()OVER  ( ORDER BY SALARY DESC)AS RNK 
      FROM EMPLOYEE)
      WHERE RNK=3;















create view my_view as 
select * from hr.employees

select * from my_view
