USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnTranTypeSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATN_TranType].[TranType],
		[ATN_TranType].[Description] 
  FROM [ATN_TranType] 
  ORDER BY
     CASE @orderBy WHEN 'TranType' THEN [ATN_TranType].[TranType] END,
     CASE @orderBy WHEN 'TranType DESC' THEN [ATN_TranType].[TranType] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ATN_TranType].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ATN_TranType].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
