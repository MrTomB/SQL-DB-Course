--Thomas Burch
--2/5/16
--CS180_Lab2

DROP TABLE dv_customer;
DROP TABLE dv_address;
DROP TYPE mpaa_rating;
DROP TABLE dv_film;
DROP TABLE cb_customers;
DROP TABLE cb_books;
DROP TABLE cb_authors;
DROP TABLE mg_customers;

--For id attributes, use integer. For first names, last names, email, film title, publisher and all address-related
--fields, use character varying(50). For the active attribute, which indicates whether a customer has an
--active account, use boolean. For film description, use text. For film length, release year and book edition,
--use smallint.

CREATE TABLE dv_customer (
    customer_id integer,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(50),
    address_id integer,
    active boolean
);

CREATE TABLE dv_address (
    address_id integer,
    address character varying(50),
    address2 character varying(50),
    district character varying(50),
    city_id character varying(50),
    postal_code character varying(50),
    phone character varying(50)
);

--For film rating, create the following enumerated type. Make sure to put this command immediately before
--the command to create the dv film table.

CREATE TYPE mpaa_rating AS ENUM (
    'G',
    'PG',
    'PG-13',
    'R',
    'NC-17'
);

CREATE TABLE dv_film (
    film_id integer,
    title character varying(50),
    description text,
    length smallint,
    rating character varying(50),
    release_year smallint
);

CREATE TABLE cb_customers(
    last_name character varying(50),
    first_name character varying(50)
);

CREATE TABLE cb_books(
    title character varying(50),
    author_id integer,
    edition smallint,
    publisher character varying(50)
);

CREATE TABLE cb_authors(
    author_id integer,
    first_name character varying(50),
    last_name character varying(50)
);

CREATE TABLE mg_customers(
    customer_id integer,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(50),
    address_id integer,
    active boolean
);

