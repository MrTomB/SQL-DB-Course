-- Thomas Burch
-- 2/15/16
-- CMPS180-lab3

DROP VIEW customer_city;
DROP VIEW district_stats;
DROP VIEW renamed_customer_city;

--1. Create a view customer city that contains the first name, last name, email and city id of all people
--who are customers of both Smith Video and Smith Books
CREATE VIEW customer_city AS
SELECT dv_customer.first_name, dv_customer.last_name, dv_customer.email, dv_address.city_id
FROM dv_customer, dv_address, cb_customers
WHERE dv_customer.first_name = cb_customers.first_name
AND   dv_customer.last_name = cb_customers.last_name
AND   dv_customer.address_id = dv_address.address_id 
;

--2. Create a view district stats that contain the district and the number of Smith Video customers living
--in that district (sorted in the ascending order on the number of customers)
CREATE VIEW district_stats AS
SELECT dv_address.district, COUNT(dv_customer.customer_id) 
FROM dv_customer, dv_address
WHERE dv_customer.address_id = dv_address.address_id
GROUP BY dv_address.district
ORDER BY COUNT(dv_customer.customer_id) ASC 
;

--3. Which district has the most number of customers? How many districts have only one customer? (Query
--from the district stats view)

SELECT district_stats.district
FROM district_stats
WHERE district_stats.count
IN (SELECT MAX(district_stats.count)
	FROM district_stats)
;

--How many districts have only one customer? (Query from the district stats view)
SELECT COUNT(district_stats.count)
FROM district_stats
WHERE district_stats.count = 1
;

--4. Alter the name of the customer city view to a new name of your choice
ALTER VIEW customer_city RENAME TO renamed_cutomer_city;

