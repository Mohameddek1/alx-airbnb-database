## Airbnb Database Seed Script

This document explains the structure and purpose of the `seed.sql` file, which provides sample data for the Airbnb-like database system. The goal is to simulate real-world data for development and testing.

---

## 🌱 Purpose

Populate the database with example data that:

* Reflects a working Airbnb-like environment
* Allows testing of relationships between entities
* Validates schema integrity and indexing performance

---

## 📄 Sample Data Summary

### 1. `users`

Three users: a guest, a host, and an admin with relevant attributes like email and role.

### 2. `properties`

Two properties added by the host user. Locations reflect real Kenyan cities.

### 3. `bookings`

A confirmed booking by the guest for the Beach House.

### 4. `payments`

One payment associated with the confirmed booking.

### 5. `reviews`

One review by the guest for the Beach House with a 5-star rating.

### 6. `messages`

A guest-to-host message asking about property availability.

---

## ⚙️ Execution

To seed the database in your PostgreSQL environment:

```bash
psql -U username -d database_name -f seed.sql
```

Replace `username` and `database_name` with your actual PostgreSQL credentials.

---

## 🧠 Notes

* Make sure you run `schema.sql` first before executing the seed script.
* UUIDs are pre-defined for consistency and traceability during testing.
* All seed data follows normalization rules up to 3NF.

