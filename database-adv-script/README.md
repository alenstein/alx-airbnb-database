# SQL Join Queries

This document provides a description of the SQL queries written in the `joins_queries.sql` file.

## Understanding the Queries

The `joins_queries.sql` file contains three SQL queries that use different types of JOINs to combine data from various tables in an Airbnb-like database.

### 1. Query 1: Bookings with User Details

* **What it does:** This query fetches a list of all bookings and includes the information of the user who made each booking.
* **Join Type Used:** `INNER JOIN`
* **Tables Involved:** `Bookings` and `Users`.
* **How it works:** It looks for matching `UserID` in both the `Bookings` and `Users` tables. Only bookings that have a corresponding user, and users who have made bookings, will be shown.

### 2. Query 2: Properties with Their Reviews

* **What it does:** This query lists all properties and any reviews they have received. Importantly, it will show all properties, even if a property has no reviews yet.
* **Join Type Used:** `LEFT JOIN`
* **Tables Involved:** `Properties`, `Reviews`, and (optionally) `Users` (to show who wrote the review).
* **How it works:** It takes everything from the `Properties` table and tries to match it with reviews from the `Reviews` table using `PropertyID`. If a property has reviews, the review details are shown. If a property has no reviews, its details are still listed, but the review fields will be empty (NULL).

### 3. Query 3: All Users and All Bookings

* **What it does:** This query gives a complete list of all users and all bookings, showing how they relate.
* **Join Type Used:** `FULL OUTER JOIN`
* **Tables Involved:** `Users` and `Bookings`.
* **How it works:**
    * It shows every user. If a user has made bookings, those booking details are listed next to the user. If a user hasn't made any bookings, their details are still shown, but the booking fields will be empty (NULL).
    * It also shows every booking. If a booking is linked to a user, that user's details are shown. If a booking isn't linked to any user (which is unusual but possible), the booking is still listed, but the user fields will be empty (NULL).



