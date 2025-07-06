-- Index for user ID
CREATE INDEX idx_users_id ON users(id);

-- Index for booking's user ID
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index for booking's property ID
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index for booking's start date
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Index for property ID
CREATE INDEX idx_properties_id ON properties(id);

-- Index for review's property ID
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Performance measurement with EXPLAIN ANALYZE
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 2;

EXPLAIN ANALYZE
SELECT users.name, bookings.start_date
FROM users
JOIN bookings ON users.id = bookings.user_id;
