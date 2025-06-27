-- dbo.vw_fm_get_last_status_files source
DROP VIEW if exists [dbo].[vw_get_search]
GO
CREATE VIEW [dbo].[vw_get_search] AS

WITH CTE_files AS (
SELECT	file_type_id, file_name,folder_name, file_status_id,  record_count, last_write_time,created_at, Notes, sort_order,size_kb, key_status, rownums, filecount
FROM	(	SELECT	tf.file_type_id, tf.file_name, tf.folder_name, CONVERT(VARCHAR(23),tf.created_at, 120) created_at, tf.record_count, tf.file_status_id, CONVERT(VARCHAR(23),tf.last_write_time, 120) last_write_time, tf.Notes,tf.size_kb, tfs.sort_order,tf.key_status,
					ROW_NUMBER() OVER (PARTITION BY tf.file_name
					ORDER BY tfs.sort_order desc, tf.[created_at] desc
		) rownums,
                    count(tf.file_name) OVER (PARTITION BY tf.file_name
        ) filecount
FROM	file_status  tfs
INNER JOIN file_info tf ON tfs.file_status_id = tf.file_status_id) as ok
WHERE rownums = 1 ),

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


-- SELECT * FROM vw_get_last_status_files