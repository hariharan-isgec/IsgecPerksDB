USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalPrioritySelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[CAL_Priority].[Priority],
		[CAL_Priority].[Description] 
  FROM [CAL_Priority] 
  ORDER BY
     CASE @orderBy WHEN 'Priority' THEN [CAL_Priority].[Priority] END,
     CASE @orderBy WHEN 'Priority DESC' THEN [CAL_Priority].[Priority] END DESC,
     CASE @orderBy WHEN 'Description' THEN [CAL_Priority].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [CAL_Priority].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
