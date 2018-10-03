USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakQCListDSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int,
  @QCLNo Int,
  @BOMNo Int,
  @ItemNo Int 
  AS
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
  [PAK_QCListD].[SerialNo] = @SerialNo
  AND [PAK_QCListD].[QCLNo] = @QCLNo
  AND [PAK_QCListD].[BOMNo] = @BOMNo
  AND [PAK_QCListD].[ItemNo] = @ItemNo
GO
