USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLStatesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ELOG_IRBLStates].*  
  FROM [ELOG_IRBLStates] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [ELOG_IRBLStates].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [ELOG_IRBLStates].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_IRBLStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_IRBLStates].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
