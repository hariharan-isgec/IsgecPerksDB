USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallStatusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ADM_ITCallStatus].[CallStatusID],
		[ADM_ITCallStatus].[Description] 
  FROM [ADM_ITCallStatus] 
  ORDER BY
     CASE @orderBy WHEN 'CallStatusID' THEN [ADM_ITCallStatus].[CallStatusID] END,
     CASE @orderBy WHEN 'CallStatusID DESC' THEN [ADM_ITCallStatus].[CallStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_ITCallStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_ITCallStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
