-- DROP SCHEMA dbo;
-- file_tracker.dbo.file_status definition
-- Drop table
-- DROP TABLE file_tracker.dbo.file_status;

CREATE TABLE file_tracker.dbo.file_status (
	id int IDENTITY(1,1) NOT NULL,
	file_status_id varchar(20) COLLATE Latin1_General_CI_AS NOT NULL,
	detailed_info nvarchar(45) COLLATE Latin1_General_CI_AS NULL,
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	is_active tinyint DEFAULT 1 NULL,
	sort_order int NULL,
	group_name varchar(20) COLLATE Latin1_General_CI_AS NULL,
	key_status int DEFAULT 0 NULL,
	CONSTRAINT file_status_PK PRIMARY KEY (file_status_id)
);


-- file_tracker.dbo.file_type_config definition
-- Drop table
-- DROP TABLE file_tracker.dbo.file_type_config;

CREATE TABLE file_tracker.dbo.file_type_config (
	ft_cfg_ref varchar(20) COLLATE Latin1_General_CI_AS NOT NULL,
	cfg_option varchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	cfg_value varchar(100) COLLATE Latin1_General_CI_AS NULL,
	ftp_cfg_req tinyint DEFAULT 0 NULL,
	created_at datetime NULL,
	created_by varchar(100) COLLATE Latin1_General_CI_AS NULL,
	updated_at datetime NULL,
	updated_by varchar(100) COLLATE Latin1_General_CI_AS NULL,
	id int IDENTITY(0,1) NOT NULL,
	CONSTRAINT ft_cfg_UN UNIQUE (ft_cfg_ref,cfg_option)
);
-- CREATE UNIQUE NONCLUSTERED INDEX ft_cfg_UN ON file_tracker.dbo.file_type_config (ft_cfg_ref, cfg_option);


-- file_tracker.dbo.file_types definition
-- Drop table
-- DROP TABLE file_tracker.dbo.file_types;

CREATE TABLE file_tracker.dbo.file_types (
	id int IDENTITY(1,1) NOT NULL,
	file_type_id varchar(20) COLLATE Latin1_General_CI_AS NOT NULL,
	detailed_info nvarchar(45) COLLATE Latin1_General_CI_AS NULL,
	ft_cfg_ref varchar(20) COLLATE Latin1_General_CI_AS NULL,
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	is_active tinyint DEFAULT 1 NOT NULL,
	CONSTRAINT file_types_PK PRIMARY KEY (file_type_id)
);


-- file_tracker.dbo.file_info definition
-- Drop table
-- DROP TABLE file_tracker.dbo.file_info;

CREATE TABLE file_tracker.dbo.file_info (
	id int IDENTITY(0,1) NOT NULL,
	file_name varchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	folder_name varchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	file_type_id varchar(20) COLLATE Latin1_General_CI_AS NOT NULL,
	record_count int NULL,
	file_status_id varchar(20) COLLATE Latin1_General_CI_AS NOT NULL,
	notes nvarchar COLLATE Latin1_General_CI_AS NULL,
	created_at datetime NOT NULL,
	created_by varchar(100) COLLATE Latin1_General_CI_AS NULL,
	last_write_time datetime NULL,
	file_ext varchar(5) COLLATE Latin1_General_CI_AS NULL,
	size_kb smallint DEFAULT 0 NULL,
	key_status int DEFAULT 0 NULL,
	file_hash varchar(100) COLLATE Latin1_General_CI_AS NULL,
	CONSTRAINT file_info_PK PRIMARY KEY (id),
	CONSTRAINT file_info_UN UNIQUE (file_name,folder_name,file_status_id)
);
--CREATE UNIQUE NONCLUSTERED INDEX file_info_UN ON file_tracker.dbo.file_info (file_name, folder_name, file_status_id);


-- file_tracker.dbo.job_log definition

-- Drop table

-- DROP TABLE file_tracker.dbo.job_log;

CREATE TABLE file_tracker.dbo.job_log (
	job_name_id int IDENTITY(0,1) NOT NULL,
	job_name varchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	file_type_id varchar(20) COLLATE Latin1_General_CI_AS NOT NULL,
	Notes ntext COLLATE Latin1_General_CI_AS NULL,
	files_found tinyint DEFAULT 0 NULL,
	created_at datetime NOT NULL,
	created_by varchar(100) COLLATE Latin1_General_CI_AS NULL,
	CONSTRAINT job_name_PK PRIMARY KEY (job_name_id)
);


-- file_tracker.dbo.ftp_config definition

-- Drop table

-- DROP TABLE file_tracker.dbo.ftp_config;

CREATE TABLE file_tracker.dbo.ftp_config (
	id int IDENTITY(0,1) NOT NULL,
	config_ref varchar(20) COLLATE Latin1_General_CI_AS NOT NULL,
	config_name varchar(100) COLLATE Latin1_General_CI_AS NULL,
	file_type_id varchar(20) COLLATE Latin1_General_CI_AS NULL,
	source_folder varchar(100) COLLATE Latin1_General_CI_AS NULL,
	dest_folder varchar(100) COLLATE Latin1_General_CI_AS NULL,
	WinSCPDLL varchar(100) COLLATE Latin1_General_CI_AS NULL,
	username varchar(20) COLLATE Latin1_General_CI_AS NULL,
	password varchar(100) COLLATE Latin1_General_CI_AS NULL,
	private_key varchar(100) COLLATE Latin1_General_CI_AS NULL,
	hostname varchar(100) COLLATE Latin1_General_CI_AS NULL,
	fingerprint varchar(100) COLLATE Latin1_General_CI_AS NULL,
	ftp_function varchar(100) COLLATE Latin1_General_CI_AS NULL,
	proxy_required int NOT NULL,
	proxy_method varchar(20) COLLATE Latin1_General_CI_AS NULL,
	proxy_host varchar(20) COLLATE Latin1_General_CI_AS NULL,
	proxy_port varchar(20) COLLATE Latin1_General_CI_AS NULL,
	created_at datetime NULL,
	created_by varchar(100) COLLATE Latin1_General_CI_AS NULL,
	updated_at datetime NULL,
	updated_by varchar(100) COLLATE Latin1_General_CI_AS NULL,
	archive_locs varchar(500) COLLATE Latin1_General_CI_AS NULL,
	file_status_id varchar(500) COLLATE Latin1_General_CI_AS NULL,
	CONSTRAINT ftp_config_PK PRIMARY KEY (config_ref),
	CONSTRAINT ftp_config_FK FOREIGN KEY (file_type_id) REFERENCES file_tracker.dbo.file_types(file_type_id)
);


-- file_tracker.dbo.c_sales_data definition

-- Drop table

-- DROP TABLE file_tracker.dbo.c_sales_data;

CREATE TABLE c_sales_data (
	id int IDENTITY(0,1) NOT NULL,
	file_name varchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	region varchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	product_type varchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	sales_month varchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	[year] varchar(10) COLLATE Latin1_General_CI_AS NOT NULL,
	total_cost float NULL,
	total_revenue float NULL,
	total_profit float NULL,
	drop_down varchar(25) COLLATE Latin1_General_CI_AS NULL,
	summary varchar(100) COLLATE Latin1_General_CI_AS NULL,
	flag bit DEFAULT 0 NULL,
	created_at datetime NULL,
	updated_at datetime NULL,
	CONSTRAINT c_sales_data_PK PRIMARY KEY (file_name,region,product_type,sales_month,[year])
);

-- dbo.vw_file_type_config source

CREATE VIEW [dbo].[vw_file_type_config]
AS
SELECT        ft_cfg_ref, cfg_value, cfg_option, ftp_cfg_req, id
FROM            dbo.file_type_config
-- WHERE        (ft_cfg_ref IN ('DEFAULT', 'SAMPLE', 'ITWEL', 'ITWEL_FB', 'ITWEL_SUB'));


-- dbo.vw_get_file_status source

CREATE VIEW dbo.vw_get_file_status
AS
SELECT        id, file_status_id, detailed_info, key_status, group_name, sort_order, is_active
FROM            dbo.file_status;


-- dbo.vw_get_file_types source

CREATE VIEW [dbo].[vw_get_file_types]
AS
SELECT        id, file_type_id, detailed_info, ft_cfg_ref, is_active
FROM            dbo.file_types
WHERE is_active = 1;


-- dbo.vw_get_files source

CREATE VIEW [dbo].[vw_get_files]
AS

WITH CTE_files AS (

SELECT        file_name, folder_name, file_type_id, record_count, file_status_id, notes, created_at, last_write_time, file_ext, size_kb, key_status, file_hash, file_id
FROM            dbo.file_info

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

CREATE TABLE demo_form (
	id int IDENTITY(0,1) NOT NULL,
	status_id varchar(500) COLLATE Latin1_General_CI_AS NULL,
	[date] datetime NULL,
	MoreInfo varchar(100) COLLATE Latin1_General_CI_AS NULL,
	CheckBox bit DEFAULT 0 NULL
);
-- dbo.vw_get_ftp_config source

CREATE VIEW dbo.vw_get_ftp_config
AS
SELECT        id, config_ref, config_name, file_type_id, LEFT(source_folder, 20) AS source_folder, LEFT(dest_folder, 20) AS dest_folder, LEFT(file_status_id, 40) AS file_status_id, LEFT(archive_locs, 30) AS archive_locs, LEFT(private_key, 10) 
                         AS private_key, LEFT(hostname, 10) AS hostname, ftp_function
FROM            dbo.ftp_config;


-- dbo.vw_get_last_status_files source

CREATE VIEW [dbo].[vw_get_last_status_files] AS

WITH CTE_files AS (
SELECT	file_name,folder_name, file_status_id,  record_count, last_write_time,created_at, Notes, sort_order,size_kb, key_status, rownums, filecount
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

