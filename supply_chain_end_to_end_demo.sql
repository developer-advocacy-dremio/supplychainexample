-- Mark's Supply Chain Demo Examples
-- This script sets up a complete supply chain scenario with Bronze, Silver, and Gold layers.

-- Note: Replace 'SupplyChainDB' with your actual root catalog source name if different.
CREATE FOLDER IF NOT EXISTS SupplyChainDB;
CREATE FOLDER IF NOT EXISTS SupplyChainDB.Bronze;
CREATE FOLDER IF NOT EXISTS SupplyChainDB.Silver;
CREATE FOLDER IF NOT EXISTS SupplyChainDB.Gold;

DROP TABLE IF EXISTS SupplyChainDB.Bronze.Warehouses;
CREATE TABLE IF NOT EXISTS SupplyChainDB.Bronze.Warehouses (
    warehouse_id INT,
    warehouse_name VARCHAR,
    city VARCHAR,
    state VARCHAR,
    region VARCHAR,
    capacity_units INT
);

INSERT INTO SupplyChainDB.Bronze.Warehouses VALUES
(1, 'Central DC', 'Chicago', 'IL', 'Midwest', 50000),
(2, 'East Coast Hub', 'Edison', 'NJ', 'Northeast', 45000),
(3, 'West Coast Gateway', 'Reno', 'NV', 'West', 60000),
(4, 'Southern Depot', 'Atlanta', 'GA', 'South', 40000),
(5, 'Texas Distribution', 'Dallas', 'TX', 'South', 55000);

DROP TABLE IF EXISTS SupplyChainDB.Bronze.Products;
CREATE TABLE IF NOT EXISTS SupplyChainDB.Bronze.Products (
    product_id INT,
    product_name VARCHAR,
    product_category VARCHAR,
    brand VARCHAR,
    unit_cost FLOAT,
    unit_weight FLOAT,
    is_active BOOLEAN
);

INSERT INTO SupplyChainDB.Bronze.Products VALUES
(1, 'Product-1', 'Industrial', 'Brand-A', 426.29, 10.4, True),
(2, 'Product-2', 'Apparel', 'Brand-A', 208.94, 19.3, True),
(3, 'Product-3', 'Electronics', 'Brand-B', 490.21, 18.2, True),
(4, 'Product-4', 'Home & Garden', 'Brand-A', 460.29, 9.9, True),
(5, 'Product-5', 'Home & Garden', 'Brand-A', 361.63, 11.6, True),
(6, 'Product-6', 'Home & Garden', 'Brand-C', 334.97, 18.8, True),
(7, 'Product-7', 'Electronics', 'Brand-B', 290.0, 13.3, True),
(8, 'Product-8', 'Industrial', 'Brand-A', 17.79, 5.6, True),
(9, 'Product-9', 'Industrial', 'Brand-A', 120.64, 3.6, True),
(10, 'Product-10', 'Electronics', 'Brand-B', 227.91, 14.9, True),
(11, 'Product-11', 'Industrial', 'Brand-C', 125.86, 0.6, True),
(12, 'Product-12', 'Industrial', 'Brand-A', 183.6, 19.0, True),
(13, 'Product-13', 'Electronics', 'Brand-B', 239.37, 14.9, True),
(14, 'Product-14', 'Electronics', 'Brand-A', 343.04, 17.2, True),
(15, 'Product-15', 'Home & Garden', 'Brand-C', 255.2, 13.3, True),
(16, 'Product-16', 'Electronics', 'Brand-C', 52.07, 15.7, True),
(17, 'Product-17', 'Electronics', 'Brand-A', 165.65, 19.9, True),
(18, 'Product-18', 'Electronics', 'Brand-B', 468.81, 5.9, True),
(19, 'Product-19', 'Home & Garden', 'Brand-C', 271.23, 17.2, True),
(20, 'Product-20', 'Apparel', 'Brand-A', 233.52, 1.5, True),
(21, 'Product-21', 'Home & Garden', 'Brand-B', 495.22, 9.4, True),
(22, 'Product-22', 'Industrial', 'Brand-A', 412.89, 17.0, True),
(23, 'Product-23', 'Apparel', 'Brand-B', 261.63, 1.1, True),
(24, 'Product-24', 'Apparel', 'Brand-B', 306.42, 6.5, True),
(25, 'Product-25', 'Industrial', 'Brand-B', 149.55, 4.2, True),
(26, 'Product-26', 'Industrial', 'Brand-B', 480.68, 19.5, True),
(27, 'Product-27', 'Home & Garden', 'Brand-B', 204.42, 1.4, True),
(28, 'Product-28', 'Home & Garden', 'Brand-B', 100.96, 5.0, True),
(29, 'Product-29', 'Home & Garden', 'Brand-A', 208.8, 8.0, True),
(30, 'Product-30', 'Industrial', 'Brand-A', 98.12, 10.4, True),
(31, 'Product-31', 'Electronics', 'Brand-A', 493.28, 1.7, True),
(32, 'Product-32', 'Industrial', 'Brand-B', 324.79, 11.6, True),
(33, 'Product-33', 'Electronics', 'Brand-B', 488.54, 17.1, True),
(34, 'Product-34', 'Home & Garden', 'Brand-A', 240.27, 9.9, True),
(35, 'Product-35', 'Apparel', 'Brand-C', 51.47, 15.1, True),
(36, 'Product-36', 'Home & Garden', 'Brand-A', 319.2, 7.7, True),
(37, 'Product-37', 'Electronics', 'Brand-B', 194.31, 0.5, True),
(38, 'Product-38', 'Home & Garden', 'Brand-A', 398.94, 15.7, True),
(39, 'Product-39', 'Apparel', 'Brand-B', 29.05, 7.1, True),
(40, 'Product-40', 'Apparel', 'Brand-A', 447.97, 8.8, True);

DROP TABLE IF EXISTS SupplyChainDB.Bronze.Suppliers;
CREATE TABLE IF NOT EXISTS SupplyChainDB.Bronze.Suppliers (
    supplier_id INT,
    supplier_name VARCHAR,
    country VARCHAR,
    region VARCHAR,
    risk_rating VARCHAR,
    contract_lead_time_days INT
);

INSERT INTO SupplyChainDB.Bronze.Suppliers VALUES
(1, 'Supplier-1', 'China', 'APAC', 'High', 22),
(2, 'Supplier-2', 'Germany', 'EMEA', 'Low', 59),
(3, 'Supplier-3', 'Germany', 'EMEA', 'Medium', 25),
(4, 'Supplier-4', 'Germany', 'EMEA', 'Low', 41),
(5, 'Supplier-5', 'China', 'APAC', 'Medium', 36),
(6, 'Supplier-6', 'China', 'APAC', 'Low', 25),
(7, 'Supplier-7', 'Germany', 'EMEA', 'High', 60),
(8, 'Supplier-8', 'Germany', 'EMEA', 'High', 37),
(9, 'Supplier-9', 'Germany', 'EMEA', 'Medium', 37),
(10, 'Supplier-10', 'China', 'APAC', 'Medium', 59),
(11, 'Supplier-11', 'Germany', 'EMEA', 'Medium', 23),
(12, 'Supplier-12', 'USA', 'NA', 'Medium', 50),
(13, 'Supplier-13', 'USA', 'NA', 'High', 37),
(14, 'Supplier-14', 'China', 'APAC', 'High', 16),
(15, 'Supplier-15', 'USA', 'NA', 'Medium', 34);

DROP TABLE IF EXISTS SupplyChainDB.Bronze.Orders;
CREATE TABLE IF NOT EXISTS SupplyChainDB.Bronze.Orders (
    order_id INT,
    order_date DATE,
    customer_id INT,
    product_id INT,
    warehouse_id INT,
    ordered_qty INT,
    unit_price FLOAT,
    order_status VARCHAR,
    promised_delivery_date DATE,
    actual_ship_date DATE
);

INSERT INTO SupplyChainDB.Bronze.Orders VALUES
(1, '2025-04-10', 137, 34, 4, 100, 515.88, 'Shipped', '2025-04-14', '2025-04-15'),
(2, '2025-10-28', 168, 36, 5, 55, 433.99, 'Shipped', '2025-11-06', '2025-11-04'),
(3, '2025-07-24', 188, 13, 2, 64, 254.37, 'Open', '2025-07-30', NULL),
(4, '2025-01-13', 152, 3, 5, 90, 543.36, 'Backordered', '2025-01-21', NULL),
(5, '2025-04-13', 106, 35, 1, 2, 522.0, 'Cancelled', '2025-04-19', NULL),
(6, '2025-05-12', 109, 4, 2, 5, 222.65, 'Shipped', '2025-05-15', '2025-05-16'),
(7, '2025-09-09', 114, 1, 3, 76, 208.37, 'Shipped', '2025-09-17', '2025-09-10'),
(8, '2025-10-12', 156, 18, 1, 91, 490.71, 'Open', '2025-10-22', NULL),
(9, '2025-09-04', 108, 32, 5, 74, 466.07, 'Open', '2025-09-07', NULL),
(10, '2025-04-24', 139, 28, 4, 68, 47.19, 'Cancelled', '2025-04-27', NULL),
(11, '2025-11-29', 128, 8, 3, 65, 280.7, 'Backordered', '2025-12-07', NULL),
(12, '2025-02-22', 147, 34, 5, 51, 482.09, 'Cancelled', '2025-02-25', NULL),
(13, '2025-05-08', 139, 7, 1, 38, 560.24, 'Open', '2025-05-18', NULL),
(14, '2025-11-18', 183, 11, 4, 76, 424.13, 'Shipped', '2025-11-23', '2025-11-21'),
(15, '2025-01-28', 103, 36, 2, 90, 256.85, 'Cancelled', '2025-01-31', NULL),
(16, '2025-12-02', 191, 33, 4, 56, 108.67, 'Shipped', '2025-12-08', '2025-12-04'),
(17, '2025-04-08', 108, 13, 2, 38, 472.11, 'Backordered', '2025-04-14', NULL),
(18, '2025-06-29', 199, 12, 4, 38, 592.99, 'Shipped', '2025-07-09', '2025-07-04'),
(19, '2025-06-05', 138, 22, 1, 75, 465.37, 'Shipped', '2025-06-11', '2025-06-10'),
(20, '2025-01-29', 152, 4, 2, 29, 254.33, 'Backordered', '2025-02-07', NULL),
(21, '2025-02-22', 180, 15, 2, 2, 221.04, 'Backordered', '2025-03-04', NULL),
(22, '2025-02-03', 162, 29, 4, 80, 386.33, 'Shipped', '2025-02-06', '2025-02-06'),
(23, '2025-07-24', 188, 9, 3, 94, 487.49, 'Shipped', '2025-08-01', '2025-07-26'),
(24, '2025-12-03', 193, 20, 4, 47, 139.24, 'Shipped', '2025-12-10', '2025-12-07'),
(25, '2025-04-05', 130, 33, 2, 43, 338.07, 'Open', '2025-04-11', NULL),
(26, '2025-09-21', 165, 14, 2, 34, 106.88, 'Cancelled', '2025-09-26', NULL),
(27, '2025-10-15', 104, 30, 3, 36, 22.96, 'Cancelled', '2025-10-21', NULL),
(28, '2025-09-18', 133, 35, 4, 26, 227.28, 'Open', '2025-09-26', NULL),
(29, '2025-02-03', 181, 10, 1, 3, 435.97, 'Cancelled', '2025-02-10', NULL),
(30, '2025-11-03', 180, 32, 5, 89, 395.27, 'Cancelled', '2025-11-06', NULL),
(31, '2025-06-06', 160, 39, 1, 49, 390.8, 'Shipped', '2025-06-09', '2025-06-12'),
(32, '2025-04-08', 163, 31, 5, 88, 512.37, 'Open', '2025-04-16', NULL),
(33, '2025-09-25', 190, 2, 5, 87, 119.97, 'Backordered', '2025-10-01', NULL),
(34, '2025-08-25', 199, 17, 5, 100, 496.51, 'Backordered', '2025-08-31', NULL),
(35, '2025-02-08', 119, 31, 1, 100, 594.14, 'Backordered', '2025-02-14', NULL),
(36, '2025-05-02', 122, 19, 2, 33, 114.9, 'Cancelled', '2025-05-07', NULL),
(37, '2025-11-13', 115, 19, 1, 29, 302.99, 'Backordered', '2025-11-22', NULL),
(38, '2025-01-06', 128, 27, 5, 90, 157.43, 'Backordered', '2025-01-10', NULL),
(39, '2025-11-01', 158, 9, 2, 43, 308.14, 'Cancelled', '2025-11-11', NULL),
(40, '2025-06-29', 195, 37, 1, 79, 20.45, 'Shipped', '2025-07-05', '2025-07-06'),
(41, '2025-01-22', 174, 38, 1, 30, 581.66, 'Open', '2025-01-27', NULL),
(42, '2025-03-25', 138, 40, 4, 50, 355.93, 'Backordered', '2025-03-30', NULL),
(43, '2025-11-02', 122, 40, 3, 96, 480.73, 'Cancelled', '2025-11-11', NULL),
(44, '2025-11-20', 118, 38, 2, 35, 507.92, 'Open', '2025-11-26', NULL),
(45, '2025-09-21', 193, 25, 5, 40, 234.44, 'Cancelled', '2025-09-27', NULL),
(46, '2025-02-26', 198, 23, 3, 22, 262.9, 'Open', '2025-03-01', NULL),
(47, '2025-11-03', 146, 19, 1, 15, 63.42, 'Open', '2025-11-13', NULL),
(48, '2025-05-09', 141, 40, 3, 35, 457.74, 'Open', '2025-05-17', NULL),
(49, '2025-04-06', 104, 11, 3, 51, 393.01, 'Backordered', '2025-04-10', NULL),
(50, '2025-11-14', 199, 12, 3, 61, 57.32, 'Shipped', '2025-11-20', '2025-11-16');

INSERT INTO SupplyChainDB.Bronze.Orders VALUES
(51, '2025-06-04', 123, 14, 5, 12, 529.14, 'Shipped', '2025-06-07', '2025-06-07'),
(52, '2025-02-08', 168, 33, 5, 33, 501.01, 'Cancelled', '2025-02-12', NULL),
(53, '2025-09-30', 164, 30, 4, 55, 324.91, 'Shipped', '2025-10-03', '2025-10-02'),
(54, '2025-04-28', 187, 27, 5, 80, 524.41, 'Open', '2025-05-06', NULL),
(55, '2025-07-17', 161, 23, 3, 6, 342.9, 'Shipped', '2025-07-23', '2025-07-20'),
(56, '2025-07-18', 141, 24, 3, 12, 354.55, 'Shipped', '2025-07-28', '2025-07-26'),
(57, '2025-08-24', 129, 11, 2, 33, 396.11, 'Open', '2025-08-30', NULL),
(58, '2025-12-18', 149, 28, 2, 45, 334.45, 'Backordered', '2025-12-22', NULL),
(59, '2025-01-06', 175, 9, 4, 25, 240.39, 'Backordered', '2025-01-16', NULL),
(60, '2025-03-07', 133, 26, 3, 87, 33.0, 'Backordered', '2025-03-10', NULL),
(61, '2025-08-02', 103, 10, 5, 83, 382.48, 'Backordered', '2025-08-06', NULL),
(62, '2025-09-26', 111, 30, 2, 22, 351.83, 'Open', '2025-10-04', NULL),
(63, '2025-07-21', 141, 11, 1, 81, 477.84, 'Shipped', '2025-07-31', '2025-07-24'),
(64, '2025-01-26', 135, 38, 5, 45, 373.69, 'Cancelled', '2025-02-04', NULL),
(65, '2025-03-09', 116, 35, 5, 94, 183.99, 'Backordered', '2025-03-17', NULL),
(66, '2025-07-10', 178, 7, 1, 19, 536.33, 'Open', '2025-07-18', NULL),
(67, '2025-01-28', 174, 28, 1, 79, 360.16, 'Backordered', '2025-02-03', NULL),
(68, '2025-07-29', 184, 31, 1, 46, 491.49, 'Cancelled', '2025-08-05', NULL),
(69, '2025-11-12', 126, 18, 2, 57, 32.21, 'Cancelled', '2025-11-20', NULL),
(70, '2025-03-02', 181, 28, 3, 77, 453.46, 'Open', '2025-03-07', NULL),
(71, '2025-07-28', 104, 1, 4, 16, 472.33, 'Cancelled', '2025-08-01', NULL),
(72, '2025-06-01', 164, 34, 1, 12, 288.88, 'Backordered', '2025-06-11', NULL),
(73, '2025-02-28', 149, 9, 4, 55, 431.45, 'Shipped', '2025-03-10', '2025-03-06'),
(74, '2025-04-08', 170, 15, 5, 100, 234.06, 'Open', '2025-04-15', NULL),
(75, '2025-06-02', 132, 5, 5, 51, 548.04, 'Shipped', '2025-06-05', '2025-06-05'),
(76, '2025-08-22', 109, 9, 2, 67, 74.75, 'Open', '2025-08-29', NULL),
(77, '2025-02-23', 143, 27, 2, 46, 165.5, 'Open', '2025-03-03', NULL),
(78, '2025-10-27', 176, 22, 3, 60, 244.45, 'Open', '2025-11-05', NULL),
(79, '2025-11-29', 108, 33, 4, 44, 219.6, 'Shipped', '2025-12-08', '2025-12-07'),
(80, '2025-04-19', 155, 35, 2, 38, 62.27, 'Open', '2025-04-26', NULL),
(81, '2025-11-28', 142, 8, 1, 1, 202.72, 'Backordered', '2025-12-02', NULL),
(82, '2025-02-14', 142, 22, 4, 95, 101.51, 'Open', '2025-02-21', NULL),
(83, '2025-11-20', 107, 11, 3, 46, 159.34, 'Open', '2025-11-29', NULL),
(84, '2025-11-25', 142, 25, 4, 79, 191.74, 'Open', '2025-11-30', NULL),
(85, '2025-10-26', 187, 27, 5, 28, 182.45, 'Backordered', '2025-11-05', NULL),
(86, '2025-04-05', 138, 6, 2, 79, 136.34, 'Cancelled', '2025-04-09', NULL),
(87, '2025-01-06', 175, 10, 4, 40, 521.98, 'Cancelled', '2025-01-11', NULL),
(88, '2025-01-15', 132, 40, 2, 91, 190.53, 'Cancelled', '2025-01-23', NULL),
(89, '2025-08-22', 102, 9, 2, 8, 40.83, 'Shipped', '2025-08-31', '2025-08-24'),
(90, '2025-01-19', 130, 24, 3, 95, 327.26, 'Backordered', '2025-01-23', NULL),
(91, '2025-12-19', 198, 39, 1, 35, 72.08, 'Open', '2025-12-22', NULL),
(92, '2025-05-03', 173, 29, 1, 36, 284.77, 'Shipped', '2025-05-07', '2025-05-05'),
(93, '2025-10-20', 102, 18, 5, 55, 110.82, 'Backordered', '2025-10-29', NULL),
(94, '2025-04-30', 139, 8, 1, 12, 552.02, 'Shipped', '2025-05-10', '2025-05-06'),
(95, '2025-03-22', 156, 25, 4, 29, 50.76, 'Backordered', '2025-03-28', NULL),
(96, '2025-10-04', 100, 22, 2, 29, 553.18, 'Backordered', '2025-10-08', NULL),
(97, '2025-07-15', 103, 8, 1, 81, 430.88, 'Cancelled', '2025-07-23', NULL),
(98, '2025-04-16', 157, 30, 3, 56, 520.46, 'Backordered', '2025-04-25', NULL),
(99, '2025-04-02', 191, 35, 4, 63, 220.06, 'Backordered', '2025-04-05', NULL),
(100, '2025-02-28', 120, 8, 5, 84, 202.35, 'Open', '2025-03-06', NULL);

INSERT INTO SupplyChainDB.Bronze.Orders VALUES
(101, '2025-10-15', 134, 26, 3, 16, 78.54, 'Cancelled', '2025-10-24', NULL),
(102, '2025-10-31', 111, 18, 4, 68, 414.32, 'Open', '2025-11-05', NULL),
(103, '2025-04-04', 173, 19, 1, 20, 68.13, 'Open', '2025-04-11', NULL),
(104, '2025-11-27', 104, 20, 3, 18, 153.23, 'Backordered', '2025-11-30', NULL),
(105, '2025-09-15', 172, 38, 5, 86, 341.29, 'Open', '2025-09-20', NULL),
(106, '2025-04-18', 134, 40, 2, 39, 454.49, 'Shipped', '2025-04-21', '2025-04-22'),
(107, '2025-09-07', 171, 22, 1, 29, 160.31, 'Cancelled', '2025-09-16', NULL),
(108, '2025-11-23', 148, 40, 1, 55, 208.52, 'Shipped', '2025-11-28', '2025-11-27'),
(109, '2025-05-30', 200, 23, 3, 44, 177.86, 'Open', '2025-06-06', NULL),
(110, '2025-02-21', 198, 35, 4, 35, 483.65, 'Backordered', '2025-03-02', NULL),
(111, '2025-05-31', 127, 40, 3, 5, 244.46, 'Backordered', '2025-06-10', NULL),
(112, '2025-12-24', 141, 3, 2, 54, 89.0, 'Cancelled', '2025-12-27', NULL),
(113, '2025-02-26', 112, 3, 2, 43, 35.66, 'Backordered', '2025-03-01', NULL),
(114, '2025-01-19', 123, 19, 1, 30, 104.01, 'Shipped', '2025-01-25', '2025-01-23'),
(115, '2025-11-07', 185, 8, 2, 73, 117.56, 'Open', '2025-11-13', NULL),
(116, '2025-06-28', 105, 9, 3, 78, 428.09, 'Shipped', '2025-07-08', '2025-06-30'),
(117, '2025-11-08', 119, 13, 4, 92, 176.94, 'Cancelled', '2025-11-12', NULL),
(118, '2025-04-18', 106, 29, 5, 37, 507.17, 'Shipped', '2025-04-24', '2025-04-19'),
(119, '2025-06-15', 165, 36, 2, 6, 206.43, 'Open', '2025-06-22', NULL),
(120, '2025-01-04', 106, 21, 5, 14, 96.86, 'Open', '2025-01-11', NULL),
(121, '2025-04-17', 137, 12, 2, 77, 140.96, 'Shipped', '2025-04-24', '2025-04-25'),
(122, '2025-05-22', 123, 20, 2, 100, 111.42, 'Cancelled', '2025-05-30', NULL),
(123, '2025-01-07', 199, 36, 1, 33, 497.44, 'Open', '2025-01-15', NULL),
(124, '2025-02-05', 151, 10, 2, 4, 325.56, 'Cancelled', '2025-02-15', NULL),
(125, '2025-05-08', 143, 26, 5, 91, 406.04, 'Shipped', '2025-05-12', '2025-05-12'),
(126, '2025-10-18', 121, 7, 2, 44, 373.36, 'Cancelled', '2025-10-22', NULL),
(127, '2025-04-05', 133, 17, 4, 41, 578.5, 'Shipped', '2025-04-10', '2025-04-09'),
(128, '2025-05-06', 151, 29, 4, 10, 40.95, 'Cancelled', '2025-05-09', NULL),
(129, '2025-09-18', 194, 38, 3, 94, 414.86, 'Backordered', '2025-09-25', NULL),
(130, '2025-05-16', 111, 6, 3, 53, 20.89, 'Open', '2025-05-21', NULL),
(131, '2025-05-27', 170, 18, 3, 67, 143.13, 'Open', '2025-06-01', NULL),
(132, '2025-12-24', 194, 20, 1, 3, 74.63, 'Shipped', '2026-01-02', '2025-12-31'),
(133, '2025-01-25', 193, 40, 2, 46, 190.19, 'Backordered', '2025-01-29', NULL),
(134, '2025-10-17', 112, 27, 3, 32, 42.61, 'Cancelled', '2025-10-24', NULL),
(135, '2025-02-21', 163, 25, 3, 96, 578.29, 'Backordered', '2025-02-25', NULL),
(136, '2025-03-09', 149, 14, 5, 78, 264.9, 'Cancelled', '2025-03-16', NULL),
(137, '2025-06-15', 121, 28, 1, 8, 36.04, 'Open', '2025-06-25', NULL),
(138, '2025-03-16', 189, 39, 5, 98, 319.4, 'Shipped', '2025-03-22', '2025-03-17'),
(139, '2025-07-24', 170, 22, 5, 98, 549.51, 'Shipped', '2025-08-01', '2025-07-25'),
(140, '2025-03-11', 136, 30, 3, 8, 155.58, 'Shipped', '2025-03-14', '2025-03-16'),
(141, '2025-01-15', 177, 22, 3, 52, 501.06, 'Open', '2025-01-25', NULL),
(142, '2025-06-01', 120, 11, 1, 40, 518.6, 'Backordered', '2025-06-08', NULL),
(143, '2025-10-03', 185, 29, 4, 50, 23.2, 'Backordered', '2025-10-11', NULL),
(144, '2025-01-30', 135, 23, 2, 69, 526.3, 'Shipped', '2025-02-04', '2025-02-03'),
(145, '2025-12-10', 141, 28, 1, 95, 303.89, 'Open', '2025-12-18', NULL),
(146, '2025-05-31', 183, 1, 1, 5, 418.69, 'Cancelled', '2025-06-08', NULL),
(147, '2025-01-01', 143, 31, 2, 56, 494.2, 'Open', '2025-01-10', NULL),
(148, '2025-12-26', 134, 6, 5, 5, 99.45, 'Shipped', '2025-12-30', '2025-12-28'),
(149, '2025-09-18', 194, 31, 4, 4, 587.89, 'Cancelled', '2025-09-22', NULL),
(150, '2025-12-01', 107, 36, 1, 90, 188.97, 'Backordered', '2025-12-11', NULL);

DROP TABLE IF EXISTS SupplyChainDB.Bronze.Purchase_Orders;
CREATE TABLE IF NOT EXISTS SupplyChainDB.Bronze.Purchase_Orders (
    po_id INT,
    supplier_id INT,
    product_id INT,
    warehouse_id INT,
    po_date DATE,
    expected_delivery_date DATE,
    actual_delivery_date DATE,
    ordered_qty INT,
    received_qty INT,
    po_status VARCHAR
);

INSERT INTO SupplyChainDB.Bronze.Purchase_Orders VALUES
(1, 7, 22, 5, '2025-03-25', '2025-04-14', '2025-04-19', 886, 886, 'Closed'),
(2, 10, 37, 3, '2025-02-11', '2025-03-17', NULL, 895, 0, 'Pending'),
(3, 15, 13, 2, '2025-12-21', '2026-01-22', '2026-01-23', 549, 549, 'Closed'),
(4, 10, 13, 4, '2025-07-15', '2025-08-27', '2025-08-31', 737, 737, 'Closed'),
(5, 1, 18, 4, '2025-04-30', '2025-06-02', NULL, 514, 0, 'Pending'),
(6, 15, 33, 2, '2025-07-21', '2025-08-15', '2025-08-14', 508, 508, 'Closed'),
(7, 15, 24, 5, '2025-01-19', '2025-03-05', NULL, 511, 0, 'Pending'),
(8, 6, 28, 4, '2025-09-17', '2025-10-25', NULL, 504, 0, 'Open'),
(9, 11, 27, 5, '2025-06-21', '2025-07-11', '2025-07-11', 525, 525, 'Closed'),
(10, 8, 17, 5, '2025-01-19', '2025-02-21', NULL, 119, 0, 'Pending'),
(11, 11, 14, 2, '2025-03-22', '2025-04-14', '2025-04-16', 879, 879, 'Closed'),
(12, 4, 38, 4, '2025-04-15', '2025-05-10', '2025-05-12', 809, 809, 'Closed'),
(13, 15, 29, 3, '2025-03-04', '2025-04-02', NULL, 476, 0, 'Pending'),
(14, 13, 9, 3, '2025-11-13', '2025-12-23', NULL, 833, 0, 'Open'),
(15, 8, 25, 1, '2025-10-21', '2025-11-21', '2025-11-26', 122, 122, 'Closed'),
(16, 8, 23, 3, '2025-04-18', '2025-05-22', '2025-05-27', 939, 939, 'Closed'),
(17, 11, 16, 5, '2025-09-30', '2025-10-30', NULL, 291, 0, 'Open'),
(18, 15, 35, 3, '2025-10-21', '2025-11-08', NULL, 859, 0, 'Pending'),
(19, 11, 15, 1, '2025-10-28', '2025-11-13', '2025-11-13', 314, 314, 'Closed'),
(20, 4, 37, 4, '2025-05-21', '2025-06-11', NULL, 123, 0, 'Open'),
(21, 1, 15, 1, '2025-04-15', '2025-05-04', NULL, 278, 0, 'Open'),
(22, 10, 27, 1, '2025-04-03', '2025-04-29', '2025-04-29', 246, 242, 'Closed'),
(23, 8, 7, 5, '2025-09-12', '2025-10-06', '2025-10-09', 842, 842, 'Closed'),
(24, 12, 11, 2, '2025-11-12', '2025-11-26', '2025-11-27', 193, 193, 'Closed'),
(25, 10, 38, 4, '2025-09-12', '2025-10-22', NULL, 344, 0, 'Pending'),
(26, 11, 11, 4, '2025-09-03', '2025-09-26', NULL, 680, 0, 'Pending'),
(27, 10, 3, 3, '2025-09-20', '2025-10-04', NULL, 177, 0, 'Pending'),
(28, 10, 34, 1, '2025-12-16', '2025-12-30', NULL, 883, 0, 'Open'),
(29, 12, 37, 5, '2025-02-20', '2025-03-15', NULL, 263, 0, 'Open'),
(30, 13, 39, 1, '2025-06-06', '2025-07-12', NULL, 539, 0, 'Open'),
(31, 13, 21, 2, '2025-08-15', '2025-09-04', NULL, 566, 0, 'Pending'),
(32, 7, 12, 3, '2025-12-30', '2026-01-29', NULL, 726, 0, 'Pending'),
(33, 12, 37, 3, '2025-04-21', '2025-05-31', NULL, 204, 0, 'Open'),
(34, 7, 33, 3, '2025-08-06', '2025-08-31', '2025-08-31', 731, 731, 'Closed'),
(35, 2, 32, 1, '2025-04-17', '2025-05-19', NULL, 554, 0, 'Pending'),
(36, 8, 11, 3, '2025-09-05', '2025-09-29', '2025-09-30', 448, 448, 'Closed'),
(37, 5, 36, 5, '2025-05-02', '2025-05-18', NULL, 433, 0, 'Open'),
(38, 9, 4, 2, '2025-04-07', '2025-04-26', NULL, 816, 0, 'Pending'),
(39, 8, 14, 1, '2025-08-15', '2025-09-19', NULL, 266, 0, 'Pending'),
(40, 1, 20, 3, '2025-11-01', '2025-12-07', NULL, 724, 0, 'Open'),
(41, 2, 25, 4, '2025-09-13', '2025-10-06', '2025-10-07', 403, 403, 'Closed'),
(42, 1, 37, 4, '2025-12-25', '2026-01-25', NULL, 175, 0, 'Open'),
(43, 14, 39, 2, '2025-05-21', '2025-07-03', NULL, 574, 0, 'Pending'),
(44, 15, 16, 1, '2025-06-17', '2025-07-30', NULL, 873, 0, 'Open'),
(45, 15, 2, 5, '2025-11-25', '2025-12-15', NULL, 799, 0, 'Pending'),
(46, 6, 20, 3, '2025-02-02', '2025-03-16', NULL, 524, 0, 'Pending'),
(47, 11, 12, 4, '2025-01-09', '2025-01-24', NULL, 605, 0, 'Pending'),
(48, 3, 8, 3, '2025-11-25', '2025-12-31', '2026-01-04', 694, 694, 'Closed'),
(49, 7, 8, 2, '2025-10-23', '2025-11-09', '2025-11-11', 115, 115, 'Closed'),
(50, 11, 34, 2, '2025-08-16', '2025-09-11', NULL, 437, 0, 'Open');

DROP TABLE IF EXISTS SupplyChainDB.Bronze.Inventory_Snapshot;
CREATE TABLE IF NOT EXISTS SupplyChainDB.Bronze.Inventory_Snapshot (
    snapshot_date DATE,
    warehouse_id INT,
    product_id INT,
    on_hand_qty INT,
    allocated_qty INT,
    available_qty INT,
    safety_stock_qty INT
);

INSERT INTO SupplyChainDB.Bronze.Inventory_Snapshot VALUES
('2025-10-01', 1, 1, 70, 33, 37, 14),
('2025-10-01', 2, 1, 105, 69, 36, 10),
('2025-10-01', 3, 1, 454, 241, 213, 46),
('2025-10-01', 4, 1, 403, 98, 305, 15),
('2025-10-01', 5, 1, 359, 111, 248, 21),
('2025-10-01', 1, 2, 342, 117, 225, 30),
('2025-10-01', 2, 2, 467, 75, 392, 38),
('2025-10-01', 3, 2, 26, 22, 4, 30),
('2025-10-01', 4, 2, 326, 263, 63, 21),
('2025-10-01', 5, 2, 260, 47, 213, 13),
('2025-10-01', 1, 3, 0, 0, 0, 21),
('2025-10-01', 2, 3, 307, 153, 154, 11),
('2025-10-01', 3, 3, 201, 25, 176, 16),
('2025-10-01', 4, 3, 389, 358, 31, 23),
('2025-10-01', 5, 3, 168, 158, 10, 41),
('2025-10-01', 1, 4, 338, 281, 57, 36),
('2025-10-01', 2, 4, 177, 25, 152, 32),
('2025-10-01', 3, 4, 235, 203, 32, 11),
('2025-10-01', 4, 4, 293, 65, 228, 40),
('2025-10-01', 5, 4, 208, 93, 115, 36),
('2025-10-01', 1, 5, 387, 53, 334, 34),
('2025-10-01', 2, 5, 397, 170, 227, 22),
('2025-10-01', 3, 5, 381, 331, 50, 40),
('2025-10-01', 4, 5, 472, 86, 386, 25),
('2025-10-01', 5, 5, 259, 69, 190, 35),
('2025-10-01', 1, 6, 355, 110, 245, 14),
('2025-10-01', 2, 6, 34, 25, 9, 16),
('2025-10-01', 3, 6, 442, 386, 56, 11),
('2025-10-01', 4, 6, 146, 51, 95, 15),
('2025-10-01', 5, 6, 351, 46, 305, 29),
('2025-10-01', 1, 7, 342, 195, 147, 46),
('2025-10-01', 2, 7, 273, 201, 72, 22),
('2025-10-01', 3, 7, 283, 278, 5, 47),
('2025-10-01', 4, 7, 25, 24, 1, 29),
('2025-10-01', 5, 7, 92, 15, 77, 14),
('2025-10-01', 1, 8, 3, 3, 0, 38),
('2025-10-01', 2, 8, 308, 120, 188, 11),
('2025-10-01', 3, 8, 338, 122, 216, 46),
('2025-10-01', 4, 8, 157, 13, 144, 20),
('2025-10-01', 5, 8, 173, 63, 110, 21),
('2025-10-01', 1, 9, 83, 16, 67, 31),
('2025-10-01', 2, 9, 444, 124, 320, 23),
('2025-10-01', 3, 9, 228, 94, 134, 43),
('2025-10-01', 4, 9, 233, 99, 134, 28),
('2025-10-01', 5, 9, 176, 69, 107, 19),
('2025-10-01', 1, 10, 252, 56, 196, 14),
('2025-10-01', 2, 10, 247, 8, 239, 19),
('2025-10-01', 3, 10, 238, 212, 26, 21),
('2025-10-01', 4, 10, 129, 49, 80, 12),
('2025-10-01', 5, 10, 116, 3, 113, 21);

INSERT INTO SupplyChainDB.Bronze.Inventory_Snapshot VALUES
('2025-10-01', 1, 11, 343, 163, 180, 40),
('2025-10-01', 2, 11, 55, 23, 32, 30),
('2025-10-01', 3, 11, 322, 36, 286, 34),
('2025-10-01', 4, 11, 252, 89, 163, 43),
('2025-10-01', 5, 11, 354, 156, 198, 14),
('2025-10-01', 1, 12, 42, 42, 0, 30),
('2025-10-01', 2, 12, 54, 21, 33, 34),
('2025-10-01', 3, 12, 250, 82, 168, 30),
('2025-10-01', 4, 12, 104, 89, 15, 25),
('2025-10-01', 5, 12, 463, 454, 9, 43),
('2025-10-01', 1, 13, 203, 172, 31, 23),
('2025-10-01', 2, 13, 453, 174, 279, 20),
('2025-10-01', 3, 13, 74, 9, 65, 24),
('2025-10-01', 4, 13, 207, 191, 16, 20),
('2025-10-01', 5, 13, 158, 19, 139, 38),
('2025-10-01', 1, 14, 304, 64, 240, 21),
('2025-10-01', 2, 14, 220, 194, 26, 23),
('2025-10-01', 3, 14, 214, 12, 202, 23),
('2025-10-01', 4, 14, 144, 99, 45, 49),
('2025-10-01', 5, 14, 205, 80, 125, 49),
('2025-10-01', 1, 15, 222, 114, 108, 42),
('2025-10-01', 2, 15, 114, 62, 52, 46),
('2025-10-01', 3, 15, 364, 16, 348, 29),
('2025-10-01', 4, 15, 317, 0, 317, 50),
('2025-10-01', 5, 15, 120, 27, 93, 49),
('2025-10-01', 1, 16, 492, 376, 116, 26),
('2025-10-01', 2, 16, 181, 14, 167, 41),
('2025-10-01', 3, 16, 166, 22, 144, 13),
('2025-10-01', 4, 16, 209, 137, 72, 36),
('2025-10-01', 5, 16, 150, 142, 8, 24),
('2025-10-01', 1, 17, 161, 80, 81, 17),
('2025-10-01', 2, 17, 324, 19, 305, 32),
('2025-10-01', 3, 17, 204, 72, 132, 47),
('2025-10-01', 4, 17, 225, 28, 197, 29),
('2025-10-01', 5, 17, 373, 227, 146, 11),
('2025-10-01', 1, 18, 350, 78, 272, 35),
('2025-10-01', 2, 18, 225, 19, 206, 43),
('2025-10-01', 3, 18, 241, 150, 91, 18),
('2025-10-01', 4, 18, 373, 163, 210, 25),
('2025-10-01', 5, 18, 323, 290, 33, 23),
('2025-10-01', 1, 19, 371, 196, 175, 20),
('2025-10-01', 2, 19, 231, 198, 33, 45),
('2025-10-01', 3, 19, 54, 35, 19, 23),
('2025-10-01', 4, 19, 78, 73, 5, 33),
('2025-10-01', 5, 19, 106, 98, 8, 34),
('2025-10-01', 1, 20, 256, 192, 64, 34),
('2025-10-01', 2, 20, 275, 55, 220, 45),
('2025-10-01', 3, 20, 442, 435, 7, 44),
('2025-10-01', 4, 20, 208, 19, 189, 24),
('2025-10-01', 5, 20, 150, 36, 114, 41);

INSERT INTO SupplyChainDB.Bronze.Inventory_Snapshot VALUES
('2025-10-01', 1, 21, 34, 34, 0, 12),
('2025-10-01', 2, 21, 368, 102, 266, 42),
('2025-10-01', 3, 21, 423, 341, 82, 16),
('2025-10-01', 4, 21, 321, 225, 96, 44),
('2025-10-01', 5, 21, 283, 152, 131, 31),
('2025-10-01', 1, 22, 185, 139, 46, 50),
('2025-10-01', 2, 22, 119, 107, 12, 22),
('2025-10-01', 3, 22, 462, 1, 461, 48),
('2025-10-01', 4, 22, 158, 57, 101, 27),
('2025-10-01', 5, 22, 498, 146, 352, 11),
('2025-10-01', 1, 23, 39, 36, 3, 21),
('2025-10-01', 2, 23, 425, 220, 205, 48),
('2025-10-01', 3, 23, 102, 92, 10, 37),
('2025-10-01', 4, 23, 379, 183, 196, 32),
('2025-10-01', 5, 23, 21, 10, 11, 39),
('2025-10-01', 1, 24, 109, 12, 97, 40),
('2025-10-01', 2, 24, 425, 227, 198, 17),
('2025-10-01', 3, 24, 15, 3, 12, 45),
('2025-10-01', 4, 24, 249, 198, 51, 14),
('2025-10-01', 5, 24, 468, 380, 88, 25),
('2025-10-01', 1, 25, 469, 412, 57, 49),
('2025-10-01', 2, 25, 119, 32, 87, 16),
('2025-10-01', 3, 25, 458, 271, 187, 41),
('2025-10-01', 4, 25, 495, 264, 231, 36),
('2025-10-01', 5, 25, 325, 283, 42, 11),
('2025-10-01', 1, 26, 331, 136, 195, 32),
('2025-10-01', 2, 26, 147, 1, 146, 19),
('2025-10-01', 3, 26, 170, 63, 107, 39),
('2025-10-01', 4, 26, 455, 24, 431, 22),
('2025-10-01', 5, 26, 221, 168, 53, 28),
('2025-10-01', 1, 27, 57, 17, 40, 17),
('2025-10-01', 2, 27, 59, 8, 51, 50),
('2025-10-01', 3, 27, 105, 105, 0, 17),
('2025-10-01', 4, 27, 316, 255, 61, 21),
('2025-10-01', 5, 27, 48, 47, 1, 43),
('2025-10-01', 1, 28, 242, 21, 221, 23),
('2025-10-01', 2, 28, 454, 118, 336, 39),
('2025-10-01', 3, 28, 77, 66, 11, 50),
('2025-10-01', 4, 28, 127, 27, 100, 48),
('2025-10-01', 5, 28, 433, 290, 143, 29),
('2025-10-01', 1, 29, 323, 63, 260, 47),
('2025-10-01', 2, 29, 63, 12, 51, 16),
('2025-10-01', 3, 29, 147, 71, 76, 24),
('2025-10-01', 4, 29, 110, 97, 13, 47),
('2025-10-01', 5, 29, 173, 14, 159, 32),
('2025-10-01', 1, 30, 167, 18, 149, 44),
('2025-10-01', 2, 30, 487, 289, 198, 21),
('2025-10-01', 3, 30, 278, 154, 124, 40),
('2025-10-01', 4, 30, 145, 49, 96, 33),
('2025-10-01', 5, 30, 220, 19, 201, 21);

INSERT INTO SupplyChainDB.Bronze.Inventory_Snapshot VALUES
('2025-10-01', 1, 31, 90, 20, 70, 36),
('2025-10-01', 2, 31, 330, 40, 290, 11),
('2025-10-01', 3, 31, 204, 33, 171, 28),
('2025-10-01', 4, 31, 245, 171, 74, 12),
('2025-10-01', 5, 31, 253, 45, 208, 15),
('2025-10-01', 1, 32, 265, 88, 177, 12),
('2025-10-01', 2, 32, 73, 70, 3, 34),
('2025-10-01', 3, 32, 320, 171, 149, 33),
('2025-10-01', 4, 32, 406, 309, 97, 13),
('2025-10-01', 5, 32, 353, 65, 288, 28),
('2025-10-01', 1, 33, 343, 98, 245, 17),
('2025-10-01', 2, 33, 470, 106, 364, 40),
('2025-10-01', 3, 33, 164, 104, 60, 14),
('2025-10-01', 4, 33, 484, 434, 50, 29),
('2025-10-01', 5, 33, 284, 281, 3, 37),
('2025-10-01', 1, 34, 119, 107, 12, 30),
('2025-10-01', 2, 34, 70, 14, 56, 13),
('2025-10-01', 3, 34, 291, 35, 256, 18),
('2025-10-01', 4, 34, 244, 108, 136, 49),
('2025-10-01', 5, 34, 409, 151, 258, 13),
('2025-10-01', 1, 35, 325, 270, 55, 36),
('2025-10-01', 2, 35, 68, 33, 35, 12),
('2025-10-01', 3, 35, 15, 7, 8, 23),
('2025-10-01', 4, 35, 74, 16, 58, 47),
('2025-10-01', 5, 35, 438, 56, 382, 25),
('2025-10-01', 1, 36, 437, 434, 3, 27),
('2025-10-01', 2, 36, 324, 97, 227, 28),
('2025-10-01', 3, 36, 495, 19, 476, 13),
('2025-10-01', 4, 36, 19, 10, 9, 35),
('2025-10-01', 5, 36, 317, 165, 152, 31),
('2025-10-01', 1, 37, 341, 30, 311, 24),
('2025-10-01', 2, 37, 254, 88, 166, 34),
('2025-10-01', 3, 37, 85, 17, 68, 39),
('2025-10-01', 4, 37, 439, 18, 421, 12),
('2025-10-01', 5, 37, 79, 49, 30, 17),
('2025-10-01', 1, 38, 6, 5, 1, 33),
('2025-10-01', 2, 38, 364, 102, 262, 20),
('2025-10-01', 3, 38, 166, 25, 141, 47),
('2025-10-01', 4, 38, 119, 62, 57, 11),
('2025-10-01', 5, 38, 256, 59, 197, 24),
('2025-10-01', 1, 39, 150, 88, 62, 39),
('2025-10-01', 2, 39, 135, 55, 80, 23),
('2025-10-01', 3, 39, 332, 319, 13, 48),
('2025-10-01', 4, 39, 309, 233, 76, 41),
('2025-10-01', 5, 39, 188, 119, 69, 12),
('2025-10-01', 1, 40, 44, 1, 43, 39),
('2025-10-01', 2, 40, 123, 75, 48, 46),
('2025-10-01', 3, 40, 154, 15, 139, 29),
('2025-10-01', 4, 40, 293, 132, 161, 27),
('2025-10-01', 5, 40, 9, 1, 8, 37);

DROP TABLE IF EXISTS SupplyChainDB.Bronze.Shipments;
CREATE TABLE IF NOT EXISTS SupplyChainDB.Bronze.Shipments (
    shipment_id INT,
    order_id INT,
    carrier VARCHAR,
    ship_mode VARCHAR,
    ship_date DATE,
    delivery_date DATE,
    shipping_cost FLOAT,
    shipment_status VARCHAR
);

INSERT INTO SupplyChainDB.Bronze.Shipments VALUES
(1, 1, 'DHL', 'Ground', '2025-04-15', '2025-04-16', 30.27, 'Delivered'),
(2, 2, 'UPS', 'Ocean', '2025-11-04', '2025-11-05', 31.08, 'Delivered'),
(3, 6, 'FedEx', 'Air', '2025-05-16', '2025-05-21', 13.99, 'Delivered'),
(4, 7, 'DHL', 'Ground', '2025-09-10', '2025-09-15', 10.05, 'Delivered'),
(5, 14, 'UPS', 'Ocean', '2025-11-21', '2025-11-25', 11.86, 'Delivered'),
(6, 16, 'DHL', 'Ground', '2025-12-04', '2025-12-06', 27.34, 'Delivered'),
(7, 18, 'UPS', 'Ocean', '2025-07-04', '2025-07-06', 47.28, 'Delivered'),
(8, 19, 'UPS', 'Air', '2025-06-10', '2025-06-11', 41.23, 'Delivered'),
(9, 22, 'FedEx', 'Ground', '2025-02-06', '2025-02-09', 32.96, 'Delivered'),
(10, 23, 'FedEx', 'Ground', '2025-07-26', '2025-07-28', 36.56, 'Delivered'),
(11, 24, 'DHL', 'Air', '2025-12-07', '2025-12-10', 17.1, 'Delivered'),
(12, 31, 'DHL', 'Ground', '2025-06-12', '2025-06-13', 38.95, 'Delivered'),
(13, 40, 'UPS', 'Ground', '2025-07-06', '2025-07-11', 14.2, 'Delivered'),
(14, 50, 'UPS', 'Ocean', '2025-11-16', '2025-11-21', 26.6, 'Delivered'),
(15, 51, 'FedEx', 'Ground', '2025-06-07', '2025-06-10', 41.08, 'Delivered'),
(16, 53, 'FedEx', 'Ground', '2025-10-02', '2025-10-03', 27.82, 'Delivered'),
(17, 55, 'DHL', 'Ground', '2025-07-20', '2025-07-23', 32.81, 'Delivered'),
(18, 56, 'DHL', 'Ground', '2025-07-26', '2025-07-31', 45.69, 'Delivered'),
(19, 63, 'DHL', 'Air', '2025-07-24', '2025-07-28', 20.47, 'Delivered'),
(20, 73, 'UPS', 'Air', '2025-03-06', '2025-03-07', 33.91, 'Delivered'),
(21, 75, 'UPS', 'Ocean', '2025-06-05', '2025-06-10', 16.87, 'Delivered'),
(22, 79, 'UPS', 'Ocean', '2025-12-07', '2025-12-12', 47.06, 'Delivered'),
(23, 89, 'UPS', 'Ocean', '2025-08-24', '2025-08-29', 48.6, 'Delivered'),
(24, 92, 'UPS', 'Air', '2025-05-05', '2025-05-10', 41.85, 'Delivered'),
(25, 94, 'FedEx', 'Ocean', '2025-05-06', '2025-05-11', 19.14, 'Delivered'),
(26, 106, 'UPS', 'Ocean', '2025-04-22', '2025-04-27', 48.03, 'Delivered'),
(27, 108, 'UPS', 'Ocean', '2025-11-27', '2025-11-28', 16.93, 'Delivered'),
(28, 114, 'DHL', 'Ground', '2025-01-23', '2025-01-25', 45.6, 'Delivered'),
(29, 116, 'FedEx', 'Ground', '2025-06-30', '2025-07-04', 48.83, 'Delivered'),
(30, 118, 'DHL', 'Ocean', '2025-04-19', '2025-04-22', 40.27, 'Delivered'),
(31, 121, 'FedEx', 'Air', '2025-04-25', '2025-04-27', 49.02, 'Delivered'),
(32, 125, 'UPS', 'Ocean', '2025-05-12', '2025-05-17', 44.56, 'Delivered'),
(33, 127, 'FedEx', 'Air', '2025-04-09', '2025-04-10', 7.18, 'Delivered'),
(34, 132, 'UPS', 'Air', '2025-12-31', '2026-01-03', 49.43, 'Delivered'),
(35, 138, 'DHL', 'Ground', '2025-03-17', '2025-03-20', 12.96, 'Delivered'),
(36, 139, 'FedEx', 'Air', '2025-07-25', '2025-07-27', 49.92, 'Delivered'),
(37, 140, 'FedEx', 'Ground', '2025-03-16', '2025-03-19', 39.87, 'Delivered'),
(38, 144, 'FedEx', 'Ground', '2025-02-03', '2025-02-04', 15.77, 'Delivered'),
(39, 148, 'UPS', 'Ocean', '2025-12-28', '2026-01-01', 33.53, 'Delivered');



-- =============================================================================
-- SILVER LAYER: ENRICHMENT & STANDARDIZATION
-- =============================================================================
-- The Silver layer focuses on cleaning, joining, and creating business-friendly views.
-- We denormalize the Star Schema here to make ad-hoc analysis easier.

-- View: Enriched Orders
-- Joins Orders with Products, Warehouses, and Shipments to provide a wide table for analysis.
CREATE VIEW SupplyChainDB.Silver.Enriched_Orders AS
SELECT
    o.order_id,
    o.order_date,
    o.customer_id,
    o.product_id,
    p.product_name,
    p.product_category,
    p.brand,
    o.warehouse_id,
    w.warehouse_name,
    w.region AS warehouse_region,
    o.ordered_qty,
    o.unit_price,
    CAST(o.ordered_qty AS DOUBLE) * o.unit_price AS gross_revenue,
    o.order_status,
    o.promised_delivery_date,
    o.actual_ship_date,
    s.carrier,
    s.ship_mode,
    s.shipping_cost,
    -- Calculate days taken to ship
    DATEDIFF(day, o.order_date, o.actual_ship_date) AS days_to_ship,
    -- Logic to determine if shipment was late
    CASE 
        WHEN o.actual_ship_date > o.promised_delivery_date THEN 1 
        ELSE 0 
    END AS is_late_shipment
FROM SupplyChainDB.Bronze.Orders o
LEFT JOIN SupplyChainDB.Bronze.Products p ON o.product_id = p.product_id
LEFT JOIN SupplyChainDB.Bronze.Warehouses w ON o.warehouse_id = w.warehouse_id
LEFT JOIN SupplyChainDB.Bronze.Shipments s ON o.order_id = s.order_id;

-- View: Inventory Status
-- Enriches the snapshot with product details and calculates healthy/at-risk statuses.
CREATE VIEW SupplyChainDB.Silver.Inventory_Status AS
SELECT
    i.snapshot_date,
    i.warehouse_id,
    w.warehouse_name,
    w.region,
    i.product_id,
    p.product_name,
    p.product_category,
    p.unit_cost,
    i.on_hand_qty,
    i.allocated_qty,
    i.available_qty,
    i.safety_stock_qty,
    (CAST(i.on_hand_qty AS DOUBLE) * p.unit_cost) AS total_inventory_value,
    -- Business logic for stock health
    CASE 
        WHEN i.available_qty <= 0 THEN 'Stockout'
        WHEN i.available_qty <= i.safety_stock_qty THEN 'Low Stock'
        ELSE 'Healthy'
    END AS stock_status,
    -- Utilization Ratio
    CASE 
        WHEN i.on_hand_qty > 0 THEN CAST(i.allocated_qty AS DOUBLE) / i.on_hand_qty 
        ELSE 0.0 
    END AS allocation_ratio
FROM SupplyChainDB.Bronze.Inventory_Snapshot i
JOIN SupplyChainDB.Bronze.Products p ON i.product_id = p.product_id
JOIN SupplyChainDB.Bronze.Warehouses w ON i.warehouse_id = w.warehouse_id;

-- View: Supplier Performance
-- Analyzes Purchase Orders to track lead times and fulfillment quality.
CREATE VIEW SupplyChainDB.Silver.Supplier_Performance AS
SELECT
    po.po_id,
    po.supplier_id,
    s.supplier_name,
    s.country,
    s.risk_rating,
    po.product_id,
    po.po_date,
    po.expected_delivery_date,
    po.actual_delivery_date,
    po.ordered_qty,
    po.received_qty,
    -- Lead time calculation
    DATEDIFF(day, po.po_date, po.actual_delivery_date) AS actual_lead_time,
    s.contract_lead_time_days,
    -- Late delivery flag
    CASE 
        WHEN po.actual_delivery_date > po.expected_delivery_date THEN 1 
        ELSE 0 
    END AS is_late_delivery,
    -- Partial delivery flag
    CASE 
        WHEN po.received_qty < po.ordered_qty THEN 1 
        ELSE 0 
    END AS is_partial_delivery
FROM SupplyChainDB.Bronze.Purchase_Orders po
JOIN SupplyChainDB.Bronze.Suppliers s ON po.supplier_id = s.supplier_id;

-- =============================================================================
-- GOLD LAYER: STRATEGIC BUSINESS METRICS
-- =============================================================================
-- The Gold layer provides aggregated, dashboard-ready metrics.

-- View: Fulfillment Metrics
-- Key KPIs: On-Time Delivery, Revenue, Late Shipment Rates.
CREATE VIEW SupplyChainDB.Gold.Fulfillment_Metrics AS
SELECT
    warehouse_region,
    product_category,
    ship_mode,
    COUNT(order_id) AS total_orders,
    SUM(gross_revenue) AS total_revenue,
    AVG(days_to_ship) AS avg_days_to_ship,
    SUM(is_late_shipment) AS total_late_orders,
    -- Calculate percentage of on-time shipments
    (1.0 - (SUM(CAST(is_late_shipment AS DOUBLE)) / COUNT(order_id))) * 100 AS on_time_shipment_rate
FROM SupplyChainDB.Silver.Enriched_Orders
WHERE order_status IN ('Shipped', 'Delivered')
GROUP BY warehouse_region, product_category, ship_mode;

-- View: Inventory Risk
-- Identifies capital tied up in inventory and risks of stockouts.
CREATE VIEW SupplyChainDB.Gold.Inventory_Risk AS
SELECT
    warehouse_name,
    product_category,
    COUNT(*) AS total_skus,
    SUM(total_inventory_value) AS inventory_value,
    -- Count of SKUs that are in trouble
    SUM(CASE WHEN stock_status IN ('Low Stock', 'Stockout') THEN 1 ELSE 0 END) AS at_risk_skus,
    AVG(allocation_ratio) AS avg_allocation
FROM SupplyChainDB.Silver.Inventory_Status
GROUP BY warehouse_name, product_category;

-- View: Supplier Scorecard
-- Evaluates suppliers based on reliability and risk.
CREATE VIEW SupplyChainDB.Gold.Supplier_Scorecard AS
SELECT
    supplier_name,
    risk_rating,
    COUNT(po_id) AS total_pos,
    AVG(actual_lead_time) AS avg_lead_time,
    SUM(is_late_delivery) AS late_deliveries,
    -- Fill Rate formula
    (SUM(CAST(received_qty AS DOUBLE)) / SUM(ordered_qty)) * 100 AS fill_rate_pct
FROM SupplyChainDB.Silver.Supplier_Performance
WHERE po_status = 'Closed'
GROUP BY supplier_name, risk_rating;

-- =============================================================================
-- AI AGENT PROMPTS / QUESTIONS
-- =============================================================================
/*
Use the following natural language prompts to test Dremio's AI capabilities against this dataset.
You can copy and paste these directly into the Dremio chat interface.

--- Demand & Fulfillment ---
"Which products are most frequently backordered this quarter?"
"How has on-time delivery changed over the last 90 days?"
"Which customers are most impacted by late shipments?"
"Show me revenue by product category and region."

--- Inventory Optimization ---
"Where do we have excess inventory relative to demand?"
"Which SKUs are at risk of stocking out in the next two weeks?"
"How many days of supply do we have by warehouse and product category?"
"Show me total inventory value by risk status."

--- Supplier Performance & Risk ---
"Which suppliers are missing delivery dates most often?"
"How does supplier lead time vary by region?"
"What percentage of our spend is with high-risk suppliers?"

--- Cost & Margin Impact ---
"What is the revenue impact of delayed orders?"
"Which products have rising logistics costs but flat demand?"
"How much extra shipping cost are we incurring due to expediting?"

--- Executive / What-If Questions ---
"If supplier delays increase by 10%, which products are most affected?"
"What happens to inventory levels if demand spikes 15% next month?"
"Which warehouses should we rebalance to reduce stockouts?"
*/
