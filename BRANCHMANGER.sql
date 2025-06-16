create database branchdb;
use branchdb;
show tables;
describe branch_manager;
describe branch_staff;
describe customer;
describe loan_payment;
INSERT INTO branch_manager VALUES (1, 'Anna Nagar', 'pass123', 'manager1');
describe loan_application;
insert into loan_application values(1,2930.0,'Anna Nagar','abinesh','PENDING');
insert into loan_application values(2,6000.0,'Anna Nagar','vignesh','PENDING');
select * from branch_staff;
select * from branch_manager;
insert into loan_application values(3,50000.0,'Anna Nagar','Shivanii M','PENDING');
select * from customer;
INSERT INTO loan_application (amount, branch_name, customer_name, status, application_date)
VALUES (50000.0, 'Anna Nagar', 'Shivanii M', 'PENDING', '2024-06-16');
-- Customers for 'Anna Nagar' Branch (20 records)
-- Corrected Customer Inserts for 'Anna Nagar' Branch (20 records)
INSERT INTO customer (name, account_number, branch_name) VALUES
('Akash Sharma', 'ACC001', 'Anna Nagar'),
('Bhavya Reddy', 'ACC002', 'Anna Nagar'),
('Chirag Patel', 'ACC003', 'Anna Nagar'),
('Deepika Singh', 'ACC004', 'Anna Nagar'),
('Eshaan Gupta', 'ACC005', 'Anna Nagar'),
('Fathima Khan', 'ACC006', 'Anna Nagar'),
('Gaurav Mehta', 'ACC007', 'Anna Nagar'),
('Hema Sridhar', 'ACC008', 'Anna Nagar'),
('Ishaan Das', 'ACC009', 'Anna Nagar'),
('Jasmine Kaur', 'ACC010', 'Anna Nagar'),
('Kartik Iyer', 'ACC011', 'Anna Nagar'),
('Lavanya Rao', 'ACC012', 'Anna Nagar'),
('Manish Kumar', 'ACC013', 'Anna Nagar'),
('Nidhi Sharma', 'ACC014', 'Anna Nagar'),
('Om Prakash', 'ACC015', 'Anna Nagar'),
('Priya Singh', 'ACC016', 'Anna Nagar'),
('Rahul Gupta', 'ACC017', 'Anna Nagar'),
('Sonal Verma', 'ACC018', 'Anna Nagar'),
('Tarun Reddy', 'ACC019', 'Anna Nagar'),
('Uma Devi', 'ACC020', 'Anna Nagar');
-- Loan Applications for 'Anna Nagar' Branch (15 records)
INSERT INTO loan_application (customer_name, amount, status, application_date, branch_name) VALUES
('Akash Sharma', 150000.00, 'APPROVED', '2025-05-10', 'Anna Nagar'),
('Bhavya Reddy', 250000.00, 'PENDING', '2025-06-01', 'Anna Nagar'),
('Chirag Patel', 75000.00, 'REJECTED', '2025-05-20', 'Anna Nagar'),
('Deepika Singh', 120000.00, 'APPROVED', '2025-05-15', 'Anna Nagar'),
('Eshaan Gupta', 300000.00, 'PENDING', '2025-06-05', 'Anna Nagar'),
('Fathima Khan', 90000.00, 'APPROVED', '2025-05-25', 'Anna Nagar'),
('Gaurav Mehta', 180000.00, 'PENDING', '2025-06-10', 'Anna Nagar'),
('Hema Sridhar', 50000.00, 'APPROVED', '2025-05-01', 'Anna Nagar'),
('Ishaan Das', 220000.00, 'PENDING', '2025-06-12', 'Anna Nagar'),
('Jasmine Kaur', 100000.00, 'REJECTED', '2025-05-28', 'Anna Nagar'),
('Kartik Iyer', 400000.00, 'APPROVED', '2025-05-08', 'Anna Nagar'),
('Lavanya Rao', 60000.00, 'PENDING', '2025-06-15', 'Anna Nagar'),
('Manish Kumar', 130000.00, 'APPROVED', '2025-05-03', 'Anna Nagar'),
('Priya Singh', 190000.00, 'PENDING', '2025-06-16', 'Anna Nagar'),
('Rahul Gupta', 85000.00, 'APPROVED', '2025-05-18', 'Anna Nagar');
-- Loan Payments (Linked to APPROVED Loan Applications)
-- Staff Members for 'Anna Nagar' Branch (5 records)

-- Staff Members for 'Anna Nagar' Branch (5 records)
INSERT INTO branch_staff (branch_name, name, role, address, email, password, phone, status, username) VALUES
('Anna Nagar', 'Suresh Kumar', 'TELLER', 'Staff Qtrs 1, Anna Nagar', 'suresh.kumar@example.com', 'staffpass1', '9988776655', 'ACTIVE', 'suresh.k'),
('Anna Nagar', 'Rina Singh', 'LOAN_OFFICER', 'Staff Qtrs 2, Anna Nagar', 'rina.singh@example.com', 'staffpass2', '9977665544', 'ACTIVE', 'rina.s'),
('Anna Nagar', 'Alok Verma', 'TELLER', 'Staff Qtrs 3, Anna Nagar', 'alok.verma@example.com', 'staffpass3', '9966554433', 'PENDING_APPROVAL', 'alok.v'),
('Anna Nagar', 'Preeti Joshi', 'TELLER', 'Staff Qtrs 4, Anna Nagar', 'preeti.j@example.com', 'staffpass4', '9955443322', 'ACTIVE', 'preeti.j'),
('Anna Nagar', 'Vikram Rao', 'LOAN_OFFICER', 'Staff Qtrs 5, Anna Nagar', 'vikram.r@example.com', 'staffpass5', '9944332211', 'PENDING_APPROVAL', 'vikram.r');

SELECT id, name FROM customer WHERE branch_name = 'Anna Nagar';
-- Issues for 'Anna Nagar' Branch (5 records)

INSERT INTO issues (date_raised, description, status, subject, customer_id, branch_name) VALUES
('2025-06-13', 'Customer unable to access online banking portal.', 'OPEN', 'Online Banking Access',25 , 'Anna Nagar'),
('2025-06-10', 'Incorrect transaction details on recent statement.', 'OPEN', 'Statement Discrepancy', 26, 'Anna Nagar'),
('2025-06-11', 'ATM at Branch A is out of cash.', 'RESOLVED', 'ATM Maintenance', 27, 'Anna Nagar'),
('2025-06-15', 'Client wants to update personal information but form is missing.', 'OPEN', 'Data Update Form', 25, 'Anna Nagar'),
('2025-06-08', 'Complaint about long waiting times at the teller counter.', 'CLOSED', 'Teller Queue Management', 26, 'Anna Nagar');

-- Payments for Akash Sharma (Original Loan: 150000.00)
INSERT INTO loan_payment (loan_id, customer_name, amount_paid, payment_date, branch_name) VALUES
(5, 'Akash Sharma', 10000.00, '2025-06-01', 'Anna Nagar'),
(5, 'Akash Sharma', 15000.00, '2025-06-15', 'Anna Nagar'),
(5, 'Akash Sharma', 10000.00, '2025-07-01', 'Anna Nagar');

-- Payments for Deepika Singh (Original Loan: 120000.00)
INSERT INTO loan_payment (loan_id, customer_name, amount_paid, payment_date, branch_name) VALUES
(8, 'Deepika Singh', 8000.00, '2025-06-03', 'Anna Nagar'),
(8, 'Deepika Singh', 12000.00, '2025-06-18', 'Anna Nagar'),
(8, 'Deepika Singh', 8000.00, '2025-07-03', 'Anna Nagar');

-- Payments for Fathima Khan (Original Loan: 90000.00)
INSERT INTO loan_payment (loan_id, customer_name, amount_paid, payment_date, branch_name) VALUES
(10, 'Fathima Khan', 9000.00, '2025-06-10', 'Anna Nagar'),
(10, 'Fathima Khan', 9000.00, '2025-07-10', 'Anna Nagar');

-- Payments for Hema Sridhar (Original Loan: 50000.00)
INSERT INTO loan_payment (loan_id, customer_name, amount_paid, payment_date, branch_name) VALUES
(12, 'Hema Sridhar', 5000.00, '2025-06-15', 'Anna Nagar'),
(12, 'Hema Sridhar', 5000.00, '2025-07-15', 'Anna Nagar');

-- Payments for Kartik Iyer (Original Loan: 400000.00)
INSERT INTO loan_payment (loan_id, customer_name, amount_paid, payment_date, branch_name) VALUES
(15, 'Kartik Iyer', 40000.00, '2025-06-02', 'Anna Nagar'),
(15, 'Kartik Iyer', 40000.00, '2025-06-16', 'Anna Nagar'),
(15, 'Kartik Iyer', 40000.00, '2025-07-02', 'Anna Nagar');

-- Payments for Manish Kumar (Original Loan: 130000.00)
INSERT INTO loan_payment (loan_id, customer_name, amount_paid, payment_date, branch_name) VALUES
(17, 'Manish Kumar', 13000.00, '2025-06-08', 'Anna Nagar'),
(17, 'Manish Kumar', 13000.00, '2025-07-08', 'Anna Nagar');

-- Payments for Rahul Gupta (Original Loan: 85000.00)
INSERT INTO loan_payment (loan_id, customer_name, amount_paid, payment_date, branch_name) VALUES
(21, 'Rahul Gupta', 8500.00, '2025-06-14', 'Anna Nagar'),
(21, 'Rahul Gupta', 8500.00, '2025-07-14', 'Anna Nagar');

-- Additional payments (mix, for varied dates/amounts)
INSERT INTO loan_payment (loan_id, customer_name, amount_paid, payment_date, branch_name) VALUES
(5, 'Akash Sharma', 5000.00, '2025-07-20', 'Anna Nagar'),
(8, 'Deepika Singh', 7000.00, '2025-07-22', 'Anna Nagar'),
(15, 'Kartik Iyer', 20000.00, '2025-07-25', 'Anna Nagar'),
(17, 'Manish Kumar', 5000.00, '2025-07-28', 'Anna Nagar');
DESCRIBE customer;
