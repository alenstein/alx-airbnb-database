# Database Normalization to 3NF

This document outlines the analysis of the [provided database schema](https://github.com/alenstein/alx-airbnb-database/ERD/requirements.md) to ensure it adheres to the Third Normal Form (3NF).

## Schema Review and 3NF Verification

The schema consists of the following entities: `User`, `Property`, `Booking`, `Payment`, `Review`, and `Message`.

### 1. User Entity

* **Attributes:** `user_id` (PK), `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`.
* **1NF:**
    * All attributes (`VARCHAR`, `UUID`, `ENUM`, `TIMESTAMP`) are atomic.
    * No repeating groups are present.
    * `user_id` serves as the primary key, ensuring row uniqueness.
    
* **2NF:**
    * The primary key (`user_id`) is not composite (it's a single column).
    * Therefore, there can be no partial dependencies.
    
* **3NF:**
    * We need to check for transitive dependencies. All non-key attributes (`first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`) appear to depend directly on `user_id`. No non-key attribute seems to be determined by another non-key attribute. For example, `role` does not determine `first_name`, nor does `email` determine `role`.


### 2. Property Entity

* **Attributes:** `property_id` (PK), `host_id` (FK), `name`, `description`, `location`, `price_per_night`, `created_at`, `updated_at`.
* **1NF:** All attributes are atomic, `property_id` is PK.
* **2NF:** PK is not composite. 
* **3NF:** `host_id` is a foreign key. The other non-key attributes (`name`, `description`, `location`, `price_per_night`) directly describe the property identified by `property_id`. There are no evident dependencies among these non-key attributes (e.g., `location` does not determine `price_per_night` independently of `property_id`).


### 3. Booking Entity

* **Attributes:** `booking_id` (PK), `property_id` (FK), `user_id` (FK), `start_date`, `end_date`, `total_price`, `status`, `created_at`.
* **1NF:** All attributes are atomic, `booking_id` is PK. 
* **2NF:** PK is not composite. 
* **3NF:** `property_id` and `user_id` are foreign keys. Attributes like `start_date`, `end_date`, and `status` directly describe the booking.
    * The `total_price` attribute is dependent on `booking_id`. In a booking system, `total_price` typically represents the actual price agreed upon at the time of booking, which might include various factors (e.g., base price, discounts, taxes, service fees applicable at that moment). While it might be calculated based on `Property.price_per_night` and the duration (`start_date`, `end_date`), it's stored as a snapshot of the transaction. It's not dependent on another non-key attribute *within the Booking table itself* in a way that would cause a transitive dependency violation for typical booking system requirements (i.e., `status` doesn't determine `total_price`).
    * If `total_price` were *always and only* derivable from `Property.price_per_night` and `Booking.start_date`/`Booking.end_date` without any other modifiers, one might argue it's redundant. However, for historical accuracy and to capture the agreed price, storing it is standard practice and considered dependent on the `booking_id` (this specific booking instance had this specific total price).


### 4. Payment Entity

* **Attributes:** `payment_id` (PK), `booking_id` (FK), `amount`, `payment_date`, `payment_method`.
* **1NF:** All attributes are atomic, `payment_id` is PK.
* **2NF:** PK is not composite. 
* **3NF:** `booking_id` is a foreign key. The non-key attributes `amount`, `payment_date`, and `payment_method` directly describe the payment transaction identified by `payment_id`. There's no indication that, for example, `payment_method` determines `amount`.
    

### 5. Review Entity

* **Attributes:** `review_id` (PK), `property_id` (FK), `user_id` (FK), `rating`, `comment`, `created_at`.
* **1NF:** All attributes are atomic, `review_id` is PK.
* **2NF:** PK is not composite.
* **3NF:** `property_id` and `user_id` are foreign keys. `rating` and `comment` directly describe the review. There are no transitive dependencies among non-key attributes.
    

### 6. Message Entity

* **Attributes:** `message_id` (PK), `sender_id` (FK), `recipient_id` (FK), `message_body`, `sent_at`.
* **1NF:** All attributes are atomic, `message_id` is PK. 
* **2NF:** PK is not composite.
* **3NF:** `sender_id` and `recipient_id` are foreign keys. `message_body` and `sent_at` directly describe the message. No transitive dependencies are apparent.
   
