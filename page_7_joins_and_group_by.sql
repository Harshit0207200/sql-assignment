
-- Joins:

-- Question 9: Display the title of the movie, customer's first name, and last name who rented it
SELECT f.title AS movie_title, 
       c.first_name AS customer_first_name, 
       c.last_name AS customer_last_name
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id;

-- Question 10: Retrieve the names of all actors who have appeared in the film "Gone with the Wind"
SELECT a.first_name, 
       a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Gone with the Wind';

-- Question 11: Retrieve the customer names along with the total amount they've spent on rentals
SELECT c.first_name, 
       c.last_name, 
       SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

-- Question 12: List the titles of movies rented by each customer in a particular city (e.g., 'London')
SELECT c.first_name, 
       c.last_name, 
       f.title AS movie_title
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
WHERE ct.city = 'London';

-- Advanced Joins and GROUP BY:

-- Question 13: Display the top 5 rented movies along with the number of times they've been rented
SELECT f.title AS movie_title, 
       COUNT(r.rental_id) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id
ORDER BY rental_count DESC
LIMIT 5;

-- Question 14: Determine the customers who have rented movies from both stores (store ID 1 and store ID 2)
SELECT c.customer_id, 
       c.first_name, 
       c.last_name
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE i.store_id = 1
  AND c.customer_id IN (
      SELECT customer_id
      FROM rental r2
      JOIN inventory i2 ON r2.inventory_id = i2.inventory_id
      WHERE i2.store_id = 2
  )
GROUP BY c.customer_id;
