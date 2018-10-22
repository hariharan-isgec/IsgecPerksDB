USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sppak_LG_DPendingSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
 ,PkgNo Int NOT NULL
 ,BOMNo Int NOT NULL
 ,ItemNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo, PkgNo, BOMNo, ItemNo)
  SELECT [PAK_PkgListD].[SerialNo], [PAK_PkgListD].[PkgNo], [PAK_PkgListD].[BOMNo], [PAK_PkgListD].[ItemNo] FROM [PAK_PkgListD]
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
   ( 
         STR(ISNULL([PAK_PkgListD].[ItemNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListD].[UOMQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListD].[Quantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListD].[UOMWeight], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListD].[WeightPerUnit], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListD].[UOMPack], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListD].[PackHeight], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PkgListD].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListD].[QuantityReceived], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListD].[TotalWeightReceived], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListD].[QuantityBalance], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListD].[TotalWeightBalance], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListD].[BOMNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListD].[PkgNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListD].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListD].[PackTypeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListD].[PackWidth], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListD].[PackLength], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PkgListD].[PackingMark],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [PAK_PkgListD].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [PAK_PkgListD].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'PkgNo' THEN [PAK_PkgListD].[PkgNo] END,
     CASE @OrderBy WHEN 'PkgNo DESC' THEN [PAK_PkgListD].[PkgNo] END DESC,
     CASE @OrderBy WHEN 'BOMNo' THEN [PAK_PkgListD].[BOMNo] END,
     CASE @OrderBy WHEN 'BOMNo DESC' THEN [PAK_PkgListD].[BOMNo] END DESC,
     CASE @OrderBy WHEN 'ItemNo' THEN [PAK_PkgListD].[ItemNo] END,
     CASE @OrderBy WHEN 'ItemNo DESC' THEN [PAK_PkgListD].[ItemNo] END DESC,
     CASE @OrderBy WHEN 'UOMQuantity' THEN [PAK_PkgListD].[UOMQuantity] END,
     CASE @OrderBy WHEN 'UOMQuantity DESC' THEN [PAK_PkgListD].[UOMQuantity] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [PAK_PkgListD].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [PAK_PkgListD].[Quantity] END DESC,
     CASE @OrderBy WHEN 'UOMWeight' THEN [PAK_PkgListD].[UOMWeight] END,
     CASE @OrderBy WHEN 'UOMWeight DESC' THEN [PAK_PkgListD].[UOMWeight] END DESC,
     CASE @OrderBy WHEN 'WeightPerUnit' THEN [PAK_PkgListD].[WeightPerUnit] END,
     CASE @OrderBy WHEN 'WeightPerUnit DESC' THEN [PAK_PkgListD].[WeightPerUnit] END DESC,
     CASE @OrderBy WHEN 'PackTypeID' THEN [PAK_PkgListD].[PackTypeID] END,
     CASE @OrderBy WHEN 'PackTypeID DESC' THEN [PAK_PkgListD].[PackTypeID] END DESC,
     CASE @OrderBy WHEN 'PackingMark' THEN [PAK_PkgListD].[PackingMark] END,
     CASE @OrderBy WHEN 'PackingMark DESC' THEN [PAK_PkgListD].[PackingMark] END DESC,
     CASE @OrderBy WHEN 'PackLength' THEN [PAK_PkgListD].[PackLength] END,
     CASE @OrderBy WHEN 'PackLength DESC' THEN [PAK_PkgListD].[PackLength] END DESC,
     CASE @OrderBy WHEN 'PackWidth' THEN [PAK_PkgListD].[PackWidth] END,
     CASE @OrderBy WHEN 'PackWidth DESC' THEN [PAK_PkgListD].[PackWidth] END DESC,
     CASE @OrderBy WHEN 'PackHeight' THEN [PAK_PkgListD].[PackHeight] END,
     CASE @OrderBy WHEN 'PackHeight DESC' THEN [PAK_PkgListD].[PackHeight] END DESC,
     CASE @OrderBy WHEN 'UOMPack' THEN [PAK_PkgListD].[UOMPack] END,
     CASE @OrderBy WHEN 'UOMPack DESC' THEN [PAK_PkgListD].[UOMPack] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [PAK_PkgListD].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [PAK_PkgListD].[Remarks] END DESC,
     CASE @OrderBy WHEN 'QuantityReceived' THEN [PAK_PkgListD].[QuantityReceived] END,
     CASE @OrderBy WHEN 'QuantityReceived DESC' THEN [PAK_PkgListD].[QuantityReceived] END DESC,
     CASE @OrderBy WHEN 'QuantityBalance' THEN [PAK_PkgListD].[QuantityBalance] END,
     CASE @OrderBy WHEN 'QuantityBalance DESC' THEN [PAK_PkgListD].[QuantityBalance] END DESC,
     CASE @OrderBy WHEN 'TotalWeightReceived' THEN [PAK_PkgListD].[TotalWeightReceived] END,
     CASE @OrderBy WHEN 'TotalWeightReceived DESC' THEN [PAK_PkgListD].[TotalWeightReceived] END DESC,
     CASE @OrderBy WHEN 'TotalWeightBalance' THEN [PAK_PkgListD].[TotalWeightBalance] END,
     CASE @OrderBy WHEN 'TotalWeightBalance DESC' THEN [PAK_PkgListD].[TotalWeightBalance] END DESC,
     CASE @OrderBy WHEN 'PAK_PakTypes1_Description' THEN [PAK_PakTypes1].[Description] END,
     CASE @OrderBy WHEN 'PAK_PakTypes1_Description DESC' THEN [PAK_PakTypes1].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_PkgListH2_SupplierRefNo' THEN [PAK_PkgListH2].[SupplierRefNo] END,
     CASE @OrderBy WHEN 'PAK_PkgListH2_SupplierRefNo DESC' THEN [PAK_PkgListH2].[SupplierRefNo] END DESC,
     CASE @OrderBy WHEN 'PAK_PO3_PODescription' THEN [PAK_PO3].[PODescription] END,
     CASE @OrderBy WHEN 'PAK_PO3_PODescription DESC' THEN [PAK_PO3].[PODescription] END DESC,
     CASE @OrderBy WHEN 'PAK_POBItems4_ItemDescription' THEN [PAK_POBItems4].[ItemDescription] END,
     CASE @OrderBy WHEN 'PAK_POBItems4_ItemDescription DESC' THEN [PAK_POBItems4].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'PAK_POBOM5_ItemDescription' THEN [PAK_POBOM5].[ItemDescription] END,
     CASE @OrderBy WHEN 'PAK_POBOM5_ItemDescription DESC' THEN [PAK_POBOM5].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'PAK_Units6_Description' THEN [PAK_Units6].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units6_Description DESC' THEN [PAK_Units6].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units7_Description' THEN [PAK_Units7].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units7_Description DESC' THEN [PAK_Units7].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units8_Description' THEN [PAK_Units8].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units8_Description DESC' THEN [PAK_Units8].[Description] END DESC 

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
