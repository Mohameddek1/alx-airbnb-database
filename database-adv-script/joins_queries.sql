-- INNER JOIN: Retrieve all bookings and the respective users who made those bookings
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


-- LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT
  properties.id AS property_id,
  properties.name AS property_name,
  reviews.id AS review_id,
  reviews.rating,
  reviews.comment
FROM
  properties
LEFT JOIN reviews ON reviews.property_id = properties.id;


-- FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
-- If using PostgreSQL:
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

-- If using MySQL (alternative using UNION of LEFT and RIGHT JOINs):
--
-- SELECT
--   users.id AS user_id,
--   users.name AS user_name,
--   bookings.id AS booking_id,
--   bookings.property_id,
--   bookings.start_date,
--   bookings.end_date
-- FROM users
-- LEFT JOIN bookings ON users.id = bookings.user_id
--
-- UNION
--
-- SELECT
--   users.id AS user_id,
--   users.name AS user_name,
--   bookings.id AS booking_id,
--   bookings.property_id,
--   bookings.start_date,
--   bookings.end_date
-- FROM bookings
-- LEFT JOIN users ON users.id = bookings.user_id;
