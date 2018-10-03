USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtERPStatesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SPMT_ERPStates].*  
  FROM [SPMT_ERPStates] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StateID' THEN [SPMT_ERPStates].[StateID] END,
     CASE @OrderBy WHEN 'StateID DESC' THEN [SPMT_ERPStates].[StateID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_ERPStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_ERPStates].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
