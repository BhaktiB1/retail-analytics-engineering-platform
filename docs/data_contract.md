# Data Contract

## Purpose
This document defines the expected structure and quality rules for the retail analytics models.

## Quality Expectations
- Order IDs must not be null
- Order-level models must contain one row per order
- Revenue values must not be negative
- Delivery days must not be negative for completed deliveries
- Accepted order statuses must be documented and tested