# ALX Airbnb Database Schema (0x01)

This document explains the main blueprint for our database.

## What's in this Directory?

* **`schema.sql`**: This is the most important file here.
It contains a set of instructions that tells our database system how to set up the tables and structure for our Airbnb application.

## Understanding `schema.sql`

When you open `schema.sql`, you'll see commands that:

1.  **Create Tables:** Tables are where we store different types of information.
For example:
    * `User`: Stores information about our users (guests, hosts, admins).
    * `Property`: Keeps details about the places available for rent.
    * `Booking`: Tracks when a user books a property.
    * `Payment`: Handles payment information for bookings.
    * `Review`: Stores reviews users leave for properties.
    * `Message`: Keeps track of messages between users.

2.  **Define Columns (Attributes):** Each table has columns that describe the data. 
For instance, the `User` table has columns like `first_name`, `last_name`, and `email`.

3.  **Set Primary Keys:** Each table has a "primary key" (like `user_id` for the `User` table). 
This is a unique ID for each record in the table, making sure we can find and manage each piece of data correctly.
We're using `UUID`s, which are just a type of super-unique ID.

4.  **Establish Relationships (Foreign Keys):** Some columns are "foreign keys." These link tables together. 
For example, the `Property` table has a `host_id` which links to a `user_id` in the `User` table.
This tells us which user hosts which property.

5.  **Add Constraints:** These are rules to keep our data clean and reliable.
    * `NOT NULL`: Means a column must have a value.
    * `UNIQUE`: Means every value in that column must be different (like email addresses).
    * `CHECK`: Makes sure a value meets certain conditions (e.g., a user's `role` must be 'guest', 'host', or 'admin').

6.  **Create Indexes:** Indexes help the database find information much faster,
