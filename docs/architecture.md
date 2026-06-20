# Architecture

```text
Raw Retail Data
      ↓
Snowflake RAW Schema
      ↓
dbt Staging Models
      ↓
dbt Intermediate Models
      ↓
dbt Mart Models
      ↓
dbt Tests + Documentation
      ↓
GitHub Actions CI/CD