USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallSubTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ADM_ITCallSubTypes].[CallTypeID] ,
		[ADM_ITCallSubTypes].[CallSubTypeID] ,
		[ADM_ITCallSubTypes].[Description] ,
		[ADM_ITCallTypes1].[Description] AS ADM_ITCallTypes1_Description 
  FROM [ADM_ITCallSubTypes] 
  INNER JOIN [ADM_ITCallTypes] AS [ADM_ITCallTypes1]
    ON [ADM_ITCallSubTypes].[CallTypeID] = [ADM_ITCallTypes1].[CallTypeID]
  WHERE [ADM_ITCallSubTypes].[CallTypeID] = case when @OrderBy='' then [ADM_ITCallSubTypes].[CallTypeID] else @OrderBy end   

  --ORDER BY
  --   CASE @OrderBy WHEN 'CallTypeID' THEN [ADM_ITCallSubTypes].[CallTypeID] END,
  --   CASE @OrderBy WHEN 'CallTypeID DESC' THEN [ADM_ITCallSubTypes].[CallTypeID] END DESC,
  --   CASE @OrderBy WHEN 'CallSubTypeID' THEN [ADM_ITCallSubTypes].[CallSubTypeID] END,
  --   CASE @OrderBy WHEN 'CallSubTypeID DESC' THEN [ADM_ITCallSubTypes].[CallSubTypeID] END DESC,
  --   CASE @OrderBy WHEN 'Description' THEN [ADM_ITCallSubTypes].[Description] END,
  --   CASE @OrderBy WHEN 'Description DESC' THEN [ADM_ITCallSubTypes].[Description] END DESC,
  --   CASE @OrderBy WHEN 'ADM_ITCallTypes1_Description' THEN [ADM_ITCallTypes1].[Description] END,
  --   CASE @OrderBy WHEN 'ADM_ITCallTypes1_Description DESC' THEN [ADM_ITCallTypes1].[Description] END DESC 

  SET @RecordCount = @@RowCount
GO
