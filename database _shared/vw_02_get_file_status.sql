DROP VIEW if exists dbo.vw_get_file_status
GO
CREATE VIEW dbo.vw_get_file_status
AS
SELECT        id, file_status_id, detailed_info, key_status, group_name, sort_order, is_active
FROM           dbo.file_status;