# Retail Analytics Engineering Platform

## Overview

This project demonstrates the design and implementation of a modern Analytics Engineering platform using Snowflake and dbt.

The objective was to transform raw retail data into trusted, analytics-ready datasets using software engineering principles, data modelling best practices, automated testing, and CI/CD workflows.

The project follows a layered architecture commonly used in production Analytics Engineering environments and showcases core skills required for Analytics Engineer roles, including:

* Advanced SQL transformations
* dbt model development
* Data quality testing
* Jinja macros
* Incremental processing
* Dimensional modelling
* Git version control
* GitHub Actions CI/CD
* Snowflake data warehousing

---

## Business Problem

Retail organisations often struggle with fragmented operational data spread across multiple systems.

Analysts require clean, documented, and reliable datasets to answer business questions such as:

* Which products generate the most revenue?
* Which customer segments are most valuable?
* What is the average delivery performance?
* Which orders are delivered late?
* How do sales trends change over time?

This project transforms raw transactional retail data into a scalable analytics platform capable of supporting reporting, dashboarding, and advanced analytics use cases.

---

## Technology Stack

| Technology     | Purpose                          |
| -------------- | -------------------------------- |
| Snowflake      | Cloud Data Warehouse             |
| dbt Core       | Data Transformation Framework    |
| SQL            | Data Modelling & Transformations |
| Jinja          | Reusable Logic & Macros          |
| Git            | Version Control                  |
| GitHub         | Source Control                   |
| GitHub Actions | Continuous Integration           |
| Python         | dbt Runtime Environment          |

---

## Architecture

The project follows a layered Analytics Engineering architecture:

```text
Raw Source Data
        │
Staging Models
        │
Intermediate Models
        │
Fact & Dimension Models
        │
Reporting Models
```

---

## Project Structure

```text
retail-analytics-engineering-platform
│
├── retail_analytics
│   │
│   ├── models
│   │   ├── staging
│   │   ├── intermediate
│   │   └── marts
│   │       ├── dimensions
│   │       ├── facts
│   │       └── reporting
│   │
│   ├── macros
│   ├── tests
│   └── dbt_project.yml
│
├── .github
│   └── workflows
│       └── dbt-ci.yml
│
├── docs
│
└── README.md
```

---

## Data Model Layers

### Staging Layer

Purpose:

* Standardise source data
* Apply naming conventions
* Perform basic cleaning
* Establish trusted source models

Examples:

* stg_customers
* stg_orders
* stg_order_items
* stg_order_payments
* stg_products
* stg_sellers

---

### Intermediate Layer

Purpose:

* Centralise reusable business logic
* Join related entities
* Reduce duplication

Example:

* int_order_items_enriched

This model combines:

* Orders
* Customers
* Products
* Sellers
* Delivery metrics

into a reusable analytics layer.

---

### Mart Layer

Purpose:

* Create business-facing datasets
* Implement dimensional modelling
* Support reporting and analytics

Dimensions:

* dim_customers
* dim_products

Facts:

* fct_order_items
* fct_order_items_incremental

Reporting:

* rpt_monthly_revenue

---

## Data Quality Framework

The project uses dbt testing to ensure data quality.

### Built-In dbt Tests

* not_null
* unique
* accepted_values

### Custom Business Rule Tests

* no_negative_price
* no_negative_freight
* valid_delivery_timeline

These tests validate business logic rather than only schema integrity.

---

## Incremental Processing

An incremental fact model was implemented using dbt incremental materialisations.

Benefits:

* Faster processing
* Lower warehouse costs
* Production scalability
* Efficient handling of large datasets

Only newly arriving records are processed during incremental runs.

---

## Reusable Jinja Macro

The project includes reusable business logic through Jinja macros.

Example:

* calculate_delivery_status

Benefits:

* Reduced code duplication
* Centralised business logic
* Easier maintenance
* Consistent calculations across models

---

## CI/CD

GitHub Actions is used to automatically validate the dbt project whenever code is pushed or a pull request is opened.

Current validations include:

* Repository checkout
* Python environment setup
* dbt installation
* dbt project parsing

This helps catch:

* Broken refs
* Invalid sources
* YAML errors
* Jinja syntax issues

before changes are merged.

---

## Documentation

dbt documentation can be generated using:

```bash
dbt docs generate
dbt docs serve
```

The documentation includes:

* Model lineage
* Source dependencies
* Column-level documentation
* Test coverage

---

## Lessons Learned

### Snowflake Authentication

Initially encountered MFA authentication issues when connecting dbt to Snowflake.

Resolved by creating a dedicated dbt user and configuring authentication correctly.

### Source Freshness

Source freshness was explored using dbt.

Because the Olist dataset is a historical static dataset rather than a continuously loaded production source, freshness checks produced stale-source warnings.

In a production environment, a dedicated ingestion timestamp would be added and monitored through dbt source freshness.

### Data Quality

Business rule testing proved valuable for identifying invalid data scenarios such as:

* Negative pricing
* Negative freight charges
* Invalid delivery timelines

### Analytics Engineering Practices

This project reinforced several key Analytics Engineering principles:

* Explicit modelling over SELECT *
* Layered transformations
* Reusable business logic
* Automated testing
* CI/CD-driven development
* Documentation-first design

---

## Future Improvements

Potential enhancements include:

* Great Expectations integration
* Terraform infrastructure deployment
* Dockerised local development
* Airflow orchestration
* Pull Request validation workflows
* Advanced dbt exposures
* Data contracts
* Automated deployment pipelines

---

## Author

Built as a portfolio project to demonstrate modern Analytics Engineering skills using Snowflake, dbt, SQL, GitHub Actions, testing, and dimensional modelling.
