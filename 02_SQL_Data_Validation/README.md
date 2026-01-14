# 🗄️ SQL Data Validation

This module contains SQL scripts designed to set up a test environment and perform data integrity checks within an Insurance Management System context.

### 📂 Folder Contents

| File | Description |
| :--- | :--- |
| **`01_Insurance_DB.sql`** | **Start here.** script that creates the database structure (Tables: `Clients`, `Policies`, `Claims`) and populates it with sample test data (Seed Data). |
| **`02_Validation_Queries.sql`** | Contains queries for validating business logic, performing gap analysis, and generating financial risk reports. |

### 🛠️ How to Run

The code is optimized for **SQLite** (standard Python database engine) but is compatible with most SQL dialects.

1. Open an online SQL editor (e.g., [SQLite Online](https://sqliteonline.com/)).
2. Copy and execute the content of `01_Insurance_DB.sql` to build the database.
3. Execute queries from `02_Validation_Queries.sql` one by one to verify data integrity and business rules.

### 🧠 Key SQL Skills Demonstrated

This portfolio section demonstrates the practical application of the following SQL concepts for QA purposes:
* **Relational Database Design:** Understanding Primary Keys and Foreign Keys.
* **JOINs (INNER / LEFT):** Verifying relationships between entities and identifying missing data.
* **Aggregations (SUM, COUNT, GROUP BY):** Generating summary reports and validating financial totals.
* **Business Logic Verification (WHERE):** Detecting fraud risks and time-logic anomalies.
* **Data Validation:** Using pattern matching (`GLOB`/`REGEX`) to ensure data quality (e.g., PESEL validation).
