USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtMonthsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATN_Months].[MonthID],
		[ATN_Months].[ShortName],
		[ATN_Months].[Description] 
  FROM [ATN_Months] 
  ORDER BY
     CASE @orderBy WHEN 'MonthID' THEN [ATN_Months].[MonthID] END,
     CASE @orderBy WHEN 'MonthID DESC' THEN [ATN_Months].[MonthID] END DESC,
     CASE @orderBy WHEN 'ShortName' THEN [ATN_Months].[ShortName] END,
     CASE @orderBy WHEN 'ShortName DESC' THEN [ATN_Months].[ShortName] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ATN_Months].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ATN_Months].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
