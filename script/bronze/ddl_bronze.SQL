## Bronze Layer ETL Implementation

### Overview

Implemented the Bronze Layer data ingestion process for the data warehouse project using PostgreSQL stored procedures.

### Changes Made

* Created `bronze.load_bronze_layer()` stored procedure.
* Added logic to truncate staging tables before loading new data.
* Configured bulk data ingestion using PostgreSQL `COPY` commands.
* Loaded CRM source datasets:

  * Customer data (`cust_info.csv`)
  * Product data (`prd_info.csv`)
  * Sales data (`sales_info.csv`)
* Established the foundation of the ETL pipeline by loading raw source data into Bronze staging tables.

### Purpose

This implementation enables automated ingestion of raw CRM data into the Bronze Layer, ensuring that staging tables are refreshed and populated consistently before downstream transformations in the Silver and Gold layers.

### Technologies Used

* PostgreSQL
* PL/pgSQL
* CSV Data Sources
* ETL/Data Warehousing Concepts
git commit -m "Implement ETL procedure for bronze layer CSV ingestion"
copy bronze.stg_customers FROM 'C:/SQL/dwh_project/sql-data-warehouse-project/datasets/source_crm/cust_info.csv' DELIMITER ',' CSV HEADER;
copy bronze.stg_producer FROM 'C:/SQL/dwh_project/sql-data-warehouse-project/datasets/source_crm/prd_info.csv' DELIMITER ',' CSV HEADER;
copy bronze.stg_sales FROM 'C:/SQL/dwh_project/sql-data-warehouse-project/datasets/source_crm/sales_details.csv' DELIMITER ',' CSV HEADER;
copy bronze.erp_cust_az12 FROM'C:/SQL/dwh_project/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv' DELIMITER ',' CSV HEADER;
copy bronze.erp_loc_a101 FROM'C:/SQL/dwh_project/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv' DELIMITER ',' CSV HEADER;
copy bronze.erp_px_cat_giv2 FROM'C:/SQL/dwh_project/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv' DELIMITER ',' CSV HEADER;
CREATE OR REPLACE PROCEDURE bronze.load_bronze_layer()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Clean tables
    TRUNCATE TABLE bronze.stg_customers;
    TRUNCATE TABLE bronze.stg_producer;
    TRUNCATE TABLE bronze.stg_sales;

    -- Load customers
    EXECUTE 'COPY bronze.stg_customers
             FROM ''C:/SQL/dwh_project/sql-data-warehouse-project/datasets/source_crm/cust_info.csv''
             WITH (FORMAT CSV, HEADER true, DELIMITER '','')';

    -- Load products
    EXECUTE 'COPY bronze.stg_producer
             FROM ''C:/SQL/dwh_project/sql-data-warehouse-project/datasets/source_crm/prd_info.csv''
             WITH (FORMAT CSV, HEADER true, DELIMITER '','')';

    -- Load sales
    EXECUTE 'COPY bronze.stg_sales
             FROM ''C:/SQL/dwh_project/sql-data-warehouse-project/datasets/source_crm/sales_info.csv''
             WITH (FORMAT CSV, HEADER true, DELIMITER '','')';

END;
$$;
