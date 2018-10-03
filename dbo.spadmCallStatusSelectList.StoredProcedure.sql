USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmCallStatusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ADM_CallStatus].[CallStatusID],
		[ADM_CallStatus].[Description] 
  FROM [ADM_CallStatus] 
  ORDER BY
     CASE @orderBy WHEN 'CallStatusID' THEN [ADM_CallStatus].[CallStatusID] END,
     CASE @orderBy WHEN 'CallStatusID DESC' THEN [ADM_CallStatus].[CallStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_CallStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_CallStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
