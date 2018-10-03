USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakQCListHSelectByID]
  @LoginID NVarChar(8),
  @QCLNo Int,
  @SerialNo Int 
  AS
  SELECT
    [PAK_QCListH].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [PAK_PO2].[PODescription] AS PAK_PO2_PODescription,
    [PAK_QCListStatus3].[Description] AS PAK_QCListStatus3_Description,
    [PAK_Units4].[Description] AS PAK_Units4_Description,
    [aspnet_Users5].[UserFullName] AS aspnet_Users5_UserFullName 
  FROM [PAK_QCListH] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_QCListH].[CreatedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [PAK_PO] AS [PAK_PO2]
    ON [PAK_QCListH].[SerialNo] = [PAK_PO2].[SerialNo]
  LEFT OUTER JOIN [PAK_QCListStatus] AS [PAK_QCListStatus3]
    ON [PAK_QCListH].[StatusID] = [PAK_QCListStatus3].[StatusID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units4]
    ON [PAK_QCListH].[UOMTotalWeight] = [PAK_Units4].[UnitID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users5]
    ON [PAK_QCListH].[ClearedBy] = [aspnet_users5].[LoginID]
  WHERE
  [PAK_QCListH].[QCLNo] = @QCLNo
  AND [PAK_QCListH].[SerialNo] = @SerialNo
GO
