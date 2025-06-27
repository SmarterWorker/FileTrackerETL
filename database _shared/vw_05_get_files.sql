
-- dbo.vw_get_files source
DROP VIEW if exists dbo.vw_get_files
GO

CREATE VIEW [dbo].[vw_get_files]
AS

WITH CTE_files AS (

SELECT  file_name, folder_name, file_type_id, record_count, file_status_id, notes, 
		created_at, last_write_time, file_ext, size_kb, key_status, file_hash, id
FROM    dbo.file_info

 ),

files_count AS (

SELECT file_name,file_hash
FROM dbo.file_info
GROUP by file_name,file_hash

),

unique_hash AS (
SELECT file_name,count(*) as fhashcount FROM files_count GROUP BY file_name
),

files_join AS (

SELECT cf.*, uhc.fhashcount
FROM CTE_files cf
JOIN unique_hash uhc on uhc.file_name = cf.file_name

)

SELECT * FROM files_join;

-- SELECT * FROM vw_get_files