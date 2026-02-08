create database hotel_db;
use hotel_db;

CREATE TABLE guests (
  guest_id INT PRIMARY KEY,
  name VARCHAR(100),
  phone VARCHAR(20),
  email VARCHAR(100),
  id_proof VARCHAR(50)
);

CREATE TABLE rooms (
  room_id INT PRIMARY KEY,
  room_type VARCHAR(50),
  price_per_night INT,
  status VARCHAR(20)
);

CREATE TABLE bookings (
  booking_id INT PRIMARY KEY,
  guest_id INT,
  room_id INT,
  check_in DATE,
  check_out DATE,
  FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
  FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE payments (
  payment_id INT PRIMARY KEY,
  booking_id INT,
  amount INT,
  payment_mode VARCHAR(20),
  payment_date DATE,
  FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);