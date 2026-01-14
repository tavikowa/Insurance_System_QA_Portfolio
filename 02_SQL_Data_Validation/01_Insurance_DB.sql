CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    PESEL VARCHAR(11) NOT NULL,
    city VARCHAR(50)
);

CREATE TABLE policies (
    policy_id INT PRIMARY KEY,
    client_id INT,
    policy_type VARCHAR(10),
    start_date DATE,
    end_date DATE,
    premium DECIMAL(10,2),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE claims (
    claim_id INT PRIMARY KEY,
    policy_id INT,
    claim_date DATE,
    claim_amount DECIMAL(10,2),
    status VARCHAR(15),
    FOREIGN KEY (policy_id) REFERENCES policies(policy_id)
);

-- 1. Clients
INSERT INTO clients (client_id, first_name, last_name, pesel, city)
VALUES (1, 'Jan', 'Kowalski', '99010112345', 'Gdańsk');

INSERT INTO clients (client_id, first_name, last_name, pesel, city)
VALUES (2, 'Anna', 'Nowak', '85051598765', 'Warszawa');

INSERT INTO clients (client_id, first_name, last_name, pesel, city)
VALUES (3, 'Piotr', 'Wiśniewski', '90112055555', 'Sopot');

-- 2. Policies
INSERT INTO policies (policy_id, client_id, policy_type, start_date, end_date, premium)
VALUES (101, 1, 'OC', '2025-02-15', '2026-02-14', 1200.00);

INSERT INTO policies (policy_id, client_id, policy_type, start_date, end_date, premium)
VALUES (102, 2, 'AC', '2024-01-01', '2024-12-31', 2500.00);

INSERT INTO policies (policy_id, client_id, policy_type, start_date, end_date, premium)
VALUES (103, 2, 'HOME', '2025-06-01', '2026-05-31', 450.00);

-- 3. Claims
INSERT INTO claims (claim_id, policy_id, claim_date, claim_amount, status)
VALUES (5001, 102, '2024-06-15', 1200.50, 'PAID');

INSERT INTO claims (claim_id, policy_id, claim_date, claim_amount, status)
VALUES (5002, 101, '2025-12-20', 5000.00, 'REJECTED');