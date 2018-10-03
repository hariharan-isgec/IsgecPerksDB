USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogCarriersSelectByID]
  @LoginID NVarChar(8),
  @CarrierID Int 
  AS
  SELECT
    [ELOG_Carriers].* ,
    [ELOG_ShipmentModes1].[Description] AS ELOG_ShipmentModes1_Description 
  FROM [ELOG_Carriers] 
  LEFT OUTER JOIN [ELOG_ShipmentModes] AS [ELOG_ShipmentModes1]
    ON [ELOG_Carriers].[ShipmentModeID] = [ELOG_ShipmentModes1].[ShipmentModeID]
  WHERE
  [ELOG_Carriers].[CarrierID] = @CarrierID
GO
