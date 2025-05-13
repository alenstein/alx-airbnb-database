Entities and Their Attributes:
List of each entity and its corresponding attributes:

1. User
* user_id: Primary Key, UUID, Indexed
* first_name: VARCHAR, NOT NULL
* last_name: VARCHAR, NOT NULL
* email: VARCHAR, UNIQUE, NOT NULL, Indexed
* password_hash: VARCHAR, NOT NULL
* phone_number: VARCHAR, NULL
* role: ENUM (guest, host, admin), NOT NULL
* created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

2. Property
* property_id: Primary Key, UUID, Indexed
* host_id: Foreign Key, references User(user_id)
* name: VARCHAR, NOT NULL
* description: TEXT, NOT NULL
* location: VARCHAR, NOT NULL
* price_per_night: DECIMAL, NOT NULL (Corrected from pricepernight for clarity)
* created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
* updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

3. Booking
* booking_id: Primary Key, UUID, Indexed
* property_id: Foreign Key, references Property(property_id), Indexed
* user_id: Foreign Key, references User(user_id)
* start_date: DATE, NOT NULL
* end_date: DATE, NOT NULL
* total_price: DECIMAL, NOT NULL
* status: ENUM (pending, confirmed, canceled), NOT NULL
* created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

4. Payment
* payment_id: Primary Key, UUID, Indexed
* booking_id: Foreign Key, references Booking(booking_id), Indexed
* amount: DECIMAL, NOT NULL
* payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
* payment_method: ENUM (credit_card, paypal, stripe), NOT NULL

5. Review
* review_id: Primary Key, UUID, Indexed
* property_id: Foreign Key, references Property(property_id)
* user_id: Foreign Key, references User(user_id)
* rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
* comment: TEXT, NOT NULL
* created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

6. Message
* message_id: Primary Key, UUID, Indexed
* sender_id: Foreign Key, references User(user_id)
* recipient_id: Foreign Key, references User(user_id)
* message_body: TEXT, NOT NULL
* sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

Relationships Between Entities:
Here's how the entities are related:

User and Property:

Relationship: A User (specifically a host) can own/list multiple Property entities. A Property is owned/listed by one User (host).
Type: One-to-Many (User to Property)
Foreign Key: Property.host_id references User.user_id.
User and Booking:

Relationship: A User (guest) can make multiple Booking entities. A Booking is made by one User.
Type: One-to-Many (User to Booking)
Foreign Key: Booking.user_id references User.user_id.
Property and Booking:

Relationship: A Property can have multiple Booking entities associated with it. A Booking is for one specific Property.
Type: One-to-Many (Property to Booking)
Foreign Key: Booking.property_id references Property.property_id.
Booking and Payment:

Relationship: A Booking can have one Payment associated with it (assuming one payment per booking, which is typical, though some systems might allow multiple partial payments. The current schema with payment_id as PK in Payment and booking_id as FK suggests one primary payment record per booking, or one payment at a time). Conversely, a Payment is made for one specific Booking.
Type: One-to-One (or One-to-Many if a booking could have multiple payment attempts/records) based on the current PK/FK structure. Given payment_id is a PK and booking_id is a FK, it leans towards a booking potentially having multiple payment records (e.g., attempts, refunds recorded separately), but a single payment transaction usually finalizes a booking. For simplicity in an ER diagram, this is often represented as a one-to-one or a direct one-to-many from Booking to Payment (a booking leads to payments).
Foreign Key: Payment.booking_id references Booking.booking_id.
User and Review:

Relationship: A User (guest) can write multiple Review entities. A Review is written by one User.
Type: One-to-Many (User to Review)
Foreign Key: Review.user_id references User.user_id.
Property and Review:

Relationship: A Property can have multiple Review entities written for it. A Review is for one specific Property.
Type: One-to-Many (Property to Review)
Foreign Key: Review.property_id references Property.property_id.
User and Message (Sender):

Relationship: A User can send multiple Message entities. A Message is sent by one User.
Type: One-to-Many (User to Message as sender)
Foreign Key: Message.sender_id references User.user_id.
User and Message (Recipient):

Relationship: A User can receive multiple Message entities. A Message is received by one User.
Type: One-to-Many (User to Message as recipient)
Foreign Key: Message.recipient_id references User.user_id.
