USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ELOG_DetentionBillStatus].*  
  FROM [ELOG_DetentionBillStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [ELOG_DetentionBillStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [ELOG_DetentionBillStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_DetentionBillStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_DetentionBillStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
