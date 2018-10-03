USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSPOBOMSelectListFilteres]
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
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ', BOMNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_POBOM].[SerialNo]'
  SET @LGSQL = @LGSQL + ', [PAK_POBOM].[BOMNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_POBOM] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBOM].[AcceptedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBOM].[FreezedBy] = [aspnet_users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Divisions] AS [PAK_Divisions3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBOM].[DivisionID] = [PAK_Divisions3].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Documents] AS [PAK_Documents4]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBOM].[DocumentNo] = [PAK_Documents4].[DocumentNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Elements] AS [PAK_Elements5]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBOM].[ElementID] = [PAK_Elements5].[ElementID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_PO] AS [PAK_PO6]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBOM].[SerialNo] = [PAK_PO6].[SerialNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_POBOMStatus] AS [PAK_POBOMStatus7]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBOM].[StatusID] = [PAK_POBOMStatus7].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units8]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBOM].[UOMQuantity] = [PAK_Units8].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units9]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBOM].[UOMWeight] = [PAK_Units9].[UnitID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_POBOM].[SerialNo] = ' + STR(@Filter_SerialNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[PAK_POBOM].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PAK_POBOM].[SerialNo] DESC'
                        WHEN 'BOMNo' THEN '[PAK_POBOM].[BOMNo]'
                        WHEN 'BOMNo DESC' THEN '[PAK_POBOM].[BOMNo] DESC'
                        WHEN 'ItemCode' THEN '[PAK_POBOM].[ItemCode]'
                        WHEN 'ItemCode DESC' THEN '[PAK_POBOM].[ItemCode] DESC'
                        WHEN 'SupplierItemCode' THEN '[PAK_POBOM].[SupplierItemCode]'
                        WHEN 'SupplierItemCode DESC' THEN '[PAK_POBOM].[SupplierItemCode] DESC'
                        WHEN 'DivisionID' THEN '[PAK_POBOM].[DivisionID]'
                        WHEN 'DivisionID DESC' THEN '[PAK_POBOM].[DivisionID] DESC'
                        WHEN 'UOMQuantity' THEN '[PAK_POBOM].[UOMQuantity]'
                        WHEN 'UOMQuantity DESC' THEN '[PAK_POBOM].[UOMQuantity] DESC'
                        WHEN 'Quantity' THEN '[PAK_POBOM].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[PAK_POBOM].[Quantity] DESC'
                        WHEN 'UOMWeight' THEN '[PAK_POBOM].[UOMWeight]'
                        WHEN 'UOMWeight DESC' THEN '[PAK_POBOM].[UOMWeight] DESC'
                        WHEN 'WeightPerUnit' THEN '[PAK_POBOM].[WeightPerUnit]'
                        WHEN 'WeightPerUnit DESC' THEN '[PAK_POBOM].[WeightPerUnit] DESC'
                        WHEN 'DocumentNo' THEN '[PAK_POBOM].[DocumentNo]'
                        WHEN 'DocumentNo DESC' THEN '[PAK_POBOM].[DocumentNo] DESC'
                        WHEN 'ParentItemNo' THEN '[PAK_POBOM].[ParentItemNo]'
                        WHEN 'ParentItemNo DESC' THEN '[PAK_POBOM].[ParentItemNo] DESC'
                        WHEN 'ISGECQuantity' THEN '[PAK_POBOM].[ISGECQuantity]'
                        WHEN 'ISGECQuantity DESC' THEN '[PAK_POBOM].[ISGECQuantity] DESC'
                        WHEN 'ISGECWeightPerUnit' THEN '[PAK_POBOM].[ISGECWeightPerUnit]'
                        WHEN 'ISGECWeightPerUnit DESC' THEN '[PAK_POBOM].[ISGECWeightPerUnit] DESC'
                        WHEN 'SupplierQuantity' THEN '[PAK_POBOM].[SupplierQuantity]'
                        WHEN 'SupplierQuantity DESC' THEN '[PAK_POBOM].[SupplierQuantity] DESC'
                        WHEN 'SupplierWeightPerUnit' THEN '[PAK_POBOM].[SupplierWeightPerUnit]'
                        WHEN 'SupplierWeightPerUnit DESC' THEN '[PAK_POBOM].[SupplierWeightPerUnit] DESC'
                        WHEN 'Accepted' THEN '[PAK_POBOM].[Accepted]'
                        WHEN 'Accepted DESC' THEN '[PAK_POBOM].[Accepted] DESC'
                        WHEN 'AcceptedBy' THEN '[PAK_POBOM].[AcceptedBy]'
                        WHEN 'AcceptedBy DESC' THEN '[PAK_POBOM].[AcceptedBy] DESC'
                        WHEN 'AcceptedOn' THEN '[PAK_POBOM].[AcceptedOn]'
                        WHEN 'AcceptedOn DESC' THEN '[PAK_POBOM].[AcceptedOn] DESC'
                        WHEN 'Freezed' THEN '[PAK_POBOM].[Freezed]'
                        WHEN 'Freezed DESC' THEN '[PAK_POBOM].[Freezed] DESC'
                        WHEN 'FreezedBy' THEN '[PAK_POBOM].[FreezedBy]'
                        WHEN 'FreezedBy DESC' THEN '[PAK_POBOM].[FreezedBy] DESC'
                        WHEN 'FreezedOn' THEN '[PAK_POBOM].[FreezedOn]'
                        WHEN 'FreezedOn DESC' THEN '[PAK_POBOM].[FreezedOn] DESC'
                        WHEN 'Changed' THEN '[PAK_POBOM].[Changed]'
                        WHEN 'Changed DESC' THEN '[PAK_POBOM].[Changed] DESC'
                        WHEN 'CreatedBySupplier' THEN '[PAK_POBOM].[CreatedBySupplier]'
                        WHEN 'CreatedBySupplier DESC' THEN '[PAK_POBOM].[CreatedBySupplier] DESC'
                        WHEN 'ChangedBySupplier' THEN '[PAK_POBOM].[ChangedBySupplier]'
                        WHEN 'ChangedBySupplier DESC' THEN '[PAK_POBOM].[ChangedBySupplier] DESC'
                        WHEN 'AcceptedBySupplier' THEN '[PAK_POBOM].[AcceptedBySupplier]'
                        WHEN 'AcceptedBySupplier DESC' THEN '[PAK_POBOM].[AcceptedBySupplier] DESC'
                        WHEN 'FreezedBySupplier' THEN '[PAK_POBOM].[FreezedBySupplier]'
                        WHEN 'FreezedBySupplier DESC' THEN '[PAK_POBOM].[FreezedBySupplier] DESC'
                        WHEN 'Active' THEN '[PAK_POBOM].[Active]'
                        WHEN 'Active DESC' THEN '[PAK_POBOM].[Active] DESC'
                        WHEN 'Root' THEN '[PAK_POBOM].[Root]'
                        WHEN 'Root DESC' THEN '[PAK_POBOM].[Root] DESC'
                        WHEN 'Middle' THEN '[PAK_POBOM].[Middle]'
                        WHEN 'Middle DESC' THEN '[PAK_POBOM].[Middle] DESC'
                        WHEN 'Bottom' THEN '[PAK_POBOM].[Bottom]'
                        WHEN 'Bottom DESC' THEN '[PAK_POBOM].[Bottom] DESC'
                        WHEN 'Free' THEN '[PAK_POBOM].[Free]'
                        WHEN 'Free DESC' THEN '[PAK_POBOM].[Free] DESC'
                        WHEN 'ItemLevel' THEN '[PAK_POBOM].[ItemLevel]'
                        WHEN 'ItemLevel DESC' THEN '[PAK_POBOM].[ItemLevel] DESC'
                        WHEN 'Prefix' THEN '[PAK_POBOM].[Prefix]'
                        WHEN 'Prefix DESC' THEN '[PAK_POBOM].[Prefix] DESC'
                        WHEN 'ItemNo' THEN '[PAK_POBOM].[ItemNo]'
                        WHEN 'ItemNo DESC' THEN '[PAK_POBOM].[ItemNo] DESC'
                        WHEN 'ItemDescription' THEN '[PAK_POBOM].[ItemDescription]'
                        WHEN 'ItemDescription DESC' THEN '[PAK_POBOM].[ItemDescription] DESC'
                        WHEN 'ElementID' THEN '[PAK_POBOM].[ElementID]'
                        WHEN 'ElementID DESC' THEN '[PAK_POBOM].[ElementID] DESC'
                        WHEN 'StatusID' THEN '[PAK_POBOM].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[PAK_POBOM].[StatusID] DESC'
                        WHEN 'ISGECRemarks' THEN '[PAK_POBOM].[ISGECRemarks]'
                        WHEN 'ISGECRemarks DESC' THEN '[PAK_POBOM].[ISGECRemarks] DESC'
                        WHEN 'SupplierRemarks' THEN '[PAK_POBOM].[SupplierRemarks]'
                        WHEN 'SupplierRemarks DESC' THEN '[PAK_POBOM].[SupplierRemarks] DESC'
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
                        WHEN 'PAK_POBOMStatus7_Description' THEN '[PAK_POBOMStatus7].[Description]'
                        WHEN 'PAK_POBOMStatus7_Description DESC' THEN '[PAK_POBOMStatus7].[Description] DESC'
                        WHEN 'PAK_Units8_Description' THEN '[PAK_Units8].[Description]'
                        WHEN 'PAK_Units8_Description DESC' THEN '[PAK_Units8].[Description] DESC'
                        WHEN 'PAK_Units9_Description' THEN '[PAK_Units9].[Description]'
                        WHEN 'PAK_Units9_Description DESC' THEN '[PAK_Units9].[Description] DESC'
                        ELSE '[PAK_POBOM].[SerialNo],[PAK_POBOM].[BOMNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_POBOM].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [PAK_Divisions3].[Description] AS PAK_Divisions3_Description,
    [PAK_Documents4].[cmba] AS PAK_Documents4_cmba,
    [PAK_Elements5].[Description] AS PAK_Elements5_Description,
    [PAK_PO6].[PODescription] AS PAK_PO6_PODescription,
    [PAK_POBOMStatus7].[Description] AS PAK_POBOMStatus7_Description,
    [PAK_Units8].[Description] AS PAK_Units8_Description,
    [PAK_Units9].[Description] AS PAK_Units9_Description 
  FROM [PAK_POBOM] 
      INNER JOIN #PageIndex
          ON [PAK_POBOM].[SerialNo] = #PageIndex.SerialNo
          AND [PAK_POBOM].[BOMNo] = #PageIndex.BOMNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_POBOM].[AcceptedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [PAK_POBOM].[FreezedBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [PAK_Divisions] AS [PAK_Divisions3]
    ON [PAK_POBOM].[DivisionID] = [PAK_Divisions3].[DivisionID]
  LEFT OUTER JOIN [PAK_Documents] AS [PAK_Documents4]
    ON [PAK_POBOM].[DocumentNo] = [PAK_Documents4].[DocumentNo]
  LEFT OUTER JOIN [PAK_Elements] AS [PAK_Elements5]
    ON [PAK_POBOM].[ElementID] = [PAK_Elements5].[ElementID]
  INNER JOIN [PAK_PO] AS [PAK_PO6]
    ON [PAK_POBOM].[SerialNo] = [PAK_PO6].[SerialNo]
  LEFT OUTER JOIN [PAK_POBOMStatus] AS [PAK_POBOMStatus7]
    ON [PAK_POBOM].[StatusID] = [PAK_POBOMStatus7].[StatusID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units8]
    ON [PAK_POBOM].[UOMQuantity] = [PAK_Units8].[UnitID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units9]
    ON [PAK_POBOM].[UOMWeight] = [PAK_Units9].[UnitID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
