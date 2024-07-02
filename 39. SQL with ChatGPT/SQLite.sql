-- Create the sale table
CREATE TABLE sale (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    product_id INT,
    product_name VARCHAR(50),
    customer_id INT,
    customer_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2),
    total_amount DECIMAL(10, 2)
);

-- Insert data into the sale table
INSERT INTO sale (sale_id, sale_date, sale_time, product_id, product_name, customer_id, customer_name, quantity, price, total_amount)
VALUES
(1, '2023-01-01', '10:30:00', 101, 'Laptop', 201, 'Arjun', 2, 50000, 95000),
(2, '2023-01-02', '11:15:00', 102, 'Mobile', 202, 'Bhavya', 1, 20000, 18000),
(3, '2023-01-03', '12:00:00', 103, 'Tablet', 203, 'Chaitanya', 3, 15000, 40500),
(4, '2023-01-04', '13:45:00', 104, 'TV', 204, 'Deepak', 1, 30000, 27000),
(5, '2023-01-05', '14:30:00', 105, 'Headphones', 205, 'Esha', 4, 2000, 7200),
(6, '2023-01-06', '15:15:00', 101, 'Laptop', 206, 'Farhan', 2, 50000, 95000),
(7, '2023-01-07', '16:00:00', 102, 'Mobile', 207, 'Gauri', 1, 20000, 18000),
(8, '2023-01-08', '17:30:00', 103, 'Tablet', 208, 'Harsh', 3, 15000, 40500),
(9, '2023-01-09', '18:45:00', 104, 'TV', 209, 'Ishita', 1, 30000, 27000),
(10, '2023-01-10', '19:15:00', 105, 'Headphones', 210, 'Jai', 4, 2000, 7200);
