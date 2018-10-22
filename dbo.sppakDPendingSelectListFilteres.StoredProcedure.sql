USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakDPendingSelectListFilteres]
  @Filter_PkgNo Int,
  @Filter_SerialNo Int,
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
 ,SerialNo Int NOT NULL
 ,PkgNo Int NOT NULL
 ,BOMNo Int NOT NULL
 ,ItemNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ', PkgNo'
  SET @LGSQL = @LGSQL + ', BOMNo'
  SET @LGSQL = @LGSQL + ', ItemNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_PkgListD].[SerialNo]'
  SET @LGSQL = @LGSQL + ', [PAK_PkgListD].[PkgNo]'
  SET @LGSQL = @LGSQL + ', [PAK_PkgListD].[BOMNo]'
  SET @LGSQL = @LGSQL + ', [PAK_PkgListD].[ItemNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_PkgListD] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_PakTypes] AS [PAK_PakTypes1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListD].[PackTypeID] = [PAK_PakTypes1].[PackTypeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_PkgListH] AS [PAK_PkgListH2]'
  --SET @LGSQL = @LGSQL + '    ON [PAK_PkgListD].[SerialNo] = [PAK_PkgListH2].[SerialNo]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListD].[PkgNo] = [PAK_PkgListH2].[PkgNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_PO] AS [PAK_PO3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListD].[SerialNo] = [PAK_PO3].[SerialNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_POBItems] AS [PAK_POBItems4]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListD].[SerialNo] = [PAK_POBItems4].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_PkgListD].[BOMNo] = [PAK_POBItems4].[BOMNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_PkgListD].[ItemNo] = [PAK_POBItems4].[ItemNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_POBOM] AS [PAK_POBOM5]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListD].[SerialNo] = [PAK_POBOM5].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_PkgListD].[BOMNo] = [PAK_POBOM5].[BOMNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units6]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListD].[UOMQuantity] = [PAK_Units6].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units7]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListD].[UOMWeight] = [PAK_Units7].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units8]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListD].[UOMPack] = [PAK_Units8].[UnitID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_PkgNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_PkgListD].[PkgNo] = ' + STR(@Filter_PkgNo)
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_PkgListD].[SerialNo] = ' + STR(@Filter_SerialNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[PAK_PkgListD].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PAK_PkgListD].[SerialNo] DESC'
                        WHEN 'PkgNo' THEN '[PAK_PkgListD].[PkgNo]'
                        WHEN 'PkgNo DESC' THEN '[PAK_PkgListD].[PkgNo] DESC'
                        WHEN 'BOMNo' THEN '[PAK_PkgListD].[BOMNo]'
                        WHEN 'BOMNo DESC' THEN '[PAK_PkgListD].[BOMNo] DESC'
                        WHEN 'ItemNo' THEN '[PAK_PkgListD].[ItemNo]'
                        WHEN 'ItemNo DESC' THEN '[PAK_PkgListD].[ItemNo] DESC'
                        WHEN 'UOMQuantity' THEN '[PAK_PkgListD].[UOMQuantity]'
                        WHEN 'UOMQuantity DESC' THEN '[PAK_PkgListD].[UOMQuantity] DESC'
                        WHEN 'Quantity' THEN '[PAK_PkgListD].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[PAK_PkgListD].[Quantity] DESC'
                        WHEN 'UOMWeight' THEN '[PAK_PkgListD].[UOMWeight]'
                        WHEN 'UOMWeight DESC' THEN '[PAK_PkgListD].[UOMWeight] DESC'
                        WHEN 'WeightPerUnit' THEN '[PAK_PkgListD].[WeightPerUnit]'
                        WHEN 'WeightPerUnit DESC' THEN '[PAK_PkgListD].[WeightPerUnit] DESC'
                        WHEN 'PackTypeID' THEN '[PAK_PkgListD].[PackTypeID]'
                        WHEN 'PackTypeID DESC' THEN '[PAK_PkgListD].[PackTypeID] DESC'
                        WHEN 'PackingMark' THEN '[PAK_PkgListD].[PackingMark]'
                        WHEN 'PackingMark DESC' THEN '[PAK_PkgListD].[PackingMark] DESC'
                        WHEN 'PackLength' THEN '[PAK_PkgListD].[PackLength]'
                        WHEN 'PackLength DESC' THEN '[PAK_PkgListD].[PackLength] DESC'
                        WHEN 'PackWidth' THEN '[PAK_PkgListD].[PackWidth]'
                        WHEN 'PackWidth DESC' THEN '[PAK_PkgListD].[PackWidth] DESC'
                        WHEN 'PackHeight' THEN '[PAK_PkgListD].[PackHeight]'
                        WHEN 'PackHeight DESC' THEN '[PAK_PkgListD].[PackHeight] DESC'
                        WHEN 'UOMPack' THEN '[PAK_PkgListD].[UOMPack]'
                        WHEN 'UOMPack DESC' THEN '[PAK_PkgListD].[UOMPack] DESC'
                        WHEN 'Remarks' THEN '[PAK_PkgListD].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[PAK_PkgListD].[Remarks] DESC'
                        WHEN 'QuantityReceived' THEN '[PAK_PkgListD].[QuantityReceived]'
                        WHEN 'QuantityReceived DESC' THEN '[PAK_PkgListD].[QuantityReceived] DESC'
                        WHEN 'QuantityBalance' THEN '[PAK_PkgListD].[QuantityBalance]'
                        WHEN 'QuantityBalance DESC' THEN '[PAK_PkgListD].[QuantityBalance] DESC'
                        WHEN 'TotalWeightReceived' THEN '[PAK_PkgListD].[TotalWeightReceived]'
                        WHEN 'TotalWeightReceived DESC' THEN '[PAK_PkgListD].[TotalWeightReceived] DESC'
                        WHEN 'TotalWeightBalance' THEN '[PAK_PkgListD].[TotalWeightBalance]'
                        WHEN 'TotalWeightBalance DESC' THEN '[PAK_PkgListD].[TotalWeightBalance] DESC'
                        WHEN 'PAK_PakTypes1_Description' THEN '[PAK_PakTypes1].[Description]'
                        WHEN 'PAK_PakTypes1_Description DESC' THEN '[PAK_PakTypes1].[Description] DESC'
                        WHEN 'PAK_PkgListH2_SupplierRefNo' THEN '[PAK_PkgListH2].[SupplierRefNo]'
                        WHEN 'PAK_PkgListH2_SupplierRefNo DESC' THEN '[PAK_PkgListH2].[SupplierRefNo] DESC'
                        WHEN 'PAK_PO3_PODescription' THEN '[PAK_PO3].[PODescription]'
                        WHEN 'PAK_PO3_PODescription DESC' THEN '[PAK_PO3].[PODescription] DESC'
                        WHEN 'PAK_POBItems4_ItemDescription' THEN '[PAK_POBItems4].[ItemDescription]'
                        WHEN 'PAK_POBItems4_ItemDescription DESC' THEN '[PAK_POBItems4].[ItemDescription] DESC'
                        WHEN 'PAK_POBOM5_ItemDescription' THEN '[PAK_POBOM5].[ItemDescription]'
                        WHEN 'PAK_POBOM5_ItemDescription DESC' THEN '[PAK_POBOM5].[ItemDescription] DESC'
                        WHEN 'PAK_Units6_Description' THEN '[PAK_Units6].[Description]'
                        WHEN 'PAK_Units6_Description DESC' THEN '[PAK_Units6].[Description] DESC'
                        WHEN 'PAK_Units7_Description' THEN '[PAK_Units7].[Description]'
                        WHEN 'PAK_Units7_Description DESC' THEN '[PAK_Units7].[Description] DESC'
                        WHEN 'PAK_Units8_Description' THEN '[PAK_Units8].[Description]'
                        WHEN 'PAK_Units8_Description DESC' THEN '[PAK_Units8].[Description] DESC'
                        ELSE '[PAK_PkgListD].[SerialNo],[PAK_PkgListD].[PkgNo],[PAK_PkgListD].[BOMNo],[PAK_PkgListD].[ItemNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_PkgListD].* ,
    [PAK_PakTypes1].[Description] AS PAK_PakTypes1_Description,
    [PAK_PkgListH2].[SupplierRefNo] AS PAK_PkgListH2_SupplierRefNo,
    [PAK_PO3].[PODescription] AS PAK_PO3_PODescription,
    [PAK_POBItems4].[ItemDescription] AS PAK_POBItems4_ItemDescription,
    [PAK_POBOM5].[ItemDescription] AS PAK_POBOM5_ItemDescription,
    [PAK_Units6].[Description] AS PAK_Units6_Description,
    [PAK_Units7].[Description] AS PAK_Units7_Description,
    [PAK_Units8].[Description] AS PAK_Units8_Description 
  FROM [PAK_PkgListD] 
      INNER JOIN #PageIndex
          ON [PAK_PkgListD].[SerialNo] = #PageIndex.SerialNo
          AND [PAK_PkgListD].[PkgNo] = #PageIndex.PkgNo
          AND [PAK_PkgListD].[BOMNo] = #PageIndex.BOMNo
          AND [PAK_PkgListD].[ItemNo] = #PageIndex.ItemNo
  LEFT OUTER JOIN [PAK_PakTypes] AS [PAK_PakTypes1]
    ON [PAK_PkgListD].[PackTypeID] = [PAK_PakTypes1].[PackTypeID]
  INNER JOIN [PAK_PkgListH] AS [PAK_PkgListH2]
    --ON [PAK_PkgListD].[SerialNo] = [PAK_PkgListH2].[SerialNo]
    ON [PAK_PkgListD].[PkgNo] = [PAK_PkgListH2].[PkgNo]
  INNER JOIN [PAK_PO] AS [PAK_PO3]
    ON [PAK_PkgListD].[SerialNo] = [PAK_PO3].[SerialNo]
  INNER JOIN [PAK_POBItems] AS [PAK_POBItems4]
    ON [PAK_PkgListD].[SerialNo] = [PAK_POBItems4].[SerialNo]
    AND [PAK_PkgListD].[BOMNo] = [PAK_POBItems4].[BOMNo]
    AND [PAK_PkgListD].[ItemNo] = [PAK_POBItems4].[ItemNo]
  INNER JOIN [PAK_POBOM] AS [PAK_POBOM5]
    ON [PAK_PkgListD].[SerialNo] = [PAK_POBOM5].[SerialNo]
    AND [PAK_PkgListD].[BOMNo] = [PAK_POBOM5].[BOMNo]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units6]
    ON [PAK_PkgListD].[UOMQuantity] = [PAK_Units6].[UnitID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units7]
    ON [PAK_PkgListD].[UOMWeight] = [PAK_Units7].[UnitID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units8]
    ON [PAK_PkgListD].[UOMPack] = [PAK_Units8].[UnitID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
