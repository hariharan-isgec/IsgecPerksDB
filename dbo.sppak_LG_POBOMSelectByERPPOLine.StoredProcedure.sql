USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppak_LG_POBOMSelectByERPPOLine]
  @LoginID NVarChar(8),
  @SerialNo Int,
  @ItemNo Int 
  AS
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
  [PAK_POBOM].[SerialNo] = @SerialNo
  AND [PAK_POBOM].[ItemNo] = @ItemNo
GO
