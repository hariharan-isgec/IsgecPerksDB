USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallTypesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ADM_ITCallTypes].[CallTypeID],
		[ADM_ITCallTypes].[Description] 
  FROM [ADM_ITCallTypes] 
  ORDER BY
     CASE @orderBy WHEN 'CallTypeID' THEN [ADM_ITCallTypes].[CallTypeID] END,
     CASE @orderBy WHEN 'CallTypeID DESC' THEN [ADM_ITCallTypes].[CallTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_ITCallTypes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_ITCallTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
