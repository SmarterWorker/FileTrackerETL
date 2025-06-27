USE [file_tracker]
GO

/****** Object:  View [dbo].[vw_file_type_config]    Script Date: 15/07/2021 13:50:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vw_c_sales_data_sum]
AS
SELECT ROW_NUMBER() OVER(ORDER BY region ASC) AS RowN, region REGION,
round(sum(total_revenue),0) REVENUE,
round(sum(total_cost),0) COST,
round(sum(total_profit),0) PROFIT
--FORMAT(round(sum(total_revenue),0),'C','en-gb') REVENUE,
-- FORMAT(round(sum(total_cost),0),'C','en-gb') COST,
-- FORMAT(round(sum(total_profit),0),'C','en-gb') PROFIT
from c_sales_data
group by region

GO


ALTER VIEW [dbo].[vw_c_sales_data_prod_type]
AS
SELECT ROW_NUMBER() OVER(ORDER BY product_type ASC) AS RowN, product_type PRODUCT,
round(sum(total_revenue),0) REVENUE,
round(sum(total_cost),0) COST,
round(sum(total_profit),0) PROFIT
--FORMAT(round(sum(total_revenue),0),'C','en-gb') REVENUE,
-- FORMAT(round(sum(total_cost),0),'C','en-gb') COST,
-- FORMAT(round(sum(total_profit),0),'C','en-gb') PROFIT
from c_sales_data
group by product_type

GO

