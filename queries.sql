-- Occupied Rooms
select count(*) as occupied_rooms
from rooms
where status ='Occupied';

-- Available Rooms
select count(*) as available_rooms
from rooms
where status='Available';

-- Daily Revenue Report
select sum(amount) as total_revenue
from payments;

-- Revenue By Payment Mode
Select payment_mode, SUM(amount) AS revenue
FROM payments
GROUP BY payment_mode;

-- Guest Stay List 
SELECT g.name, r.room_type, b.check_in, b.check_out
FROM bookings b
JOIN guests g ON b.guest_id = g.guest_id
JOIN rooms r ON b.room_id = r.room_id;

-- Today's Check-outs
SELECT g.name, r.room_id
FROM bookings b
JOIN guests g ON b.guest_id = g.guest_id
JOIN rooms r ON b.room_id = r.room_id
WHERE b.check_out = CURDATE();

-- Night Audit Summary
SELECT 
  (SELECT COUNT(*) FROM rooms WHERE status='Occupied') AS occupied_rooms,
  (SELECT COUNT(*) FROM rooms WHERE status='Available') AS available_rooms,
  (SELECT SUM(amount) FROM payments) AS total_revenue;
  
  --  queries
  SELECT g.name, r.room_type, b.check_in, b.check_out, p.amount, p.payment_mode
FROM bookings b
JOIN guests g ON b.guest_id = g.guest_id
JOIN rooms r ON b.room_id = r.room_id
JOIN payments p ON b.booking_id = p.booking_id;

SELECT COUNT(*) FROM rooms WHERE status='Occupied';

SELECT COUNT(*) FROM rooms WHERE status='Available';
