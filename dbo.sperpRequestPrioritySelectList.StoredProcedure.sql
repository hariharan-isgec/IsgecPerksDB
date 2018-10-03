USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestPrioritySelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ERP_RequestPriority].[PriorityID] ,
		[ERP_RequestPriority].[Description]  
  FROM [ERP_RequestPriority] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'PriorityID' THEN [ERP_RequestPriority].[PriorityID] END,
     CASE @OrderBy WHEN 'PriorityID DESC' THEN [ERP_RequestPriority].[PriorityID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ERP_RequestPriority].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ERP_RequestPriority].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
