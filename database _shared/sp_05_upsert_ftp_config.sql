CREATE PROCEDURE [dbo].[sp_upsert_ftp_config] (
	-- Add the parameters for the stored procedure here

	@var_config_ref varchar(20),
	@var_config_name varchar(100),
	@var_file_type_id varchar(20),
	@var_source_folder varchar(100),
	@var_dest_folder varchar(100),
	@var_WinSCPDLL varchar(100),
	@var_username varchar(20),
	@var_password varchar(100) = NULL,
	@var_private_key varchar(100) = NULL,
	@var_hostname varchar(100) = NULL,
	@var_fingerprint varchar(100) = NULL,
	@var_ftp_function varchar(100) = NULL,
	@var_proxy_required int = NULL,
	@var_proxy_method varchar(20)  = NULL,
	@var_proxy_host varchar(20) = NULL,
	@var_proxy_port varchar(20) = NULL,
	@var_date [datetime] = NULL,
	@var_archive_locs varchar(500) = NULL,
	@var_file_status varchar(20) = NULL,
	@var_add_new_status int = NULL
	
)

AS

--SET Values from the database if they are not passed in
SELECT
 @var_config_name = ISNULL (@var_config_name, [config_name]),
 @var_file_type_id = ISNULL (@var_file_type_id, [file_type_id]),
 @var_source_folder = ISNULL (@var_source_folder, [source_folder]),
 @var_dest_folder = ISNULL (@var_dest_folder, [dest_folder]),
 @var_WinSCPDLL = ISNULL (@var_WinSCPDLL, [WinSCPDLL]),
 @var_username = ISNULL (@var_username,[username] ),
 @var_password = ISNULL (@var_password,[password] ),
 @var_private_key = ISNULL (@var_private_key, [private_key]),
 @var_hostname = ISNULL (@var_hostname,[hostname] ),
 @var_fingerprint = ISNULL (@var_fingerprint, [fingerprint] ),
 @var_ftp_function = ISNULL (@var_ftp_function,[ftp_function] ),
 @var_proxy_required = ISNULL (@var_proxy_required,[proxy_required] ),
 @var_proxy_method = ISNULL (@var_proxy_method,[proxy_method] ),
 @var_proxy_host = ISNULL (@var_proxy_host,[proxy_host] ),
 @var_proxy_port = ISNULL (@var_proxy_host,[proxy_port] ),
 @var_archive_locs = ISNULL (@var_archive_locs,[archive_locs] ),
 @var_file_status = ISNULL (@var_file_status,[file_status_id] ),
 @var_add_new_status = ISNULL (@var_add_new_status,[add_new_status] )

FROM [dbo].[ftp_config] 
WHERE [config_ref] = @var_config_ref

SET @var_date = (ISNULL ( @var_date, (CAST(GETDATE() AS datetimeoffset(7))) ))
SET NOCOUNT ON;
-- SELECT (CAST(GETDATE() AS datetimeoffset(7)))
BEGIN TRAN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	UPDATE [dbo].[ftp_config]

	SET

	 [config_name] = @var_config_name 
	,[file_type_id] = @var_file_type_id 
	,[source_folder] = @var_source_folder 
	,[dest_folder] = @var_dest_folder 
	,[WinSCPDLL] = @var_WinSCPDLL 
	,[username] = @var_username 
	,[password] = @var_password 
	,[private_key] = @var_private_key 
	,[hostname] = @var_hostname 
	,[fingerprint] = @var_fingerprint 
	,[ftp_function] = @var_ftp_function 
	,[proxy_required] = @var_proxy_required 
	,[proxy_method] = @var_proxy_method 
	,[proxy_host] = @var_proxy_host 
	,[proxy_port] = @var_proxy_port
	,[updated_at] = @var_date	
	,[updated_by] = ORIGINAL_LOGIN()
	,[archive_locs] = @var_archive_locs
	,[file_status_id] = @var_file_status
	,[add_new_status] = @var_add_new_status

	WHERE [config_ref] = @var_config_ref
 
 IF @@ROWCOUNT = 0
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO [dbo].[ftp_config] (
		
	 [config_ref]
	,[config_name]
	,[file_type_id]
	,[source_folder]
	,[dest_folder]
	,[WinSCPDLL]
	,[username]
	,[password]
	,[private_key]
	,[hostname]
	,[fingerprint]
	,[ftp_function]
	,[proxy_required]
	,[proxy_method]
	,[proxy_host]
	,[proxy_port]
	,[created_at]
	,[created_by]
	,[updated_at]
	,[updated_by]
	,[archive_locs]
	,[file_status_id]
	,[add_new_status]

	)
	VALUES (
	  @var_config_ref
	 ,@var_config_name 
	 ,@var_file_type_id 
	 ,@var_source_folder 
	 ,@var_dest_folder 
	 ,@var_WinSCPDLL 
	 ,@var_username 
	 ,@var_password 
	 ,@var_private_key 
	 ,@var_hostname 
	 ,@var_fingerprint 
	 ,@var_ftp_function 
	 ,@var_proxy_required 
	 ,@var_proxy_method 
	 ,@var_proxy_host 
	 ,@var_proxy_port
	 ,@var_date
	 ,ORIGINAL_LOGIN()
	 ,@var_date
	 ,ORIGINAL_LOGIN()
	 ,@var_archive_locs
	 ,@var_file_status
	 ,@var_add_new_status
	)
END
COMMIT TRAN;
