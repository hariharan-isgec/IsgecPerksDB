USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOItemStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[EITL_POItemStatus].[StatusID] ,
		[EITL_POItemStatus].[Description]  
  FROM [EITL_POItemStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [EITL_POItemStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [EITL_POItemStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [EITL_POItemStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [EITL_POItemStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
