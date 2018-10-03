USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSPOBItemsSelectListFilteres]
  @Filter_BOMNo Int,
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
 ,BOMNo Int NOT NULL
 ,ItemNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ', BOMNo'
  SET @LGSQL = @LGSQL + ', ItemNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_POBItems].[SerialNo]'
  SET @LGSQL = @LGSQL + ', [PAK_POBItems].[BOMNo]'
  SET @LGSQL = @LGSQL + ', [PAK_POBItems].[ItemNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_POBItems] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBItems].[AcceptedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBItems].[FreezedBy] = [aspnet_users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Divisions] AS [PAK_Divisions3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBItems].[DivisionID] = [PAK_Divisions3].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Documents] AS [PAK_Documents4]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBItems].[DocumentNo] = [PAK_Documents4].[DocumentNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Elements] AS [PAK_Elements5]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBItems].[ElementID] = [PAK_Elements5].[ElementID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_PO] AS [PAK_PO6]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBItems].[SerialNo] = [PAK_PO6].[SerialNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_POBItems] AS [PAK_POBItems7]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBItems].[SerialNo] = [PAK_POBItems7].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_POBItems].[BOMNo] = [PAK_POBItems7].[BOMNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_POBItems].[ParentItemNo] = [PAK_POBItems7].[ItemNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_POBOM] AS [PAK_POBOM8]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBItems].[SerialNo] = [PAK_POBOM8].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_POBItems].[BOMNo] = [PAK_POBOM8].[BOMNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_POBOMStatus] AS [PAK_POBOMStatus9]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBItems].[StatusID] = [PAK_POBOMStatus9].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units10]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBItems].[UOMQuantity] = [PAK_Units10].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units11]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBItems].[UOMWeight] = [PAK_Units11].[UnitID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_BOMNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_POBItems].[BOMNo] = ' + STR(@Filter_BOMNo)
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_POBItems].[SerialNo] = ' + STR(@Filter_SerialNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[PAK_POBItems].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PAK_POBItems].[SerialNo] DESC'
                        WHEN 'BOMNo' THEN '[PAK_POBItems].[BOMNo]'
                        WHEN 'BOMNo DESC' THEN '[PAK_POBItems].[BOMNo] DESC'
                        WHEN 'ItemNo' THEN '[PAK_POBItems].[ItemNo]'
                        WHEN 'ItemNo DESC' THEN '[PAK_POBItems].[ItemNo] DESC'
                        WHEN 'ItemCode' THEN '[PAK_POBItems].[ItemCode]'
                        WHEN 'ItemCode DESC' THEN '[PAK_POBItems].[ItemCode] DESC'
                        WHEN 'SupplierItemCode' THEN '[PAK_POBItems].[SupplierItemCode]'
                        WHEN 'SupplierItemCode DESC' THEN '[PAK_POBItems].[SupplierItemCode] DESC'
                        WHEN 'ItemDescription' THEN '[PAK_POBItems].[ItemDescription]'
                        WHEN 'ItemDescription DESC' THEN '[PAK_POBItems].[ItemDescription] DESC'
                        WHEN 'DivisionID' THEN '[PAK_POBItems].[DivisionID]'
                        WHEN 'DivisionID DESC' THEN '[PAK_POBItems].[DivisionID] DESC'
                        WHEN 'ElementID' THEN '[PAK_POBItems].[ElementID]'
                        WHEN 'ElementID DESC' THEN '[PAK_POBItems].[ElementID] DESC'
                        WHEN 'UOMQuantity' THEN '[PAK_POBItems].[UOMQuantity]'
                        WHEN 'UOMQuantity DESC' THEN '[PAK_POBItems].[UOMQuantity] DESC'
                        WHEN 'Quantity' THEN '[PAK_POBItems].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[PAK_POBItems].[Quantity] DESC'
                        WHEN 'UOMWeight' THEN '[PAK_POBItems].[UOMWeight]'
                        WHEN 'UOMWeight DESC' THEN '[PAK_POBItems].[UOMWeight] DESC'
                        WHEN 'WeightPerUnit' THEN '[PAK_POBItems].[WeightPerUnit]'
                        WHEN 'WeightPerUnit DESC' THEN '[PAK_POBItems].[WeightPerUnit] DESC'
                        WHEN 'DocumentNo' THEN '[PAK_POBItems].[DocumentNo]'
                        WHEN 'DocumentNo DESC' THEN '[PAK_POBItems].[DocumentNo] DESC'
                        WHEN 'ParentItemNo' THEN '[PAK_POBItems].[ParentItemNo]'
                        WHEN 'ParentItemNo DESC' THEN '[PAK_POBItems].[ParentItemNo] DESC'
                        WHEN 'StatusID' THEN '[PAK_POBItems].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[PAK_POBItems].[StatusID] DESC'
                        WHEN 'ISGECRemarks' THEN '[PAK_POBItems].[ISGECRemarks]'
                        WHEN 'ISGECRemarks DESC' THEN '[PAK_POBItems].[ISGECRemarks] DESC'
                        WHEN 'SupplierRemarks' THEN '[PAK_POBItems].[SupplierRemarks]'
                        WHEN 'SupplierRemarks DESC' THEN '[PAK_POBItems].[SupplierRemarks] DESC'
                        WHEN 'ISGECQuantity' THEN '[PAK_POBItems].[ISGECQuantity]'
                        WHEN 'ISGECQuantity DESC' THEN '[PAK_POBItems].[ISGECQuantity] DESC'
                        WHEN 'ISGECWeightPerUnit' THEN '[PAK_POBItems].[ISGECWeightPerUnit]'
                        WHEN 'ISGECWeightPerUnit DESC' THEN '[PAK_POBItems].[ISGECWeightPerUnit] DESC'
                        WHEN 'SupplierQuantity' THEN '[PAK_POBItems].[SupplierQuantity]'
                        WHEN 'SupplierQuantity DESC' THEN '[PAK_POBItems].[SupplierQuantity] DESC'
                        WHEN 'SupplierWeightPerUnit' THEN '[PAK_POBItems].[SupplierWeightPerUnit]'
                        WHEN 'SupplierWeightPerUnit DESC' THEN '[PAK_POBItems].[SupplierWeightPerUnit] DESC'
                        WHEN 'Accepted' THEN '[PAK_POBItems].[Accepted]'
                        WHEN 'Accepted DESC' THEN '[PAK_POBItems].[Accepted] DESC'
                        WHEN 'AcceptedBy' THEN '[PAK_POBItems].[AcceptedBy]'
                        WHEN 'AcceptedBy DESC' THEN '[PAK_POBItems].[AcceptedBy] DESC'
                        WHEN 'AcceptedOn' THEN '[PAK_POBItems].[AcceptedOn]'
                        WHEN 'AcceptedOn DESC' THEN '[PAK_POBItems].[AcceptedOn] DESC'
                        WHEN 'Freezed' THEN '[PAK_POBItems].[Freezed]'
                        WHEN 'Freezed DESC' THEN '[PAK_POBItems].[Freezed] DESC'
                        WHEN 'FreezedBy' THEN '[PAK_POBItems].[FreezedBy]'
                        WHEN 'FreezedBy DESC' THEN '[PAK_POBItems].[FreezedBy] DESC'
                        WHEN 'FreezedOn' THEN '[PAK_POBItems].[FreezedOn]'
                        WHEN 'FreezedOn DESC' THEN '[PAK_POBItems].[FreezedOn] DESC'
                        WHEN 'Changed' THEN '[PAK_POBItems].[Changed]'
                        WHEN 'Changed DESC' THEN '[PAK_POBItems].[Changed] DESC'
                        WHEN 'CreatedBySupplier' THEN '[PAK_POBItems].[CreatedBySupplier]'
                        WHEN 'CreatedBySupplier DESC' THEN '[PAK_POBItems].[CreatedBySupplier] DESC'
                        WHEN 'ChangedBySupplier' THEN '[PAK_POBItems].[ChangedBySupplier]'
                        WHEN 'ChangedBySupplier DESC' THEN '[PAK_POBItems].[ChangedBySupplier] DESC'
                        WHEN 'AcceptedBySupplier' THEN '[PAK_POBItems].[AcceptedBySupplier]'
                        WHEN 'AcceptedBySupplier DESC' THEN '[PAK_POBItems].[AcceptedBySupplier] DESC'
                        WHEN 'FreezedBySupplier' THEN '[PAK_POBItems].[FreezedBySupplier]'
                        WHEN 'FreezedBySupplier DESC' THEN '[PAK_POBItems].[FreezedBySupplier] DESC'
                        WHEN 'Active' THEN '[PAK_POBItems].[Active]'
                        WHEN 'Active DESC' THEN '[PAK_POBItems].[Active] DESC'
                        WHEN 'Root' THEN '[PAK_POBItems].[Root]'
                        WHEN 'Root DESC' THEN '[PAK_POBItems].[Root] DESC'
                        WHEN 'Middle' THEN '[PAK_POBItems].[Middle]'
                        WHEN 'Middle DESC' THEN '[PAK_POBItems].[Middle] DESC'
                        WHEN 'Bottom' THEN '[PAK_POBItems].[Bottom]'
                        WHEN 'Bottom DESC' THEN '[PAK_POBItems].[Bottom] DESC'
                        WHEN 'Free' THEN '[PAK_POBItems].[Free]'
                        WHEN 'Free DESC' THEN '[PAK_POBItems].[Free] DESC'
                        WHEN 'ItemLevel' THEN '[PAK_POBItems].[ItemLevel]'
                        WHEN 'ItemLevel DESC' THEN '[PAK_POBItems].[ItemLevel] DESC'
                        WHEN 'Prefix' THEN '[PAK_POBItems].[Prefix]'
                        WHEN 'Prefix DESC' THEN '[PAK_POBItems].[Prefix] DESC'
                        WHEN 'QuantityToPack' THEN '[PAK_POBItems].[QuantityToPack]'
                        WHEN 'QuantityToPack DESC' THEN '[PAK_POBItems].[QuantityToPack] DESC'
                        WHEN 'TotalWeightToPack' THEN '[PAK_POBItems].[TotalWeightToPack]'
                        WHEN 'TotalWeightToPack DESC' THEN '[PAK_POBItems].[TotalWeightToPack] DESC'
                        WHEN 'QuantityToDespatch' THEN '[PAK_POBItems].[QuantityToDespatch]'
                        WHEN 'QuantityToDespatch DESC' THEN '[PAK_POBItems].[QuantityToDespatch] DESC'
                        WHEN 'TotalWeightToDespatch' THEN '[PAK_POBItems].[TotalWeightToDespatch]'
                        WHEN 'TotalWeightToDespatch DESC' THEN '[PAK_POBItems].[TotalWeightToDespatch] DESC'
                        WHEN 'QuantityDespatched' THEN '[PAK_POBItems].[QuantityDespatched]'
                        WHEN 'QuantityDespatched DESC' THEN '[PAK_POBItems].[QuantityDespatched] DESC'
                        WHEN 'TotalWeightDespatched' THEN '[PAK_POBItems].[TotalWeightDespatched]'
                        WHEN 'TotalWeightDespatched DESC' THEN '[PAK_POBItems].[TotalWeightDespatched] DESC'
                        WHEN 'QuantityReceived' THEN '[PAK_POBItems].[QuantityReceived]'
                        WHEN 'QuantityReceived DESC' THEN '[PAK_POBItems].[QuantityReceived] DESC'
                        WHEN 'TotalWeightReceived' THEN '[PAK_POBItems].[TotalWeightReceived]'
                        WHEN 'TotalWeightReceived DESC' THEN '[PAK_POBItems].[TotalWeightReceived] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'PAK_Divisions3_Description' THEN '[PAK_Divisions3].[Description]'
                        WHEN 'PAK_Divisions3_Description DESC' THEN '[PAK_Divisions3].[Description] DESC'
                        WHEN 'PAK_Documents4_cmba' THEN '[PAK_Documents4].[cmba]'
                        WHEN 'PAK_Documents4_cmba DESC' THEN '[PAK_Documents4].[cmba] DESC'
                        WHEN 'PAK_Elements5_Description' THEN '[PAK_Elements5].[Description]'
                        WHEN 'PAK_Elements5_Description DESC' THEN '[PAK_Elements5].[Description] DESC'
                        WHEN 'PAK_PO6_PODescription' THEN '[PAK_PO6].[PODescription]'
                        WHEN 'PAK_PO6_PODescription DESC' THEN '[PAK_PO6].[PODescription] DESC'
                        WHEN 'PAK_POBItems7_ItemDescription' THEN '[PAK_POBItems7].[ItemDescription]'
                        WHEN 'PAK_POBItems7_ItemDescription DESC' THEN '[PAK_POBItems7].[ItemDescription] DESC'
                        WHEN 'PAK_POBOM8_ItemDescription' THEN '[PAK_POBOM8].[ItemDescription]'
                        WHEN 'PAK_POBOM8_ItemDescription DESC' THEN '[PAK_POBOM8].[ItemDescription] DESC'
                        WHEN 'PAK_POBOMStatus9_Description' THEN '[PAK_POBOMStatus9].[Description]'
                        WHEN 'PAK_POBOMStatus9_Description DESC' THEN '[PAK_POBOMStatus9].[Description] DESC'
                        WHEN 'PAK_Units10_Description' THEN '[PAK_Units10].[Description]'
                        WHEN 'PAK_Units10_Description DESC' THEN '[PAK_Units10].[Description] DESC'
                        WHEN 'PAK_Units11_Description' THEN '[PAK_Units11].[Description]'
                        WHEN 'PAK_Units11_Description DESC' THEN '[PAK_Units11].[Description] DESC'
                        ELSE '[PAK_POBItems].[SerialNo],[PAK_POBItems].[BOMNo],[PAK_POBItems].[ItemNo]'
                    END
  EXEC (@LGSQL)

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
