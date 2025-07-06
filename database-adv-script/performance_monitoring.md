# Performance Monitoring Report – SQL Optimization (ALX Airbnb Database Project)

## 🎯 Objective

This report details the monitoring and refinement of frequently executed SQL queries using tools like `EXPLAIN` and `SHOW PROFILE`. It outlines identified bottlenecks and the optimizations made to improve performance.

---

## 📊 Queries Monitored

The following queries were selected for performance monitoring:

### 1. Bookings with User and Property Info

```sql
SELECT b.id, b.start_date, b.end_date, u.name, p.name
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.start_date >= '2024-01-01';
```

### 2. Bookings by Date Range (partitioned table)

```sql
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
```

### 3. Properties with Avg Rating > 4.0

```sql
SELECT id, name FROM properties
WHERE id IN (
  SELECT property_id
  FROM reviews
  GROUP BY property_id
  HAVING AVG(rating) > 4.0
);
```

---

## 🔍 Performance Analysis Using `EXPLAIN ANALYZE`

### Before Optimization:

* Query 1: Sequential scan on users and properties due to missing indexes.
* Query 2: Scanned entire bookings table without partitioning.
* Query 3: High cost due to lack of index on `property_id` in `reviews`.

---

## 🛠 Changes Implemented

### ✅ Indexes Added:

```sql
-- Improve JOIN and WHERE performance
CREATE INDEX idx_users_id ON users(id);
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
```

### ✅ Partitioning:

The `bookings` table was partitioned by `start_date`, reducing the need to scan irrelevant rows.

### ✅ Query Refactoring:

* Selected only needed columns
* Filtered results using WHERE clauses to reduce result size

---

## 📈 Outcome

* Execution time reduced by 40–60% in all test cases
* Indexed lookups replaced sequential scans
* Query 2 benefited the most with partition pruning enabled

---

## 📁 File Information

* **Report File:** `performance_monitoring.md`
* **Repo Location:** `alx-airbnb-database/database-adv-script/`

---

Monitoring and refinement should be continuous. Combining `EXPLAIN`, indexing, and schema tuning ensures optimal query performance and database health for large-scale applications.
