
CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

CREATE TABLE posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(255) NOT NULL,
    word_count INT,
    views INT,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- Daten einfügen
INSERT INTO authors (author_name) VALUES ('Maria Charlotte'), ('Juan Perez'), ('Gemma Alcocer');

INSERT INTO posts (title, word_count, views, author_id) VALUES 
('Best Paint Colors', 814, 14, 1),
('Small Space Decorating Tips', 1146, 221, 2),
('Hot Accessories', 986, 105, 1),
('Mixing Textures', 765, 22, 1),
('Kitchen Refresh', 1242, 307, 2),
('Homemade Art Hacks', 1002, 193, 1),
('Refinishing Wood Floors', 1571, 7542, 3);


CREATE TABLE aircrafts (
    aircraft_model VARCHAR(255) PRIMARY KEY,
    total_seats INT NOT NULL
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_status VARCHAR(50),
    total_customer_mileage INT
);

CREATE TABLE flights (
    flight_number VARCHAR(10) PRIMARY KEY,
    flight_mileage INT NOT NULL,
    aircraft_model VARCHAR(255),
    FOREIGN KEY (aircraft_model) REFERENCES aircrafts(aircraft_model)
);

CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    flight_number VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (flight_number) REFERENCES flights(flight_number)
);

SELECT COUNT(DISTINCT flight_number) FROM flights;
SELECT AVG(flight_mileage) FROM flights;
SELECT customer_status, AVG(total_customer_mileage) FROM customers GROUP BY customer_status;
