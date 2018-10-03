USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ELOG_DetentionBillTypes].*  
  FROM [ELOG_DetentionBillTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'BillTypeID' THEN [ELOG_DetentionBillTypes].[BillTypeID] END,
     CASE @OrderBy WHEN 'BillTypeID DESC' THEN [ELOG_DetentionBillTypes].[BillTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_DetentionBillTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_DetentionBillTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
