CREATE TABLE bookings (booking_id SERIAL PRIMARY KEY, user_id integer, listing_id integer);
ALTER TABLE bookings ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE bookings ADD FOREIGN KEY (listing_id) REFERENCES listings(id);