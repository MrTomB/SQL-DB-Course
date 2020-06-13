-- Thomas Burch
-- 2/15/16
-- CMPS180-lab3

--mg customers (customer id, first name, last name, email, address id, active)
--is foreign key that references
--dv address (address id, address, address2, district, city id, postal code, phone)
ALTER TABLE mg_customers
ADD CONSTRAINT fk_address_id FOREIGN KEY (address_id) REFERENCES dv_address(address_id);


--cb books (title, author id, edition, publisher)
--is foreign key that references
--cb authors (author id, first name, last name)
ALTER TABLE cb_books
ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES cb_authors(author_id)


