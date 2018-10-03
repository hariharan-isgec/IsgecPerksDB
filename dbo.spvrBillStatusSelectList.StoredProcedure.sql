USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrBillStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[VR_BillStatus].[BillStatusID] ,
		[VR_BillStatus].[Description]  
  FROM [VR_BillStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'BillStatusID' THEN [VR_BillStatus].[BillStatusID] END,
     CASE @OrderBy WHEN 'BillStatusID DESC' THEN [VR_BillStatus].[BillStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_BillStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_BillStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
