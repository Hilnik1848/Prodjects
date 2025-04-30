CREATE TABLE Photos(
	photo_id INT PRIMARY KEY IDENTITY(1,1),
	photo_data VARBINARY(MAX)
);

CREATE TABLE Roles (
    role_id INT PRIMARY KEY IDENTITY(1,1),
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    fio VARCHAR(200) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    password_hash VARCHAR(255) NOT NULL,
    role_id INT,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);

CREATE TABLE Hotels (
    hotel_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    star_rating FLOAT,
    email VARCHAR(100),
    phone VARCHAR(20),
	preview_photo INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (preview_photo) REFERENCES Photos(photo_id)
);

CREATE TABLE RoomTypes (
    type_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE Rooms (
    room_id INT PRIMARY KEY IDENTITY(1,1),
    hotel_id INT NOT NULL,
    type_id INT NOT NULL,
    description TEXT,
    capacity INT NOT NULL,
    quantity_available INT NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    size INT,
	room_preview INT,
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id),
    FOREIGN KEY (room_preview) REFERENCES Photos(photo_id),
    FOREIGN KEY (type_id) REFERENCES RoomTypes(type_id)
);

CREATE TABLE Payment_status (
    payment_status_id INT PRIMARY KEY IDENTITY(1,1),
    status_text VARCHAR(50) NOT NULL
);

CREATE TABLE Booking_status (
    booking_status_id INT PRIMARY KEY IDENTITY(1,1),
    status_text VARCHAR(50) NOT NULL
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    guests_number INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    booking_status INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    special_requests TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (booking_status) REFERENCES Booking_status(booking_status_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    hotel_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 10),
    review_text TEXT,
    review_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    hotel_response TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    booking_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status INT,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    transaction_id VARCHAR(100),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
	FOREIGN KEY (payment_status) REFERENCES Payment_status(payment_status_id)
);

CREATE TABLE Manager_request(
	request_id INT PRIMARY KEY IDENTITY(1,1),
	photo_doc INT,
	request_text VARCHAR(300),
	FOREIGN KEY (photo_doc) REFERENCES Photos(photo_id)
);
