USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOOpenRequestSelectByID]
  @LoginID NVarChar(8),
  @RequestNo Int 
  AS
  SELECT
		[EITL_POOpenRequest].[RequestNo] ,
		[EITL_POOpenRequest].[SerialNo] ,
		[EITL_POOpenRequest].[PORevision] ,
		[EITL_POOpenRequest].[SupplierID] ,
		[EITL_POOpenRequest].[Remarks] ,
		[EITL_POOpenRequest].[RequestedOn] ,
		[EITL_POOpenRequest].[ExecutedBy] ,
		[EITL_POOpenRequest].[ExecutedOn] ,
		[EITL_POOpenRequest].[ExecuterRemarks] ,
		[EITL_POOpenRequest].[ExecutedToOpen] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[EITL_POList2].[PONumber] AS EITL_POList2_PONumber,
		[EITL_Suppliers3].[SupplierName] AS EITL_Suppliers3_SupplierName 
  FROM [EITL_POOpenRequest] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [EITL_POOpenRequest].[ExecutedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [EITL_POList] AS [EITL_POList2]
    ON [EITL_POOpenRequest].[SerialNo] = [EITL_POList2].[SerialNo]
  LEFT OUTER JOIN [EITL_Suppliers] AS [EITL_Suppliers3]
    ON [EITL_POOpenRequest].[SupplierID] = [EITL_Suppliers3].[SupplierID]
  WHERE
  [EITL_POOpenRequest].[RequestNo] = @RequestNo
GO
