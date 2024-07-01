SELECT * FROM messy_indian_dataset;

-- Start a transaction
START TRANSACTION;
UPDATE messy_indian_dataset SET purchase_amount = 1500 where id = 1;
SELECT * FROM messy_indian_dataset;

-- Transection with Rollback
START TRANSACTION;
UPDATE messy_indian_dataset SET purchase_amount = 1400 where id = 1;
SELECT * FROM messy_indian_dataset;
ROLLBACK;
SELECT * FROM messy_indian_dataset;


-- Transections with Commit
START TRANSACTION;
UPDATE messy_indian_dataset SET purchase_amount = 1300 where id = 1;
SELECT * FROM messy_indian_dataset;
COMMIT;
SELECT * FROM messy_indian_dataset;

-- Commit & Rollback
START TRANSACTION;
	INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) 
	VALUES (11, 'Mahesh Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05');
    SELECT * FROM messy_indian_dataset where id = 11;
    SELECT * FROM messy_indian_dataset;
    COMMIT;
    ROLLBACK;
SELECT * FROM messy_indian_dataset;
    
-- Commit & Rollback with multiple commands

START TRANSACTION;
	INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) 
	VALUES (12, 'Prakash', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05');
    
    INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) 
	VALUES (13, 'Aarti', 30, 'Female', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05');
    
    SELECT * FROM messy_indian_dataset;
    COMMIT;
    ROLLBACK;
SELECT * FROM messy_indian_dataset;

-- Rollback with multiple commands

START TRANSACTION;
	INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) 
	VALUES (14, 'Prakash', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05');
    
    INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) 
	VALUES (15, 'Aarti', 30, 'Female', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05');
    
    SELECT * FROM messy_indian_dataset;
    ROLLBACK;
SELECT * FROM messy_indian_dataset;

