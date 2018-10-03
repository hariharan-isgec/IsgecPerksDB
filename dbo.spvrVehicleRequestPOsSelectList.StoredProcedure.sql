USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleRequestPOsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'RequestNo' THEN [VR_VehicleRequestPOs].[RequestNo] END,
     CASE @OrderBy WHEN 'RequestNo DESC' THEN [VR_VehicleRequestPOs].[RequestNo] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [VR_VehicleRequestPOs].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [VR_VehicleRequestPOs].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'PoNumber' THEN [VR_VehicleRequestPOs].[PoNumber] END,
     CASE @OrderBy WHEN 'PoNumber DESC' THEN [VR_VehicleRequestPOs].[PoNumber] END DESC,
     CASE @OrderBy WHEN 'PoLine' THEN [VR_VehicleRequestPOs].[PoLine] END,
     CASE @OrderBy WHEN 'PoLine DESC' THEN [VR_VehicleRequestPOs].[PoLine] END DESC,
     CASE @OrderBy WHEN 'Item' THEN [VR_VehicleRequestPOs].[Item] END,
     CASE @OrderBy WHEN 'Item DESC' THEN [VR_VehicleRequestPOs].[Item] END DESC,
     CASE @OrderBy WHEN 'ItemDescription' THEN [VR_VehicleRequestPOs].[ItemDescription] END,
     CASE @OrderBy WHEN 'ItemDescription DESC' THEN [VR_VehicleRequestPOs].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'ItemQuantity' THEN [VR_VehicleRequestPOs].[ItemQuantity] END,
     CASE @OrderBy WHEN 'ItemQuantity DESC' THEN [VR_VehicleRequestPOs].[ItemQuantity] END DESC,
     CASE @OrderBy WHEN 'QuantityUnit' THEN [VR_VehicleRequestPOs].[QuantityUnit] END,
     CASE @OrderBy WHEN 'QuantityUnit DESC' THEN [VR_VehicleRequestPOs].[QuantityUnit] END DESC,
     CASE @OrderBy WHEN 'ItemWeight' THEN [VR_VehicleRequestPOs].[ItemWeight] END,
     CASE @OrderBy WHEN 'ItemWeight DESC' THEN [VR_VehicleRequestPOs].[ItemWeight] END DESC,
     CASE @OrderBy WHEN 'WeightUnit' THEN [VR_VehicleRequestPOs].[WeightUnit] END,
     CASE @OrderBy WHEN 'WeightUnit DESC' THEN [VR_VehicleRequestPOs].[WeightUnit] END DESC,
     CASE @OrderBy WHEN 'RequestedWeight' THEN [VR_VehicleRequestPOs].[RequestedWeight] END,
     CASE @OrderBy WHEN 'RequestedWeight DESC' THEN [VR_VehicleRequestPOs].[RequestedWeight] END DESC,
     CASE @OrderBy WHEN 'RequestedWeightUnit' THEN [VR_VehicleRequestPOs].[RequestedWeightUnit] END,
     CASE @OrderBy WHEN 'RequestedWeightUnit DESC' THEN [VR_VehicleRequestPOs].[RequestedWeightUnit] END DESC,
     CASE @OrderBy WHEN 'PoLineMode' THEN [VR_VehicleRequestPOs].[PoLineMode] END,
     CASE @OrderBy WHEN 'PoLineMode DESC' THEN [VR_VehicleRequestPOs].[PoLineMode] END DESC,
     CASE @OrderBy WHEN 'PAK_Units1_Description' THEN [PAK_Units1].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units1_Description DESC' THEN [PAK_Units1].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units2_Description' THEN [PAK_Units2].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units2_Description DESC' THEN [PAK_Units2].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units3_Description' THEN [PAK_Units3].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units3_Description DESC' THEN [PAK_Units3].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_VehicleRequest6_RequestDescription' THEN [VR_VehicleRequest6].[RequestDescription] END,
     CASE @OrderBy WHEN 'VR_VehicleRequest6_RequestDescription DESC' THEN [VR_VehicleRequest6].[RequestDescription] END DESC 
  SET @RecordCount = @@RowCount
GO
