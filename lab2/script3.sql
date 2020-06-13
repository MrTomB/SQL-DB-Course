--Thomas Burch
--2/5/16
--CS180_Lab2

DROP SEQUENCE mg_customers_seq;

--You need to populate the merged tables with data from both the Smith Books and Smith Video databases.
--However, you need to preserve the customer id of the dv customers table. 

INSERT INTO mg_customers (customer_id, first_name, last_name, email, address_id, active)
SELECT dv_customer.customer_id, dv_customer.first_name, dv_customer.last_name, dv_customer.email, dv_customer.address_id, dv_customer.active
FROM dv_customer;

--Create a sequence for the merged table. For simplicity, we hard-code the start of the sequence to start just
--after the highest respective values already in the merged table:

CREATE SEQUENCE mg_customers_seq START 600;

--Then ensure that the id attribute in the merged table uses the sequence to generate values:

ALTER TABLE mg_customers
ALTER COLUMN customer_id
SET DEFAULT NEXTVAL('mg_customers_seq');

-- (Hint: Select the first and last names of all Smith Books
--customers. Separately, select all Smith Books and Smith Video customers whose first and last names together
--do match. Then use the EXCEPT keyword to find the difference of the two sets.)

INSERT INTO mg_customers (first_name, last_name)
SELECT cb_customers.first_name, cb_customers.last_name
FROM cb_customers
EXCEPT
SELECT dv_customer.first_name, dv_customer.last_name
FROM dv_customer, cb_customers
WHERE dv_customer.first_name = cb_customers.first_name AND dv_customer.last_name = cb_customers.last_name;

