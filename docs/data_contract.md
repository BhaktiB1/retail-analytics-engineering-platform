# Data Contract

## Purpose

This document defines the expected structure and quality requirements for source data used by the Retail Analytics Engineering Platform.

The goal is to ensure downstream models remain stable and predictable.

---

## Orders

| Column                   | Data Type | Nullable | Description              |
| ------------------------ | --------- | -------- | ------------------------ |
| order_id                 | VARCHAR   | No       | Unique order identifier  |
| customer_id              | VARCHAR   | No       | Customer identifier      |
| order_status             | VARCHAR   | No       | Current order status     |
| order_purchase_timestamp | TIMESTAMP | No       | Order purchase timestamp |

### Quality Rules

* order_id must be unique
* customer_id must exist
* order_status must be valid
* purchase timestamp cannot be null

---

## Customers

| Column             | Data Type | Nullable | Description                  |
| ------------------ | --------- | -------- | ---------------------------- |
| customer_id        | VARCHAR   | No       | Unique customer identifier   |
| customer_unique_id | VARCHAR   | No       | Customer business identifier |
| customer_city      | VARCHAR   | Yes      | Customer city                |
| customer_state     | VARCHAR   | Yes      | Customer state               |

### Quality Rules

* customer_id must be unique
* customer_id cannot be null

---

## Order Items

| Column        | Data Type | Nullable | Description        |
| ------------- | --------- | -------- | ------------------ |
| order_id      | VARCHAR   | No       | Order identifier   |
| product_id    | VARCHAR   | No       | Product identifier |
| seller_id     | VARCHAR   | No       | Seller identifier  |
| price         | NUMBER    | No       | Product price      |
| freight_value | NUMBER    | No       | Shipping cost      |

### Quality Rules

* Price cannot be negative
* Freight cost cannot be negative

---

## Contract Ownership

Analytics Engineering Team

Changes to source schemas should be reviewed before implementation to prevent downstream model failures.
