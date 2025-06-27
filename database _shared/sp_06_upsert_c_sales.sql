
CREATE PROCEDURE [dbo].[sp_insert_c_sales_data] (
	-- Add the parameters for the stored procedure here
	@var_file_name  varchar(100), 	@var_region varchar(100),
	@var_product_type varchar(100), @var_sales_month varchar(100),
	@var_year varchar(10),	@var_total_cost float,
	@var_total_revenue float, @var_total_profit float,
	@var_date [datetime] = NULL
	
)

AS
--SET Values from the database if they are not passed in
SET @var_date = (ISNULL ( @var_date, (CAST(GETDATE() AS datetimeoffset(7))) ))
SET NOCOUNT ON;
-- SELECT (CAST(GETDATE() AS datetimeoffset(7)))
BEGIN TRAN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO [dbo].[c_sales_data] (
		
		 [file_name]
		,[region]     
        ,[product_type]
		,[sales_month]   
		,[year]
        ,[total_cost]   
        ,[total_revenue]  
        ,[total_profit]     
		,[created_at]    
		,[updated_at]
	)
	VALUES (
		  @var_file_name
		, @var_region
        , @var_product_type
        , @var_sales_month
		, @var_year
        , @var_total_cost
        , @var_total_revenue
        , @var_total_profit
		, @var_date
		, @var_date
	)

COMMIT TRAN;