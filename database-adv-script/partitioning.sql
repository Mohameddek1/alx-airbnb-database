-- Partitioning the Bookings table by RANGE on start_date

-- Step 1: Create a new partitioned table (PostgreSQL example)
CREATE TABLE bookings_partitioned (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  property_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
  FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
  FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
  FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 3: Insert sample data (if needed) and test queries
-- SELECT * FROM bookings_partitioned WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
-- Use EXPLAIN ANALYZE to test query performance on partitioned vs. non-partitioned table
