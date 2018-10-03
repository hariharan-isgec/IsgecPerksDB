USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBItemsSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int,
  @BOMNo Int,
  @ItemNo Int 
  AS
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
  [PAK_POBItems].[SerialNo] = @SerialNo
  AND [PAK_POBItems].[BOMNo] = @BOMNo
  AND [PAK_POBItems].[ItemNo] = @ItemNo
GO
