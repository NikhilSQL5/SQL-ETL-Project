/*
this script is for creating the table in 'silver schema'
if already exists it drops the table
*/

USE DataWareHouse;
/*check the silver.crm_cust_info table exist or not if exist then drop*/
IF OBJECT_ID('silver.crm_cust_info','U') IS NOT NULL
	DROP TABLE silver.crm_cust_info;
GO

/*creating silver.crm_cust_info table*/
CREATE TABLE silver.crm_cust_info
(
cst_id INT,
cst_key NVARCHAR (50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_marital_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date date
);
GO

/*check the silver.crm_prd_info table exist or not if exist then drop*/
IF OBJECT_ID('silver.crm_prd_info','U') IS NOT NULL
	DROP TABLE silver.crm_prd_info;
GO

/*creating silver.crm_prd_info table*/
CREATE TABLE silver.crm_prd_info
(
prd_id int,
prd_key VARCHAR(50),
cat_id NVARCHAR(50),
prd_nm NVARCHAR(50),
prd_cost int,
prd_line NVARCHAR(50),
prd_start_dt DATE,
prd_end_dt DATE
);
GO

/*check the silver.sales_details_info table exist or not if exist then drop*/
IF OBJECT_ID('silver.sales_details_info','U') IS NOT NULL
	DROP TABLE silver.sales_details_info;
GO

/*creating silver.sales_details_info table*/
CREATE TABLE silver.sales_details_info
(
sls_ord_num NVARCHAR(50),
sls_prd_key VARCHAR(50),
sls_cust_id INT,
sls_order_dt DATE,
sls_ship_dt DATE,
sls_due_dt DATE,
sls_sales INT,
sls_quantity INT,
sls_price INT
);
GO

/*check the silver.erp_loc_a101table exist or not if exist then drop*/
IF OBJECT_ID('silver.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE silver.erp_loc_a101;
GO

/*creating silver.erp_loc_a101 table*/
CREATE TABLE silver.erp_loc_a101 (
    cid    NVARCHAR(50),
    cntry  NVARCHAR(50)
);
GO

/*check the silver.erp_cust_az12 table exist or not if exist then drop*/
IF OBJECT_ID('silver.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE silver.erp_cust_az12;
GO

/*creating silver.erp_cust_az12 table*/
CREATE TABLE silver.erp_cust_az12 (
    cid    NVARCHAR(50),
    bdate  DATE,
    gen    NVARCHAR(50)
);
GO

/*check the silver.erp_px_cat_g1v2 table exist or not if exist then drop*/
IF OBJECT_ID('silver.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE silver.erp_px_cat_g1v2;
GO

/*creating silver.erp_px_cat_g1v2 table*/
CREATE TABLE silver.erp_px_cat_g1v2 (
    id           NVARCHAR(50),
    cat          NVARCHAR(50),
    subcat       NVARCHAR(50),
    maintenance  NVARCHAR(50)
);
GO
