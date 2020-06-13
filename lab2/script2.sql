--Thomas Burch
--2/5/16
--CS180_Lab2

--There are six files, one for each table. You can copy
--data from each file into its corresponding table using this command: \copy <table> FROM ’<filename>’.

\copy dv_customer FROM 'dv_customer.data'
\copy dv_address FROM 'dv_address.data'
\copy dv_film FROM 'dv_film.data'

\copy cb_customers FROM 'cb_customers.data'
\copy cb_books FROM 'cb_books.data'
\copy cb_authors FROM 'cb_authors.data'
