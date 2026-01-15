# 📄 Test Plan: Data Artifacts Verification (Static Testing)

| Project Info | Details |
| :--- | :--- |
| **Project** | Insurance System - Data Migration Prep |
| **Object of Testing** | SQL Scripts, JSON Payloads, XML External Data |
| **Type of Testing** | **Static Testing** / Manual Data Review |
| **Author** | Oktawia Kowalewska |
| **Date** | 2026-01-14 |

### 1. 🎯 Objective
The goal is to perform a manual review of the database initialization scripts (`.sql`) and API data templates (`.json`, `.xml`) to ensure they comply with business rules **before** the system is fully deployed.

### 2. 🔭 Scope (Zakres)

**In Scope:**
* **SQL Script Logic:** Verifying if `INSERT` statements in `01_Insurance_DB.sql` contain correct business values.
* **Data Consistency:** Comparing input data (JSON) against stored data (SQL) to identify discrepancies.
* **Format Compliance:** Checking if JSON and XML files adhere to the required structure.

**Out of Scope:**
* Executing the application (UI/Backend).
* Performance testing.

### 3. 🛠️ Test Strategy
We will use **Static Analysis** techniques:
1.  **Walkthrough:** Step-by-step review of the SQL code.
2.  **Cross-Check:** Manually comparing the "User Request" (JSON file) with the "Database Record" (SQL file) to simulate a transaction flow.

**Tools:**
* Text Editor (VS Code).

### 4. 🚪 Criteria

**Entry Criteria:**
* SQL Schema file is prepared.
* Test Data (JSON/XML) files are generated.

**Exit Criteria:**
* All data files reviewed.
* Discrepancies between JSON inputs and SQL outputs are reported as Bugs.