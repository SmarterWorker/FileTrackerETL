-- CUSTOM Objects

-- file_tracker.dbo.c_tr_file_trans_rejects definition

-- Drop table

-- DROP TABLE file_tracker.dbo.c_tr_file_trans_rejects;

CREATE TABLE file_tracker.dbo.c_tr_file_trans_rejects (
	file_id int IDENTITY(0,1) NOT NULL,
	file_name varchar(100) COLLATE Latin1_General_CI_AS NULL,
	file_type_id varchar(20) COLLATE Latin1_General_CI_AS NULL,
	Pyld_MsgRptIdr varchar(100) COLLATE Latin1_General_CI_AS NULL,
	AppHdr_MsgRptIdr varchar(100) COLLATE Latin1_General_CI_AS NULL,
	Sts varchar(4) COLLATE Latin1_General_CI_AS NULL,
	VldtnRule_id varchar(10) COLLATE Latin1_General_CI_AS NULL,
	VldtnRule_Desc varchar(100) COLLATE Latin1_General_CI_AS NULL,
	last_write_time datetime NULL,
	OrgnlRcrdId varchar(100) COLLATE Latin1_General_CI_AS NULL
);


-- file_tracker.dbo.c_tr_file_trans_summary definition

-- Drop table

-- DROP TABLE file_tracker.dbo.c_tr_file_trans_summary;

CREATE TABLE file_tracker.dbo.c_tr_file_trans_summary (
	file_id int IDENTITY(0,1) NOT NULL,
	file_name varchar(100) COLLATE Latin1_General_CI_AS NULL,
	file_type_id varchar(20) COLLATE Latin1_General_CI_AS NULL,
	file_MsgRptIdr varchar(100) COLLATE Latin1_General_CI_AS NULL,
	TtlNbOfRcrds int NULL,
	DtldStsACPT int NULL,
	DtldStsPNDG int NULL,
	DtldStsRJCT int NULL,
	MsgSts varchar(4) COLLATE Latin1_General_CI_AS NULL,
	created_at datetime NULL,
	AppHdr_MsgRptIdr varchar(100) COLLATE Latin1_General_CI_AS NULL,
	last_write_time datetime NULL,
	new_MsgRptIdr varchar(100) COLLATE Latin1_General_CI_AS NULL
);
 CREATE NONCLUSTERED INDEX fm_file_trans_summary_file_name_IDX ON dbo.c_tr_file_trans_summary (  file_name ASC  , file_type_id ASC  , new_MsgRptIdr ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- file_tracker.dbo.c_tr_file_trans_summary_fb definition

-- Drop table

-- DROP TABLE file_tracker.dbo.c_tr_file_trans_summary_fb;

CREATE TABLE file_tracker.dbo.c_tr_file_trans_summary_fb (
	ID int IDENTITY(1,1) NOT NULL,
	file_name varchar(100) COLLATE Latin1_General_CI_AS NULL,
	file_type_id varchar(20) COLLATE Latin1_General_CI_AS NULL,
	Pyld_MsgRptIdr varchar(100) COLLATE Latin1_General_CI_AS NULL,
	TtlNbOfRcrds int NULL,
	DtldStsACPT int NULL,
	DtldStsPNDG int NULL,
	DtldStsRJCT int NULL,
	MsgSts varchar(4) COLLATE Latin1_General_CI_AS NULL,
	AppHdr_MsgRptIdr varchar(100) COLLATE Latin1_General_CI_AS NULL,
	last_write_time datetime NULL,
	ref_MsgRptIdr varchar(100) COLLATE Latin1_General_CI_AS NULL
);


-- file_tracker.dbo.c_tr_file_trans_summary_subdefinition

-- Drop table

-- DROP TABLE file_tracker.dbo.fm_file_trans_summary_sub;

CREATE TABLE file_tracker.dbo.c_tr_file_trans_summary_sub(
	ID int IDENTITY(1,1) NOT NULL,
	file_name varchar(100) COLLATE Latin1_General_CI_AS NULL,
	file_type_id varchar(20) COLLATE Latin1_General_CI_AS NULL,
	Pyld_MsgRptIdr varchar(100) COLLATE Latin1_General_CI_AS NULL,
	TtlNbOfRcrds int NULL,
	MsgSts varchar(4) COLLATE Latin1_General_CI_AS NULL,
	AppHdr_MsgRptIdr varchar(100) COLLATE Latin1_General_CI_AS NULL,
	last_write_time datetime NULL,
	ref_MsgRptIdr varchar(100) COLLATE Latin1_General_CI_AS NULL
);

-- file_tracker.dbo.py_user_info_tbl definition

-- Drop table

-- DROP TABLE file_tracker.dbo.py_user_info_tbl;

CREATE TABLE file_tracker.dbo.py_user_info_tbl (
	id int IDENTITY(1,1) NOT NULL,
	name varchar(50) COLLATE Latin1_General_CI_AS NULL,
	location varchar(50) COLLATE Latin1_General_CI_AS NULL,
	CONSTRAINT PK__py_user___3213E83F98EDF664 PRIMARY KEY (id)
);


-- file_tracker.dbo.py_view_user_info definition

-- Drop table

-- DROP TABLE file_tracker.dbo.py_view_user_info;

CREATE TABLE file_tracker.dbo.py_view_user_info (
	name varchar(50) COLLATE Latin1_General_CI_AS NULL,
	id int IDENTITY(1,1) NOT NULL,
	CONSTRAINT PK__py_view___3213E83F5524E4B6 PRIMARY KEY (id)
);


-- file_tracker.dbo.socks definition

-- Drop table

-- DROP TABLE file_tracker.dbo.socks;

CREATE TABLE file_tracker.dbo.socks (
	id int IDENTITY(1,1) NOT NULL,
	name varchar(MAX) COLLATE Latin1_General_CI_AS NULL,
	[style] varchar(MAX) COLLATE Latin1_General_CI_AS NULL,
	color varchar(MAX) COLLATE Latin1_General_CI_AS NULL,
	quantity int NULL,
	price float NULL,
	updated varchar(MAX) COLLATE Latin1_General_CI_AS NULL,
	CONSTRAINT PK__socks__3213E83FA16C9C9F PRIMARY KEY (id)
);


-- file_tracker.dbo.test definition

-- Drop table

-- DROP TABLE file_tracker.dbo.test;

CREATE TABLE file_tracker.dbo.test (
	id int IDENTITY(0,1) NOT NULL,
	status_id varchar(500) COLLATE Latin1_General_CI_AS NULL,
	[date] datetime NULL,
	MoreInfo varchar(100) COLLATE Latin1_General_CI_AS NULL,
	CheckBox bit DEFAULT 0 NULL
);


-- file_tracker.dbo.users definition

-- Drop table

-- DROP TABLE file_tracker.dbo.users;

CREATE TABLE file_tracker.dbo.users (
	id int IDENTITY(1,1) NOT NULL,
	username varchar(20) COLLATE Latin1_General_CI_AS NOT NULL,
	email varchar(120) COLLATE Latin1_General_CI_AS NOT NULL,
	image_file varchar(20) COLLATE Latin1_General_CI_AS NOT NULL,
	password varchar(60) COLLATE Latin1_General_CI_AS NOT NULL,
	profile_info varchar(MAX) COLLATE Latin1_General_CI_AS NULL,
	CONSTRAINT PK__users__3213E83F42BE56AB PRIMARY KEY (id),
	CONSTRAINT UQ__users__AB6E616411A923E9 UNIQUE (email),
	CONSTRAINT UQ__users__F3DBC572B510CA4F UNIQUE (username)
);
CREATE UNIQUE NONCLUSTERED INDEX UQ__users__AB6E616411A923E9 ON file_tracker.dbo.users (email);
CREATE UNIQUE NONCLUSTERED INDEX UQ__users__F3DBC572B510CA4F ON file_tracker.dbo.users (username);

-- dbo.vw_file_trans_rejects source

CREATE VIEW dbo.vw_file_trans_rejects
AS
SELECT        file_id, file_name, file_type_id, Pyld_MsgRptIdr, AppHdr_MsgRptIdr, Sts, VldtnRule_id, VldtnRule_Desc, last_write_time, OrgnlRcrdId, CASE WHEN file_type_id IN ('ITWEL_FB', 'TTREU_FB', 'TTREO_FB') 
                         THEN 'FCA' ELSE 'AFM' END AS Entity
FROM            dbo.c_tr_file_trans_rejects;

--SELECT * FROM cte_trans_files
, 

cte_join_feedback AS (

	SELECT cff.file_name, cff.Pyld_MsgRptIdr, cff.TtlNbOfRcrds, cff.DtldStsACPT, cff.DtldStsPNDG, 
	cff.DtldStsRJCT, cff.MsgSts, cff.AppHdr_MsgRptIdr, cff.last_write_time, cff.ref_MsgRptIdr, cff.group_id	
	,cff.FT, cff.sort_order
	FROM cte_feedback_files cff
	-- JOIN cte_trans_files  ctf on ctf.ref_MsgRptIdr = cff.ref_MsgRptIdr

),

cte_trans_feedback_files AS (

	SELECT * FROM cte_trans_files
	UNION
	SELECT * FROM cte_join_feedback
)
SELECT * FROM cte_trans_feedback_files WHERE group_id in ('TTWEM','TTWEO') 
--order by ref_MsgRptIdr, sort_order,last_write_time;


-- dbo.vw_get_trans_afm source

CREATE VIEW [dbo].[vw_get_trans_afm] AS
-- SELECT SUBSTRING(file_type_id,0,6), * FROM [dbo].[c_tr_file_trans_summary_fb]
WITH 
cte_feedback_files AS (
	SELECT [file_name],[Pyld_MsgRptIdr],[TtlNbOfRcrds],[DtldStsACPT],[DtldStsPNDG],[DtldStsRJCT],[MsgSts],
	[AppHdr_MsgRptIdr],[last_write_time],[ref_MsgRptIdr], SUBSTRING(file_type_id,0,6) group_id
	--,ROW_NUMBER() OVER (PARTITION BY [ref_MsgRptIdr] ORDER BY last_write_time  ) rownums 
	, SUBSTRING(file_type_id,7,8) FT,
	case when (SUBSTRING(file_name,1,2)) = 'FF' THEN 2
		 when (SUBSTRING(file_name,1,2)) = 'FD' THEN 3 ELSE '9' END AS sort_order
	FROM [dbo].[c_tr_file_trans_summary_fb]
),
cte_trans_files AS (

	SELECT trans.[file_name],trans.[Pyld_MsgRptIdr],
	trans.[TtlNbOfRcrds],0 DtldStsACPT,0 DtldStsPNDG,0 DtldStsRJCT,trans.[MsgSts],
	trans.[AppHdr_MsgRptIdr],trans.[last_write_time],'' as ref_MsgRptIdr,  SUBSTRING(trans.file_type_id,0,6) group_id
	--,ROW_NUMBER() OVER (PARTITION BY trans.[ref_MsgRptIdr] ORDER BY trans.last_write_time  ) rownums 
	, SUBSTRING(trans.file_type_id,7,8) FT,
	case when (SUBSTRING(trans.file_name,1,2)) = 'TR' THEN 1 ELSE '1' END AS sort_order
	FROM [dbo].[fm_file_trans_summary_sub] trans
--	JOIN [c_tr_file_trans_summary_fb] feed on trans.[AppHdr_MsgRptIdr] =  feed.[Pyld_MsgRptIdr]
)

--SELECT * FROM cte_trans_files
, 

cte_join_feedback AS (

	SELECT cff.file_name, cff.Pyld_MsgRptIdr, cff.TtlNbOfRcrds, cff.DtldStsACPT, cff.DtldStsPNDG, 
	cff.DtldStsRJCT, cff.MsgSts, cff.AppHdr_MsgRptIdr, cff.last_write_time, cff.ref_MsgRptIdr, cff.group_id	
	,cff.FT, cff.sort_order
	FROM cte_feedback_files cff
	-- JOIN cte_trans_files  ctf on ctf.ref_MsgRptIdr = cff.ref_MsgRptIdr

),

cte_trans_feedback_files AS (

	SELECT * FROM cte_trans_files
	UNION
	SELECT * FROM cte_join_feedback
),

CTE_get_sub_files AS ( 
SELECT 
	sub.file_name as file_name,	sub.Pyld_MsgRptIdr as Pyld_MsgRptIdr,
	sub.TtlNbOfRcrds as TtlNbOfRcrds, sub.DtldStsACPT as DtldStsACPT,
	sub.DtldStsPNDG as DtldStsPNDG, sub.DtldStsRJCT as DtldStsRJCT,
	sub.MsgSts as MsgSts, sub.AppHdr_MsgRptIdr as AppHdr_MsgRptIdr,
	sub.last_write_time as last_write_time, fb.ref_MsgRptIdr as ref_MsgRptIdr,
	sub.group_id as group_id, sub.FT as FT, sub.sort_order as sort_order

FROM cte_trans_feedback_files sub
JOIN cte_trans_feedback_files fb on sub.AppHdr_MsgRptIdr = fb.Pyld_MsgRptIdr
),

CTE_get_fb_files AS (

SELECT * FROM cte_trans_feedback_files
WHERE FT = 'FB'
),

CTE_join_data as (
SELECT * FROM CTE_get_sub_files
UNION 
SELECT * FROM CTE_get_fb_files
)

SELECT * FROM CTE_join_data WHERE group_id in ('TTWEM','TTWEO') 
--order by ref_MsgRptIdr, sort_order,last_write_time;


-- dbo.vw_get_trans_afm_summary source

CREATE VIEW [dbo].[vw_get_trans_afm_summary] AS

WITH CTE_sub_total AS ( 
SELECT CAST(FORMAT(last_write_time, 'yyyy') as int) YR
, CAST(FORMAT(last_write_time, 'MM') as int) MTH
, CASE WHEN FT='SUB' THEN SUM(TtlNbOfRcrds) END AS TOTAL
, SUM(0) ACPT
, SUM(0) RJCT
, 'Subs' FT
, CAST(FORMAT(last_write_time, 'yyyyMM') as int) conn
FROM [dbo].[vw_get_trans_afm] 
WHERE FT='SUB'
GROUP BY FORMAT(last_write_time, 'yyyy'),FORMAT(last_write_time, 'MM'), FORMAT(last_write_time, 'yyyyMM'),FT
),

CTE_fb_total AS (
SELECT CAST(FORMAT(last_write_time, 'yyyy') as int) YR
, CAST(FORMAT(last_write_time, 'MM') as int) MTH
, SUM(0) TOTAL
, SUM(DtldStsACPT) ACPT
, SUM(DtldStsRJCT) RJCT
, 'Feedback' FT
, CAST(FORMAT(last_write_time, 'yyyyMM') as int) conn

FROM [dbo].[vw_get_trans_afm] 
WHERE FT='FB'
GROUP BY FORMAT(last_write_time, 'yyyy'),FORMAT(last_write_time, 'MM'), FORMAT(last_write_time, 'yyyyMM'),FT
),


cte_trans_count_files AS (

		SELECT sub.YR, sub.MTH,sub.TOTAL, fb.ACPT, fb.RJCT, (sub.TOTAL - fb.ACPT + fb.RJCT) as PNDG, fb.conn YR_MTH,
		ROW_NUMBER()  OVER( ORDER BY fb.conn DESC ) ID
		FROM CTE_sub_total sub
		JOIN CTE_fb_total fb on sub.conn = fb.conn
)
SELECT * FROM cte_trans_count_files;


-- dbo.vw_get_trans_fca source

CREATE VIEW [dbo].[vw_get_trans_fca] AS

WITH cte_feedbacks AS (
		SELECT		SUBSTRING(sub.file_type_id,7,8) ft, sub.ID, sub.file_name, 	sub.TtlNbOfRcrds, sub.DtldStsACPT, sub.DtldStsPNDG, sub.DtldStsRJCT, sub.file_type_id,
					sub.Pyld_MsgRptIdr, sub.AppHdr_MsgRptIdr, sub.last_write_time,SUBSTRING(sub.file_type_id,0,6) group_id,
		CASE		WHEN sub.TtlNbOfRcrds = sub.DtldStsACPT THEN '2' 
					WHEN sub.TtlNbOfRcrds = (sub.DtldStsACPT + sub.DtldStsPNDG) THEN '3' 
					WHEN sub.TtlNbOfRcrds = (sub.DtldStsACPT + sub.DtldStsRJCT) OR sub.TtlNbOfRcrds = (sub.DtldStsACPT + sub.DtldStsPNDG + sub.DtldStsRJCT) THEN '1' ELSE '0' END AS CalSts,
						 
						(case when SUBSTRING(sub.file_type_id,7,8) ='fb' then sub.AppHdr_MsgRptIdr ELSE sub.Pyld_MsgRptIdr END) sort_msg_id
		FROM [dbo].[c_tr_file_trans_summary_fb] sub
),

cte_rows AS (
	SELECT *
	,ROW_NUMBER() OVER (PARTITION BY sub.Pyld_MsgRptIdr ORDER BY  last_write_time DESC, CalSts  ) rownums
	FROM cte_feedbacks sub
	WHERE group_id IN ('TTREU','TTREO','ITWEL')

)

-- SELECT * FROM cte_rows
,
cte_sub_fb_view AS(

SELECT		SUBSTRING(fb.file_type_id,7,8) FT, fb.file_name,sub.Pyld_MsgRptIdr,sub.TtlNbOfRcrds,fb.DtldStsACPT, fb.DtldStsPNDG, fb.DtldStsRJCT,
			sub.AppHdr_MsgRptIdr,sub.last_write_time, SUBSTRING(sub.file_type_id,0,6) group_id, 
CASE		WHEN CalSts=1 THEN 'RJCT' 
			WHEN CalSts=2 THEN 'ACPT'
			WHEN CalSts=3 THEN 'PNDG' END As SubStatus, sub.file_type_id
FROM		c_tr_file_trans_summary_subsub 
JOIN		cte_rows fb on sub.Pyld_MsgRptIdr = fb.Pyld_MsgRptIdr
WHERE		fb.rownums = 1

)
-- SELECT * FROM cte_sub_fb_view
,
cte_trans_files AS (

	SELECT SUBSTRING(trans.file_type_id,7,8) FT
	, trans.[file_name],trans.[Pyld_MsgRptIdr],
	trans.[TtlNbOfRcrds],0 DtldStsACPT,0 DtldStsPNDG,0 DtldStsRJCT,
	trans.[AppHdr_MsgRptIdr],trans.[last_write_time], SUBSTRING(trans.file_type_id,0,6) group_id
	,  '' as SubStatus
	, trans.file_type_id
	-- , case when (SUBSTRING(trans.file_name,1,2)) = 'TR' THEN 1 ELSE '1' END AS sort_order
	FROM [dbo].[fm_file_trans_summary_sub] trans
	WHERE SUBSTRING(trans.file_type_id,0,6) IN ('TTREU','TTREO','ITWEL')

)

-- select * from cte_trans_files
,
cte_trans_feedback_files AS (

	SELECT ROW_NUMBER() OVER (ORDER BY A.last_write_time) as 'UID',A.*
	FROM (
	SELECT * FROM cte_trans_files
	UNION
	SELECT * FROM cte_sub_fb_view
	) A
)
SELECT * FROM cte_trans_feedback_files;


-- dbo.vw_get_trans_fca_summary source

CREATE VIEW [dbo].[vw_get_trans_fca_summary] AS
with CTE_fca AS(
	SELECT 
		  CAST(FORMAT(last_write_time, 'yyyyMM') as int) YR_MTH
		, CAST(FORMAT(last_write_time, 'yyyy') as int) YR
		, CAST(FORMAT(last_write_time, 'MM') as int) MTH
		, SUBSTRING(file_type_id,0,6) ENTITY
		, count (file_type_id) SUBS
		, SUM(TtlNbOfRcrds) TOTAL
		, SUM(DtldStsACPT) ACPT
		, SUM(DtldStsPNDG) PNDG
		, SUM(DtldStsRJCT) RJCT
	
	FROM dbo.vw_get_trans_fca
	GROUP BY 
		  CAST(FORMAT(last_write_time, 'yyyyMM') as int) 
		, CAST(FORMAT(last_write_time, 'yyyy') as int)
		, CAST(FORMAT(last_write_time, 'MM') as int)
		, file_type_id
),
CTE_Rows as (
	SELECT *
	,ROW_NUMBER()  OVER( ORDER BY YR_MTH DESC ) ID
	FROM CTE_fca
)

SELECT * FROM CTE_Rows;



-- dbo.vw_get_search source

CREATE VIEW [dbo].[vw_get_search] AS
-- SELECT SUBSTRING(file_type_id,0,6), * FROM [dbo].[c_tr_file_trans_summary_fb]
WITH 
cte_feedback_files AS (
	SELECT [file_name],[Pyld_MsgRptIdr],[TtlNbOfRcrds],[DtldStsACPT],[DtldStsPNDG],[DtldStsRJCT],[MsgSts],
	[AppHdr_MsgRptIdr],[last_write_time],[ref_MsgRptIdr], SUBSTRING(file_type_id,0,6) group_id
	--,ROW_NUMBER() OVER (PARTITION BY [ref_MsgRptIdr] ORDER BY last_write_time  ) rownums 
	, SUBSTRING(file_type_id,7,8) FT,
	case when (SUBSTRING(file_name,1,2)) = 'FF' THEN 2
		 when (SUBSTRING(file_name,1,2)) = 'FD' THEN 3 ELSE '9' END AS sort_order
	FROM [dbo].[c_tr_file_trans_summary_fb]
),
cte_trans_files AS (

	SELECT trans.[file_name],trans.[Pyld_MsgRptIdr],
	trans.[TtlNbOfRcrds],0 DtldStsACPT,0 DtldStsPNDG,0 DtldStsRJCT,trans.[MsgSts],
	trans.[AppHdr_MsgRptIdr],trans.[last_write_time],'' as ref_MsgRptIdr,  SUBSTRING(trans.file_type_id,0,6) group_id
	--,ROW_NUMBER() OVER (PARTITION BY trans.[ref_MsgRptIdr] ORDER BY trans.last_write_time  ) rownums 
	, SUBSTRING(trans.file_type_id,7,8) FT,
	case when (SUBSTRING(trans.file_name,1,2)) = 'TR' THEN 1 ELSE '1' END AS sort_order
	FROM [dbo].[file_trans_summary_sub] trans
--	JOIN [c_tr_file_trans_summary_fb] feed on trans.[AppHdr_MsgRptIdr] =  feed.[Pyld_MsgRptIdr]
)

