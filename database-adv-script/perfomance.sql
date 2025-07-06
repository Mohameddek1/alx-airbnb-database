-- Initial complex query (unoptimized)
SELECT
  b.id AS booking_id,
  b.start_date,
  b.end_date,
  u.name AS user_name,
  u.email,
  p.name AS property_name,
  p.location,
  pay.amount,
  pay.status
FROM
  bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;

-- Analyze initial performance
EXPLAIN ANALYZE
SELECT
  b.id,
  b.start_date,
  b.end_date,
  u.name,
  u.email,
  p.name,
  p.location,
  pay.amount,
  pay.status
FROM
  bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;

-- Refactored query (assumes indexes exist on booking.user_id, booking.property_id, payments.booking_id)
-- Optional WHERE clause or filtered join for real-case performance gains
SELECT
  b.id AS booking_id,
  b.start_date,
  b.end_date,
  u.name AS user_name,
  u.email,
  p.name AS property_name,
  p.location,
  pay.amount,
  pay.status
FROM
  bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id
WHERE b.start_date >= '2023-01-01'; -- optional filter to reduce scanned rows

-- Re-analyze refactored version
EXPLAIN ANALYZE
SELECT
  b.id,
  b.start_date,
  b.end_date,
  u.name,
  u.email,
  p.name,
  p.location,
  pay.amount,
  pay.status
FROM
  bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id
WHERE b.start_date >= '2023-01-01';
