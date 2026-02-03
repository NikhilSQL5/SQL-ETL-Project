/*
this script create the views for the gold layer 
*/

USE DataWareHouse;
GO

/* dim customer */
IF OBJECT_ID ('gold.dim_customer','V') IS NOT NULL
DROP VIEW gold.dim_customer;
GO

CREATE VIEW gold.dim_customer AS
		SELECT
       ROW_NUMBER () OVER (ORDER BY ci.cst_id) customer_key,
      ci.cst_id,
      ci.cst_key,
	  ci.cst_firstname,
	  ci.cst_lastname,
	  ci.cst_marital_status,
	  CASE 
				WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr
				ELSE COALESCE(ei.gen,'n/a')
	  END cst_gndr,
	  ci.cst_create_date,
	  ei.bdate,
	  lc.cntry
  FROM silver.crm_cust_info ci
  LEFT JOIN silver.erp_cust_az12 ei
  ON ci.cst_key = ei.cid
  LEFT JOIN silver.erp_loc_a101 lc
  ON ci.cst_key = lc.cid
GO

  /* dim product */

IF OBJECT_ID ('gold.dim_product','V') IS NOT NULL
DROP VIEW gold.dim_product;
GO

CREATE VIEW gold.dim_product AS
  SELECT 
	  ROW_NUMBER() OVER(ORDER BY p.prd_start_dt, p.prd_id) AS product_key,
	  p.prd_id,
	  p.prd_key,
	  p.prd_nm,
	  p.prd_cost,
	  p.prd_line,
	  p.prd_start_dt,
	  p.prd_end_dt,
	  ct.cat,
	  ct.id,
	  ct.maintenance,
	  ct.subcat
   FROM silver.crm_prd_info p
   LEFT JOIN silver.erp_px_cat_g1v2 ct
   ON p.cat_id = ct.id
GO

   /*fact sales*/
IF OBJECT_ID ('gold.fat_sales','V') IS NOT NULL
DROP VIEW gold.fat_sales;
GO

CREATE VIEW gold.fat_sales AS
SELECT 
	    c.customer_key,
		c.cst_firstname,
		c.cst_lastname,
		c.bdate,
		c.cst_gndr,
		c.cst_marital_status,
		c.cntry,
		p.product_key,
		p.prd_cost,
		p.prd_line,
		p.prd_nm,
		p.prd_start_dt,
		p.prd_end_dt,
	    sl.sls_sales,
		sl.sls_quantity,
		sl.sls_price,
		sl.sls_ord_num,
		sl.sls_order_dt,
		sl.sls_ship_dt,
		sl.sls_due_dt		
  FROM silver.sales_details_info AS sl
  LEFT JOIN gold.dim_customer AS c
  ON sl.sls_cust_id = c.cst_id
  LEFT JOIN gold.dim_product p
  ON sl.sls_prd_key = p.prd_key;
  GO

