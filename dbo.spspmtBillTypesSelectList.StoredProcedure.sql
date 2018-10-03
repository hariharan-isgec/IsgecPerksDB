USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBillTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SPMT_BillTypes].*  
  FROM [SPMT_BillTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'BillType' THEN [SPMT_BillTypes].[BillType] END,
     CASE @OrderBy WHEN 'BillType DESC' THEN [SPMT_BillTypes].[BillType] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_BillTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_BillTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
