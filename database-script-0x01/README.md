## Airbnb Database Schema

This document explains the structure and purpose of the `schema.sql` file for the Airbnb-like database system. It describes the entities (tables), their attributes, constraints, relationships, and indexing strategies.

---

## 📦 Tables Overview

### 1. `users`

Represents registered users, including guests, hosts, and admins.

* `user_id` (UUID): Primary Key
* `email`: Unique, required
* `role`: ENUM ('guest', 'host', 'admin')
* Timestamps: Automatically track creation

### 2. `properties`

Describes the listings that hosts add to the platform.

* `property_id` (UUID): Primary Key
* `host_id`: Foreign Key to `users(user_id)`
* `pricepernight`: Cost per night
* `created_at`, `updated_at`: Timestamps

### 3. `bookings`

Captures reservations made by users for properties.

* `booking_id` (UUID): Primary Key
* `property_id`, `user_id`: Foreign Keys
* `start_date`, `end_date`: Reservation period
* `status`: ENUM ('pending', 'confirmed', 'canceled')

### 4. `payments`

Links payments to bookings and tracks payment info.

* `payment_id` (UUID): Primary Key
* `booking_id`: Foreign Key
* `payment_method`: ENUM ('credit\_card', 'paypal', 'stripe')

### 5. `reviews`

Stores feedback from users about properties.

* `review_id` (UUID): Primary Key
* `property_id`, `user_id`: Foreign Keys
* `rating`: Integer (1 to 5)

### 6. `messages`

Allows communication between users (e.g., guests and hosts).

* `message_id` (UUID): Primary Key
* `sender_id`, `recipient_id`: Foreign Keys to `users`

---

## 🔐 Constraints

* All tables use `UUID` as Primary Keys.
* Foreign Key constraints enforce relational integrity.
* ENUMs and `CHECK` constraints limit invalid values (e.g., rating, roles, status).
* Email in the `users` table is unique.

---

## 📈 Indexing

To optimize queries:

* `users.email` is indexed for quick lookups.
* `properties.property_id`, `bookings.property_id`, `bookings.user_id` are indexed.
* `payments.booking_id` is indexed to speed up joins with `bookings`.

---

## ⚙️ Execution

To create the schema in your PostgreSQL environment:

```bash
psql -U username -d database_name -f schema.sql
```

Replace `username` and `database_name` with your actual credentials.

---

## 🧠 Summary

The schema has been designed in line with normalization principles (up to 3NF), uses proper key structures, and supports extensibility for future features. This structure supports an Airbnb-like booking platform with strong data integrity and performance.

