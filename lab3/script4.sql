-- Thomas Burch
-- 2/15/16
-- CMPS180-lab3

--Unit tests are the key to verifying that your constraints are working precisely as you expect. For every
--foreign key constraint, provide:
--1. A DELETE command the violates the foreign key constraint (and elicits an error).

--ALTER TABLE mg_customers
--ADD CONSTRAINT fk_address_id FOREIGN KEY (address_id) REFERENCES dv_address(address_id);
DELETE from dv_address
WHERE address_id = 1;

--ALTER TABLE cb_books
--ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES cb_authors(author_id)
DELETE from cb_authors
WHERE author_id = 1;


--For every general constraint you add, provide:
--1. An INSERT command that meets the constraint
INSERT into cb_books (title, author_id, edition, publisher)
VALUES ('A', 1, 2, 'B');
-- 2. An INSERT command that violates the constraint (and elicits an error)
INSERT into cb_books (title, author_id, edition, publisher)
VALUES ('A', 1, -2, 'B');
-- error: 
-- 1. The edition of a book must be a positive integer.


--1. An INSERT command that meets the constraint
INSERT into mg_customers (customer_id, first_name, last_name, email, address_id, active)
VALUES (1, 'A', 'B', 'C', 2, 'true');
-- 2. An INSERT command that violates the constraint (and elicits an error)
INSERT into mg_customers (customer_id, first_name, last_name, email, address_id, active)
VALUES (1, 'A', 'B', 'C', NULL, 'true');
--error
--2. A customer record may not have an empty foreign key to the address table.


--1. An INSERT command that meets the constraint
INSERT into dv_address(address_id, address, address2, district, city_id, postal_code, phone)
VALUES (1, 'A','B', 'C', 1, 1, 1);
-- 2. An INSERT command that violates the constraint (and elicits an error)
INSERT into dv_address(address_id, address, address2, district, city_id, postal_code, phone)
VALUES (1, 'A', NULL, 'B', 1, 1, 1);
--error:  
-- 3. An address record may not have an empty address field.


