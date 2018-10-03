USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalStatusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[CAL_Status].[CallStatusID],
		[CAL_Status].[Description] 
  FROM [CAL_Status] 
  ORDER BY
     CASE @orderBy WHEN 'CallStatusID' THEN [CAL_Status].[CallStatusID] END,
     CASE @orderBy WHEN 'CallStatusID DESC' THEN [CAL_Status].[CallStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [CAL_Status].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [CAL_Status].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
