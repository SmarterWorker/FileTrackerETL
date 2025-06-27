
DROP VIEW if exists dbo.vw_get_file_types
GO
CREATE VIEW [dbo].[vw_get_file_types]
AS
SELECT        id, file_type_id, detailed_info, ft_cfg_ref, is_active
FROM            dbo.file_types
WHERE is_active = 1;