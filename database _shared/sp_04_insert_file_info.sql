CREATE PROCEDURE [dbo].[sp_insert_file_info] (
	-- Add the parameters for the stored procedure here
	
	@var_file_name varchar(100),
	@var_folder_name varchar(100),
	@var_file_type_id varchar(20),
	@var_record_count int = NULL,
	@var_file_status_id varchar(20),
    @var_notes ntext  = NULL,
    @var_created_by varchar(100),
	@var_date [datetime] = NULL,
	@var_last_write_dt [datetime] = NULL,
	@var_file_ext varchar(5) = NULL,
	@var_size_kb int = NULL,
	@var_key_status int = NULL,
	@var_file_hash varchar(100) = NULL,
	@var_sort_group varchar(20) = NULL
)
AS

--SET Values from the database if they are not passed in

SET @var_date = (ISNULL ( @var_date, (CAST(GETDATE() AS datetimeoffset(7))) ))
SET NOCOUNT ON;
-- SELECT (CAST(GETDATE() AS datetimeoffset(7)))
BEGIN TRAN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO [dbo].[file_info] (
		
		 [file_name]     
        ,[folder_name]   
        ,[file_type_id]   
        ,[record_count]  
        ,[file_status_id] 
        ,[notes]      
        ,[created_by]    
		,[created_at]    
		,[last_write_time]
		,[file_ext]
		,[size_kb]
		,[key_status]
		,[file_hash]
		,[sort_group]

	)
	VALUES (

          @var_file_name
        , @var_folder_name
        , @var_file_type_id
        , @var_record_count
        , @var_file_status_id
        , @var_Notes
        , @var_created_by
		, @var_date
		, @var_last_write_dt
		, @var_file_ext
		, @var_size_kb
		, @var_key_status
		, @var_file_hash
		, @var_sort_group
	)

COMMIT TRAN;
