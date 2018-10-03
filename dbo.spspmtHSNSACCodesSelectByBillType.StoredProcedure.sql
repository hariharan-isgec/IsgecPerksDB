USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtHSNSACCodesSelectByBillType]
  @BillType Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SPMT_HSNSACCodes].* ,
    [SPMT_BillTypes1].[Description] AS SPMT_BillTypes1_Description 
  FROM [SPMT_HSNSACCodes] 
  INNER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes1]
    ON [SPMT_HSNSACCodes].[BillType] = [SPMT_BillTypes1].[BillType]
  WHERE
  [SPMT_HSNSACCodes].[BillType] = @BillType
  ORDER BY
     CASE @OrderBy WHEN 'BillType' THEN [SPMT_HSNSACCodes].[BillType] END,
     CASE @OrderBy WHEN 'BillType DESC' THEN [SPMT_HSNSACCodes].[BillType] END DESC,
     CASE @OrderBy WHEN 'HSNSACCode' THEN [SPMT_HSNSACCodes].[HSNSACCode] END,
     CASE @OrderBy WHEN 'HSNSACCode DESC' THEN [SPMT_HSNSACCodes].[HSNSACCode] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_HSNSACCodes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_HSNSACCodes].[Description] END DESC,
     CASE @OrderBy WHEN 'TaxRate' THEN [SPMT_HSNSACCodes].[TaxRate] END,
     CASE @OrderBy WHEN 'TaxRate DESC' THEN [SPMT_HSNSACCodes].[TaxRate] END DESC,
     CASE @OrderBy WHEN 'SPMT_BillTypes1_Description' THEN [SPMT_BillTypes1].[Description] END,
     CASE @OrderBy WHEN 'SPMT_BillTypes1_Description DESC' THEN [SPMT_BillTypes1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
