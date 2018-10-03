USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtReturnReasonSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SPMT_ReturnReason].*  
  FROM [SPMT_ReturnReason] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ReasonID' THEN [SPMT_ReturnReason].[ReasonID] END,
     CASE @OrderBy WHEN 'ReasonID DESC' THEN [SPMT_ReturnReason].[ReasonID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_ReturnReason].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_ReturnReason].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
