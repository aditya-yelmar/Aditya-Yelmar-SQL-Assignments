-- SQL Assignment Portfolio
-- Prepared for: Tusher Nikam
-- Topic: SQL practice, queries, joins, aggregation, and database management

assignment:-4-5

===================================================================================================


--Q1: Write a query to display the Full name only those employees whose first name start with �S� character.
--Employee_id Full Name Salary  Hire_date


SELECT employee_id,(substr(first_name,1,1))||'.'||last_name Full_Name,salary,hire_date
FROM employees
WHERE first_name like 'S%';

------------------------------------------------------------------------------------------------------------------------

--Q2. Find the highest, lowest, sum, and average salary of all employees. Label the columns Maximum
--,Minimum, Sum, and Average, respectively. Round your results to the nearest whole number. 

SELECT round(max(salary)) highest,
round(min(salary)) lowest,
round(sum(salary)) sum,
round(avg(salary)) avg
FROM employees;

-------------------------------------------------------------------------------------------------------------------------

--Q3. Display following output .
--Employee Details


SELECT last_name||' '||'earns'||to_char(salary,'$99999.00')||' '||'but wants'||' '||(to_char(salary*3,'$99999.00'))
FROM employees;

-----------------------------------------------------------------------------------------------------------------------

--Q4. Determine the number of managers without listing them. Label the column  Number of Managers Hint: Use the MANAGER_ID column to determine the number of managers. 
SELECT count(manager_id) number_of_managers
FROM employees;

----------------------------------------------------------------------------------------------------------------

--Q5. Find the difference between the highest and lowest salaries. Label the column DIFFERENCE
SELECT max(salary)-min(salary) difference
FROM employees;

------------------------------------------------------------------------------------------------------------------------

--Q6. Display how many employees joined in each month
Hint: Grouping by month and count the employees .use TO_CHAR functions also

SELECT to_char(hire_date,'Month')month,count(employee_id)
FROM employees
group by to_char(hire_date,'Month')
order by month;

-------------------------------------------------------------------------------------------------------------------

--Q7. Display employee id , full name of employees and their hire date only those employees that has greater than 10 year experience in company.

SELECT employee_id,first_name||' '||last_name Full_name,hire_date
FROM employees
WHERE (to_char(hire_date)<sysdate-365*10);
-------------------------------------------------------------------------------------------------------------
--Q8. Write a query to multipley  salary to commission and calculate the average salary of employees.
--Hint: Commission column contain null values

SELECT AVG(salary * NVL(commission_pct, 0)) AS avg_salary_commission
FROM employees;
----------------------------------------------------------------------------------------------------------
--Q9.Write a query to display department_id and number of manager under the particular department exclude the null department.
Hint: Grouping on department id


SELECT department_id,count(manager_id)
FROM departments
WHERE department_id is not null
group by department_id;
--------------------------------------------------------------------------------------------------------------
--Q10.Display job title and number of employees working those job and number of manager they perform job.

SELECT count(employee_id),count(manager_id),j.job_title
FROM employees e,jobs j
WHERE e.job_id=j.job_id and manager_id is not null
group by j.job_title;
-----------------------------------------------------------------------------------------------------
--Q11. Display employee full name and pad both side asterisk sing 10 time . Example 

SELECT
       LPAD('*', 10, '*') ||
       first_name || ' ' || last_name ||
       RPAD('*', 10, '*') AS employee_details
FROM employees;
----------------------------------------------------------------------------------------------------------
--Q12. Display following output. (Hint: Use Months_between Function)


  SELECT employee_id,last_name,hire_date,round(months_between(sysdate,hire_date)/7) weeks,
round(months_between(sysdate,hire_date)) months,
round(months_between(sysdate,hire_date)/12) years
FROM employees;

----------------------------------------------------------------------------------------------------------------
