# Build Log

## 1. Project Objective
Built a Snowflake + dbt analytics engineering platform for retail order data.

## 2. Warehouse Setup
Created RETAIL_ANALYTICS database, RETAIL_WH warehouse, and schemas for raw, staging and marts.

## 3. Authentication
Configured dbt with Snowflake key-pair authentication after MFA blocked password-based access.

## 4. Raw Data Loading
Loaded Olist retail CSVs into Snowflake.

## 5. dbt Layers
Built staging, intermediate, fact, dimension and reporting models.

## 6. Testing
Added built-in dbt tests and custom SQL tests for business rules.

## 7. CI/CD
Added GitHub Actions to validate the dbt project on push and pull request.