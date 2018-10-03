USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkMonthsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PRK_Months].*  
  FROM [PRK_Months] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'MonthID' THEN [PRK_Months].[MonthID] END,
     CASE @OrderBy WHEN 'MonthID DESC' THEN [PRK_Months].[MonthID] END DESC,
     CASE @OrderBy WHEN 'MonthName' THEN [PRK_Months].[MonthName] END,
     CASE @OrderBy WHEN 'MonthName DESC' THEN [PRK_Months].[MonthName] END DESC 
  SET @RecordCount = @@RowCount
GO
