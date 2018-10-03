USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpTPTBillReasonsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ERP_TPTBillReasons].[ReasonID] ,
		[ERP_TPTBillReasons].[Description]  
  FROM [ERP_TPTBillReasons] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ReasonID' THEN [ERP_TPTBillReasons].[ReasonID] END,
     CASE @OrderBy WHEN 'ReasonID DESC' THEN [ERP_TPTBillReasons].[ReasonID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ERP_TPTBillReasons].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ERP_TPTBillReasons].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
