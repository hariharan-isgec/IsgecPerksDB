USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBItemsSelectListSearch]
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
 ,BOMNo Int NOT NULL
 ,ItemNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo, BOMNo, ItemNo)
  SELECT [PAK_POBItems].[SerialNo], [PAK_POBItems].[BOMNo], [PAK_POBItems].[ItemNo] FROM [PAK_POBItems]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_POBItems].[AcceptedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [PAK_POBItems].[FreezedBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [PAK_Divisions] AS [PAK_Divisions3]
    ON [PAK_POBItems].[DivisionID] = [PAK_Divisions3].[DivisionID]
  LEFT OUTER JOIN [PAK_Documents] AS [PAK_Documents4]
    ON [PAK_POBItems].[DocumentNo] = [PAK_Documents4].[DocumentNo]
  LEFT OUTER JOIN [PAK_Elements] AS [PAK_Elements5]
    ON [PAK_POBItems].[ElementID] = [PAK_Elements5].[ElementID]
  INNER JOIN [PAK_PO] AS [PAK_PO6]
    ON [PAK_POBItems].[SerialNo] = [PAK_PO6].[SerialNo]
  LEFT OUTER JOIN [PAK_POBItems] AS [PAK_POBItems7]
    ON [PAK_POBItems].[SerialNo] = [PAK_POBItems7].[SerialNo]
    AND [PAK_POBItems].[BOMNo] = [PAK_POBItems7].[BOMNo]
    AND [PAK_POBItems].[ParentItemNo] = [PAK_POBItems7].[ItemNo]
  INNER JOIN [PAK_POBOM] AS [PAK_POBOM8]
    ON [PAK_POBItems].[SerialNo] = [PAK_POBOM8].[SerialNo]
    AND [PAK_POBItems].[BOMNo] = [PAK_POBOM8].[BOMNo]
  LEFT OUTER JOIN [PAK_POBOMStatus] AS [PAK_POBOMStatus9]
    ON [PAK_POBItems].[StatusID] = [PAK_POBOMStatus9].[StatusID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units10]
    ON [PAK_POBItems].[UOMQuantity] = [PAK_Units10].[UnitID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units11]
    ON [PAK_POBItems].[UOMWeight] = [PAK_Units11].[UnitID]
 WHERE  
   ( 
         STR(ISNULL([PAK_POBItems].[ItemNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBItems].[ItemCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBItems].[ItemDescription],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBItems].[ElementID],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[Quantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[WeightPerUnit], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[StatusID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[QuantityDespatched], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[TotalWeightToDespatch], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[TotalWeightDespatched], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[TotalWeightReceived], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[QuantityReceived], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBItems].[Prefix],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[ItemLevel], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[QuantityToPack], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[QuantityToDespatch], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[TotalWeightToPack], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[DocumentNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[UOMWeight], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[ParentItemNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBItems].[SupplierRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBItems].[ISGECRemarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[BOMNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBItems].[SupplierItemCode],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[UOMQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[DivisionID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBItems].[AcceptedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBItems].[FreezedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[ISGECWeightPerUnit], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[ISGECQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[SupplierQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBItems].[SupplierWeightPerUnit], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [PAK_POBItems].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [PAK_POBItems].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'BOMNo' THEN [PAK_POBItems].[BOMNo] END,
     CASE @OrderBy WHEN 'BOMNo DESC' THEN [PAK_POBItems].[BOMNo] END DESC,
     CASE @OrderBy WHEN 'ItemNo' THEN [PAK_POBItems].[ItemNo] END,
     CASE @OrderBy WHEN 'ItemNo DESC' THEN [PAK_POBItems].[ItemNo] END DESC,
     CASE @OrderBy WHEN 'ItemCode' THEN [PAK_POBItems].[ItemCode] END,
     CASE @OrderBy WHEN 'ItemCode DESC' THEN [PAK_POBItems].[ItemCode] END DESC,
     CASE @OrderBy WHEN 'SupplierItemCode' THEN [PAK_POBItems].[SupplierItemCode] END,
     CASE @OrderBy WHEN 'SupplierItemCode DESC' THEN [PAK_POBItems].[SupplierItemCode] END DESC,
     CASE @OrderBy WHEN 'ItemDescription' THEN [PAK_POBItems].[ItemDescription] END,
     CASE @OrderBy WHEN 'ItemDescription DESC' THEN [PAK_POBItems].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'DivisionID' THEN [PAK_POBItems].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [PAK_POBItems].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'ElementID' THEN [PAK_POBItems].[ElementID] END,
     CASE @OrderBy WHEN 'ElementID DESC' THEN [PAK_POBItems].[ElementID] END DESC,
     CASE @OrderBy WHEN 'UOMQuantity' THEN [PAK_POBItems].[UOMQuantity] END,
     CASE @OrderBy WHEN 'UOMQuantity DESC' THEN [PAK_POBItems].[UOMQuantity] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [PAK_POBItems].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [PAK_POBItems].[Quantity] END DESC,
     CASE @OrderBy WHEN 'UOMWeight' THEN [PAK_POBItems].[UOMWeight] END,
     CASE @OrderBy WHEN 'UOMWeight DESC' THEN [PAK_POBItems].[UOMWeight] END DESC,
     CASE @OrderBy WHEN 'WeightPerUnit' THEN [PAK_POBItems].[WeightPerUnit] END,
     CASE @OrderBy WHEN 'WeightPerUnit DESC' THEN [PAK_POBItems].[WeightPerUnit] END DESC,
     CASE @OrderBy WHEN 'DocumentNo' THEN [PAK_POBItems].[DocumentNo] END,
     CASE @OrderBy WHEN 'DocumentNo DESC' THEN [PAK_POBItems].[DocumentNo] END DESC,
     CASE @OrderBy WHEN 'ParentItemNo' THEN [PAK_POBItems].[ParentItemNo] END,
     CASE @OrderBy WHEN 'ParentItemNo DESC' THEN [PAK_POBItems].[ParentItemNo] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [PAK_POBItems].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [PAK_POBItems].[StatusID] END DESC,
     CASE @OrderBy WHEN 'ISGECRemarks' THEN [PAK_POBItems].[ISGECRemarks] END,
     CASE @OrderBy WHEN 'ISGECRemarks DESC' THEN [PAK_POBItems].[ISGECRemarks] END DESC,
     CASE @OrderBy WHEN 'SupplierRemarks' THEN [PAK_POBItems].[SupplierRemarks] END,
     CASE @OrderBy WHEN 'SupplierRemarks DESC' THEN [PAK_POBItems].[SupplierRemarks] END DESC,
     CASE @OrderBy WHEN 'ISGECQuantity' THEN [PAK_POBItems].[ISGECQuantity] END,
     CASE @OrderBy WHEN 'ISGECQuantity DESC' THEN [PAK_POBItems].[ISGECQuantity] END DESC,
     CASE @OrderBy WHEN 'ISGECWeightPerUnit' THEN [PAK_POBItems].[ISGECWeightPerUnit] END,
     CASE @OrderBy WHEN 'ISGECWeightPerUnit DESC' THEN [PAK_POBItems].[ISGECWeightPerUnit] END DESC,
     CASE @OrderBy WHEN 'SupplierQuantity' THEN [PAK_POBItems].[SupplierQuantity] END,
     CASE @OrderBy WHEN 'SupplierQuantity DESC' THEN [PAK_POBItems].[SupplierQuantity] END DESC,
     CASE @OrderBy WHEN 'SupplierWeightPerUnit' THEN [PAK_POBItems].[SupplierWeightPerUnit] END,
     CASE @OrderBy WHEN 'SupplierWeightPerUnit DESC' THEN [PAK_POBItems].[SupplierWeightPerUnit] END DESC,
     CASE @OrderBy WHEN 'Accepted' THEN [PAK_POBItems].[Accepted] END,
     CASE @OrderBy WHEN 'Accepted DESC' THEN [PAK_POBItems].[Accepted] END DESC,
     CASE @OrderBy WHEN 'AcceptedBy' THEN [PAK_POBItems].[AcceptedBy] END,
     CASE @OrderBy WHEN 'AcceptedBy DESC' THEN [PAK_POBItems].[AcceptedBy] END DESC,
     CASE @OrderBy WHEN 'AcceptedOn' THEN [PAK_POBItems].[AcceptedOn] END,
     CASE @OrderBy WHEN 'AcceptedOn DESC' THEN [PAK_POBItems].[AcceptedOn] END DESC,
     CASE @OrderBy WHEN 'Freezed' THEN [PAK_POBItems].[Freezed] END,
     CASE @OrderBy WHEN 'Freezed DESC' THEN [PAK_POBItems].[Freezed] END DESC,
     CASE @OrderBy WHEN 'FreezedBy' THEN [PAK_POBItems].[FreezedBy] END,
     CASE @OrderBy WHEN 'FreezedBy DESC' THEN [PAK_POBItems].[FreezedBy] END DESC,
     CASE @OrderBy WHEN 'FreezedOn' THEN [PAK_POBItems].[FreezedOn] END,
     CASE @OrderBy WHEN 'FreezedOn DESC' THEN [PAK_POBItems].[FreezedOn] END DESC,
     CASE @OrderBy WHEN 'Changed' THEN [PAK_POBItems].[Changed] END,
     CASE @OrderBy WHEN 'Changed DESC' THEN [PAK_POBItems].[Changed] END DESC,
     CASE @OrderBy WHEN 'CreatedBySupplier' THEN [PAK_POBItems].[CreatedBySupplier] END,
     CASE @OrderBy WHEN 'CreatedBySupplier DESC' THEN [PAK_POBItems].[CreatedBySupplier] END DESC,
     CASE @OrderBy WHEN 'ChangedBySupplier' THEN [PAK_POBItems].[ChangedBySupplier] END,
     CASE @OrderBy WHEN 'ChangedBySupplier DESC' THEN [PAK_POBItems].[ChangedBySupplier] END DESC,
     CASE @OrderBy WHEN 'AcceptedBySupplier' THEN [PAK_POBItems].[AcceptedBySupplier] END,
     CASE @OrderBy WHEN 'AcceptedBySupplier DESC' THEN [PAK_POBItems].[AcceptedBySupplier] END DESC,
     CASE @OrderBy WHEN 'FreezedBySupplier' THEN [PAK_POBItems].[FreezedBySupplier] END,
     CASE @OrderBy WHEN 'FreezedBySupplier DESC' THEN [PAK_POBItems].[FreezedBySupplier] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [PAK_POBItems].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [PAK_POBItems].[Active] END DESC,
     CASE @OrderBy WHEN 'Root' THEN [PAK_POBItems].[Root] END,
     CASE @OrderBy WHEN 'Root DESC' THEN [PAK_POBItems].[Root] END DESC,
     CASE @OrderBy WHEN 'Middle' THEN [PAK_POBItems].[Middle] END,
     CASE @OrderBy WHEN 'Middle DESC' THEN [PAK_POBItems].[Middle] END DESC,
     CASE @OrderBy WHEN 'Bottom' THEN [PAK_POBItems].[Bottom] END,
     CASE @OrderBy WHEN 'Bottom DESC' THEN [PAK_POBItems].[Bottom] END DESC,
     CASE @OrderBy WHEN 'Free' THEN [PAK_POBItems].[Free] END,
     CASE @OrderBy WHEN 'Free DESC' THEN [PAK_POBItems].[Free] END DESC,
     CASE @OrderBy WHEN 'ItemLevel' THEN [PAK_POBItems].[ItemLevel] END,
     CASE @OrderBy WHEN 'ItemLevel DESC' THEN [PAK_POBItems].[ItemLevel] END DESC,
     CASE @OrderBy WHEN 'Prefix' THEN [PAK_POBItems].[Prefix] END,
     CASE @OrderBy WHEN 'Prefix DESC' THEN [PAK_POBItems].[Prefix] END DESC,
     CASE @OrderBy WHEN 'QuantityToPack' THEN [PAK_POBItems].[QuantityToPack] END,
     CASE @OrderBy WHEN 'QuantityToPack DESC' THEN [PAK_POBItems].[QuantityToPack] END DESC,
     CASE @OrderBy WHEN 'TotalWeightToPack' THEN [PAK_POBItems].[TotalWeightToPack] END,
     CASE @OrderBy WHEN 'TotalWeightToPack DESC' THEN [PAK_POBItems].[TotalWeightToPack] END DESC,
     CASE @OrderBy WHEN 'QuantityToDespatch' THEN [PAK_POBItems].[QuantityToDespatch] END,
     CASE @OrderBy WHEN 'QuantityToDespatch DESC' THEN [PAK_POBItems].[QuantityToDespatch] END DESC,
     CASE @OrderBy WHEN 'TotalWeightToDespatch' THEN [PAK_POBItems].[TotalWeightToDespatch] END,
     CASE @OrderBy WHEN 'TotalWeightToDespatch DESC' THEN [PAK_POBItems].[TotalWeightToDespatch] END DESC,
     CASE @OrderBy WHEN 'QuantityDespatched' THEN [PAK_POBItems].[QuantityDespatched] END,
     CASE @OrderBy WHEN 'QuantityDespatched DESC' THEN [PAK_POBItems].[QuantityDespatched] END DESC,
     CASE @OrderBy WHEN 'TotalWeightDespatched' THEN [PAK_POBItems].[TotalWeightDespatched] END,
     CASE @OrderBy WHEN 'TotalWeightDespatched DESC' THEN [PAK_POBItems].[TotalWeightDespatched] END DESC,
     CASE @OrderBy WHEN 'QuantityReceived' THEN [PAK_POBItems].[QuantityReceived] END,
     CASE @OrderBy WHEN 'QuantityReceived DESC' THEN [PAK_POBItems].[QuantityReceived] END DESC,
     CASE @OrderBy WHEN 'TotalWeightReceived' THEN [PAK_POBItems].[TotalWeightReceived] END,
     CASE @OrderBy WHEN 'TotalWeightReceived DESC' THEN [PAK_POBItems].[TotalWeightReceived] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'PAK_Divisions3_Description' THEN [PAK_Divisions3].[Description] END,
     CASE @OrderBy WHEN 'PAK_Divisions3_Description DESC' THEN [PAK_Divisions3].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Documents4_cmba' THEN [PAK_Documents4].[cmba] END,
     CASE @OrderBy WHEN 'PAK_Documents4_cmba DESC' THEN [PAK_Documents4].[cmba] END DESC,
     CASE @OrderBy WHEN 'PAK_Elements5_Description' THEN [PAK_Elements5].[Description] END,
     CASE @OrderBy WHEN 'PAK_Elements5_Description DESC' THEN [PAK_Elements5].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_PO6_PODescription' THEN [PAK_PO6].[PODescription] END,
     CASE @OrderBy WHEN 'PAK_PO6_PODescription DESC' THEN [PAK_PO6].[PODescription] END DESC,
     CASE @OrderBy WHEN 'PAK_POBItems7_ItemDescription' THEN [PAK_POBItems7].[ItemDescription] END,
     CASE @OrderBy WHEN 'PAK_POBItems7_ItemDescription DESC' THEN [PAK_POBItems7].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'PAK_POBOM8_ItemDescription' THEN [PAK_POBOM8].[ItemDescription] END,
     CASE @OrderBy WHEN 'PAK_POBOM8_ItemDescription DESC' THEN [PAK_POBOM8].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'PAK_POBOMStatus9_Description' THEN [PAK_POBOMStatus9].[Description] END,
     CASE @OrderBy WHEN 'PAK_POBOMStatus9_Description DESC' THEN [PAK_POBOMStatus9].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units10_Description' THEN [PAK_Units10].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units10_Description DESC' THEN [PAK_Units10].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units11_Description' THEN [PAK_Units11].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units11_Description DESC' THEN [PAK_Units11].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_POBItems].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [PAK_Divisions3].[Description] AS PAK_Divisions3_Description,
    [PAK_Documents4].[cmba] AS PAK_Documents4_cmba,
    [PAK_Elements5].[Description] AS PAK_Elements5_Description,
    [PAK_PO6].[PODescription] AS PAK_PO6_PODescription,
    [PAK_POBItems7].[ItemDescription] AS PAK_POBItems7_ItemDescription,
    [PAK_POBOM8].[ItemDescription] AS PAK_POBOM8_ItemDescription,
    [PAK_POBOMStatus9].[Description] AS PAK_POBOMStatus9_Description,
    [PAK_Units10].[Description] AS PAK_Units10_Description,
    [PAK_Units11].[Description] AS PAK_Units11_Description 
  FROM [PAK_POBItems] 
      INNER JOIN #PageIndex
          ON [PAK_POBItems].[SerialNo] = #PageIndex.SerialNo
          AND [PAK_POBItems].[BOMNo] = #PageIndex.BOMNo
          AND [PAK_POBItems].[ItemNo] = #PageIndex.ItemNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_POBItems].[AcceptedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [PAK_POBItems].[FreezedBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [PAK_Divisions] AS [PAK_Divisions3]
    ON [PAK_POBItems].[DivisionID] = [PAK_Divisions3].[DivisionID]
  LEFT OUTER JOIN [PAK_Documents] AS [PAK_Documents4]
    ON [PAK_POBItems].[DocumentNo] = [PAK_Documents4].[DocumentNo]
  LEFT OUTER JOIN [PAK_Elements] AS [PAK_Elements5]
    ON [PAK_POBItems].[ElementID] = [PAK_Elements5].[ElementID]
  INNER JOIN [PAK_PO] AS [PAK_PO6]
    ON [PAK_POBItems].[SerialNo] = [PAK_PO6].[SerialNo]
  LEFT OUTER JOIN [PAK_POBItems] AS [PAK_POBItems7]
    ON [PAK_POBItems].[SerialNo] = [PAK_POBItems7].[SerialNo]
    AND [PAK_POBItems].[BOMNo] = [PAK_POBItems7].[BOMNo]
    AND [PAK_POBItems].[ParentItemNo] = [PAK_POBItems7].[ItemNo]
  INNER JOIN [PAK_POBOM] AS [PAK_POBOM8]
    ON [PAK_POBItems].[SerialNo] = [PAK_POBOM8].[SerialNo]
    AND [PAK_POBItems].[BOMNo] = [PAK_POBOM8].[BOMNo]
  LEFT OUTER JOIN [PAK_POBOMStatus] AS [PAK_POBOMStatus9]
    ON [PAK_POBItems].[StatusID] = [PAK_POBOMStatus9].[StatusID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units10]
    ON [PAK_POBItems].[UOMQuantity] = [PAK_Units10].[UnitID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units11]
    ON [PAK_POBItems].[UOMWeight] = [PAK_Units11].[UnitID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
