
-- 1. Create the employees table with constraints
CREATE TABLE employees (
  emp_id INT NOT NULL PRIMARY KEY,
  emp_name VARCHAR(255) NOT NULL,
  age INT CHECK (age >= 18),
  email VARCHAR(255) UNIQUE,
  salary DECIMAL(10,2) DEFAULT 30000.00
);

-- 2. Explanation of constraints (Comments used for explanation)
-- Constraints enforce rules on data, ensuring accuracy and reliability.
-- Common constraints: NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK, DEFAULT.

-- 3. NOT NULL ensures that a column cannot have NULL values.
-- A PRIMARY KEY uniquely identifies each record and cannot be NULL.

-- 4. Adding and Removing Constraints
ALTER TABLE employees ADD CONSTRAINT chk_age CHECK (age >= 18);
ALTER TABLE employees DROP CONSTRAINT chk_age;

-- 5. Constraint Violation Example
-- Attempting to insert an employee younger than 18 will cause an error.
-- ERROR: CHECK constraint failed: employees
INSERT INTO employees (emp_id, emp_name, age, email, salary)
VALUES (2, 'John Doe', 17, 'john@example.com', 40000);

-- 6. Altering the products table to add constraints
ALTER TABLE products ADD PRIMARY KEY (product_id);
ALTER TABLE products ALTER COLUMN price SET DEFAULT 50.00;

-- 7. Fetch student_name and class_name using INNER JOIN
SELECT students.student_name, classes.class_name
FROM students
INNER JOIN classes ON students.class_id = classes.class_id;

-- 8. Fetch all order_id, customer_name, and product_name, ensuring all products are listed
SELECT orders.order_id, customers.customer_name, products.product_name
FROM products
LEFT JOIN orders ON products.product_id = orders.product_id
LEFT JOIN customers ON orders.customer_id = customers.customer_id;

-- 9. Total sales amount per product using SUM() and INNER JOIN
SELECT products.product_name, SUM(orders.amount) AS total_sales
FROM orders
INNER JOIN products ON orders.product_id = products.product_id
GROUP BY products.product_name;

-- 10. Fetch order_id, customer_name, and quantity of products ordered
SELECT orders.order_id, customers.customer_name, order_details.quantity
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id
INNER JOIN order_details ON orders.order_id = order_details.order_id;

-- 11. Identify primary and foreign keys in Maven Movies DB
-- Primary keys uniquely identify records; foreign keys link tables together.

-- 12. List all details of actors
SELECT * FROM actors;

-- 13. List all customer information
SELECT * FROM customers;

-- 14. List different countries
SELECT DISTINCT country FROM addresses;

-- 15. Display all active customers
SELECT * FROM customers WHERE active = 1;

-- 16. List all rental IDs for customer with ID 1
SELECT rental_id FROM rentals WHERE customer_id = 1;

-- 17. Display all films with rental duration greater than 5
SELECT * FROM films WHERE rental_duration > 5;

-- 18. Count of films with replacement cost between $15 and $20
SELECT COUNT(*) FROM films WHERE replacement_cost BETWEEN 15 AND 20;

-- 19. Count unique first names of actors
SELECT COUNT(DISTINCT first_name) FROM actors;

-- 20. Display first 10 customer records
SELECT * FROM customers LIMIT 10;

-- 21. Display first 3 customers whose name starts with 'B'
SELECT * FROM customers WHERE first_name LIKE 'B%' LIMIT 3;

-- 22. Display first 5 movies rated 'G'
SELECT title FROM films WHERE rating = 'G' LIMIT 5;

-- 23. Find customers whose first name starts with 'A'
SELECT * FROM customers WHERE first_name LIKE 'A%';

-- 24. Find customers whose first name ends with 'A'
SELECT * FROM customers WHERE first_name LIKE '%A';

-- 25. Display first 4 cities starting and ending with 'A'
SELECT city FROM cities WHERE city LIKE 'A%A' LIMIT 4;

-- 26. Find customers whose first name contains 'NI'
SELECT * FROM customers WHERE first_name LIKE '%NI%';

-- 27. Find customers whose second letter in first name is 'R'
SELECT * FROM customers WHERE first_name LIKE '_R%';

-- 28. Find customers whose first name starts with 'A' and is at least 5 characters long
SELECT * FROM customers WHERE first_name LIKE 'A%' AND LENGTH(first_name) >= 5;

-- 29. Find customers whose first name starts with 'A' and ends with 'O'
SELECT * FROM customers WHERE first_name LIKE 'A%O';

-- 30. Get films with PG and PG-13 ratings
SELECT * FROM films WHERE rating IN ('PG', 'PG-13');

-- 31. Get films with length between 50 and 100
SELECT * FROM films WHERE length BETWEEN 50 AND 100;

-- 32. Get top 50 actors using LIMIT
SELECT * FROM actors LIMIT 50;

-- 33. Get distinct film IDs from inventory
SELECT DISTINCT film_id FROM inventory;
