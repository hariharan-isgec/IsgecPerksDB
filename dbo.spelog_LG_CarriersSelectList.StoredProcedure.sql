USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelog_LG_CarriersSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  IF (@OrderBy='')
	SET @OrderBy = '0'
  SELECT
    [ELOG_Carriers].* ,
    [ELOG_ShipmentModes1].[Description] AS ELOG_ShipmentModes1_Description 
  FROM [ELOG_Carriers] 
  LEFT OUTER JOIN [ELOG_ShipmentModes] AS [ELOG_ShipmentModes1]
    ON [ELOG_Carriers].[ShipmentModeID] = [ELOG_ShipmentModes1].[ShipmentModeID]
  WHERE [ELOG_Carriers].[ShipmentModeID]=@OrderBy  
  --ORDER BY
  --   CASE @OrderBy WHEN 'CarrierID' THEN [ELOG_Carriers].[CarrierID] END,
  --   CASE @OrderBy WHEN 'CarrierID DESC' THEN [ELOG_Carriers].[CarrierID] END DESC,
  --   CASE @OrderBy WHEN 'ShipmentModeID' THEN [ELOG_Carriers].[ShipmentModeID] END,
  --   CASE @OrderBy WHEN 'ShipmentModeID DESC' THEN [ELOG_Carriers].[ShipmentModeID] END DESC,
  --   CASE @OrderBy WHEN 'Description' THEN [ELOG_Carriers].[Description] END,
  --   CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_Carriers].[Description] END DESC,
  --   CASE @OrderBy WHEN 'ELOG_ShipmentModes1_Description' THEN [ELOG_ShipmentModes1].[Description] END,
  --   CASE @OrderBy WHEN 'ELOG_ShipmentModes1_Description DESC' THEN [ELOG_ShipmentModes1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
