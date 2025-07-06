# 📈 Indexing Performance Report – ALX Airbnb Database Project

## 🎯 Objective

The goal of this task was to identify high-usage columns in the `users`, `bookings`, and `properties` tables and create appropriate indexes to optimize query performance. The impact of these indexes was then evaluated using SQL performance analysis tools.

---

## 🔍 Step 1: Identify High-Usage Columns

Based on analysis of frequently used queries, the following columns were identified as high-impact candidates for indexing:

* `users.id` – used in JOIN conditions
* `bookings.user_id` – used in JOINs and WHERE conditions
* `bookings.property_id` – used in JOINs
* `bookings.start_date` – used for date range filtering and partitioning
* `properties.id` – used in JOINs
* `reviews.property_id` – used in JOINs and aggregations

---

## 🛠️ Step 2: Create Indexes

```sql
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
```

---

## ⚙️ Step 3: Measure Performance (Before vs. After Indexing)

### Sample Query

```sql
EXPLAIN SELECT * FROM bookings WHERE user_id = 2;
```

### Results

* **Before Indexing**: Full table scan (high cost)
* **After Indexing**: Index scan on `bookings.user_id` (lower cost)

### Sample Join Query

```sql
EXPLAIN SELECT users.name, bookings.start_date FROM users
JOIN bookings ON users.id = bookings.user_id;
```

* **Before**: Nested loop with sequential scan
* **After**: Nested loop with index scan on `bookings_user_id`

---

## ✅ Observations & Conclusion

* Indexes significantly reduced query execution time and resource usage for common queries.
* Most noticeable improvements occurred in JOIN-heavy queries and WHERE filters.
* Over-indexing was avoided to maintain performance for `INSERT`, `UPDATE`, and `DELETE` operations.

**Next Steps:**

* Continuously monitor query plans.
* Add or drop indexes based on evolving query patterns and performance bottlenecks.

---

📁 **File:** `database_index.sql`
📂 **Directory:** `alx-airbnb-database/database-adv-script/`
