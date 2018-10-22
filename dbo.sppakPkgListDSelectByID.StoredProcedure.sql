USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPkgListDSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int,
  @PkgNo Int,
  @BOMNo Int,
  @ItemNo Int 
  AS
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
  LEFT OUTER JOIN [PAK_PakTypes] AS [PAK_PakTypes1]
    ON [PAK_PkgListD].[PackTypeID] = [PAK_PakTypes1].[PackTypeID]
  LEFT OUTER JOIN [PAK_PkgListH] AS [PAK_PkgListH2]
    ON [PAK_PkgListD].[SerialNo] = [PAK_PkgListH2].[SerialNo]
    AND [PAK_PkgListD].[PkgNo] = [PAK_PkgListH2].[PkgNo]
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
  [PAK_PkgListD].[SerialNo] = @SerialNo
  AND [PAK_PkgListD].[PkgNo] = @PkgNo
  AND [PAK_PkgListD].[BOMNo] = @BOMNo
  AND [PAK_PkgListD].[ItemNo] = @ItemNo
GO
