
-- 1. What are the first and last names and phone numbers of all people who are customers of both Smith
-- Video and Smith Books?

SELECT dv_customer.first_name, dv_customer.last_name, dv_address.phone
FROM dv_customer, cb_customers, dv_address
WHERE       dv_customer.first_name = cb_customers.first_name 
        AND dv_customer.last_name  = cb_customers.last_name
        AND dv_customer.address_id = dv_address.address_id
;


-- 2. How many first edition books are present in Smith Books per publisher? Return publisher names and
-- the number of first edition books per publisher, sorted in descending order.


SELECT cb_books.publisher, count(*) as Count
FROM cb_books
WHERE cb_books.edition = 1
GROUP BY cb_books.publisher
ORDER BY Count DESC
;




-- 3. What are the first and last names of all customers who live in the district having the most customers?


SELECT mg_customers.first_name, mg_customers.last_name
FROM mg_customers, dv_address
WHERE mg_customers.address_id = dv_address.address_id AND dv_address.district IN
        (
            SELECT dv_address.district
            FROM dv_address
            GROUP BY dv_address.district
            ORDER BY count(*) DESC
            LIMIT 1
        )
;


-- 4. What rating is the most common among films in the Smith Video database, and how many films have
-- that rating? (Return both the rating and the number of films in one result.)



SELECT dv_film.rating, count(*) as NumberOfFilms
FROM dv_film
GROUP BY dv_film.rating
ORDER BY NumberOfFilms DESC
LIMIT 1
;



-- 5. What are the first and last names of the top 10 authors when ranked by the number of books each has
-- written? (Return both author name and the number of books of top 10 authors, sorted in descending
-- order)

SELECT cb_author.first_name, cb_author.last_name, count(*)
FROM cb_books, cb_author
WHERE cb_author.author_id = cb_books.author_id
GROUP BY cb_author.first_name, cb_author.last_name
ORDER BY count(*) DESC
LIMIT 10
;

