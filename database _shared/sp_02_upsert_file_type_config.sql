CREATE PROCEDURE [dbo].[sp_upsert_file_type_config] (
	-- Add the parameters for the stored procedure here
	@var_file_type_config_ref varchar(20),
	@var_cfg_option varchar(100),
	@var_cfg_value varchar(100) = NULL,
	@var_ftp_cfg_req int = '0',
	@var_created_at [datetime] = NULL,
    @var_created_by varchar(100) = NULL,
	@var_update_at [datetime] = NULL,
	@var_updated_by varchar(100) = NULL,
	@var_date [datetime] = NULL
	
)
AS

--SET Values from the database if they are not passed in
SELECT 
	@var_file_type_config_ref 	= ISNULL (@var_file_type_config_ref , [ft_cfg_ref]),
	@var_cfg_option 	= ISNULL (@var_cfg_option, [cfg_option]),
	@var_cfg_value 		= ISNULL (@var_cfg_value, [cfg_value]),
	@var_created_by 	= ISNULL (@var_created_by, [created_by]),
	@var_updated_by 	= ISNULL (@var_updated_by, [updated_by])

FROM [dbo].[file_type_config] 
WHERE [ft_cfg_ref] = @var_file_type_config_ref AND [cfg_option] = @var_cfg_option

SET @var_date = (ISNULL ( @var_date, (CAST(GETDATE() AS datetimeoffset(7))) ))
SET NOCOUNT ON;
-- SELECT (CAST(GETDATE() AS datetimeoffset(7)))
BEGIN TRAN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	UPDATE [dbo].[file_type_config]

	SET
		 [cfg_value] = @var_cfg_value
		,[updated_by] = @var_updated_by
		,[updated_at] = @var_date

	WHERE [ft_cfg_ref] = @var_file_type_config_ref AND [cfg_option] = @var_cfg_option
 
 IF @@ROWCOUNT = 0
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO [dbo].[file_type_config] (
		
		 [ft_cfg_ref]     
        ,[cfg_option]   
        ,[cfg_value]            
        ,[created_by]    
		,[created_at]    
		,[updated_by]
		,[updated_at]

	)
	VALUES (

          @var_file_type_config_ref
        , @var_cfg_option
        , @var_cfg_value
        , @var_created_by
		, @var_date
		, @var_updated_by
		, @var_date
	)
END
COMMIT TRAN;
