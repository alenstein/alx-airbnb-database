-- Database Schema for ALX Airbnb Clone project

-- User Table: Stores user information.
CREATE TABLE "User" (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(50),
    role VARCHAR(10) NOT NULL CHECK (role IN ('guest', 'host', 'admin')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Property Table: Stores property listings.
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(host_id) REFERENCES "User"(user_id)
);

-- Booking Table: Stores booking information.
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL, -- Guest's user_id
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(15) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(property_id) REFERENCES Property(property_id),
    FOREIGN KEY(user_id) REFERENCES "User"(user_id),
    CHECK (end_date >= start_date) -- Ensures end_date is not before start_date
);

-- Payment Table: Stores payment details for bookings.
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL UNIQUE, -- Each booking has one primary payment record.
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')),

    FOREIGN KEY(booking_id) REFERENCES Booking(booking_id)
);

-- Review Table: Stores reviews for properties.
CREATE TABLE Review (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT, -- Comment can be optional
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(property_id) REFERENCES Property(property_id),
    FOREIGN KEY(user_id) REFERENCES "User"(user_id),
    UNIQUE (property_id, user_id) -- A user can review a specific property only once.
);

-- Message Table: Stores messages between users.
CREATE TABLE Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(sender_id) REFERENCES "User"(user_id),
    FOREIGN KEY(recipient_id) REFERENCES "User"(user_id),
    CHECK (sender_id <> recipient_id) -- Users can't send messages to themselves.
);

-- Indexes for Performance
-- Primary Key indexes are usually created automatically.

CREATE INDEX idx_user_email ON "User"(email);

CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);

CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);

-- CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_review_user_id ON Review(user_id);

CREATE INDEX idx_message_sender_id ON Message(sender_id);
CREATE INDEX idx_message_recipient_id ON Message(recipient_id);

