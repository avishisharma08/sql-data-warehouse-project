

# Data Warehouse Project – Medallion Architecture

This project demonstrates an end-to-end Data Warehouse built using the Medallion Architecture (Bronze, Silver, Gold layers).  
The goal is to understand how raw data is transformed into business-ready insights.

---

## Project Overview

This project is inspired by a tutorial from Data With Baraa and is being built with a focus on deep understanding and practical implementation.

It covers:
- Data ingestion from multiple sources
- Data cleaning and transformation
- Data modeling for analytics
- Preparing data for reporting and dashboards

---

## Architecture

The project follows the Medallion Architecture:

### Bronze Layer (Raw Data)
- Stores raw data as-is from source systems
- No transformations applied
- Handles batch ingestion

Key Features:
- Source: ERP, CSV files
- Load: Batch processing
- Storage: Tables / Files

---

### Silver Layer (Processed Data)
- Cleans and standardizes data
- Removes duplicates and inconsistencies
- Prepares data for analysis

Key Features:
- Data Cleaning
- Deduplication
- Type Casting
- Structured schema

---

### Gold Layer (Business-Ready Data)
- Transforms data into analytics-ready format
- Applies business logic and aggregations
- Optimized for reporting

Key Features:
- Data Integration
- Aggregations
- Star Schema (Fact & Dimension Tables)

---

## Tech Stack

- SQL  
- Python (planned / in progress)  
- Apache Airflow (planned)  
- Power BI (for visualization)  

---

## Data Flow

Sources → Bronze → Silver → Gold → Dashboard / Analytics

---

## Use Cases

- Business reporting
- Dashboard creation
- Ad-hoc SQL analysis
- Data science / ML use cases

---

## Project Status

In Progress  

Currently working on:
- Building Bronze layer ingestion
- Implementing Silver layer transformations

---

## Future Enhancements

- Real-time data pipeline (streaming)
- Workflow orchestration using Airflow
- Data quality checks and monitoring
- Dashboard integration (Power BI)

---

## Acknowledgment

This project is inspired by the tutorial from Data With Baraa.  
The implementation and improvements are being done as part of my learning journey.

---

## Connect

If you have suggestions or feedback, feel free to connect or open an issue.

