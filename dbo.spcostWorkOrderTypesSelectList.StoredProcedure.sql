USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostWorkOrderTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [COST_WorkOrderTypes].*  
  FROM [COST_WorkOrderTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'WorkOrderTypeID' THEN [COST_WorkOrderTypes].[WorkOrderTypeID] END,
     CASE @OrderBy WHEN 'WorkOrderTypeID DESC' THEN [COST_WorkOrderTypes].[WorkOrderTypeID] END DESC,
     CASE @OrderBy WHEN 'WorkOrderTypeDescription' THEN [COST_WorkOrderTypes].[WorkOrderTypeDescription] END,
     CASE @OrderBy WHEN 'WorkOrderTypeDescription DESC' THEN [COST_WorkOrderTypes].[WorkOrderTypeDescription] END DESC 
  SET @RecordCount = @@RowCount
GO
