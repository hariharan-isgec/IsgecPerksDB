USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkFinYearSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[PRK_FinYears].[FinYear],
		[PRK_FinYears].[Description],
		[PRK_FinYears].[StartDate],
		[PRK_FinYears].[EndDate],
		[PRK_FinYears].[Status] 
  FROM [PRK_FinYears] 
  ORDER BY
     CASE @orderBy WHEN 'FinYear' THEN [PRK_FinYears].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [PRK_FinYears].[FinYear] END DESC,
     CASE @orderBy WHEN 'Description' THEN [PRK_FinYears].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [PRK_FinYears].[Description] END DESC,
     CASE @orderBy WHEN 'StartDate' THEN [PRK_FinYears].[StartDate] END,
     CASE @orderBy WHEN 'StartDate DESC' THEN [PRK_FinYears].[StartDate] END DESC,
     CASE @orderBy WHEN 'EndDate' THEN [PRK_FinYears].[EndDate] END,
     CASE @orderBy WHEN 'EndDate DESC' THEN [PRK_FinYears].[EndDate] END DESC,
     CASE @orderBy WHEN 'Status' THEN [PRK_FinYears].[Status] END,
     CASE @orderBy WHEN 'Status DESC' THEN [PRK_FinYears].[Status] END DESC 
  SET @RecordCount = @@RowCount
GO
