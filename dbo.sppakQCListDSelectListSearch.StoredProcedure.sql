USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakQCListDSelectListSearch]
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
 ,QCLNo Int NOT NULL
 ,BOMNo Int NOT NULL
 ,ItemNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo, QCLNo, BOMNo, ItemNo)
  SELECT [PAK_QCListD].[SerialNo], [PAK_QCListD].[QCLNo], [PAK_QCListD].[BOMNo], [PAK_QCListD].[ItemNo] FROM [PAK_QCListD]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_QCListD].[ClearedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [PAK_PO] AS [PAK_PO2]
    ON [PAK_QCListD].[SerialNo] = [PAK_PO2].[SerialNo]
  INNER JOIN [PAK_POBItems] AS [PAK_POBItems3]
    ON [PAK_QCListD].[SerialNo] = [PAK_POBItems3].[SerialNo]
    AND [PAK_QCListD].[BOMNo] = [PAK_POBItems3].[BOMNo]
    AND [PAK_QCListD].[ItemNo] = [PAK_POBItems3].[ItemNo]
  INNER JOIN [PAK_POBOM] AS [PAK_POBOM4]
    ON [PAK_QCListD].[SerialNo] = [PAK_POBOM4].[SerialNo]
    AND [PAK_QCListD].[BOMNo] = [PAK_POBOM4].[BOMNo]
  INNER JOIN [PAK_QCListH] AS [PAK_QCListH5]
    ON [PAK_QCListD].[SerialNo] = [PAK_QCListH5].[SerialNo]
    AND [PAK_QCListD].[QCLNo] = [PAK_QCListH5].[QCLNo]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units6]
    ON [PAK_QCListD].[UOMQuantity] = [PAK_Units6].[UnitID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units7]
    ON [PAK_QCListD].[UOMWeight] = [PAK_Units7].[UnitID]
 WHERE  
   ( 
         STR(ISNULL([PAK_QCListD].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_QCListD].[QCLNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_QCListD].[BOMNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_QCListD].[ItemNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_QCListD].[UOMQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_QCListD].[Quantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_QCListD].[UOMWeight], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_QCListD].[WeightPerUnit], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_QCListD].[QualityClearedQty], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_QCListD].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_QCListD].[ClearedBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [PAK_QCListD].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [PAK_QCListD].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'QCLNo' THEN [PAK_QCListD].[QCLNo] END,
     CASE @OrderBy WHEN 'QCLNo DESC' THEN [PAK_QCListD].[QCLNo] END DESC,
     CASE @OrderBy WHEN 'BOMNo' THEN [PAK_QCListD].[BOMNo] END,
     CASE @OrderBy WHEN 'BOMNo DESC' THEN [PAK_QCListD].[BOMNo] END DESC,
     CASE @OrderBy WHEN 'ItemNo' THEN [PAK_QCListD].[ItemNo] END,
     CASE @OrderBy WHEN 'ItemNo DESC' THEN [PAK_QCListD].[ItemNo] END DESC,
     CASE @OrderBy WHEN 'UOMQuantity' THEN [PAK_QCListD].[UOMQuantity] END,
     CASE @OrderBy WHEN 'UOMQuantity DESC' THEN [PAK_QCListD].[UOMQuantity] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [PAK_QCListD].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [PAK_QCListD].[Quantity] END DESC,
     CASE @OrderBy WHEN 'UOMWeight' THEN [PAK_QCListD].[UOMWeight] END,
     CASE @OrderBy WHEN 'UOMWeight DESC' THEN [PAK_QCListD].[UOMWeight] END DESC,
     CASE @OrderBy WHEN 'WeightPerUnit' THEN [PAK_QCListD].[WeightPerUnit] END,
     CASE @OrderBy WHEN 'WeightPerUnit DESC' THEN [PAK_QCListD].[WeightPerUnit] END DESC,
     CASE @OrderBy WHEN 'QualityClearedQty' THEN [PAK_QCListD].[QualityClearedQty] END,
     CASE @OrderBy WHEN 'QualityClearedQty DESC' THEN [PAK_QCListD].[QualityClearedQty] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [PAK_QCListD].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [PAK_QCListD].[Remarks] END DESC,
     CASE @OrderBy WHEN 'ClearedBy' THEN [PAK_QCListD].[ClearedBy] END,
     CASE @OrderBy WHEN 'ClearedBy DESC' THEN [PAK_QCListD].[ClearedBy] END DESC,
     CASE @OrderBy WHEN 'ClearedOn' THEN [PAK_QCListD].[ClearedOn] END,
     CASE @OrderBy WHEN 'ClearedOn DESC' THEN [PAK_QCListD].[ClearedOn] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'PAK_PO2_PODescription' THEN [PAK_PO2].[PODescription] END,
     CASE @OrderBy WHEN 'PAK_PO2_PODescription DESC' THEN [PAK_PO2].[PODescription] END DESC,
     CASE @OrderBy WHEN 'PAK_POBItems3_ItemDescription' THEN [PAK_POBItems3].[ItemDescription] END,
     CASE @OrderBy WHEN 'PAK_POBItems3_ItemDescription DESC' THEN [PAK_POBItems3].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'PAK_POBOM4_ItemDescription' THEN [PAK_POBOM4].[ItemDescription] END,
     CASE @OrderBy WHEN 'PAK_POBOM4_ItemDescription DESC' THEN [PAK_POBOM4].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'PAK_QCListH5_SupplierRef' THEN [PAK_QCListH5].[SupplierRef] END,
     CASE @OrderBy WHEN 'PAK_QCListH5_SupplierRef DESC' THEN [PAK_QCListH5].[SupplierRef] END DESC,
     CASE @OrderBy WHEN 'PAK_Units6_Description' THEN [PAK_Units6].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units6_Description DESC' THEN [PAK_Units6].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units7_Description' THEN [PAK_Units7].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units7_Description DESC' THEN [PAK_Units7].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_QCListD].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [PAK_PO2].[PODescription] AS PAK_PO2_PODescription,
    [PAK_POBItems3].[ItemDescription] AS PAK_POBItems3_ItemDescription,
    [PAK_POBOM4].[ItemDescription] AS PAK_POBOM4_ItemDescription,
    [PAK_QCListH5].[SupplierRef] AS PAK_QCListH5_SupplierRef,
    [PAK_Units6].[Description] AS PAK_Units6_Description,
    [PAK_Units7].[Description] AS PAK_Units7_Description 
  FROM [PAK_QCListD] 
      INNER JOIN #PageIndex
          ON [PAK_QCListD].[SerialNo] = #PageIndex.SerialNo
          AND [PAK_QCListD].[QCLNo] = #PageIndex.QCLNo
          AND [PAK_QCListD].[BOMNo] = #PageIndex.BOMNo
          AND [PAK_QCListD].[ItemNo] = #PageIndex.ItemNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_QCListD].[ClearedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [PAK_PO] AS [PAK_PO2]
    ON [PAK_QCListD].[SerialNo] = [PAK_PO2].[SerialNo]
  INNER JOIN [PAK_POBItems] AS [PAK_POBItems3]
    ON [PAK_QCListD].[SerialNo] = [PAK_POBItems3].[SerialNo]
    AND [PAK_QCListD].[BOMNo] = [PAK_POBItems3].[BOMNo]
    AND [PAK_QCListD].[ItemNo] = [PAK_POBItems3].[ItemNo]
  INNER JOIN [PAK_POBOM] AS [PAK_POBOM4]
    ON [PAK_QCListD].[SerialNo] = [PAK_POBOM4].[SerialNo]
    AND [PAK_QCListD].[BOMNo] = [PAK_POBOM4].[BOMNo]
  INNER JOIN [PAK_QCListH] AS [PAK_QCListH5]
    ON [PAK_QCListD].[SerialNo] = [PAK_QCListH5].[SerialNo]
    AND [PAK_QCListD].[QCLNo] = [PAK_QCListH5].[QCLNo]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units6]
    ON [PAK_QCListD].[UOMQuantity] = [PAK_Units6].[UnitID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units7]
    ON [PAK_QCListD].[UOMWeight] = [PAK_Units7].[UnitID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
