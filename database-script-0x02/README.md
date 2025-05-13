# ALX Airbnb Database: Sample Data (Seed Script)

This directory contains the `seed.sql` file, which is used to populate your ALX Airbnb database with sample data. This helps in testing and development by providing realistic entries for users, properties, bookings, etc.

## `seed.sql` Overview

The `seed.sql` file contains a series of SQL `INSERT` statements that add records to each of the tables defined in the main `schema.sql` (from `database-script-0x01`).

The sample data includes:
* Multiple **Users** (with roles like 'guest', 'host', 'admin').
* Several **Properties** listed by different hosts.
* Various **Bookings** made by guests for different properties, with different statuses (pending, confirmed, canceled).
* **Payments** associated with confirmed bookings.
* **Reviews** written by guests for properties they've (presumably) stayed at.
* **Messages** exchanged between users.

## Prerequisites

1.  **Database Schema Created:** You must first create the database structure by running the `schema.sql` file from the `database-script-0x01` directory.
