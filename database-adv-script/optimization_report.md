# Optimization Report – Complex Query Refactor (ALX Airbnb Database Project)

## 🎯 Objective

This report documents the optimization process for a complex SQL query that retrieves all bookings along with corresponding user, property, and payment details.

---

## 🧾 Initial Query Overview

The original query joins the `bookings`, `users`, `properties`, and `payments` tables:

```sql
SELECT
  b.id AS booking_id,
  b.start_date,
  b.end_date,
  u.id AS user_id,
  u.name AS user_name,
  u.email,
  p.id AS property_id,
  p.name AS property_name,
  pay.id AS payment_id,
  pay.amount,
  pay.status
FROM
  bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;
```

✅ This query retrieves relevant booking data and links it to user, property, and payment records.

---

## 🛠 Performance Analysis Using EXPLAIN

When using `EXPLAIN` or `EXPLAIN ANALYZE`, the following performance issues were observed:

* **Sequential scans** on `users`, `properties`, and `payments` for each join.
* **Lack of indexing** on foreign key columns such as `user_id`, `property_id`, and `booking_id`.
* **Unnecessary joins** for retrieving details when minimal output is required.

---

## ✅ Optimization Techniques Applied

### 1. Indexing

Appropriate indexes were added:

```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_users_id ON users(id);
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
```

🟢 This drastically reduced lookup time for JOIN operations.

### 2. Refactoring

If only essential columns are needed, we recommend:

* **Selecting only necessary fields** to reduce memory overhead.
* **Filtering with WHERE** if you know you're targeting a specific date range, user, or property.

Example Refactored Query:

```sql
SELECT
  b.id AS booking_id,
  b.start_date,
  b.end_date,
  u.name AS user_name,
  p.name AS property_name,
  pay.amount
FROM
  bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE b.start_date >= '2024-01-01';
```

---

## 📈 Outcome

After indexing and refactoring:

* Query execution time decreased significantly.
* JOIN operations now utilize indexed lookups.
* Less I/O and memory usage, improving scalability for large datasets.

---

## 📁 File Information

* **Query file:** `perfomance.sql`
* **Report file:** `optimization_report.md`
* **Repo path:** `alx-airbnb-database/database-adv-script/`
