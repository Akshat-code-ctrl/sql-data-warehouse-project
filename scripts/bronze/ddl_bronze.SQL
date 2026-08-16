create or alter procedure bronze.load_bronze as begin

declare @start_time datetime, @end_time datetime
begin try

print '=======================================';
print 'Loading Bronze Layer';
print '=======================================';

print '---------------------------------------';
print 'Loading CRM Tables';
print '---------------------------------------';

set @start_time = getdate();
print '>> Truncating Table: bronze.crm_cust_info'
truncate table bronze.crm_cust_info;

print '>> Inserting Data Into: bronze.crm_cust_info'
Bulk insert bronze.crm_cust_info
from 'F:\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock
);
set @end_time = getdate();
print '>> Load Duration: ' + CAST(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
print '----------------'

set @start_time = getdate();
print '>> Truncating Table: bronze.crm_prd_info'
truncate table bronze.crm_prd_info;

print '>> Inserting Data Into: bronze.crm_prd_info'
bulk insert bronze.crm_prd_info
from 'F:\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock
);
set @end_time = getdate();
print '>> Load Duration: ' + CAST(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
print '----------------'

set @start_time = getdate();
print '>> Truncating Table: bronze.crm_sales_details'
truncate table bronze.crm_sales_details;

print '>> Inserting Data Into: bronze.crm_sales_details'
bulk insert bronze.crm_sales_details
from 'F:\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock
);
set @end_time = getdate();
print '>> Load Duration: ' + CAST(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
print '----------------'

print '---------------------------------------';
print 'Loading ERP Tables';
print '---------------------------------------';

set @start_time = getdate();
print '>> Truncating Table: bronze.erp_loc_a101'
truncate table bronze.erp_loc_a101;

print '>> Inserting Data Into: bronze.erp_loc_a101'
bulk insert bronze.erp_loc_a101
from 'F:\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock
);
set @end_time = getdate();
print '>> Load Duration: ' + CAST(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
print '----------------'

set @start_time = getdate();
print '>> Truncating Table: bronze.erp_cust_az12'
truncate table bronze.erp_cust_az12;

print '>> Inserting Data Into: bronze.erp_cust_a12'
bulk insert bronze.erp_cust_az12
from 'F:\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock
);
set @end_time = getdate();
print '>> Load Duration: ' + CAST(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
print '----------------'

set @start_time = getdate();
print '>> Truncating Table: bronze.erp_px_cat_g1v2'
truncate table bronze.erp_px_cat_g1v2;

print '>> Inserting Data Into: bronze.erp_px_cat_g1v2'
bulk insert bronze.erp_px_cat_g1v2
from 'F:\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock
);
set @end_time = getdate();
print '>> Load Duration: ' + CAST(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
print '----------------'

end try
begin catch

print '=======================================';
print 'Error occured during loading bronze layer';
print 'Error Message' + Error_Message();
print 'Error Message' + CAST (Error_number() as nvarchar);
print 'Error Message' + CAST (Error_state() as nvarchar);
print '=======================================';

end catch
end
