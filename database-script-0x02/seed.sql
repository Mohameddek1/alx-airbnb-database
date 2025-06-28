-- Sample Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashedpassword1', '1234567890', 'guest'),
  ('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashedpassword2', '2345678901', 'host'),
  ('33333333-3333-3333-3333-333333333333', 'Carol', 'Lee', 'carol@example.com', 'hashedpassword3', NULL, 'admin');

-- Sample Properties
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Beach House', 'Oceanfront property with amazing views.', 'Mombasa, Kenya', 150.00),
  ('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Mountain Cabin', 'Secluded cabin in the forest.', 'Nyeri, Kenya', 90.00);

-- Sample Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('b1b1b1b1-b1b1-b1b1-b1b1-b1b1b1b1b1b1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2025-07-01', '2025-07-05', 600.00, 'confirmed');

-- Sample Payments
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
  ('cccccccc-cccc-cccc-cccc-cccccccccccc', 'b1b1b1b1-b1b1-b1b1-b1b1-b1b1b1b1b1b1', 600.00, 'credit_card');

-- Sample Reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
  ('dddddddd-dddd-dddd-dddd-dddddddddddd', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay, loved the location!');

-- Sample Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
  ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi, is the Beach House available for August?');
