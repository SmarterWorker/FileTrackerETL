-- dbo.vw_fm_get_ftp_config source
DROP VIEW if exists dbo.vw_get_ftp_config
GO
CREATE VIEW dbo.vw_get_ftp_config
AS
SELECT      id, config_ref, config_name, file_type_id, 
			LEFT(source_folder, 20) AS source_folder, 
			LEFT(dest_folder, 20) AS dest_folder, 
			LEFT(file_status_id, 40) AS file_status_id, 
			LEFT(archive_locs, 30) AS archive_locs, 
			LEFT(private_key, 10) AS private_key, 
			LEFT(hostname, 10) AS hostname, 
			ftp_function
FROM        dbo.ftp_config;