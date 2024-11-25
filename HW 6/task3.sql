-- 1
SELECT DISTINCT CONCAT(restStaff.first_name, ' ', restStaff.surname) AS waiter_name
FROM restStaff
JOIN restBill ON restStaff.staff_no = restBill.waiter_no
WHERE restBill.cust_name = 'Tanya Singh';

-- 2
SELECT room_date
FROM restRoom_management
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restStaff.first_name = 'Charles' 
  AND restRoom_management.room_name = 'Green' 
  AND room_date BETWEEN 160201 AND 160229;

-- 3
SELECT DISTINCT CONCAT(restStaff.first_name, ' ', restStaff.surname) AS waiter_name
FROM restStaff
WHERE restStaff.headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

-- 4
SELECT 
    restBill.cust_name, 
    restBill.bill_total, 
    CONCAT(restStaff.first_name, ' ', restStaff.surname) AS waiter_name
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
ORDER BY restBill.bill_total DESC;

-- 5
SELECT DISTINCT CONCAT(restStaff.first_name, ' ', restStaff.surname) AS waiter_name
FROM restStaff
WHERE restStaff.headwaiter = (
    SELECT DISTINCT s.headwaiter
    FROM restStaff s
    JOIN restBill b ON s.staff_no = b.waiter_no
    WHERE b.bill_no IN (14, 17)
);

-- 6
SELECT DISTINCT CONCAT(restStaff.first_name, ' ', restStaff.surname) AS team_member_name
FROM restStaff
WHERE restStaff.headwaiter = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
) 
OR restStaff.staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
);
