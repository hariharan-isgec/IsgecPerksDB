USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlSuppliersSelectByID]
  @LoginID NVarChar(8),
  @SupplierID NVarChar(9) 
  AS
  SELECT
		[EITL_Suppliers].[SupplierID] ,
		[EITL_Suppliers].[SupplierName] ,
		[EITL_Suppliers].[Address1] ,
		[EITL_Suppliers].[Address2] ,
		[EITL_Suppliers].[Address3] ,
		[EITL_Suppliers].[Address4] ,
		[EITL_Suppliers].[City] ,
		[EITL_Suppliers].[State] ,
		[EITL_Suppliers].[Country] ,
		[EITL_Suppliers].[Zip] ,
		[EITL_Suppliers].[ContactPerson] ,
		[EITL_Suppliers].[EMailID] ,
		[EITL_Suppliers].[ContactNo]  
  FROM [EITL_Suppliers] 
  WHERE
  [EITL_Suppliers].[SupplierID] = @SupplierID
GO
