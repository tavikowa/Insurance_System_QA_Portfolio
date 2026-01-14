-- Basic SQL Queries for Insurance_DB
SELECT * FROM policies WHERE policy_type 'OC' AND premium > 1000;

SELECT first_name, last_name, policy_type, end_date FROM clients JOIN policies ON clients.client_id = policies.client_id;

SELECT SUM(policy_fee) FROM policies;

-- Queries for testing purposes

-- Case 1: Time logic
-- Scenario: Claim date cannot be registered with a date before policy start date.
-- Expected results: 0 rows returned
SELECT policies.policy_id, start_date, claim_date 
FROM policies 
JOIN claims ON policies.policy_id = claims.policy_id 
WHERE claims.claim_date < policies.start_date;

-- Case 2: Time logic- post-policy claims
-- Scenario: Claim date cannot be registered with a date after policy end date.
-- Expected results: 0 rows returned
SELECT policies.policy_id, end_date, claim_date 
FROM policies 
JOIN claims ON policies.policy_id = claims.policy_id 
WHERE claims.claim_date > policies.end_date;

-- Case 3: Gap Analysis
-- Scenario: Find all registered clients without any active policy.
-- Purpose: Identify potential sales leads.
SELECT first_name, last_name 
FROM clients 
LEFT JOIN policies ON clients.client_id = policies.client_id 
WHERE policies.policy_id IS NULL;

-- Case 4: Business reporting
-- Scenario: Calculate total policy fee per policy type.
-- Purpose: Verify functionality of financial reporting aggregations.
SELECT policy_type, SUM(policy_fee) 
FROM policies 
GROUP BY policy_type;

-- Case 5: PESEL length verification
-- Scenario: PESEL cannot have different lenght than 11, but it's not secured in DB (CONSTRAINT CHECK).
-- Expected results: 0 rows returned
SELECT client_id, first_name, last_name, pesel 
FROM clients 
WHERE LENGTH(pesel) != 11;

-- Case 6: PESEL data validation
-- Scenario: PESEL should include only numbers.
-- Expected results: 0 rows returned
SELECT client_id, first_name, last_name, pesel 
FROM clients
WHERE pesel NOT GLOB '[0-9]*';

-- Case 7: Loss ratio
-- Scenario: Find policies, where a claim amount is 3 times highier than a policy fee.
-- Purpose: If a claim amount is 3 times highier than a policy fee it might be a possible fraud and needs to be verified manually.
SELECT policies.policy_id, policy_fee, claim_amount
FROM policies
JOIN claims ON policies.policy_id = claims.policy_id
WHERE claim_amount > 3 * policy_fee;
