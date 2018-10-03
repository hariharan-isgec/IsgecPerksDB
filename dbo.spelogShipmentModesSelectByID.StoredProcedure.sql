USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogShipmentModesSelectByID]
  @LoginID NVarChar(8),
  @ShipmentModeID Int 
  AS
  SELECT
    [ELOG_ShipmentModes].*  
  FROM [ELOG_ShipmentModes] 
  WHERE
  [ELOG_ShipmentModes].[ShipmentModeID] = @ShipmentModeID
GO
