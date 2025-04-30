CREATE VIEW v_Active_Bookings AS
SELECT 
    b.booking_id,
    b.user_id,
    u.fio AS user_fio,
    b.room_id,
    r.description AS room_description,
    b.check_in_date,
    b.check_out_date,
    b.guests_number,
    b.total_price
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Rooms r ON b.room_id = r.room_id
WHERE b.check_out_date > GETDATE();
GO

CREATE VIEW v_Manager_Requests AS
SELECT 
    mr.request_id,
    u.user_id,
    u.fio AS user_fio,
    mr.photo_doc,
    mr.request_text
FROM Manager_request mr
JOIN Users u ON mr.user_id = u.user_id;
GO

CREATE VIEW v_Hotels_with_Photos AS
SELECT 
    h.hotel_id,
    h.name,
    h.address,
    h.city,
    h.country,
    h.star_rating,
    h.email,
    h.phone,
    p.photo_data AS hotel_photo
FROM Hotels h
LEFT JOIN Photos p ON h.preview_photo = p.photo_id;
GO

CREATE VIEW v_Bookings_Details AS
SELECT 
    b.booking_id,
    b.user_id,
    u.fio AS user_fio,
    b.room_id,
    r.description AS room_description,
    b.check_in_date,
    b.check_out_date,
    b.guests_number,
    b.total_price,
    bs.status_text AS booking_status,
    p.payment_id,
    p.amount AS payment_amount,
    pm.status_text AS payment_status
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Rooms r ON b.room_id = r.room_id
JOIN Booking_status bs ON b.booking_status = bs.booking_status_id
LEFT JOIN Payments p ON b.booking_id = p.booking_id
LEFT JOIN Payment_status pm ON p.payment_status = pm.payment_status_id;
GO

CREATE VIEW v_Rooms_Details AS
SELECT 
    r.room_id,
    r.hotel_id,
    rt.name AS room_type_name,
    r.description,
    r.capacity,
    r.quantity_available,
    r.price_per_night,
    r.size,
    p.photo_data AS room_photo
FROM Rooms r
JOIN RoomTypes rt ON r.type_id = rt.type_id
LEFT JOIN Photos p ON r.room_preview = p.photo_id;
GO

CREATE VIEW v_Hotel_Reviews AS
SELECT 
    h.hotel_id,
    h.name AS hotel_name,
    u.user_id,
    u.fio AS user_fio,
    r.review_id,
    r.rating,
    r.review_text,
    r.hotel_response,
    r.review_date
FROM Hotels h
JOIN Reviews r ON h.hotel_id = r.hotel_id
JOIN Users u ON r.user_id = u.user_id;