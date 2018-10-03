USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpTPTBillStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ERP_TPTBillStatus].[BillStatusID] ,
		[ERP_TPTBillStatus].[Description]  
  FROM [ERP_TPTBillStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'BillStatusID' THEN [ERP_TPTBillStatus].[BillStatusID] END,
     CASE @OrderBy WHEN 'BillStatusID DESC' THEN [ERP_TPTBillStatus].[BillStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ERP_TPTBillStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ERP_TPTBillStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
