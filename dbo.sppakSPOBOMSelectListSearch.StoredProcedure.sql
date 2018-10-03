USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSPOBOMSelectListSearch]
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
  )
  INSERT INTO #PageIndex (SerialNo, BOMNo)
  SELECT [PAK_POBOM].[SerialNo], [PAK_POBOM].[BOMNo] FROM [PAK_POBOM]
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
   ( 
         STR(ISNULL([PAK_POBOM].[BOMNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBOM].[ItemNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBOM].[ItemDescription],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBOM].[ElementID],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBOM].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBOM].[ISGECRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBOM].[SupplierRemarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBOM].[ItemLevel], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBOM].[Prefix],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBOM].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBOM].[WeightPerUnit], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBOM].[UOMWeight], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBOM].[ParentItemNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBOM].[DocumentNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBOM].[Quantity], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBOM].[SupplierItemCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBOM].[ItemCode],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBOM].[UOMQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBOM].[DivisionID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBOM].[AcceptedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POBOM].[FreezedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBOM].[ISGECWeightPerUnit], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBOM].[ISGECQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBOM].[SupplierWeightPerUnit], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_POBOM].[SupplierQuantity], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [PAK_POBOM].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [PAK_POBOM].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'BOMNo' THEN [PAK_POBOM].[BOMNo] END,
     CASE @OrderBy WHEN 'BOMNo DESC' THEN [PAK_POBOM].[BOMNo] END DESC,
     CASE @OrderBy WHEN 'ItemCode' THEN [PAK_POBOM].[ItemCode] END,
     CASE @OrderBy WHEN 'ItemCode DESC' THEN [PAK_POBOM].[ItemCode] END DESC,
     CASE @OrderBy WHEN 'SupplierItemCode' THEN [PAK_POBOM].[SupplierItemCode] END,
     CASE @OrderBy WHEN 'SupplierItemCode DESC' THEN [PAK_POBOM].[SupplierItemCode] END DESC,
     CASE @OrderBy WHEN 'DivisionID' THEN [PAK_POBOM].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [PAK_POBOM].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'UOMQuantity' THEN [PAK_POBOM].[UOMQuantity] END,
     CASE @OrderBy WHEN 'UOMQuantity DESC' THEN [PAK_POBOM].[UOMQuantity] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [PAK_POBOM].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [PAK_POBOM].[Quantity] END DESC,
     CASE @OrderBy WHEN 'UOMWeight' THEN [PAK_POBOM].[UOMWeight] END,
     CASE @OrderBy WHEN 'UOMWeight DESC' THEN [PAK_POBOM].[UOMWeight] END DESC,
     CASE @OrderBy WHEN 'WeightPerUnit' THEN [PAK_POBOM].[WeightPerUnit] END,
     CASE @OrderBy WHEN 'WeightPerUnit DESC' THEN [PAK_POBOM].[WeightPerUnit] END DESC,
     CASE @OrderBy WHEN 'DocumentNo' THEN [PAK_POBOM].[DocumentNo] END,
     CASE @OrderBy WHEN 'DocumentNo DESC' THEN [PAK_POBOM].[DocumentNo] END DESC,
     CASE @OrderBy WHEN 'ParentItemNo' THEN [PAK_POBOM].[ParentItemNo] END,
     CASE @OrderBy WHEN 'ParentItemNo DESC' THEN [PAK_POBOM].[ParentItemNo] END DESC,
     CASE @OrderBy WHEN 'ISGECQuantity' THEN [PAK_POBOM].[ISGECQuantity] END,
     CASE @OrderBy WHEN 'ISGECQuantity DESC' THEN [PAK_POBOM].[ISGECQuantity] END DESC,
     CASE @OrderBy WHEN 'ISGECWeightPerUnit' THEN [PAK_POBOM].[ISGECWeightPerUnit] END,
     CASE @OrderBy WHEN 'ISGECWeightPerUnit DESC' THEN [PAK_POBOM].[ISGECWeightPerUnit] END DESC,
     CASE @OrderBy WHEN 'SupplierQuantity' THEN [PAK_POBOM].[SupplierQuantity] END,
     CASE @OrderBy WHEN 'SupplierQuantity DESC' THEN [PAK_POBOM].[SupplierQuantity] END DESC,
     CASE @OrderBy WHEN 'SupplierWeightPerUnit' THEN [PAK_POBOM].[SupplierWeightPerUnit] END,
     CASE @OrderBy WHEN 'SupplierWeightPerUnit DESC' THEN [PAK_POBOM].[SupplierWeightPerUnit] END DESC,
     CASE @OrderBy WHEN 'Accepted' THEN [PAK_POBOM].[Accepted] END,
     CASE @OrderBy WHEN 'Accepted DESC' THEN [PAK_POBOM].[Accepted] END DESC,
     CASE @OrderBy WHEN 'AcceptedBy' THEN [PAK_POBOM].[AcceptedBy] END,
     CASE @OrderBy WHEN 'AcceptedBy DESC' THEN [PAK_POBOM].[AcceptedBy] END DESC,
     CASE @OrderBy WHEN 'AcceptedOn' THEN [PAK_POBOM].[AcceptedOn] END,
     CASE @OrderBy WHEN 'AcceptedOn DESC' THEN [PAK_POBOM].[AcceptedOn] END DESC,
     CASE @OrderBy WHEN 'Freezed' THEN [PAK_POBOM].[Freezed] END,
     CASE @OrderBy WHEN 'Freezed DESC' THEN [PAK_POBOM].[Freezed] END DESC,
     CASE @OrderBy WHEN 'FreezedBy' THEN [PAK_POBOM].[FreezedBy] END,
     CASE @OrderBy WHEN 'FreezedBy DESC' THEN [PAK_POBOM].[FreezedBy] END DESC,
     CASE @OrderBy WHEN 'FreezedOn' THEN [PAK_POBOM].[FreezedOn] END,
     CASE @OrderBy WHEN 'FreezedOn DESC' THEN [PAK_POBOM].[FreezedOn] END DESC,
     CASE @OrderBy WHEN 'Changed' THEN [PAK_POBOM].[Changed] END,
     CASE @OrderBy WHEN 'Changed DESC' THEN [PAK_POBOM].[Changed] END DESC,
     CASE @OrderBy WHEN 'CreatedBySupplier' THEN [PAK_POBOM].[CreatedBySupplier] END,
     CASE @OrderBy WHEN 'CreatedBySupplier DESC' THEN [PAK_POBOM].[CreatedBySupplier] END DESC,
     CASE @OrderBy WHEN 'ChangedBySupplier' THEN [PAK_POBOM].[ChangedBySupplier] END,
     CASE @OrderBy WHEN 'ChangedBySupplier DESC' THEN [PAK_POBOM].[ChangedBySupplier] END DESC,
     CASE @OrderBy WHEN 'AcceptedBySupplier' THEN [PAK_POBOM].[AcceptedBySupplier] END,
     CASE @OrderBy WHEN 'AcceptedBySupplier DESC' THEN [PAK_POBOM].[AcceptedBySupplier] END DESC,
     CASE @OrderBy WHEN 'FreezedBySupplier' THEN [PAK_POBOM].[FreezedBySupplier] END,
     CASE @OrderBy WHEN 'FreezedBySupplier DESC' THEN [PAK_POBOM].[FreezedBySupplier] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [PAK_POBOM].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [PAK_POBOM].[Active] END DESC,
     CASE @OrderBy WHEN 'Root' THEN [PAK_POBOM].[Root] END,
     CASE @OrderBy WHEN 'Root DESC' THEN [PAK_POBOM].[Root] END DESC,
     CASE @OrderBy WHEN 'Middle' THEN [PAK_POBOM].[Middle] END,
     CASE @OrderBy WHEN 'Middle DESC' THEN [PAK_POBOM].[Middle] END DESC,
     CASE @OrderBy WHEN 'Bottom' THEN [PAK_POBOM].[Bottom] END,
     CASE @OrderBy WHEN 'Bottom DESC' THEN [PAK_POBOM].[Bottom] END DESC,
     CASE @OrderBy WHEN 'Free' THEN [PAK_POBOM].[Free] END,
     CASE @OrderBy WHEN 'Free DESC' THEN [PAK_POBOM].[Free] END DESC,
     CASE @OrderBy WHEN 'ItemLevel' THEN [PAK_POBOM].[ItemLevel] END,
     CASE @OrderBy WHEN 'ItemLevel DESC' THEN [PAK_POBOM].[ItemLevel] END DESC,
     CASE @OrderBy WHEN 'Prefix' THEN [PAK_POBOM].[Prefix] END,
     CASE @OrderBy WHEN 'Prefix DESC' THEN [PAK_POBOM].[Prefix] END DESC,
     CASE @OrderBy WHEN 'ItemNo' THEN [PAK_POBOM].[ItemNo] END,
     CASE @OrderBy WHEN 'ItemNo DESC' THEN [PAK_POBOM].[ItemNo] END DESC,
     CASE @OrderBy WHEN 'ItemDescription' THEN [PAK_POBOM].[ItemDescription] END,
     CASE @OrderBy WHEN 'ItemDescription DESC' THEN [PAK_POBOM].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'ElementID' THEN [PAK_POBOM].[ElementID] END,
     CASE @OrderBy WHEN 'ElementID DESC' THEN [PAK_POBOM].[ElementID] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [PAK_POBOM].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [PAK_POBOM].[StatusID] END DESC,
     CASE @OrderBy WHEN 'ISGECRemarks' THEN [PAK_POBOM].[ISGECRemarks] END,
     CASE @OrderBy WHEN 'ISGECRemarks DESC' THEN [PAK_POBOM].[ISGECRemarks] END DESC,
     CASE @OrderBy WHEN 'SupplierRemarks' THEN [PAK_POBOM].[SupplierRemarks] END,
     CASE @OrderBy WHEN 'SupplierRemarks DESC' THEN [PAK_POBOM].[SupplierRemarks] END DESC,
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
     CASE @OrderBy WHEN 'PAK_POBOMStatus7_Description' THEN [PAK_POBOMStatus7].[Description] END,
     CASE @OrderBy WHEN 'PAK_POBOMStatus7_Description DESC' THEN [PAK_POBOMStatus7].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units8_Description' THEN [PAK_Units8].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units8_Description DESC' THEN [PAK_Units8].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units9_Description' THEN [PAK_Units9].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units9_Description DESC' THEN [PAK_Units9].[Description] END DESC 

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
