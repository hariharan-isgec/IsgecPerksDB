USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkFinYearsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PRK_FinYears].*  
  FROM [PRK_FinYears] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'FinYear' THEN [PRK_FinYears].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [PRK_FinYears].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PRK_FinYears].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PRK_FinYears].[Description] END DESC,
     CASE @OrderBy WHEN 'StartDate' THEN [PRK_FinYears].[StartDate] END,
     CASE @OrderBy WHEN 'StartDate DESC' THEN [PRK_FinYears].[StartDate] END DESC,
     CASE @OrderBy WHEN 'EndDate' THEN [PRK_FinYears].[EndDate] END,
     CASE @OrderBy WHEN 'EndDate DESC' THEN [PRK_FinYears].[EndDate] END DESC,
     CASE @OrderBy WHEN 'Status' THEN [PRK_FinYears].[Status] END,
     CASE @OrderBy WHEN 'Status DESC' THEN [PRK_FinYears].[Status] END DESC 
  SET @RecordCount = @@RowCount
GO
