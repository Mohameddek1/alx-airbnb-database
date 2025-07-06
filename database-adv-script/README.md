# Join Queries – Advanced SQL (ALX Airbnb Database Project)

This README provides a description of the SQL join queries implemented for Task 0 of the **Unleashing Advanced Querying Power** project in the ALX Airbnb Database Module.

## 🔗 1. INNER JOIN – Bookings and Users

**Objective:** Retrieve all bookings and the respective users who made them.

```sql
SELECT
  bookings.id AS booking_id,
  bookings.property_id,
  bookings.start_date,
  bookings.end_date,
  users.id AS user_id,
  users.name AS user_name,
  users.email
FROM
  bookings
INNER JOIN users ON bookings.user_id = users.id;
```

✅ This query returns only the bookings that are linked to users. If a booking doesn't have a user, it will not appear.

---

## 🏠 2. LEFT JOIN – Properties and Reviews

**Objective:** Retrieve all properties and their reviews, including properties that have no reviews.

```sql
SELECT
  properties.id AS property_id,
  properties.name AS property_name,
  reviews.id AS review_id,
  reviews.rating,
  reviews.comment
FROM
  properties
LEFT JOIN reviews ON properties.id = reviews.property_id;
```

✅ This query includes every property, even if it has no reviews. Review fields will be `NULL` for those properties.

---

## 🌍 3. FULL OUTER JOIN – Users and Bookings

**Objective:** Retrieve all users and all bookings, even if they are not linked.

### For PostgreSQL:

```sql
SELECT
  users.id AS user_id,
  users.name AS user_name,
  bookings.id AS booking_id,
  bookings.property_id,
  bookings.start_date,
  bookings.end_date
FROM
  users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;
```

### For MySQL (alternative using UNION):

```sql
SELECT
  users.id AS user_id,
  users.name AS user_name,
  bookings.id AS booking_id,
  bookings.property_id,
  bookings.start_date,
  bookings.end_date
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id

UNION

SELECT
  users.id AS user_id,
  users.name AS user_name,
  bookings.id AS booking_id,
  bookings.property_id,
  bookings.start_date,
  bookings.end_date
FROM bookings
LEFT JOIN users ON users.id = bookings.user_id;
```

✅ This ensures that you see all users and all bookings, even if a user has never booked or a booking isn't linked to a user.

---

## 📁 File Information

* **File name:** `joins_queries.sql`
* **Location:** `alx-airbnb-database/database-adv-script/`
* **Queries Included:**

  * INNER JOIN for bookings and users
  * LEFT JOIN for properties and reviews
  * FULL OUTER JOIN for users and bookings (with UNION alternative for MySQL)

---

These join queries showcase powerful relational data analysis techniques essential for working with normalized database structures. Run each query to verify correctness against the Airbnb schema and analyze their effect on result sets.

---

# Subquery Practice – Advanced SQL (ALX Airbnb Database Project)

This README describes the subqueries implemented for Task 1 of the **Unleashing Advanced Querying Power** project from the ALX Airbnb Database Module.

## 🧪 1. Non-Correlated Subquery – Properties with High Average Rating

**Objective:** Retrieve all properties where the average rating from reviews is greater than 4.0.

```sql
SELECT
  id,
  name
FROM
  properties
WHERE
  id IN (
    SELECT
      property_id
    FROM
      reviews
    GROUP BY
      property_id
    HAVING
      AVG(rating) > 4.0
  );
```

✅ This subquery independently calculates the average rating for each property and returns those with an average greater than 4.0. The outer query then selects those properties by ID.

---

## 🔁 2. Correlated Subquery – Users with More Than 3 Bookings

**Objective:** Find users who have made more than 3 bookings.

```sql
SELECT
  id,
  name,
  email
FROM
  users u
WHERE (
  SELECT COUNT(*)
  FROM bookings b
  WHERE b.user_id = u.id
) > 3;
```

✅ This query uses a correlated subquery because the inner query depends on each row of the outer query. It counts the number of bookings for each user and filters for those with more than 3.

---

## 📁 File Information

* **File name:** `subqueries.sql`
* **Location:** `alx-airbnb-database/database-adv-script/`
* **Queries Included:**

  * Non-correlated subquery using `HAVING AVG(rating) > 4.0`
  * Correlated subquery checking `COUNT(bookings) > 3`

---

These subqueries demonstrate essential SQL techniques for nested data analysis. Run them against your Airbnb schema to verify accuracy and performance.


# Aggregations and Window Functions – Advanced SQL (ALX Airbnb Database Project)

This README covers the aggregation and window function queries implemented for Task 2 of the **Unleashing Advanced Querying Power** project in the ALX Airbnb Database Module.

## 📊 1. Aggregation – Total Bookings by User

**Objective:** Use `COUNT` and `GROUP BY` to calculate how many bookings each user has made.

```sql
SELECT
  users.id AS user_id,
  users.name AS user_name,
  COUNT(bookings.id) AS total_bookings
FROM
  users
LEFT JOIN bookings ON users.id = bookings.user_id
GROUP BY
  users.id, users.name;
```

✅ This query aggregates the number of bookings per user, including users who may not have made any bookings (they’ll show with a count of 0 due to the `LEFT JOIN`).

---

## 🪜 2. Window Function – Rank Properties by Booking Count

**Objective:** Use the `RANK()` window function to rank properties based on total bookings.

```sql
SELECT
  p.id AS property_id,
  p.name AS property_name,
  COUNT(b.id) AS booking_count,
  RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM
  properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY
  p.id, p.name;
```

✅ This query assigns a ranking to properties according to the number of times they’ve been booked. Properties with the same number of bookings get the same rank, and ranks are skipped accordingly.

---

## 📁 File Information

* **File name:** `aggregations_and_window_functions.sql`
* **Location:** `alx-airbnb-database/database-adv-script/`
* **Queries Included:**

  * Aggregation: Count bookings per user
  * Window Function: Rank properties by booking count

---

These queries demonstrate how to extract analytical insights from data using SQL’s aggregation and ranking capabilities. Run and test them on your Airbnb schema to gain a deeper understanding of user and property activity.
