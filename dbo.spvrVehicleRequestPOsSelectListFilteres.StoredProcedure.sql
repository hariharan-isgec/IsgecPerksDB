USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleRequestPOsSelectListFilteres]
  @Filter_RequestNo Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RequestNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestNo'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_VehicleRequestPOs].[RequestNo]'
  SET @LGSQL = @LGSQL + ', [VR_VehicleRequestPOs].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [VR_VehicleRequestPOs] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units1]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequestPOs].[QuantityUnit] = [PAK_Units1].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units2]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequestPOs].[WeightUnit] = [PAK_Units2].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units3]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequestPOs].[RequestedWeightUnit] = [PAK_Units3].[UnitID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [VR_VehicleRequest] AS [VR_VehicleRequest6]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequestPOs].[RequestNo] = [VR_VehicleRequest6].[RequestNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_RequestNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [VR_VehicleRequestPOs].[RequestNo] = ' + STR(@Filter_RequestNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestNo' THEN '[VR_VehicleRequestPOs].[RequestNo]'
                        WHEN 'RequestNo DESC' THEN '[VR_VehicleRequestPOs].[RequestNo] DESC'
                        WHEN 'SerialNo' THEN '[VR_VehicleRequestPOs].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[VR_VehicleRequestPOs].[SerialNo] DESC'
                        WHEN 'PoNumber' THEN '[VR_VehicleRequestPOs].[PoNumber]'
                        WHEN 'PoNumber DESC' THEN '[VR_VehicleRequestPOs].[PoNumber] DESC'
                        WHEN 'PoLine' THEN '[VR_VehicleRequestPOs].[PoLine]'
                        WHEN 'PoLine DESC' THEN '[VR_VehicleRequestPOs].[PoLine] DESC'
                        WHEN 'Item' THEN '[VR_VehicleRequestPOs].[Item]'
                        WHEN 'Item DESC' THEN '[VR_VehicleRequestPOs].[Item] DESC'
                        WHEN 'ItemDescription' THEN '[VR_VehicleRequestPOs].[ItemDescription]'
                        WHEN 'ItemDescription DESC' THEN '[VR_VehicleRequestPOs].[ItemDescription] DESC'
                        WHEN 'ItemQuantity' THEN '[VR_VehicleRequestPOs].[ItemQuantity]'
                        WHEN 'ItemQuantity DESC' THEN '[VR_VehicleRequestPOs].[ItemQuantity] DESC'
                        WHEN 'QuantityUnit' THEN '[VR_VehicleRequestPOs].[QuantityUnit]'
                        WHEN 'QuantityUnit DESC' THEN '[VR_VehicleRequestPOs].[QuantityUnit] DESC'
                        WHEN 'ItemWeight' THEN '[VR_VehicleRequestPOs].[ItemWeight]'
                        WHEN 'ItemWeight DESC' THEN '[VR_VehicleRequestPOs].[ItemWeight] DESC'
                        WHEN 'WeightUnit' THEN '[VR_VehicleRequestPOs].[WeightUnit]'
                        WHEN 'WeightUnit DESC' THEN '[VR_VehicleRequestPOs].[WeightUnit] DESC'
                        WHEN 'RequestedWeight' THEN '[VR_VehicleRequestPOs].[RequestedWeight]'
                        WHEN 'RequestedWeight DESC' THEN '[VR_VehicleRequestPOs].[RequestedWeight] DESC'
                        WHEN 'RequestedWeightUnit' THEN '[VR_VehicleRequestPOs].[RequestedWeightUnit]'
                        WHEN 'RequestedWeightUnit DESC' THEN '[VR_VehicleRequestPOs].[RequestedWeightUnit] DESC'
                        WHEN 'PoLineMode' THEN '[VR_VehicleRequestPOs].[PoLineMode]'
                        WHEN 'PoLineMode DESC' THEN '[VR_VehicleRequestPOs].[PoLineMode] DESC'
                        WHEN 'PAK_Units1_Description' THEN '[PAK_Units1].[Description]'
                        WHEN 'PAK_Units1_Description DESC' THEN '[PAK_Units1].[Description] DESC'
                        WHEN 'PAK_Units2_Description' THEN '[PAK_Units2].[Description]'
                        WHEN 'PAK_Units2_Description DESC' THEN '[PAK_Units2].[Description] DESC'
                        WHEN 'PAK_Units3_Description' THEN '[PAK_Units3].[Description]'
                        WHEN 'PAK_Units3_Description DESC' THEN '[PAK_Units3].[Description] DESC'
                        WHEN 'VR_VehicleRequest6_RequestDescription' THEN '[VR_VehicleRequest6].[RequestDescription]'
                        WHEN 'VR_VehicleRequest6_RequestDescription DESC' THEN '[VR_VehicleRequest6].[RequestDescription] DESC'
                        ELSE '[VR_VehicleRequestPOs].[RequestNo],[VR_VehicleRequestPOs].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [VR_VehicleRequestPOs].* ,
    [PAK_Units1].[Description] AS PAK_Units1_Description,
    [PAK_Units2].[Description] AS PAK_Units2_Description,
    [PAK_Units3].[Description] AS PAK_Units3_Description,
    [VR_VehicleRequest6].[RequestDescription] AS VR_VehicleRequest6_RequestDescription 
  FROM [VR_VehicleRequestPOs] 
      INNER JOIN #PageIndex
          ON [VR_VehicleRequestPOs].[RequestNo] = #PageIndex.RequestNo
          AND [VR_VehicleRequestPOs].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units1]
    ON [VR_VehicleRequestPOs].[QuantityUnit] = [PAK_Units1].[UnitID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units2]
    ON [VR_VehicleRequestPOs].[WeightUnit] = [PAK_Units2].[UnitID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units3]
    ON [VR_VehicleRequestPOs].[RequestedWeightUnit] = [PAK_Units3].[UnitID]
  INNER JOIN [VR_VehicleRequest] AS [VR_VehicleRequest6]
    ON [VR_VehicleRequestPOs].[RequestNo] = [VR_VehicleRequest6].[RequestNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
