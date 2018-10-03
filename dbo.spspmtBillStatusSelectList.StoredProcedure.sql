USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBillStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SPMT_BillStatus].*  
  FROM [SPMT_BillStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'BillStatusID' THEN [SPMT_BillStatus].[BillStatusID] END,
     CASE @OrderBy WHEN 'BillStatusID DESC' THEN [SPMT_BillStatus].[BillStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_BillStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_BillStatus].[Description] END DESC,
     CASE @OrderBy WHEN 'NextStatusID' THEN [SPMT_BillStatus].[NextStatusID] END,
     CASE @OrderBy WHEN 'NextStatusID DESC' THEN [SPMT_BillStatus].[NextStatusID] END DESC 
  SET @RecordCount = @@RowCount
GO
