USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtPAStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SPMT_PAStatus].*  
  FROM [SPMT_PAStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'AdviceStatusID' THEN [SPMT_PAStatus].[AdviceStatusID] END,
     CASE @OrderBy WHEN 'AdviceStatusID DESC' THEN [SPMT_PAStatus].[AdviceStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_PAStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_PAStatus].[Description] END DESC,
     CASE @OrderBy WHEN 'NextStatusID' THEN [SPMT_PAStatus].[NextStatusID] END,
     CASE @OrderBy WHEN 'NextStatusID DESC' THEN [SPMT_PAStatus].[NextStatusID] END DESC 
  SET @RecordCount = @@RowCount
GO
