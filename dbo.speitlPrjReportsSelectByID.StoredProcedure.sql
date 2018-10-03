USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPrjReportsSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
  AS
  SELECT
		[EITL_POList].[SerialNo] ,
		[EITL_POList].[ProjectID] ,
		[EITL_POList].[SupplierID] ,
		[EITL_POList].[BuyerID] ,
		[EITL_POList].[POStatusID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[EITL_POStatus4].[Description] AS EITL_POStatus4_Description,
		[EITL_Suppliers5].[SupplierName] AS EITL_Suppliers5_SupplierName,
		[IDM_Projects6].[Description] AS IDM_Projects6_Description 
  FROM [EITL_POList] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [EITL_POList].[BuyerID] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [EITL_POStatus] AS [EITL_POStatus4]
    ON [EITL_POList].[POStatusID] = [EITL_POStatus4].[StatusID]
  LEFT OUTER JOIN [EITL_Suppliers] AS [EITL_Suppliers5]
    ON [EITL_POList].[SupplierID] = [EITL_Suppliers5].[SupplierID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects6]
    ON [EITL_POList].[ProjectID] = [IDM_Projects6].[ProjectID]
  WHERE
  [EITL_POList].[SerialNo] = @SerialNo
GO
