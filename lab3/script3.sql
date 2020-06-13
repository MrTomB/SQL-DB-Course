-- Thomas Burch
-- 2/15/16
-- CMPS180-lab3

--1. The edition of a book must be a positive integer.
--Note: You will need to give a name to this constraint when you create it. For this constraint,
--an example of a name is edition number, but you may use another name.
ALTER TABLE cb_books
ADD CONSTRAINT pos_edition CHECK (edition > 0);

--2. A customer record may not have an empty foreign key to the address table.
--Note: Before adding this constraint, you will need to set the address id for every customer
--record where it is NULL. You are can set it to the address id of an existing address record,
--or create a new address record. Include this as part of your script.
UPDATE mg_customers SET address_id = 1 WHERE address_id is NULL;

ALTER TABLE mg_customers
ADD CONSTRAINT not_null_mg_addr CHECK (address_id is NOT NULL);

--3. An address record may not have an empty address field.
ALTER TABLE dv_address
ADD CONSTRAINT not_empt_dv_addr CHECK (address is NOT NULL);

