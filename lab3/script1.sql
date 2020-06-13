-- Thomas Burch
-- 2/15/16
-- CMPS180-lab3

--mg customers (customer id, first name, last name, email, address id, active)
ALTER TABLE mg_customers
ADD CONSTRAINT pk_customer_id PRIMARY KEY (customer_id);

--dv address (address id, address, address2, district, city id, postal code, phone)
ALTER TABLE dv_address
ADD CONSTRAINT pk_address_id PRIMARY KEY (address_id);

--dv film (film id, title, description, length, rating, release year)
ALTER TABLE dv_film
ADD CONSTRAINT pk_film_id PRIMARY KEY (film_id);

--cb books (title, author id, edition, publisher)
ALTER TABLE cb_books
ADD CONSTRAINT pk_cb_books PRIMARY KEY (title, author_id, edition);

--cb authors (author id, first name, last name)
ALTER TABLE cb_authors
ADD CONSTRAINT pk_author_id PRIMARY KEY (author_id);







