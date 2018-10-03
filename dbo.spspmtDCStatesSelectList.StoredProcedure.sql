USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCStatesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SPMT_DCStates].*  
  FROM [SPMT_DCStates] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [SPMT_DCStates].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [SPMT_DCStates].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_DCStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_DCStates].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
