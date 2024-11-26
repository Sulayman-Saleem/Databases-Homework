-- 1
SELECT 
    rs.first_name AS WaiterName,
    rs.surname AS WaiterSurname,
    rb.bill_date AS BillDate,
    COUNT(rb.bill_no) AS NumberOfBills
FROM 
    restBill rb
JOIN 
    restStaff rs ON rb.waiter_no = rs.staff_no
GROUP BY 
    rs.first_name, rs.surname, rb.bill_date
HAVING 
    COUNT(rb.bill_no) >= 2;

-- 2
SELECT 
    rr.room_name AS RoomName,
    COUNT(rt.table_no) AS NumberOfLargeTables
FROM 
    restRest_table rt
JOIN 
    restRoom_management rr ON rt.room_name = rr.room_name
WHERE 
    rt.no_of_seats > 6
GROUP BY 
    rr.room_name;

-- 3
SELECT 
    rt.room_name AS RoomName,
    SUM(rb.bill_total) AS TotalBillAmount
FROM 
    restBill rb
JOIN 
    restRest_table rt ON rb.table_no = rt.table_no
GROUP BY 
    rt.room_name;

-- 4
SELECT 
    hs.first_name AS HeadWaiterName,
    hs.surname AS HeadWaiterSurname,
    SUM(rb.bill_total) AS TotalBillAmount
FROM 
    restBill rb
JOIN 
    restStaff ws ON rb.waiter_no = ws.staff_no
JOIN 
    restStaff hs ON ws.headwaiter = hs.staff_no
GROUP BY 
    hs.first_name, hs.surname
ORDER BY 
    TotalBillAmount DESC;

-- 5
SELECT 
    rb.cust_name AS CustomerName,
    AVG(rb.bill_total) AS AverageSpending
FROM 
    restBill rb
GROUP BY 
    rb.cust_name
HAVING 
    AVG(rb.bill_total) > 400;

-- 6
SELECT 
    rs.first_name AS WaiterName,
    rs.surname AS WaiterSurname,
    COUNT(rb.bill_no) AS NumberOfBills
FROM 
    restBill rb
JOIN 
    restStaff rs ON rb.waiter_no = rs.staff_no
GROUP BY 
    rs.first_name, rs.surname, rb.bill_date
HAVING 
    COUNT(rb.bill_no) >= 3;
