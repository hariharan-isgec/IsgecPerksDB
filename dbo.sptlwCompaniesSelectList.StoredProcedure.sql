USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwCompaniesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [HRM_Companies].*  
  FROM [HRM_Companies] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'CompanyID' THEN [HRM_Companies].[CompanyID] END,
     CASE @OrderBy WHEN 'CompanyID DESC' THEN [HRM_Companies].[CompanyID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [HRM_Companies].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_Companies].[Description] END DESC,
     CASE @OrderBy WHEN 'ShortName' THEN [HRM_Companies].[ShortName] END,
     CASE @OrderBy WHEN 'ShortName DESC' THEN [HRM_Companies].[ShortName] END DESC,
     CASE @OrderBy WHEN 'BaaNID' THEN [HRM_Companies].[BaaNID] END,
     CASE @OrderBy WHEN 'BaaNID DESC' THEN [HRM_Companies].[BaaNID] END DESC 
  SET @RecordCount = @@RowCount
GO
