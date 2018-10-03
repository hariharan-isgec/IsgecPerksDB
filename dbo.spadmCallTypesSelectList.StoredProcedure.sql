USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmCallTypesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ADM_CallTypes].[CallTypeID],
		[ADM_CallTypes].[Description] 
  FROM [ADM_CallTypes] 
  ORDER BY
     CASE @orderBy WHEN 'CallTypeID' THEN [ADM_CallTypes].[CallTypeID] END,
     CASE @orderBy WHEN 'CallTypeID DESC' THEN [ADM_CallTypes].[CallTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_CallTypes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_CallTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
