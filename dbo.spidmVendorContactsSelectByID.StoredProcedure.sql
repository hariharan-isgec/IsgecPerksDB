USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmVendorContactsSelectByID]
  @VendorID NVarChar(6),
  @SerialNo Int 
  AS
  SELECT
		[IDM_VendorContacts].[VendorID] ,
		[IDM_VendorContacts].[SerialNo] ,
		[IDM_VendorContacts].[ContactPerson] ,
		[IDM_VendorContacts].[EmailID] ,
		[IDM_VendorContacts].[ContactNo] ,
		[IDM_VendorContacts].[Address1] ,
		[IDM_VendorContacts].[Address2] ,
		[IDM_VendorContacts].[Address3] ,
		[IDM_VendorContacts].[Address4] ,
		[IDM_VendorContacts].[Remarks] ,
		[IDM_VendorContacts].[CCEmailID] ,
		[IDM_Vendors1].[Description] AS IDM_Vendors1_Description 
  FROM [IDM_VendorContacts] 
  INNER JOIN [IDM_Vendors] AS [IDM_Vendors1]
    ON [IDM_VendorContacts].[VendorID] = [IDM_Vendors1].[VendorID]
  WHERE
  [IDM_VendorContacts].[VendorID] = @VendorID
  AND [IDM_VendorContacts].[SerialNo] = @SerialNo
GO
