USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogShipmentModesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ELOG_ShipmentModes].*  
  FROM [ELOG_ShipmentModes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ShipmentModeID' THEN [ELOG_ShipmentModes].[ShipmentModeID] END,
     CASE @OrderBy WHEN 'ShipmentModeID DESC' THEN [ELOG_ShipmentModes].[ShipmentModeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_ShipmentModes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_ShipmentModes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
