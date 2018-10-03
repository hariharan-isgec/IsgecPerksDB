USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmVendorsSelectByID]
  @VendorID NVarChar(6) 
  AS
  SELECT
		[IDM_Vendors].[VendorID] ,
		[IDM_Vendors].[Description] ,
		[IDM_Vendors].[ContactPerson] ,
		[IDM_Vendors].[EmailID] ,
		[IDM_Vendors].[ContactNo] ,
		[IDM_Vendors].[Address1] ,
		[IDM_Vendors].[Address2] ,
		[IDM_Vendors].[Address3] ,
		[IDM_Vendors].[Address4] ,
		[IDM_Vendors].[ToEMailID] ,
		[IDM_Vendors].[CCEmailID]  
  FROM [IDM_Vendors] 
  WHERE
  [IDM_Vendors].[VendorID] = @VendorID
GO
