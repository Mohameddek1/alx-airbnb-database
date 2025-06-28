# Airbnb Database: Normalization Report

## 🌟 Objective

Ensure the Airbnb database schema meets **Third Normal Form (3NF)** by identifying and eliminating redundancy and transitive dependencies.

---

## 📦 Step-by-Step Normalization Process

### 🔹 Step 0: Unnormalized Form (UNF)

In the early design, booking data might store repetitive or grouped fields like:

| booking\_id | guest\_name | guest\_email | property\_name | host\_name | start\_date | end\_date | amount\_paid |
| ----------- | ----------- | ------------ | -------------- | ---------- | ----------- | --------- | ------------ |

❗ **Issues**:

* Guest, property, and host data are duplicated across bookings.
* Repeating fields violate atomicity.

---

### 🔹 Step 1: First Normal Form (1NF)

**Goal**: Ensure all columns have atomic (indivisible) values and each record is unique.

✅ **Action**:

* Split guest, host, and property into separate entities.
* Created separate `User`, `Property`, and `Booking` tables.

---

### 🔹 Step 2: Second Normal Form (2NF)

**Goal**: Eliminate **partial dependencies**. All non-key attributes must depend on the **entire** primary key.

✅ **Action**:

* Removed host info from `Property` as it’s identified via foreign key (`host_id` → `User`).
* Ensured each `Booking` references `User` and `Property` by IDs rather than duplicating information.

---

### 🔹 Step 3: Third Normal Form (3NF)

**Goal**: Eliminate **transitive dependencies**. Non-key attributes must not depend on other non-key attributes.

✅ **Action**:

* `Review` table contains only `rating`, `comment`, and foreign keys.
* `Payment` is linked to `Booking` only.
* Messages are stored independently with references to `User`.

---

## ✅ Final Normalized Tables

| Table    | Normal Form | Justification                                      |
| -------- | ----------- | -------------------------------------------------- |
| User     | 3NF         | No redundancy or transitive dependencies.          |
| Property | 3NF         | Linked to `User` via `host_id`.                    |
| Booking  | 3NF         | Foreign keys only; no derived or duplicate fields. |
| Payment  | 3NF         | Each payment tied to one booking.                  |
| Review   | 3NF         | User-Property link, rating and comment only.       |
| Message  | 3NF         | References sender and recipient only.              |

---

## 🧐 Summary

* The original schema had potential transitive and partial dependencies.
* Applying normalization up to 3NF eliminated data duplication, ensured data integrity, and improved scalability.
* The final schema now represents a relational, normalized database ideal for real-world Airbnb-like applications.
