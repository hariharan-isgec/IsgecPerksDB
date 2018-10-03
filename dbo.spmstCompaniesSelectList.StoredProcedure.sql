USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmstCompaniesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_Companies].[CompanyID] ,
		[HRM_Companies].[Description] ,
		[HRM_Companies].[ShortName] ,
		[HRM_Companies].[BaaNID]  
  FROM [HRM_Companies] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'CompanyID' THEN [HRM_Companies].[CompanyID] END,
     CASE @orderBy WHEN 'CompanyID DESC' THEN [HRM_Companies].[CompanyID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_Companies].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_Companies].[Description] END DESC,
     CASE @orderBy WHEN 'ShortName' THEN [HRM_Companies].[ShortName] END,
     CASE @orderBy WHEN 'ShortName DESC' THEN [HRM_Companies].[ShortName] END DESC,
     CASE @orderBy WHEN 'BaaNID' THEN [HRM_Companies].[BaaNID] END,
     CASE @orderBy WHEN 'BaaNID DESC' THEN [HRM_Companies].[BaaNID] END DESC 
  SET @RecordCount = @@RowCount
GO
