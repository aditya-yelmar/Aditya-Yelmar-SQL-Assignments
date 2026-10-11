-- SQL Assignment Portfolio
-- Prepared for: Tusher Nikam
-- Topic: SQL practice, queries, joins, aggregation, and database management

----========================GARAGE SYSTEM TABLES===============================
1] CUSTOMER TABLE 

CREATE TABLE customer (
    CID     NUMBER PRIMARY KEY,
    CNAME   VARCHAR2(30),
    CADD    VARCHAR2(20),
    C_CONTACT  NUMBER,
      C_CREDITDAYS NUMBER,
      CJ_DATE DATE,
      SEX VARCHAR2 (30));

SELECT * FROM CUSTOMER;
DROP TABLE CUSTOMER;

INSERT INTO customer VALUES
(1001, 'Cyona Blake', 'NEW YORK', 1235684, 20, TO_DATE('20-Jan-2011','DD-Mon-YYYY'), 'FEMALE');

INSERT INTO customer VALUES
(1002, 'JOHN SMITH', 'NEW JERSI', 1341684, 20, TO_DATE('21-Feb-2011','DD-Mon-YYYY'), 'MALE');

INSERT INTO customer VALUES
(1003, 'JORDAN WOOD', 'PRAG', 1805184, 20, TO_DATE('22-Mar-2011','DD-Mon-YYYY'), 'MALE');

INSERT INTO customer VALUES
(1004, 'CHRISTNA', 'MANHATTON', 1125684, 31, TO_DATE('23-Apr-2013','DD-Mon-YYYY'), 'FEMALE');

INSERT INTO customer VALUES
(1005, 'TOM HILL', 'LONDON', 1239284, 10, TO_DATE('25-Jun-2015','DD-Mon-YYYY'), 'MALE');

INSERT INTO customer VALUES
(1006, 'KAMILA JOSEF', 'PARISE', 124568, 9, TO_DATE('28-Jul-2011','DD-Mon-YYYY'), 'FEMALE');

INSERT INTO customer VALUES
(1007, 'ANDRU SYMON', 'TAXES', 125654, 15, TO_DATE('01-Apr-2016','DD-Mon-YYYY'), 'MALE');

INSERT INTO customer VALUES
(1008, 'SANJU SAMSUNG', 'NEW YORK', 12346341, 4, TO_DATE('20-Jan-2016','DD-Mon-YYYY'), 'MALE');
--VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
---------create table VENDORS TABLE--------------------------------
CREATE TABLE VENDORS (
VID NUMBER PRIMARY KEY ,
VNAME VARCHAR2(30),
VADD VARCHAR2 (30),
VCONTACT NUMBER,
VCREDITDAYS NUMBER,
VJ_DATE DATE);

SELECT * FROM VENDORS;

INSERT INTO vendors VALUES
(2001, 'KIRAN PATIL', 'PUNE', 20535535, 20, TO_DATE('20-Jan-2010','DD-Mon-YYYY'));

INSERT INTO vendors VALUES
(2002, 'PRAKASH JAIN', 'MUMBAI', 2063564, 10, TO_DATE('05-Nov-2011','DD-Mon-YYYY'));

INSERT INTO vendors VALUES
(2003, 'SWAPNIL THETE', 'NASHIK', 25355352, 15, TO_DATE('18-Mar-2010','DD-Mon-YYYY'));

INSERT INTO vendors VALUES
(2004, 'AMOL SHENDE', 'SATARA', 23674776, 18, TO_DATE('07-Apr-2015','DD-Mon-YYYY'));

INSERT INTO vendors VALUES
(2005, 'KARAN SINTRE', 'BULDHANA', 256756, 30, TO_DATE('22-Apr-2009','DD-Mon-YYYY'));

INSERT INTO vendors VALUES
(2006, 'RAM KULKARNI', 'OSMANABAD', 20367454, 21, TO_DATE('09-Jul-2010','DD-Mon-YYYY'));
--VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
--------------CREATE TABLE EMPLOYEE-------------------

CREATE TABLE EMPLOYEES (
    eid        NUMBER PRIMARY KEY,
    ename      VARCHAR2(40),
    ejob       VARCHAR2(20),
    eadd       VARCHAR2(30),
    econtact   NUMBER,
    esal       NUMBER,
    edoj       DATE,
    edol       DATE);
    
    select * from employees;

INSERT INTO employeeS VALUES
(3001, 'STEVEN KING', 'PAINTER', 'NEW YORK', 10367454, 1200,
 TO_DATE('09-Jul-2010','DD-Mon-YYYY'), NULL);

INSERT INTO employees VALUES
(3002, 'DAVID AUSTIN', 'FITTER', 'MAN HATON', 10367434, 1100,
 TO_DATE('19-Aug-2010','DD-Mon-YYYY'), NULL);

INSERT INTO employees VALUES
(3003, 'BRUCE ERNST', 'MECHANIC', 'NEW JERCY', 10367264, 2200,
 TO_DATE('08-Sep-2010','DD-Mon-YYYY'), NULL);

INSERT INTO employees VALUES
(3004, 'LUIS POPP', 'MECHANIC', 'NEW JERCY', 10367264, 1700,
 TO_DATE('19-Oct-2009','DD-Mon-YYYY'),
 TO_DATE('06-Sep-2010','DD-Mon-YYYY'));

INSERT INTO employees VALUES
(3005, 'SHERI GOMES', 'FITTER', 'PARIS', 10327264, 1000,
 TO_DATE('19-Oct-2009','DD-Mon-YYYY'),
 TO_DATE('01-Aug-2010','DD-Mon-YYYY'));

INSERT INTO employees VALUES
(3000, 'JAMES PHILLIP', 'FITTER', 'PARIS', 10322264, NULL,
 TO_DATE('01-Jan-2008','DD-Mon-YYYY'), NULL);
---vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
--------------------create table SPAREPART -----------------------------------------
CREATE TABLE sparepart (
    spid     NUMBER PRIMARY KEY,
    spname   VARCHAR2(60),
    sprate   NUMBER,
    spunit   VARCHAR2(10));

select * from sparepart ;

INSERT INTO sparepart VALUES (4001, 'TWO WHEELER TUBE', 250, 'NOS');
INSERT INTO sparepart VALUES (4002, 'TWO WHEELER ENGINE OIL', 400, 'LTRS');
INSERT INTO sparepart VALUES (4003, 'FOUR WHEELER ENGINE OIL', 5000, 'LTRS');
INSERT INTO sparepart VALUES (4004, 'TWO WHEELER CARBORATOR', 680, 'NOS');
INSERT INTO sparepart VALUES (4005, 'TWO WHEELER CLUTCH WIRE', 129, 'MTRS');
INSERT INTO sparepart VALUES (4006, 'TWO WHEELER TAIL LIGHT', 100, 'NOS');
INSERT INTO sparepart VALUES (4007, 'TWO WHEELER INDICATORS', 150, 'NOS');
INSERT INTO sparepart VALUES (4008, 'FOUR WHEELER GASKIT', 1340, 'NOS');
INSERT INTO sparepart VALUES (4009, 'WHITE COLOUR', 340, 'LTRS');
INSERT INTO sparepart VALUES (4010, 'BLACK COLOUR', 240, 'LTRS');
INSERT INTO sparepart VALUES (4011, 'TWO WHEELER SIDE MIRROR', 250, 'NOS');
INSERT INTO sparepart VALUES (4012, 'FOUR WHEELER SIDE MIRROR', 450, 'NOS');
INSERT INTO sparepart VALUES (4013, 'TWO WHEELER SHOCKUP', 1320, 'PAIR');
INSERT INTO sparepart VALUES (4014, 'FOUR WHEELER BUMPER', 6000, 'NOS');
INSERT INTO sparepart VALUES (4015, 'FOUR WHEELER FRONT GLASS', 7000, 'PCS');
---vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
----------CREATE PURCHASE TABLE------------------------------------------------------------
CREATE TABLE purchase (
    pid        NUMBER PRIMARY KEY,
    vid        NUMBER,
    spid       NUMBER,
    pqty       NUMBER,
    sprate     NUMBER,
    spgst      NUMBER,
    pdate      DATE,
    trancost   NUMBER,
    total      NUMBER,
    rcv_eid    NUMBER,

    CONSTRAINT fk_purchase_vendor
        FOREIGN KEY (vid)
        REFERENCES vendors(vid),

    CONSTRAINT fk_purchase_sparepart
        FOREIGN KEY (spid)
        REFERENCES sparepart(spid),

    CONSTRAINT fk_purchase_employees
        FOREIGN KEY (rcv_eid)
        REFERENCES employeeS(eid));


select * from Purchase;

INSERT INTO purchase VALUES
(5001, 2001, 4001, 10, 250, 350, TO_DATE('01-Jan-2011','DD-Mon-YYYY'), 1300, 4150, 3001);

INSERT INTO purchase VALUES
(5002, 2002, 4002, 4, 400, 288, TO_DATE('02-Mar-2011','DD-Mon-YYYY'), 100, 1988, 3001);

INSERT INTO purchase VALUES
(5003, 2003, 4004, 8, 680, 761.6, TO_DATE('12-Jun-2011','DD-Mon-YYYY'), 50, 6251.6, 3003);

INSERT INTO purchase VALUES
(5004, 2004, 4005, 10, 129, 154.8, TO_DATE('22-Aug-2011','DD-Mon-YYYY'), 125, 1569.8, 3004);

INSERT INTO purchase VALUES
(5005, 2005, 4006, 20, 100, 300, TO_DATE('07-Sep-2011','DD-Mon-YYYY'), 20, 2320, 3003);

INSERT INTO purchase VALUES
(5006, 2006, 4007, 30, 150, 630, TO_DATE('12-Oct-2011','DD-Mon-YYYY'), 60, 5190, 3000);

INSERT INTO purchase VALUES
(5007, 2001, 4003, 20, 5000, 14000, TO_DATE('07-Sep-2011','DD-Mon-YYYY'), 1000, 115000, 3000);

INSERT INTO purchase VALUES
(5008, 2006, 4005, 1, 129, 15.48, TO_DATE('12-Oct-2011','DD-Mon-YYYY'), 50, 194.48, 3005);

INSERT INTO purchase VALUES
(5009, 2006, 4005, 1, 129, 15.48, TO_DATE('15-Oct-2011','DD-Mon-YYYY'), 50, 194.48, 3005);

INSERT INTO purchase VALUES
(5010, 2006, 4009, 5, 340, 238, TO_DATE('20-Oct-2011','DD-Mon-YYYY'), 0, 2938, 3005);

---vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
-----CREATE TABLE SER_DET TABLE-------------------------------------------
CREATE TABLE ser_det (
    sid        NUMBER PRIMARY KEY,
    cid        NUMBER,
    eid        NUMBER,
    spid       NUMBER,
    typ_veh    VARCHAR2(20),
    veh_no     VARCHAR2(15),
    typ_ser    VARCHAR2(30),
    ser_date   DATE,
    qty        NUMBER,
    sp_rate    NUMBER,
    sp_amt     NUMBER,
    sp_gst     NUMBER,
    ser_amt    NUMBER,
    comm       NUMBER,
    total      NUMBER,

    CONSTRAINT fk_ser_customer
        FOREIGN KEY (cid)
        REFERENCES customer(cid),

    CONSTRAINT fk_ser_employees
        FOREIGN KEY (eid)
        REFERENCES employees(eid),

    CONSTRAINT fk_ser_sparepart
        FOREIGN KEY (spid)
        REFERENCES sparepart(spid));

select * from SER_DET;

INSERT INTO ser_det VALUES
(6001, 1001, 3001, 4001, 'TWO WHEELER', 'MH15CA3228', 'TUBE DAMAGED',
 TO_DATE('02-Jan-2011','DD-Mon-YYYY'),
 1, 250, 250, 35, 50, 0, 335);

INSERT INTO ser_det VALUES
(6002, 1002, 3002, 4002, 'TWO WHEELER', 'MH16US713', 'FULL SERVICING',
 TO_DATE('04-Mar-2011','DD-Mon-YYYY'),
 1, 400, 400, 52, 300, 50, 752);

INSERT INTO ser_det VALUES
(6003, 1003, 3004, 4005, 'TWO WHEELER', 'MH12PQ1313', 'CLUTCH WIRE',
 TO_DATE('22-Aug-2011','DD-Mon-YYYY'),
 1, 129, 129, 0, 10, 0, 139);

INSERT INTO ser_det VALUES
(6004, 1002, 3002, 4002, 'TWO WHEELER', 'MH16US713', 'FULL SERVICING',
 TO_DATE('05-May-2011','DD-Mon-YYYY'),
 1, 400, 400, 52, 300, 50, 752);

INSERT INTO ser_det VALUES
(6005, 1004, 3001, 4009, 'TWO WHEELER', 'MH14PA335', 'COLOR',
 TO_DATE('21-Oct-2011','DD-Mon-YYYY'),
 2.5, 340, 850, 119, 500, 150, 1469);

INSERT INTO ser_det VALUES
(6006, 1006, 3001, 4009, 'TWO WHEELER', 'MH12WE334', 'COLOR',
 TO_DATE('01-Dec-2011','DD-Mon-YYYY'),
 2.5, 340, 850, 119, 500, 150, 1469);

INSERT INTO ser_det VALUES
(6007, 1007, 3001, 4001, 'FOUR WHEELER', 'MH17BB1345', 'TUBE DAMAGED',
 TO_DATE('01-Jan-2012','DD-Mon-YYYY'),
 1, 250, 250, 35, 150, 0, 435);
--VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
=============================================================================================================
--======================Garage System Questions==============================================

--Q.1 List all the customers serviced.

SELECT DISTINCT C.CNAME
FROM CUSTOMER C
JOIN SER_DET S
ON C.CID = S.CID;

---Q.2 Customers who are not serviced.
SELECT cname
FROM customer
WHERE cid NOT IN (SELECT cid FROM ser_det);

---Q.3 Employees who have not received the commission.
SELECT DISTINCT e.ename
FROM employees e
JOIN ser_det s ON e.eid = s.eid
WHERE NVL(s.comm,0) = 0;

---Q.4 Name the employee who have maximum Commission.
SELECT ename
FROM employees e
JOIN ser_det s ON e.eid = s.eid
GROUP BY ename
HAVING SUM(comm) = (SELECT MAX(SUM(comm)) FROM ser_det GROUP BY eid);

---Q.5 Show employee name and minimum commission amount received by an employee.
SELECT e.ename, MIN(s.comm)
FROM employees e
JOIN ser_det s ON e.eid = s.eid
GROUP BY e.ename;

---Q6. Middle record from any table (SER_DET)
SELECT *
FROM ser_det
WHERE sid = (SELECT MEDIAN(sid) FROM ser_det);

---Q7. Last 4 records
------fetch not work in sql---------------
SELECT *
FROM ser_det
ORDER BY sid DESC
FETCH FIRST 4 ROWS ONLY;

----Q8. Count records without COUNT
SELECT MAX(ROWNUM) FROM ser_det;

----Q9. Delete duplicate records on CID (rollback after)
DELETE FROM ser_det
WHERE ROWID NOT IN (
  SELECT MIN(ROWID)
  FROM ser_det
  GROUP BY cid
);
ROLLBACK;

---Q10. Customer who paid maximum amount

SELECT * FROM ser_det;
SELECT MAX(total) FROM ser_det;

SELECT c.cname
FROM customer c
JOIN ser_det s ON c.cid = s.cid
WHERE NVL(s.total,0) = (
    SELECT MAX(NVL(total,0)) FROM ser_det
);

---Q11. Employees not currently working
SELECT ename
FROM employees
WHERE EDOL IS NOT NULL;

select * from employees;

SELECT ename
FROM employees
WHERE edol IS NOT NULL
AND TRIM(edol) IS NOT NULL;

SELECT column_name
FROM user_tab_columns
WHERE table_name = 'EMPLOYEES';

---Q12. Customers serviced two wheelers
SELECT COUNT(DISTINCT cid)
FROM ser_det
WHERE typ_veh = 'TWO WHEELER';

---Q13. Purchased items used in service with unit
SELECT DISTINCT sp.spname, sp.spunit
FROM sparepart sp
JOIN ser_det s ON sp.spid = s.spid;

---Q14. Customers who colored vehicles
SELECT DISTINCT c.cname
FROM customer c
JOIN ser_det s ON c.cid = s.cid
WHERE s.typ_ser = 'COLOR';

---Q15. Annual income of each employee (salary + commission)
SELECT e.ename,
       (NVL(e.esal,0)*12 + NVL(SUM(s.comm),0)) AS annual_income
FROM employees e
LEFT JOIN ser_det s ON e.eid = s.eid
GROUP BY e.ename, e.esal;

---Q16. Vendors who provide engine oil
SELECT DISTINCT v.vname
FROM vendors v
JOIN purchase p ON v.vid = p.vid
JOIN sparepart s ON p.spid = s.spid
WHERE s.spname LIKE '%ENGINE OIL%';

---Q17. Total cost of Color & color name
SELECT sp.spname, SUM(p.total)
FROM purchase p
JOIN sparepart sp ON p.spid = sp.spid
WHERE sp.spname LIKE '%COLOUR%'
GROUP BY sp.spname;

---Q18. Purchased items not used in service
SELECT DISTINCT spname
FROM sparepart
WHERE spid IN (SELECT spid FROM purchase)
AND spid NOT IN (SELECT spid FROM ser_det);

---Q19. Spareparts not purchased
SELECT spname
FROM sparepart
WHERE spid NOT IN (SELECT spid FROM purchase);

---Q20. Profit/Loss

Profit/Loss = Total Service Income − (Total Purchase Cost + Total Employee Salary)
SELECT
(SELECT SUM(total) FROM ser_det)
-
((SELECT SUM(total) FROM purchase) +
 (SELECT SUM(NVL(esal,0)) FROM employees)) AS profit_loss
FROM dual;

SELECT
   (SELECT SUM(NVL(total,0)) FROM ser_det)
 - (SELECT SUM(NVL(total,0)) FROM purchase)
 - (SELECT SUM(NVL(esal,0)) FROM employees) AS profit_loss
FROM ser_det
WHERE ROWNUM = 1;

select * from employees;

---Q21. Customers serviced more than once
SELECT c.cname
FROM customer c
JOIN ser_det s ON c.cid = s.cid
GROUP BY c.cname
HAVING COUNT(*) > 1;

Q22. Items purchased location-wise
SELECT v.vadd, sp.spname
FROM vendors v
JOIN purchase p ON v.vid = p.vid
JOIN sparepart sp ON p.spid = sp.spid;

Q23. Count two & four wheelers
SELECT typ_veh, COUNT(*)
FROM ser_det
GROUP BY typ_veh;

Q24. Customer who paid highest SPGST & item
SELECT c.cname, sp.spname
FROM ser_det s
JOIN customer c ON s.cid = c.cid
JOIN sparepart sp ON s.spid = sp.spid
WHERE s.sp_gst = (SELECT MAX(sp_gst) FROM ser_det);

---Q25. Vendor charged highest SPGST item
SELECT v.vname, sp.spname
FROM purchase p
JOIN vendors v ON p.vid = v.vid
JOIN sparepart sp ON p.spid = sp.spid
WHERE p.spgst = (SELECT MAX(spgst) FROM purchase);

--Q26. Item name & employee name
SELECT sp.spname, e.ename
FROM ser_det s
JOIN sparepart sp ON s.spid = sp.spid
JOIN employees e ON s.eid = e.eid;

---Q27. Full details for vehicle MH-14PA335
SELECT c.cname, s.veh_no, sp.spname, p.pdate,
       sp.spunit, v.vadd, e.ename
FROM ser_det s
JOIN customer c ON s.cid=c.cid
JOIN sparepart sp ON s.spid=sp.spid
JOIN purchase p ON sp.spid=p.spid
JOIN vendors v ON p.vid=v.vid
JOIN employees e ON s.eid=e.eid
WHERE s.veh_no='MH14PA335';

---Q28. Owner of vehicle MH-14PA335
SELECT cname
FROM customer c
JOIN ser_det s ON c.cid=s.cid
WHERE veh_no='MH14PA335';

---Q29. New York customers & service date
SELECT cname, ser_date
FROM customer c
JOIN ser_det s ON c.cid=s.cid
WHERE c.cadd='NEW YORK';

---Q30. From whom purchased maximum cost
SELECT v.vname
FROM vendors v
JOIN purchase p ON v.vid=p.vid
WHERE p.total=(SELECT MAX(total) FROM purchase);

---Q31. Employees not mechanic but serviced
SELECT DISTINCT e.ename
FROM employees e
JOIN ser_det s ON e.eid=s.eid
WHERE e.ejob <> 'MECHANIC';

---Q32. Jobs with more than two employees
SELECT ejob, COUNT(*)
FROM employees
GROUP BY ejob
HAVING COUNT(*) > 2;

---Q33. Employees ranked by services
SELECT eid, COUNT(*) services,
RANK() OVER (ORDER BY COUNT(*) DESC) rnk
FROM ser_det
GROUP BY eid;

---Q34. Painter & fitter service count
SELECT e.ejob, COUNT(s.sid)
FROM employees e
JOIN ser_det s ON e.eid=s.eid
WHERE e.ejob IN ('PAINTER','FITTER')
GROUP BY e.ejob;

---Q35. Salary grade
SELECT ename, esal,
CASE
WHEN esal >= 2000 THEN 'A'
WHEN esal >= 1500 THEN 'B'
WHEN esal >= 1000 THEN 'C'
ELSE 'D'
END grade
FROM employees;

---Q36. 4th record (no rowid / group by)
SELECT *
FROM (
  SELECT e.*, ROW_NUMBER() OVER (ORDER BY eid) rn
  FROM employees e)
WHERE rn=4;

---Q37. Give commission 100 where zero
UPDATE ser_det SET comm=100 WHERE NVL(comm,0)=0;

---Q38. Total services per day
SELECT ser_date, COUNT(*)
FROM ser_det
GROUP BY ser_date
ORDER BY COUNT(*) DESC;

---Q39. Services of customers from same city
SELECT *
FROM ser_det s
JOIN customer c ON s.cid=c.cid
WHERE c.cadd IN (
  SELECT cadd FROM customer GROUP BY cadd HAVING COUNT(*)>1);

---Q40. Customers serviced by same employee
SELECT a.cname, b.cname, s1.eid
FROM ser_det s1
JOIN ser_det s2 ON s1.eid=s2.eid AND s1.cid<s2.cid
JOIN customer a ON s1.cid=a.cid
JOIN customer b ON s2.cid=b.cid;

---Q41. Service number with customer name
SELECT sid, cname
FROM ser_det s
JOIN customer c ON s.cid=c.cid;

---Q42. Employee rating by services
SELECT eid,
CASE
WHEN COUNT(*)>=6 THEN 'A'
WHEN COUNT(*)>=4 THEN 'B'
WHEN COUNT(*)>=2 THEN 'C'
ELSE 'D'
END rating
FROM ser_det
GROUP BY eid;

---Q43. Max service amount per customer
SELECT c.cid, MAX(s.total)
FROM customer c
JOIN ser_det s ON c.cid=s.cid
GROUP BY c.cid, c.cname, c.cadd;

---Q44. Customer with total services
SELECT c.cname, COUNT(s.sid)
FROM customer c
LEFT JOIN ser_det s ON c.cid=s.cid
GROUP BY c.cname;

---Q45. Location sparepart purchased highest cost
SELECT v.vadd
FROM vendors v
JOIN purchase p ON v.vid=p.vid
WHERE p.total=(SELECT MAX(total) FROM purchase);

---Q46. Employee with null salary & services

SELECT DISTINCT e.ename
FROM employees e
LEFT JOIN ser_det s
ON e.eid = s.eid
WHERE e.esal IS NULL;

---Q47. Sum purchase location-wise
SELECT v.vadd, SUM(p.total)
FROM vendors v
JOIN purchase p ON v.vid=p.vid
GROUP BY v.vadd;

---Q48. Sum purchase amount in words (concept)
SELECT v.vadd, SUM(p.total) FROM vendors v JOIN purchase p ON v.vid=p.vid GROUP BY v.vadd;

---Q49. Highest spender got highest rating
SELECT c.cname
FROM customer c
JOIN ser_det s ON c.cid = s.cid
GROUP BY c.cname
HAVING SUM(s.total) = (
  SELECT MAX(SUM(total)) FROM ser_det GROUP BY cid
);

---Q50. Customers whose total > max service
SELECT cid, SUM(total)
FROM ser_det
GROUP BY cid
HAVING SUM(total) > (SELECT MAX(total) FROM ser_det);

---Q51. Customer, sparepart, vehicle type
SELECT c.cname, sp.spname, s.typ_veh
FROM ser_det s
JOIN customer c ON s.cid=c.cid
JOIN sparepart sp ON s.spid=sp.spid;

---Q52. spname, ename, cname, qty, rate, service amt
SELECT sp.spname, e.ename, c.cname,
       s.qty, s.sp_rate, s.total
FROM ser_det s
JOIN sparepart sp ON s.spid=sp.spid
JOIN employees e ON s.eid=e.eid
JOIN customer c ON s.cid=c.cid;

---Q53. Vehicle owners with tube damaged
SELECT cname
FROM customer c
JOIN ser_det s ON c.cid=s.cid
WHERE s.typ_ser='TUBE DAMAGED';

---Q54. Full service details
SELECT * FROM ser_det WHERE typ_ser='FULL SERVICING';

---Q55. Employees not worked & left job
SELECT * FROM employees
WHERE eid NOT IN (SELECT eid FROM ser_det)
AND edol IS NOT NULL;

---Q56. First employee worked
SELECT * FROM employee
WHERE edoj = (SELECT MIN(edoj) FROM employee);

---Q57. Records on odd date
SELECT * FROM ser_det WHERE MOD(TO_CHAR(ser_date,'DD'),2)=1;

---Q58. Records on even date
SELECT * FROM ser_det WHERE MOD(TO_CHAR(ser_date,'DD'),2)=0;

---Q59. Vendors whose material not used
SELECT vname
FROM vendors
WHERE vid IN (SELECT vid FROM purchase)
AND vid NOT IN (
  SELECT p.vid FROM purchase p JOIN ser_det s ON p.spid=s.spid);

---Q60. Difference between purchase & service date
SELECT s.sid, (s.ser_date - p.pdate) AS days_diff
FROM ser_det s
JOIN purchase p ON s.spid=p.spid;






