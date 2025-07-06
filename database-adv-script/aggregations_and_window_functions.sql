-- Aggregation: Total number of bookings made by each user
SELECT
  users.id AS user_id,
  users.name AS user_name,
  COUNT(bookings.id) AS total_bookings
FROM
  users
LEFT JOIN bookings ON users.id = bookings.user_id
GROUP BY
  users.id, users.name;

-- Window Function: Rank properties based on total number of bookings using RANK()
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

-- Window Function: Row number for properties based on total number of bookings using ROW_NUMBER()
SELECT
  p.id AS property_id,
  p.name AS property_name,
  COUNT(b.id) AS booking_count,
  ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS row_number
FROM
  properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY
  p.id, p.name;