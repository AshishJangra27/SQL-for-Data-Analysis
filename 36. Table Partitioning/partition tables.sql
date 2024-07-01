DROP TABLE IF EXISTS dataset;
CREATE TABLE dataset (
    id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    purchase_amount DECIMAL(10, 2),
    purchase_date DATE);

-- 1. Range Partitioning

DROP TABLE IF EXISTS partitioned_dataset;
CREATE TABLE partitioned_dataset ( id INT, name VARCHAR(50), city VARCHAR(50), purchase_amount DECIMAL(10, 2), purchase_date DATE )
PARTITION BY RANGE (YEAR(purchase_date)) 
(
    PARTITION p0 VALUES LESS THAN (2020),
    PARTITION p1 VALUES LESS THAN (2021),
    PARTITION p2 VALUES LESS THAN (2022),
    PARTITION p3 VALUES LESS THAN (2023),
    PARTITION p4 VALUES LESS THAN (2024)
);
SELECT name, city, purchase_amount  FROM partitioned_dataset WHERE purchase_date BETWEEN '2022-01-01' AND '2022-12-31';

-- 2. List Partitioning

DROP TABLE IF EXISTS partitioned_dataset;
CREATE TABLE partitioned_dataset ( id INT, name VARCHAR(50), city VARCHAR(50), purchase_amount DECIMAL(10, 2), purchase_date DATE,
    city_code INT GENERATED ALWAYS AS (
        CASE
            WHEN city = 'Mumbai' THEN 1
            WHEN city = 'Delhi' THEN 2
            WHEN city = 'Bangalore' THEN 3
            WHEN city IN ('Kolkata', 'Chennai', 'Hyderabad', 'Pune') THEN 4
            ELSE NULL
        END
    ) STORED
)
PARTITION BY LIST (city_code) (
    PARTITION p_mumbai VALUES IN (1),
    PARTITION p_delhi VALUES IN (2),
    PARTITION p_bangalore VALUES IN (3),
    PARTITION p_other VALUES IN (4));

INSERT INTO partitioned_dataset (id, name, city, purchase_amount, purchase_date)
VALUES
(1, 'Rajesh Patel', 'Mumbai', 1000.50, '2023-01-05'),
(2, 'Priya Sharma', 'Delhi', 850.75, '2023-02-10'),
(3, 'Amit Kumar', 'Bangalore', 1200.00, '2023-03-15'),
(4, 'Ritu Singh', 'Kolkata', 950.00, '2023-04-20'),
(5, 'Anjali Gupta', 'Chennai', 1100.25, '2023-05-25');


SELECT name, purchase_amount 
FROM partitioned_dataset 
WHERE city = 'Mumbai';


-- 3. Hash Partitioning

DROP TABLE IF EXISTS partitioned_dataset;
CREATE TABLE partitioned_dataset ( id INT, name VARCHAR(50), city VARCHAR(50), purchase_amount DECIMAL(10, 2), purchase_date DATE )
PARTITION BY HASH(id) PARTITIONS 4;

SELECT name, city, purchase_amount 
FROM partitioned_dataset 
WHERE id = 12345;

-- 4. Subpartitioning

DROP TABLE IF EXISTS partitioned_dataset;
CREATE TABLE partitioned_dataset (
    id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    purchase_amount DECIMAL(10, 2),
    purchase_date DATE
)
PARTITION BY RANGE (YEAR(purchase_date))
SUBPARTITION BY HASH(id) SUBPARTITIONS 4 (
    PARTITION p0 VALUES LESS THAN (2020),
    PARTITION p1 VALUES LESS THAN (2021),
    PARTITION p2 VALUES LESS THAN (2022),
    PARTITION p3 VALUES LESS THAN (2023),
    PARTITION p4 VALUES LESS THAN (2024)
);

SELECT name, city, purchase_amount 
FROM partitioned_dataset 
WHERE purchase_date BETWEEN '2022-01-01' AND '2022-12-31';
