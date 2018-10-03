USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleRequestPOsSelectByID]
  @LoginID NVarChar(8),
  @RequestNo Int,
  @SerialNo Int 
  AS
  SELECT
    [VR_VehicleRequestPOs].* ,
    [PAK_Units1].[Description] AS PAK_Units1_Description,
    [PAK_Units2].[Description] AS PAK_Units2_Description,
    [PAK_Units3].[Description] AS PAK_Units3_Description,
    [VR_VehicleRequest6].[RequestDescription] AS VR_VehicleRequest6_RequestDescription 
  FROM [VR_VehicleRequestPOs] 
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units1]
    ON [VR_VehicleRequestPOs].[QuantityUnit] = [PAK_Units1].[UnitID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units2]
    ON [VR_VehicleRequestPOs].[WeightUnit] = [PAK_Units2].[UnitID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units3]
    ON [VR_VehicleRequestPOs].[RequestedWeightUnit] = [PAK_Units3].[UnitID]
  INNER JOIN [VR_VehicleRequest] AS [VR_VehicleRequest6]
    ON [VR_VehicleRequestPOs].[RequestNo] = [VR_VehicleRequest6].[RequestNo]
  WHERE
  [VR_VehicleRequestPOs].[RequestNo] = @RequestNo
  AND [VR_VehicleRequestPOs].[SerialNo] = @SerialNo
GO
