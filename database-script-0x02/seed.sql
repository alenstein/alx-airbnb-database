-- Sample Data for ALX Airbnb Database (Using UUID IDs)

-- 1. Insert Users
-- (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('a1b2c3d4-e5f6-7777-8888-999900000001', 'Lisa', 'Ndlovu', 'lisa.ndlovu@example.com', 'hashed_password_lisa', '0777123456', 'host', '2023-01-10 10:00:00'),
('a1b2c3d4-e5f6-7777-8888-999900000002', 'Emily', 'Sibanda', 'emily.sibanda@example.com', 'hashed_password_emily', '0712987654', 'guest', '2023-01-15 11:30:00'),
('a1b2c3d4-e5f6-7777-8888-999900000003', 'Musa', 'Masuku', 'musa.masuku@example.com', 'hashed_password_musa', '0775555123', 'host', '2023-02-01 14:00:00'),
('a1b2c3d4-e5f6-7777-8888-999900000004', 'Ntando', 'Nkomo', 'ntando.nkomo@example.com', 'hashed_password_ntando', NULL, 'guest', '2023-02-20 09:15:00'),
('a1b2c3d4-e5f6-7777-8888-999900000005', 'Zibusiso', 'Moyo', 'zibusiso.moyo@example.com', 'hashed_admin_zibu', '0771112233', 'admin', '2023-01-01 08:00:00');

-- 2. Insert Properties
-- (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at) VALUES
('b1c2d3e4-f5g6-8888-9999-aaaa11111111', 'a1b2c3d4-e5f6-7777-8888-999900000001', 'Matshamhlophe Gardens Retreat', 'A serene 2-bedroom garden flat in Matsheumhlope, Bulawayo. Perfect for families or a quiet work retreat. Includes Wi-Fi and secure parking.', 'Matsheumhlope, Bulawayo', 85.00, '2023-03-01 12:00:00', '2023-03-05 15:30:00'),
('b1c2d3e4-f5g6-8888-9999-aaaa11111112', 'a1b2c3d4-e5f6-7777-8888-999900000001', 'Luveve Walk Cosy Home', 'Charming 3-bedroom house in Luveve 5, Bulawayo. Close to local markets and transport. Ideal for experiencing local life.', 'Luveve, Bulawayo', 60.00, '2023-03-10 10:00:00', '2023-03-10 10:00:00'),
('b1c2d3e4-f5g6-8888-9999-aaaa11111113', 'a1b2c3d4-e5f6-7777-8888-999900000003', 'Hillside Dams View Apartment', 'Modern apartment with stunning views overlooking Hillside Dams. Great for bird watching and quiet evenings. One bedroom, spacious lounge.', 'Hillside, Bulawayo', 110.00, '2023-04-01 16:00:00', '2023-04-05 10:20:00'),
('b1c2d3e4-f5g6-8888-9999-aaaa11111114', 'a1b2c3d4-e5f6-7777-8888-999900000003', 'Silwane Lodge Bush Experience', 'Authentic lodge near Silwane Nature Reserve, offering a unique bush experience. Thatched roofs, en-suite rooms, and guided walks available.', 'Matopos Road, Bulawayo', 150.00, '2023-04-15 11:00:00', '2023-04-15 11:00:00');

-- 3. Insert Bookings
-- (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('c1d2e3f4-g5h6-9999-aaaa-bbbb22222221', 'b1c2d3e4-f5g6-8888-9999-aaaa11111111', 'a1b2c3d4-e5f6-7777-8888-999900000002', '2023-06-10', '2023-06-15', 425.00, 'confirmed', '2023-05-01 10:00:00'), -- Matshamhlophe by Emily
('c1d2e3f4-g5h6-9999-aaaa-bbbb22222222', 'b1c2d3e4-f5g6-8888-9999-aaaa11111112', 'a1b2c3d4-e5f6-7777-8888-999900000004', '2023-07-01', '2023-07-03', 120.00, 'pending', '2023-05-15 14:30:00'),   -- Luveve by Ntando
('c1d2e3f4-g5h6-9999-aaaa-bbbb22222223', 'b1c2d3e4-f5g6-8888-9999-aaaa11111113', 'a1b2c3d4-e5f6-7777-8888-999900000002', '2023-08-05', '2023-08-10', 550.00, 'confirmed', '2023-06-01 09:00:00'), -- Hillside Dams by Emily
('c1d2e3f4-g5h6-9999-aaaa-bbbb22222224', 'b1c2d3e4-f5g6-8888-9999-aaaa11111114', 'a1b2c3d4-e5f6-7777-8888-999900000004', '2023-09-01', '2023-09-03', 300.00, 'canceled', '2023-07-10 11:00:00');  -- Silwane by Ntando

-- 4. Insert Payments
-- (payment_id, booking_id, amount, payment_date, payment_method)
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('d1e2f3g4-h5i6-aaaa-bbbb-cccc33333331', 'c1d2e3f4-g5h6-9999-aaaa-bbbb22222221', 425.00, '2023-05-01 10:05:00', 'credit_card'),
('d1e2f3g4-h5i6-aaaa-bbbb-cccc33333332', 'c1d2e3f4-g5h6-9999-aaaa-bbbb22222223', 550.00, '2023-06-01 09:05:00', 'paypal');

-- 5. Insert Reviews
-- (review_id, property_id, user_id, rating, comment, created_at)
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('e1f2g3h4-i5j6-bbbb-cccc-dddd44444441', 'b1c2d3e4-f5g6-8888-9999-aaaa11111111', 'a1b2c3d4-e5f6-7777-8888-999900000002', 5, 'Matshamhlophe Gardens was absolutely lovely! So peaceful and Lisa was a great host. The garden is beautiful.', '2023-06-16 12:00:00'),
('e1f2g3h4-i5j6-bbbb-cccc-dddd44444442', 'b1c2d3e4-f5g6-8888-9999-aaaa11111113', 'a1b2c3d4-e5f6-7777-8888-999900000002', 4, 'Hillside Dams View Apartment had breathtaking views. The apartment was clean and modern. Musa was very helpful.', '2023-08-11 10:30:00'),
('e1f2g3h4-i5j6-bbbb-cccc-dddd44444443', 'b1c2d3e4-f5g6-8888-9999-aaaa11111112', 'a1b2c3d4-e5f6-7777-8888-999900000004', 4, 'Luveve Walk was a good experience to feel the local vibe. The house was spacious. Lisa was responsive.', '2023-07-05 09:00:00'); -- Assuming Ntando's pending booking for Luveve eventually got confirmed and stayed.

-- 6. Insert Messages
-- (message_id, sender_id, recipient_id, message_body, sent_at)
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('f1g2h3i4-j5k6-cccc-dddd-eeee55555551', 'a1b2c3d4-e5f6-7777-8888-999900000002', 'a1b2c3d4-e5f6-7777-8888-999900000001', 'Hi Lisa, I''m looking forward to my stay at Matshamhlophe Gardens! Just wanted to confirm if there is a microwave in the kitchen?', '2023-05-20 14:00:00'),
('f1g2h3i4-j5k6-cccc-dddd-eeee55555552', 'a1b2c3d4-e5f6-7777-8888-999900000001', 'a1b2c3d4-e5f6-7777-8888-999900000002', 'Hi Emily, yes, there is a microwave and other basic kitchen appliances. Glad to host you!', '2023-05-20 14:30:00'),
('f1g2h3i4-j5k6-cccc-dddd-eeee55555553', 'a1b2c3d4-e5f6-7777-8888-999900000004', 'a1b2c3d4-e5f6-7777-8888-999900000003', 'Sawubona Musa, I''m interested in Silwane Lodge. Are there any special rates for longer stays, perhaps a week?', '2023-06-01 11:00:00'),
('f1g2h3i4-j5k6-cccc-dddd-eeee55555554', 'a1b2c3d4-e5f6-7777-8888-999900000003', 'a1b2c3d4-e5f6-7777-8888-999900000004', 'Yebo Ntando! We can discuss a discount for a week-long stay. When were you thinking of visiting?', '2023-06-01 11:35:00');


