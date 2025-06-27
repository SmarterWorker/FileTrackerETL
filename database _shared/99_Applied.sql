EXEC [dbo].[sp_upsert_file_types]  @var_file_type_id = 'DEFAULT',@var_detailed_info = 'Default file types to allow any file type. ' , @var_ft_cfg_ref  = 'DEFAULT' , @var_is_active  = 1
EXEC [dbo].[sp_upsert_file_types]  @var_file_type_id = 'SAMPLE',@var_detailed_info = 'Sample files for testing' , @var_ft_cfg_ref  = 'SAMPLE' , @var_is_active  = 1
EXEC [dbo].[sp_upsert_file_types]  @var_file_type_id = 'SALES',@var_detailed_info = 'Example Sales Data' , @var_ft_cfg_ref  = 'SALES' , @var_is_active  = 1

SELECT * FROM file_types order by 1

EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'MAIN_CFG', @var_cfg_option = 'NAME', @var_cfg_value = 'Viridian Software', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'MAIN_CFG', @var_cfg_option = 'MAIN', @var_cfg_value = 'NONE', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'MAIN_CFG', @var_cfg_option = 'LICENSE', @var_cfg_value = 'Devopment', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'SAMPLE', @var_cfg_option = 'COUNT_FNCT', @var_cfg_value = 'get_rec_count', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'SAMPLE', @var_cfg_option = 'FILE_FLTR', @var_cfg_value = 'SAMPLE_*', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'SAMPLE', @var_cfg_option = 'FILE_TYPE', @var_cfg_value = 'SAMPLE', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'SAMPLE', @var_cfg_option = 'MAIN', @var_cfg_value = 'NONE', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'SAMPLE', @var_cfg_option = 'SORT_GROUP', @var_cfg_value = 'SAMPLE', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'DEFAULT', @var_cfg_option = 'MAIN', @var_cfg_value = 'NONE', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'DEFAULT', @var_cfg_option = 'SORT_GROUP', @var_cfg_value = 'DEFAULT', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'DEFAULT', @var_cfg_option = 'COUNT_FNCT', @var_cfg_value = 'get_rec_count', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'SAMPLE', @var_cfg_option = 'FILE_FLTR1', @var_cfg_value = 'TEST_*', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'

EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'SALES', @var_cfg_option = 'COUNT_FNCT', @var_cfg_value = 'get_rec_count', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'SALES', @var_cfg_option = 'FILE_FLTR', @var_cfg_value = 'SAMPLE_*', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'SALES', @var_cfg_option = 'FILE_FLTR', @var_cfg_value = 'Sales_data_*', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'

EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'SALES', @var_cfg_option = 'MAIN', @var_cfg_value = 'NONE', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'SALES', @var_cfg_option = 'SORT_GROUP', @var_cfg_value = 'SAMPLE', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'SALES', @var_cfg_option = 'FILE_FLTR1', @var_cfg_value = 'TEST_*', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'SALES', @var_cfg_option = 'CUSTOM_FNCT', @var_cfg_value = 'get_sales_summary', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'
EXEC [dbo].[sp_upsert_file_type_config] @var_file_type_config_ref = 'SALES', @var_cfg_option = 'CUSTOM_STATUS', @var_cfg_value = 'SENT_ARCHIVE', @var_ftp_cfg_req =0 , @var_created_by ='tesh', @var_updated_by ='tesh'

-- DELETE file_type_config WHERE ft_cfg_ref = 'SALES' and cfg_option = 'FILE_FLTR1'


SELECT * FROM file_type_config order by 1

EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='DEFAULT' ,@var_detailed_info = 'Duplicate File or Same Status' ,@var_sort_order = 0  ,@var_is_active = 1 ,@var_group = 'DEFAULT',@var_key_status=2
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='FAILED_DEF' ,@var_detailed_info = 'Duplicate File or Same Status' ,@var_sort_order = 0  ,@var_is_active = 1 ,@var_group = 'DEFAULT',@var_key_status=2
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='NEW' ,@var_detailed_info = 'New file.' ,@var_sort_order = 1  ,@var_is_active = 1 ,@var_group = 'GEN',@var_key_status=0
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='FAILED_GEN' ,@var_detailed_info = 'Duplicate File or Same Status' ,@var_sort_order = 2  ,@var_is_active = 1 ,@var_group = 'GEN',@var_key_status=2
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='FTP_GEN' ,@var_detailed_info = 'File FTPd' ,@var_sort_order = 3  ,@var_is_active = 1 ,@var_group = 'GEN',@var_key_status=1
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='DONE' ,@var_detailed_info = 'Allocation and PI Files.' ,@var_sort_order = 4  ,@var_is_active = 1 ,@var_group = 'GEN',@var_key_status=3
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='NEW' ,@var_detailed_info = 'New submission file generated from Q Data.' ,@var_sort_order = 1  ,@var_is_active = 1 ,@var_group = 'SAMPLE',@var_key_status=0
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='FAIL_TO_STAGING' ,@var_detailed_info = 'File Failed to send to RT Server' ,@var_sort_order = 2  ,@var_is_active = 1 ,@var_group = 'SAMPLE',@var_key_status=2
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='SENT_TO_STAGING' ,@var_detailed_info = 'Submission File FTP to REGTEK' ,@var_sort_order = 3  ,@var_is_active = 1 ,@var_group = 'SAMPLE',@var_key_status=1
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='FAIL_LOAD_SQL' ,@var_detailed_info = 'Submission from RT' ,@var_sort_order = 4  ,@var_is_active = 1 ,@var_group = 'SAMPLE',@var_key_status=1
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='LOAD_SQL' ,@var_detailed_info = 'File Failed to send to FTP Server' ,@var_sort_order = 5  ,@var_is_active = 1 ,@var_group = 'SAMPLE',@var_key_status=2
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='FAILED' ,@var_detailed_info = 'Failed' ,@var_sort_order = 6  ,@var_is_active = 1 ,@var_group = 'SAMPLE',@var_key_status=2
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='FAIL_ARCHIVE' ,@var_detailed_info = 'File Failed to send to REGS' ,@var_sort_order = 7  ,@var_is_active = 1 ,@var_group = 'SAMPLE',@var_key_status=2
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='SENT_ARCHIVE' ,@var_detailed_info = 'Submission file FTP to REGS' ,@var_sort_order = 8  ,@var_is_active = 2 ,@var_group = 'SAMPLE',@var_key_status=3
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='COPY_DONE' ,@var_detailed_info = 'Copy Done' ,@var_sort_order = 0  ,@var_is_active = 1 ,@var_group = 'SAMPLE',@var_key_status=3
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='COPY_FAILED' ,@var_detailed_info = 'CopyFailed' ,@var_sort_order = 0  ,@var_is_active = 1 ,@var_group = 'SAMPLE',@var_key_status=2
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='ZIP_DONE' ,@var_detailed_info = 'ZIP Done' ,@var_sort_order = 0  ,@var_is_active = 1 ,@var_group = 'SAMPLE',@var_key_status=3
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='ZIP_FAILED' ,@var_detailed_info = 'Zip Failed' ,@var_sort_order = 0  ,@var_is_active = 1 ,@var_group = 'SAMPLE',@var_key_status=2
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='MOVE_DONE' ,@var_detailed_info = 'Move Done' ,@var_sort_order = 0  ,@var_is_active = 1 ,@var_group = 'SAMPLE',@var_key_status=3
EXEC [dbo].[sp_upsert_file_status]  @var_file_status_id ='MOVE_FAILED' ,@var_detailed_info = 'Move Failed' ,@var_sort_order = 0  ,@var_is_active = 1 ,@var_group = 'SAMPLE',@var_key_status=2

EXEC [dbo].[sp_upsert_ftp_config] @var_config_ref = 'sample_get',@var_config_name  = 'Get files with SAMPLE in file mask.',@var_file_type_id = 'SAMPLE',@var_source_folder  = '/data/ftpuser/upload/out',@var_dest_folder  = 'F:\Workarea\tw\tests\ftp_get',@var_WinSCPDLL  = 'H:\workarea\DataB\projects\WinSCP\winscpnet.dll', @var_username  = 'userftp',@var_password  = 'NONE',@var_private_key  = 'H:\workarea\DataB\puttyKeys\userftp_key_centos.ppk',@var_hostname  = '192.168.50.100',@var_fingerprint  = 'ssh-ed25519 256 C5fL3hsEBWvA8mcnSy5DU1xDi3ADGlp7vpMtDtammr8=',@var_ftp_function  = 'simple-get-ftp',@var_proxy_required  = '0',@var_proxy_method  = 'NONE',@var_proxy_host  = 'NONE',@var_proxy_port  = '0',@var_archive_locs = '0F:\temp\archive\get\general\folder_YYYYMMDD;1F:\temp\archive\get\dwnload',@var_file_status = '',@var_add_new_status = '1'
EXEC [dbo].[sp_upsert_ftp_config] @var_config_ref = 'sample_put',@var_config_name  = 'Put files with SAMPLE in file mask.',@var_file_type_id = 'SAMPLE',@var_source_folder  = 'F:\Workarea\tw\tests\ftp_put',@var_dest_folder  = '/data/ftpuser/upload/in/',@var_WinSCPDLL  = 'H:\workarea\DataB\projects\WinSCP\winscpnet.dll', @var_username  = 'userftp',@var_password  = 'NONE',@var_private_key  = 'H:\workarea\DataB\puttyKeys\userftp_key_centos.ppk',@var_hostname  = '192.168.50.100',@var_fingerprint  = 'ssh-ed25519 256 C5fL3hsEBWvA8mcnSy5DU1xDi3ADGlp7vpMtDtammr8=',@var_ftp_function  = 'simple-put-ftp',@var_proxy_required  = '0',@var_proxy_method  = 'NONE',@var_proxy_host  = 'NONE',@var_proxy_port  = '0',@var_archive_locs = '0F:\temp\archive\put\general\folder_put_YYYYMMDD;1F:\temp\archive\put\upload',@var_file_status = '',@var_add_new_status = '1'
EXEC [dbo].[sp_upsert_ftp_config] @var_config_ref = 'sample_copy',@var_config_name  = 'Copy Files in file mask.',@var_file_type_id = 'SAMPLE',@var_source_folder  = '\\dellserver\F\Workarea\tw\tests\ftp_put',@var_dest_folder  = '',@var_WinSCPDLL  = '', @var_username  = '',@var_password  = '',@var_private_key  = '',@var_hostname  = '',@var_fingerprint  = '',@var_ftp_function  = 'simple-cp-files',@var_proxy_required  = '0',@var_proxy_method  = 'NONE',@var_proxy_host  = 'NONE',@var_proxy_port  = '0',@var_archive_locs = '0\\dellserver\F\Workarea\tw\tests\XX_XX\ftp_put0\YYYYMMDD;1\\dellserver\F\Workarea\tw\tests\XX_XX\ftp_put1\YYYYMMDD;2\\dellserver\F\Workarea\tw\tests\XX_XX\ftp_put2\YYYYMMDD',@var_file_status = '',@var_add_new_status = '1'

SELECT * FROM [dbo].[file_status] order by group_name, sort_order

SELECT * FROM ftp_config
-- TRUNCATE TABLE ftp_config
SELECT * FROM ftp_config WHERE config_ref like 'sample_get%'

SELECT * FROM dbo.file_info order by file_name
SELECT ft_cfg_ref, cfg_value FROM file_type_config WHERE cfg_option like 'FILE_FLTR%' AND cfg_value like 'TEST_%'
-- TRUNCATE TABLE [dbo].[file_info]
-- TRUNCATE TABLE [dbo].[c_sales_data]
SELECT * FROM vw_get_last_status_files
SELECT *,count(tf.file_name) OVER (PARTITION BY tf.file_name FROM file_info tf)
SELECT * FROM [dbo].[c_sales_data] order by 1 DESC

SELECT * FROM [dbo].[file_status] order by group_name, sort_order
SET rowcount 1
-- UPDATE vw_get_last_status_files SET key_status=3 WHERE key_status = 0
SELECT * FROM c_sales_data
SELECT * FROM vw_c_sales_data_sum
SELECT * FROM vw_get_last_status_files
SELECT * FROM  [dbo].[vw_get_files]
SELECT * FROM file_info WHERE file_name='Sales_data_007_July_2020'
SELECT file_type_id FROM   vw_get_file_types

EXEC [dbo].[sp_upsert_file_types]  @var_file_type_id = 'ALL',@var_detailed_info = 'Used for FrontEnd ' , @var_ft_cfg_ref  = 'ALL' , @var_is_active  = 1
