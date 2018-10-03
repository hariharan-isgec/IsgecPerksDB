USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtFinYearSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATN_FinYear].[FinYear],
		[ATN_FinYear].[Description],
		[ATN_FinYear].[StartDate],
		[ATN_FinYear].[EndDate],
		[ATN_FinYear].[Active] 
  FROM [ATN_FinYear] 
  ORDER BY
     CASE @orderBy WHEN 'FinYear' THEN [ATN_FinYear].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATN_FinYear].[FinYear] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ATN_FinYear].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ATN_FinYear].[Description] END DESC,
     CASE @orderBy WHEN 'StartDate' THEN [ATN_FinYear].[StartDate] END,
     CASE @orderBy WHEN 'StartDate DESC' THEN [ATN_FinYear].[StartDate] END DESC,
     CASE @orderBy WHEN 'EndDate' THEN [ATN_FinYear].[EndDate] END,
     CASE @orderBy WHEN 'EndDate DESC' THEN [ATN_FinYear].[EndDate] END DESC,
     CASE @orderBy WHEN 'Active' THEN [ATN_FinYear].[Active] END,
     CASE @orderBy WHEN 'Active DESC' THEN [ATN_FinYear].[Active] END DESC 
  SET @RecordCount = @@RowCount
GO
