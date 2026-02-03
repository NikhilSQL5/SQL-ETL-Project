/*
this script use for loading the data into bronze layer from external csv file
it truncate the bronze table before loading 
use the bulk insert
*/

USE DataWareHouse;
GO

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
		/*error handeling*/
		BEGIN TRY

						/*truncating table bronze.crm_cust_info*/
						TRUNCATE TABLE bronze.crm_cust_info;

						/*loading data into bronze.crm_cust_info*/
						BULK INSERT bronze.crm_cust_info
						FROM 'C:\Users\nshin\Desktop\005 dwh project\data\source_crm\cust_info.csv'
						WITH(
							FIRSTROW = 2,
							FIELDTERMINATOR =  ',',
							TABLOCK
						);

						/*truncating table bronze.crm_prd_info*/
						TRUNCATE TABLE bronze.crm_prd_info

						/*loading data into bronze.crm_prd_info*/
						BULK INSERT bronze.crm_prd_info
						FROM 'C:\Users\nshin\Desktop\005 dwh project\data\source_crm\prd_info.csv'
						WITH(
							FIRSTROW = 2,
							FIELDTERMINATOR = ',',
							TABLOCK
						);

						/*truncating table bronze.sales_details_info*/
						TRUNCATE TABLE bronze.sales_details_info

						/*loading data into bronze.sales_details_info*/
						BULK INSERT bronze.sales_details_info
						FROM 'C:\Users\nshin\Desktop\005 dwh project\data\source_crm\sales_details.csv'
						WITH(
							FIRSTROW = 2,
							FIELDTERMINATOR = ',',
							TABLOCK
						);

						/*truncating table bronze.erp_cust_az12*/
						TRUNCATE TABLE bronze.erp_cust_az12

						/*loading data into bronze.erp_cust_az12*/
						BULK INSERT bronze.erp_cust_az12
						FROM 'C:\Users\nshin\Desktop\005 dwh project\data\source_erp\CUST_AZ12.csv' 
						WITH(
							FIRSTROW = 2,
							FIELDTERMINATOR = ',',
							TABLOCK
						);

						/*truncating table bronze.erp_loc_a101*/
						TRUNCATE TABLE bronze.erp_loc_a101

						/*loading data into bronze.erp_loc_a101*/
						BULK INSERT bronze.erp_loc_a101
						FROM 'C:\Users\nshin\Desktop\005 dwh project\data\source_erp\LOC_A101.csv'
						WITH(
							FIRSTROW = 2,
							FIELDTERMINATOR = ',',
							TABLOCK
						);

						/*truncating table bronze.erp_px_cat_g1v2*/
						TRUNCATE TABLE bronze.erp_px_cat_g1v2

						/*loading data into bronze.erp_px_cat_g1v2*/
						BULK INSERT bronze.erp_px_cat_g1v2
						FROM 'C:\Users\nshin\Desktop\005 dwh project\data\source_erp\PX_CAT_G1V2.csv'
						WITH(
							FIRSTROW = 2,
							FIELDTERMINATOR = ',',
							TABLOCK
						);
		END TRY
		BEGIN CATCH
						PRINT 'ERROR MESSAGE'; 
						PRINT 'ERROR MESSAGE' + ERROR_MESSAGE(); 
						PRINT 'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS NVARCHAR); 
						PRINT 'ERROR MESSAGE' + CAST(ERROR_STATE() AS NVARCHAR); 
		END CATCH
END

EXEC bronze.load_bronze;