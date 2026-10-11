-- SQL Assignment Portfolio
-- Prepared for: Tusher Nikam
-- Topic: SQL practice, queries, joins, aggregation, and database management

----------------------------------------------CREATE TABLE SALESPEOPLE---------------------------------------------------------------
CREATE table Salespeople
(Snum NUMBER PRIMARY KEY,
Sname varchar2(50),
City varchar2(50),
Comm NUMBER(3,2)not null);

SELECT * FROM SALESPEOPLE;
DROP TABLE SALESPEOPLE;

INSERT INTO Salespeople VALUES (1001,'Peel','London',.12);
INSERT INTO Salespeople VALUES (1002,'Serres','San Jose',.13);
INSERT INTO Salespeople VALUES (1004,'Monika','London',.11);
INSERT INTO Salespeople VALUES (1007,'Rifkin','Barcelona',.15);
INSERT INTO Salespeople VALUES (1003,'Axelrod','New York',.10);
INSERT INTO Salespeople VALUES (1005,'Franc','London',.26);
 
drop table salespeople;

----------------------create table Customers--------------------------------------------------------

create table Customers
(Cnum NUMBER PRIMARY KEY,
Cname varchar2 (50),
City varchar2(50),
Rating NUMBER,
Snum NUMBER ,
FOREIGN KEY(Snum)REFERENCES
SALESPEOPLE (Snum));

SELECT * FROM CUSTOMERS;
DROP TABLE CUSTOMERS;

INSERT INTO CUSTOMERS VALUES (2001,'Hoffman','London',100,1001);
INSERT INTO CUSTOMERS VALUES (2002,'Giovanni','Rome',200,1003);
INSERT INTO CUSTOMERS VALUES (2003,'Liu','San Jose',200,1002);
INSERT INTO CUSTOMERS VALUES (2004,'Grass','Berlin',100,1002);
INSERT INTO CUSTOMERS VALUES (2006,'Clemens','London',100,1001);
INSERT INTO CUSTOMERS VALUES (2008,'Cisneros','San Jose',100,1007);
INSERT INTO CUSTOMERS VALUES (2007,'Pereira','Romde',100,1004);

-----------CREATE TABLE ORDERS----------------------------------

CREATE TABLE ORDERS
(Onum NUMBER PRIMARY KEY,
Amt DECIMAL (10,2) ,
Odate TIMESTAMP ,
Cnum NUMBER,
Snum NUMBER,
Foreign key (Cnum)references 
customers (Cnum),
foreign key (Snum)references
Salespeople (Snum));

select * from Orders;

 DROP TABLE ORDERS ;
 
 DELETE FROM ORDERS
 WHERE Onum =3001;
 


INSERT INTO ORDERS VALUES (3001,  18.69,TO_TIMESTAMP(' 03-Oct-96 12:30','DD-MON-RR HH24:MI'), 2008 , 1007);
INSERT INTO ORDERS VALUES (3003,  767.19,TO_TIMESTAMP(' 03-Oct-96 13:45','DD-MON-RR HH24:MI'), 2001,  1001);
INSERT INTO ORDERS VALUES (3002, 1900.10,TO_TIMESTAMP(' 03-Oct-96 12:05','DD-MON-RR HH24:MI'), 2007,  1004);
INSERT INTO ORDERS VALUES (3005,  5160.45,TO_TIMESTAMP(' 03-Oct-96 14:00','DD-MON-RR HH24:MI'), 2003,  1002);
INSERT INTO ORDERS VALUES (3006 , 1098.16,TO_TIMESTAMP(' 03-Oct-96 13:37','DD-MON-RR HH24:MI'), 2008,  1007);
INSERT INTO ORDERS VALUES (3009 , 1713.23,TO_TIMESTAMP(' 04-Oct-96 15:21','DD-MON-RR HH24:MI'), 2002,  1003);
INSERT INTO ORDERS VALUES (3007,  75.75,TO_TIMESTAMP('04-Oct-96 16:02','DD-MON-RR HH24:MI'), 2002 , 1003);
INSERT INTO ORDERS VALUES (3008,  4723.00,TO_TIMESTAMP(' 05-Oct-96 12:07','DD-MON-RR HH24:MI'), 2006,  1001);
INSERT INTO ORDERS VALUES (3010,  1309.95,TO_TIMESTAMP(' 06-Oct-96 13:12','DD-MON-RR HH24:MI'), 2004 , 1002);
INSERT INTO ORDERS VALUES (3011,  9891.88,TO_TIMESTAMP(' 06-Oct-96 13:09','DD-MON-RR HH24:MI'), 2006,  1001);
INSERT INTO ORDERS VALUES (3012,  3455.78,TO_TIMESTAMP(' 04-Oct-96 15:21','DD-MON-RR HH24:MI'), 2002 , 1003);
INSERT INTO ORDERS VALUES (3013,  1245.98,TO_TIMESTAMP(' 04-Oct-96 16:32','DD-MON-RR HH24:MI'), 2002 , 1003);
INSERT INTO ORDERS VALUES (3014,  3721.53,TO_TIMESTAMP('05-Oct-96 12:45','DD-MON-RR HH24:MI'), 2006 , 1001);
INSERT INTO ORDERS VALUES (3015,  734.50,TO_TIMESTAMP('  06-Oct-96 13:16','DD-MON-RR HH24:MI'), 2004 , 1002);
INSERT INTO ORDERS VALUES (3016,  1729.67,TO_TIMESTAMP(' 06-Oct-96 13:07','DD-MON-RR HH24:MI'), 2006 , 1001);


--=========================================================================================================
select * from salespeople;
select * from customers;
select * from orders;

---1. List all customers with a rating of 100.

select * from customers
where RATING =100;

---2.  Find all records in the Customer table with NULL values in the city column.

select *from customers
where CITY IS NULL;

---3.  Find the largest order taken by each salesperson on each date.

select  snum, odate ,max(amt) 
from orders
group by snum,odate
order by snum,odate;

---4.  Arrange the Orders table by descending customer number.

select * from orders
order by cnum desc;

---5.  Find which salespeople currently have orders in the Orders table.
SELECT SNUM
FROM Orders
GROUP BY SNUM;

---6.  List names of all customers matched with the salespeople serving them.
SELECT SNAME,
       CNAME
       FROM CUSTOMERS C
       INNER JOIN SALESPEOPLE S
       ON S.SNUM= C.SNUM;
       
---7.  Find the names and numbers of all salespeople who had more than one customer.

SELECT 
    S.SNUM,
    S.SNAME
FROM SALESPEOPLE S
INNER JOIN CUSTOMERS C
    ON S.SNUM = C.SNUM
GROUP BY 
    S.SNUM, S.SNAME
HAVING COUNT(C.CNUM) > 1;


---8.  Count the orders of each of the salespeople and output the results in descending order.
select o.snum ,
count (o.onum)as total_order
from orders o
group by o.snum
order by total_order desc;

---9.  List the Customer table if and only if one or more of the customers in the Customer tables are located in San Jose.
select * from customers
where city ='San Jose';
---10. Match salespeople to customers according to what city they lived in.
select s.sname,c.city,c.cname 
     from salespeople s 
     inner join customers c
on s.snum=c.snum ;

---11. Find the largest order taken by each salesperson.
select *from orders;

select snum,
 max(amt)as largest_order
 from orders
  group by snum
 order by largest_order desc;

---12. Find customers in San Jose who has a rating above 200.
select * from customers;

select cname,city,rating
from customers
where city = 'San Jose' and rating >200;

---13. List the names and commissions of all salespeople in London.
select * from salespeople;

select sname,city,comm
from salespeople 
where city = 'London';

---14. List all the orders of salesperson Monika from the Orders table.
select s.sname,o.onum 
from salespeople s inner join orders o
on s. snum=o.snum
where sname='Monika';

---15. Find all customers with orders on October 3.
select c.cname,trunc (odate) ,O.ONUM
from customers c inner join orders o
on c.Cnum = o.Cnum
where Trunc (Odate) = TO_DATE('03/10/1996','DD/MM/YYYY');

SELECT * FROM ORDERS;
SELECT * FROM CUSTOMERS;

---16. Give the sums of the amounts from the orders table, grouped by date.
SELECT SUM (AMT)AS TOTAL_AMT , TRUNC(ODATE)
FROM ORDERS O
GROUP BY TRUNC(ODATE);

---17. Eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount.

SELECT TRUNC(odate) AS order_date,
       SUM(amt) AS total_amt,
       MAX(amt) AS max_amt
FROM orders
GROUP BY TRUNC(odate)
HAVING SUM(amt) - MAX(amt) >= 2000
ORDER BY order_date;

select * FROM ORDERS
---18. Select all orders that had amounts that were greater than at least one of the orders from October 6.
SELECT * FROM ORDERS;

SELECT COUNT(AMT),ONUM,ODATE
WHERE 

---19. Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.
SELECT *
FROM salespeople s
WHERE EXISTS
     (SELECT 1
      FROM customers c
      WHERE c.snum = s.snum
        AND c.rating = 300);


---20. Find all pairs of customers having the same rating.
SELECT * FROM CUSTOMERS;USE SELF JOIN

SELECT c1.cname AS customer1,
       c2.cname AS customer2,
       c1.rating
FROM customers c1
JOIN customers c2
  ON c1.rating = c2.rating
 AND c1.cnum < c2.cnum;


---21. Find all customers with CNUM, 1000 above the SNUM of Serres.
 select* from salespeople;
 select * from customers;
SELECT *
FROM customers
WHERE cnum > 
      (SELECT snum + 1000
      FROM salespeople
      WHERE sname = 'Serres');

---22. Give the salespeople’s commissions as percentage instead of decimal numbers.
       SELECT sname,
       comm * 100 AS commission_percentage
FROM salespeople;

---23. Find the largest order taken by each salesperson on each date, eliminating those MAX orders, which are less than $3000.00 in value.
 
SELECT snum, TRUNC(odate) AS order_date, MAX(amt) AS max_order
FROM orders
GROUP BY snum, TRUNC(odate)
HAVING MAX(amt) >= 3000;

---24. List the largest orders on October 3, for each salesperson.

SELECT snum, TRUNC(odate) AS order_date, MAX(amt) AS largest_order
FROM orders
WHERE TRUNC(odate) = DATE '1996-10-03'
GROUP BY snum, TRUNC(odate);

---25. Find all customers located in cities where Serres (SNUM 1002) has customers.
SELECT *
FROM customers
WHERE city IN (
      SELECT city
      FROM customers
      WHERE snum = 1002);
     
SELECT c1.*
FROM customers c1
JOIN customers c2
  ON c1.city = c2.city
WHERE c2.snum = 1002;

---26. Select all customers with a rating above 200.00.
       SELECT *
FROM customers
WHERE rating > 200;

---27. Count the number of salespeople currently listing orders in the Orders table.

SELECT COUNT(DISTINCT snum) AS num_salespeople
FROM orders;

---28. Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name and the salesperson‘s rate of commission.
     SELECT c.cname AS customer_name,
       s.comm * 100 AS commission_percentage
FROM customers c
JOIN salespeople s
  ON c.snum = s.snum
WHERE s.comm > 0.12;

---29. Find salespeople who have multiple customers.
     SELECT snum, COUNT(cnum) AS num_customers
FROM customers
GROUP BY snum
HAVING COUNT(cnum) > 1;


SELECT s.sname, COUNT(c.cnum) AS num_customers
FROM salespeople s
JOIN customers c ON s.snum = c.snum
GROUP BY s.sname
HAVING COUNT(c.cnum) > 1;

--30. Find salespeople with customers located in their city.

     SELECT DISTINCT s.snum, s.sname, s.city
FROM salespeople s
JOIN customers c
  ON s.snum = c.snum
WHERE s.city = c.city;

---31. Find all salespeople whose name starts with ‘P’ and the fourth character is ‘I’.
SELECT *
FROM salespeople
WHERE sname LIKE 'P__l%';
select * from salespeople;

----32. Write a query that uses a sub query to obtain all orders for the customer named ‘Cisneros’. Assume you do not know his customer number.
SELECT *
FROM orders
WHERE cnum = (
    SELECT cnum
    FROM customers
    WHERE cname = 'Cisneros');
    
---33. Find the largest orders for ‘Serres’ and ‘Rifkin’.
select * from orders;

select max (onum)as largest_ord , sname from orders o inner join 
salespeople s
on s.snum = o.snum
where s.sname IN ('serres' , 'Rifkin')
group by (onum);

---34. Extract the Salespeople table in the following order: SNUM, SNAME, COMMISSION, CITY.
select snum,sname,comm,city from salespeople;

select * from salespeople;

---35. Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range.
select * from customers
where cname between 'A' and 'G';

---36. Select all the possible combinations of customers that you can assign.

---37. Select all orders that are greater than the average for October 4.

SELECT o.*
FROM orders o
JOIN (SELECT AVG(amt) AS avg_amt
        FROM orders
        WHERE TRUNC(odate) = DATE '1996-10-04') a
ON o.amt > a.avg_amt;

---38. Write a select command using a correlated sub query that selects the names and numbers of all customers with ratings equal to the maximum for their city.
     SELECT c.cname, c.cnum 
FROM customers c
WHERE c.rating =
      (SELECT MAX(c2.rating)
       FROM customers c2
       WHERE c2.city = c.city);
       
       select * from customers;
       
       
       
---39. Write a query that totals the orders for each day and places the results in descending order.
      select * from orders;

SELECT TRUNC(odate) AS order_date, SUM(amt) AS total_orders
FROM orders
GROUP BY TRUNC(odate)
ORDER BY total_orders DESC;

---40. Write a select command that produces the rating followed by the name of each customer in San Jose.

SELECT rating, cname ,city
FROM customers
WHERE city = 'San Jose';

---41. Find all orders with amounts smaller than any amount for a customer in San Jose.
SELECT *
FROM orders
WHERE amt < ANY (
    SELECT amt
    FROM orders o
    JOIN customers c
      ON o.cnum = c.cnum
    WHERE c.city = 'San Jose');
   
select * from customers; 
  select * from orders; 
  
---42. Find all orders with above average amounts for their customers.
  SELECT *
FROM orders o1
WHERE amt > (
    SELECT AVG(amt)
    FROM orders o2
    WHERE o2.cnum = o1.cnum);
    
---43. Write a query that selects the highest rating in each city.
SELECT city, MAX(rating) AS highest_rating
FROM customers
GROUP BY city;

---44. Write a query that calculates the amount of the salesperson’s commission on order by a customer with a rating above 100.00.
  SELECT o.onum, o.amt,rating, s.sname, (o.amt * s.comm) AS commission_amount
FROM orders o
JOIN customers c ON o.cnum = c.cnum
JOIN salespeople s ON o.snum = s.snum
WHERE c.rating > 100;

---45. Count the customers with rating above San Jose’s average.
SELECT COUNT(*) AS cust_count
FROM customers
WHERE rating > (
    SELECT AVG(rating)
    FROM customers
    WHERE city = 'San Jose');
    
 select * from orders;
 
   SELECT COUNT(c1.cnum) AS cust_count
FROM customers c1
JOIN (
    SELECT AVG(rating) AS avg_rating
    FROM customers
    WHERE city = 'San Jose'
) c2
ON c1.rating > c2.avg_rating;

select * from customers;

---46. Write a query that produces all pairs of salespeople with themselves as well as duplicate rows with the order reversed.
SELECT s1.sname AS salesperson1, s2.sname AS salesperson2
FROM salespeople s1
CROSS JOIN salespeople s2;

---47. Find all salespeople that are located in either Barcelona or London.
SELECT *
FROM salespeople
WHERE city IN ('Barcelona', 'London');

---48. Find all salespeople with only one customer.
     SELECT s.snum, s.sname
FROM salespeople s
JOIN customers c ON s.snum = c.snum
GROUP BY s.snum, s.sname
HAVING COUNT(c.cnum) = 1;

---49. Write a query that joins the Customer table to itself to find all pairs of customers served by a single salesperson.
   SELECT c1.cname AS customer1, c2.cname AS customer2, c1.snum
FROM customers c1
JOIN customers c2
  ON c1.snum = c2.snum
  AND c1.cnum < c2.cnum;

---50. Write a query that will give you all orders for more than $1000.00.
    SELECT *
FROM orders
WHERE amt > 1000;

---51. Write a query that lists each order number followed by the name of the customer who made that order.
      SELECT o.onum, c.cname
FROM orders o
JOIN customers c ON o.cnum = c.cnum;
---52. Write 2 queries that select all salespeople (by name and number) who have customers in their cities who they do not service, one using a join and one a correlated subquery. Which solution is more elegant?
       (a) Using JOIN
SELECT DISTINCT s.snum, s.sname
FROM salespeople s
JOIN customers c
  ON s.city = c.city
WHERE s.snum <> c.snum;

(b) Using correlated subquery
SELECT s.snum, s.sname
FROM salespeople s
WHERE EXISTS (
    SELECT 1
    FROM customers c
    WHERE c.city = s.city
      AND c.snum <> s.snum);

---53. Write a query that selects all customers whose ratings are equal than ANY (in the SQL sense) of Serres.
SELECT *
FROM customers
WHERE rating = ANY (SELECT rating
    FROM customers
    WHERE snum = (SELECT snum
        FROM salespeople
        WHERE sname = 'Serres'));

---54. Write2 queries that will produce all orders taken on October3 or October 4.
(a) Using IN

SELECT *
FROM orders
WHERE TRUNC(odate) IN (
    TRUNC(TO_DATE('03-OCT-1996','DD-MON-YYYY')),
    TRUNC(TO_DATE('04-OCT-1996','DD-MON-YYYY'))
);

(b) Using OR
SELECT *
FROM orders
WHERE TRUNC(odate) = TRUNC (TO_DATE('03-OCT-1996','DD-MON-YYYY'))
   OR TRUNC (odate) = TRUNC (TO_DATE('04-OCT-1996','DD-MON-YYYY'));
---55. Write a query that produces all pairs of orders by a given customer. Name that customer and eliminate duplicates.
       SELECT o1.onum AS order1, o2.onum AS order2, c.cname
FROM orders o1
JOIN orders o2
  ON o1.cnum = o2.cnum
  AND o1.onum < o2.onum
JOIN customers c ON o1.cnum = c.cnum;

---56. Find only those customers whose ratings are higher than every customer in Rome.
SELECT *
FROM customers
WHERE rating > ALL (
    SELECT rating
    FROM customers
    WHERE city = 'Rome');

---57. Write a query on the customers table whose output will exclude all customers with a rating < = 100.00, unless they are located in Rome.
SELECT *
FROM customers
WHERE rating > 100
   OR city = 'Rome';

---58. Find all rows from the Customer table for which the salesperson number is 1001.
SELECT *
FROM customers
WHERE snum = 1001;

---59. Find the total amount in Orders for each salesperson for which this total is greater than the amount of the largest order in the table.
SELECT snum, SUM(amt) AS total_amt
FROM orders
GROUP BY snum
HAVING SUM(amt) >
       (SELECT MAX(amt) FROM orders);

---60. Write a query that selects all orders that have Zeroes or NULL in the Amount field.
SELECT *
FROM orders
WHERE amt = 0
   OR amt IS NULL;

---61. Produce all combinations of salespeople and customer names such that the former precedes the latter alphabetically, and the latter has a rating of less than 200.
SELECT s.sname, c.cname
FROM salespeople s
CROSS JOIN customers c
WHERE s.sname < c.cname
  AND c.rating < 200;

---62. List all salespeople’s names and the commission they have earned.

SELECT s.sname, o.onum, o.amt * s.comm AS commission_earned
FROM salespeople s
JOIN orders o ON s.snum = o.snum;

---63. Write a query that produces the names and cities of all customers with the same rating as Hoffman. Write the query using Hoffman’s CNUM rather than his rating, so that it would still be usable if his rating changed.
SELECT cname, city
FROM customers
WHERE rating = (
    SELECT rating
    FROM customers
    WHERE cname = 'Hoffman');

---64. Find all salespeople for whom there are customers that follow them in alphabetical order.
SELECT DISTINCT s.sname
FROM salespeople s
JOIN customers c
  ON s.snum = c.snum
WHERE c.cname > s.sname;

---65. Write a query that produces the names and ratings of all customers of all who have above average orders.
SELECT DISTINCT c.cname, c.rating
FROM customers c
JOIN orders o ON c.cnum = o.cnum
WHERE o.amt >
      (SELECT AVG(amt) FROM orders);


---66. Find the sum of all purchases from the Orders table.
SELECT SUM(amt) AS total_purchases
FROM orders;

---67. Write a select command that produces the order number, amount, and date for all rows in the Order table.SELECT onum, amt, odate
SELECT onum, amt, odate
FROM orders;

---68. Count the number of not null rating fields in the Customer table including duplicates.
SELECT COUNT(rating) AS rating_count
FROM customers;

---69. Write a query that gives the names of both the salesperson and the customer for each order after the order number.
SELECT o.onum, s.sname, c.cname
FROM orders o
JOIN salespeople s ON o.snum = s.snum
JOIN customers c ON o.cnum = c.cnum;

---70. List the commissions of all salespeople servicing customers in London.
SELECT DISTINCT s.sname, s.comm
FROM salespeople s
JOIN customers c ON s.snum = c.snum
WHERE c.city = 'London';

---71. Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.
SELECT *
FROM salespeople s
WHERE s.city <> ALL (
    SELECT c.city
    FROM customers c
    WHERE c.snum = s.snum);

---72. Write a query using the EXISTS operator that selects all salespeople with customers located in their cities who are not assigned to them.
SELECT s.snum, s.sname
FROM salespeople s
WHERE EXISTS (
    SELECT 1
    FROM customers c
    WHERE c.city = s.city
      AND c.snum <> s.snum);

---73. Write a query that selects all customers serviced by Peel or Motika.
SELECT c.*
FROM customers c
JOIN salespeople s ON c.snum = s.snum
WHERE s.sname IN ('Peel', 'Motika');

---74. Count the number of salespeople registering orders for each day. (If a salesperson has more than one order on a given day, he or she should be counted only once.).
SELECT TRUNC(odate) AS order_date,
       COUNT(DISTINCT snum) AS salesperson_count
FROM orders
GROUP BY TRUNC(odate);

---75. Find all orders attributed to salespeople in London.
SELECT o.*
FROM orders o
JOIN salespeople s ON o.snum = s.snum
WHERE s.city = 'London';

---76. Find all orders by customers not located in the same cities as their salespeople.
SELECT o.*
FROM orders o
JOIN customers c ON o.cnum = c.cnum
JOIN salespeople s ON o.snum = s.snum
WHERE c.city <> s.city;

---77. Find all salespeople who have customers with more than one current order.
SELECT DISTINCT s.snum, s.sname
FROM salespeople s
JOIN orders o ON s.snum = o.snum
GROUP BY s.snum, s.sname, o.cnum
HAVING COUNT(o.onum) > 1;

---78. Write a query that extracts from the Customer table every customer assigned to a salesperson who currently has at least one other customer (besides the customer being selected) with orders in the Orders table.
SELECT DISTINCT c1.*
FROM customers c1
WHERE EXISTS (
    SELECT 1
    FROM customers c2
    JOIN orders o ON c2.cnum = o.cnum
    WHERE c2.snum = c1.snum
      AND c2.cnum <> c1.cnum);

---79. Write a query that selects all customers whose name begins with ‘C’.
SELECT *
FROM customers
WHERE cname LIKE 'C%';

---80. Write a query on the Customers table that will find the highest rating in each city. Put the output in this form:  for the city (city) the highest rating is : (rating).
SELECT 'For the city ' || city ||
       ' the highest rating is : ' || MAX(rating) AS result
FROM customers
GROUP BY city;

---81. Write a query that will produce the Snum values of all salespeople with orders currently in the Orders table without any repeats.
SELECT DISTINCT snum
FROM orders;

---82. Write a query that lists customers in descending order of rating. Output the rating field first, followed by the customers’ names and numbers.
SELECT rating, cname, cnum
FROM customers
ORDER BY rating DESC;

---83. Find the average commission for salespeople in London.
SELECT AVG(comm) AS avg_commission
FROM salespeople
WHERE city = 'London';

---84. Find all orders credited to the same salesperson that services Hoffman.
SELECT *
FROM orders
WHERE snum = (
    SELECT snum
    FROM customers
    WHERE cname = 'Hoffman');

---85. Find all salespeople whose commission is in between 0.10 and 0.12 both inclusive.
SELECT *
FROM salespeople
WHERE comm BETWEEN 0.10 AND 0.12;

---86. Write a query that will give you the names and cities of all salespeople in London with commission above 0.10
SELECT sname, city
FROM salespeople
WHERE city = 'London'
  AND comm > 0.10;

---87. What will be the output from the following query? 
SELECT * FROM ORDERS WHERE (AMT < 1000 OR NOT (ODATE = 10/03/1996 AND CNUM > 2003));
Explanation (logical meaning)

This query returns:

All orders with amount < 1000, OR

All orders that are NOT placed on 10-03-1996 by customers with CNUM > 2003

So the only orders excluded are:

Orders where ODATE = 10-03-1996 AND CNUM > 2003 AND AMT ≥ 1000

Everything else is returned.
---88. Write a query that selects each customer’s smallest order.
SELECT cnum, MIN(amt) AS smallest_order
FROM orders
GROUP BY cnum;

---89. Write a query that selects the first customer in alphabetical order whose name begins with ‘G’.
SELECT *
FROM customers
WHERE cname = (
    SELECT MIN(cname)
    FROM customers
    WHERE cname LIKE 'G%');


---90. Write a query that counts the number of different not NULL city values in the Customers table.
SELECT COUNT(DISTINCT city) AS city_count
FROM customers;

---91. Find the average amount from the Orders table.
SELECT AVG(amt) AS avg_amount
FROM orders;

---92. What would be the output from the following query?
---SELECT*FROM ORDERS WHERE NOT  (Odate =10/03/1996 OR Snum>1006) AND amt. >=1500);
WHERE odate <> DATE '1996-10-03'
  AND snum <= 1006
  AND amt >= 1500;
Meaning:
Returns orders:

Not on Oct 3

Salesperson number ≤ 1006

Amount ≥ 1500

---93. Find all customers who are not located in San Jose & whose rating is above 200.
SELECT *
FROM customers
WHERE city <> 'San Jose'
  AND rating > 200;

---94. Give a simpler way to write this query:
---SELECT Snum, Sname, city, Comm FROM salespeople WHERE (Comm>0.12 and Comm <0.14);

SELECT snum, sname, city, comm
FROM salespeople
WHERE comm BETWEEN 0.12 AND 0.14;

---95. Evaluate the following query:
--SELECT * FROM orders WHERE NOT ((Odate = 10/03/1996 AND Snum>1002) OR amt>2000);
SELECT *
FROM orders
WHERE NOT ((odate = DATE '1996-10-03' AND snum > 1002)
        OR amt > 2000);

---96. Which salespeople attend to customers not in the city they have been assigned to?
SELECT DISTINCT s.sname
FROM salespeople s
JOIN customers c ON s.snum = c.snum
WHERE s.city <> c.city;

---97. Which salespeople get commission greater than 0.11 and serving customers rated less than 250?
SELECT DISTINCT s.sname
FROM salespeople s
JOIN customers c ON s.snum = c.snum
WHERE s.comm > 0.11
  AND c.rating < 250;

---98. Which salespeople have been assigned to the same city but get different commission percentages?
SELECT s1.sname, s2.sname, s1.city
FROM salespeople s1
JOIN salespeople s2
  ON s1.city = s2.city
 AND s1.comm <> s2.comm
 AND s1.snum < s2.snum;

---99. Which salesperson has earned the most by way of commission?
SELECT s.sname
FROM salespeople s
JOIN orders o ON s.snum = o.snum
GROUP BY s.sname
HAVING SUM(o.amt * s.comm) = (
    SELECT MAX(total_comm)
    FROM (
        SELECT SUM(o.amt * s.comm) AS total_comm
        FROM salespeople s
        JOIN orders o ON s.snum = o.snum
        GROUP BY s.snum));

---100.  Does the customer who has placed the maximum number of orders have the maximum rating?



---101.  Has the customer who has spent the largest amount of money been given the highest rating?
---102.  List all customers in descending order of customer rating.
SELECT *
FROM customers
ORDER BY rating DESC;

---103.  On which days has Hoffman placed orders?
SELECT DISTINCT odate
FROM orders
WHERE cnum = (
    SELECT cnum
    FROM customers
    WHERE cname = 'Hoffman');

----104.  Do all salespeople have different commissions?
    SELECT ---* from salespeople;
  CASE 
    WHEN COUNT(DISTINCT comm) = COUNT(*) 
    THEN 'YES'
    ELSE 'NO'
  END AS all_commissions_different
FROM salespeople;

---105.  Which salespeople have no orders between 10/03/1996 and 10/05/1996?
SELECT *
FROM salespeople
WHERE snum NOT IN (
    SELECT snum
    FROM orders
    WHERE TRUNC(odate) BETWEEN 
          TO_DATE('10-03-1996','DD-MM-YYYY')
      AND TO_DATE('10-05-1996','DD-MM-YYYY'));
----------
SELECT s.*
FROM salespeople s
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.snum = s.snum
      AND TRUNC(o.odate) BETWEEN 
          TO_DATE('10-03-1996','DD-MM-YYYY')
      AND TO_DATE('10-05-1996','DD-MM-YYYY'));
      
      ---106.  How many salespersons have succeeded in getting orders?
      SELECT COUNT(DISTINCT snum) AS successful_salespersons
FROM orders;

---107.  How many customers have placed orders?

SELECT * FROM CUSTOMERS ;
SELECT * FROM ORDERS;

SELECT COUNT (DISTINCT CNUM)AS CUST_COUNT
FROM ORDERS;

---108.  On which date has each salesperson booked an order of maximum value?
SELECT s.sname, o.odate, o.amt
FROM salespeople s
INNER JOIN orders o ON s.snum = o.snum
WHERE o.amt = (
    SELECT MAX(amt)
    FROM orders
    WHERE snum = s.snum);

---109.  Who is the most successful salesperson?
SELECT sname
FROM salespeople s
JOIN orders o ON s.snum = o.snum
GROUP BY sname
HAVING SUM(o.amt) = (
    SELECT MAX(SUM(amt))
    FROM orders
    GROUP BY snum);

---110.  Who is the worst customer with respect to the company?
SELECT c.cname
FROM customers c
JOIN orders o ON c.cnum = o.cnum
GROUP BY c.cname
HAVING SUM(o.amt) = (
    SELECT MIN(SUM(amt))
    FROM orders
    GROUP BY cnum);

---111.  Are all customers not having placed orders greater than 200 totally been serviced by salesperson Peel or Serres?
SELECT CASE
WHEN COUNT(*) = 0 THEN 'YES'
ELSE 'NO'
END AS answer
FROM customers c
WHERE c.cnum NOT IN (
    SELECT cnum FROM orders WHERE amt > 200
)
AND c.snum NOT IN (
    SELECT snum FROM salespeople
    WHERE sname IN ('Peel','Serres')
);

---112.  Which customers have the same rating?
SELECT rating, COUNT(*) 
FROM customers
GROUP BY rating
HAVING COUNT(*) > 1;


----113.  Find all orders greater than the average for October 4th.
SELECT *
FROM orders
WHERE amt > (
    SELECT AVG(amt)
    FROM orders
    WHERE TRUNC (odate) = TO_DATE('04-10-1996','DD-MM-YYYY'));

---114.  Which customers have above average orders?
SELECT DISTINCT c.cname
FROM customers c
JOIN orders o ON c.cnum = o.cnum
WHERE o.amt > (SELECT AVG(amt) FROM orders);

---115.  List all customers with ratings above San Jose’s average.
SELECT *
FROM customers
WHERE rating > (
    SELECT AVG(rating)
    FROM customers
    WHERE city = 'San Jose');

---116.  Select the total amount in orders for each salesperson for which the total is greater than the amount of the largest order in the table.
SELECT s.sname, SUM(o.amt)
FROM salespeople s
JOIN orders o ON s.snum = o.snum
GROUP BY s.sname
HAVING SUM(o.amt) > (SELECT MAX(amt) FROM orders);

---117.  Give names and numbers of all salesperson that have more than one customer.
SELECT s.snum, s.sname
FROM salespeople s
JOIN customers c ON s.snum = c.snum
GROUP BY s.snum, s.sname
HAVING COUNT(c.cnum) > 1;

---118.  Select all salesperson by name and numbers who have customers in their city whom they don’s the service.
SELECT DISTINCT s.sname, s.snum
FROM salespeople s
JOIN customers c
ON s.city = c.city
WHERE s.snum <> c.snum;

---119.  Which customers’ rating should be lowered?
SELECT c.cname
FROM customers c
JOIN orders o ON c.cnum = o.cnum
GROUP BY c.cname
HAVING SUM(o.amt) < (SELECT AVG(amt) FROM orders);

---120.  Is there a case for assigning a salesperson to Berlin?
SELECT CASE
WHEN COUNT(*) > 0 THEN 'YES'
ELSE 'NO'
END AS answer
FROM customers
WHERE city = 'Berlin';

---121.  Is there any evidence linking the performance of a salesperson to commission that he or she is being paid?
(Higher commission vs higher sales → evidence)

SELECT s.comm, SUM(o.amt)
FROM salespeople s
JOIN orders o ON s.snum = o.snum
GROUP BY s.comm
ORDER BY s.comm;

---122.  Dose the total amount in orders by customer in Rome and London exceeds the commission paid to salesperson in London and New York by more than 5 times?


---123.  Which is the date, order number, amt and city for each salesperson (byname) for   the maximum order he has obtained?
SELECT s.sname, o.odate, o.onum, o.amt, s.city
FROM salespeople s
JOIN orders o ON s.snum = o.snum
WHERE o.amt = (
    SELECT MAX(amt)
    FROM orders
    WHERE snum = s.snum);

---124.  Which salesperson(s) should be fired?
SELECT *
FROM salespeople
WHERE snum NOT IN (SELECT DISTINCT snum FROM orders);

---125.  What is the total income for the company? 
SELECT SUM(amt) AS total_income
FROM orders;

--++++=======++++++======+++++========++++++++========++++++=======+++++++========+++++++++=========++++++++=======++++++++=====


