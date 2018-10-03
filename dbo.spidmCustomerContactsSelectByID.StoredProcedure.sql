USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmCustomerContactsSelectByID]
  @CustomerID NVarChar(6),
  @SerialNo Int 
  AS
  SELECT
		[IDM_CustomerContacts].[CustomerID] ,
		[IDM_CustomerContacts].[SerialNo] ,
		[IDM_CustomerContacts].[ContactPerson] ,
		[IDM_CustomerContacts].[EmailID] ,
		[IDM_CustomerContacts].[ContactNo] ,
		[IDM_CustomerContacts].[Address1] ,
		[IDM_CustomerContacts].[Address2] ,
		[IDM_CustomerContacts].[Address3] ,
		[IDM_CustomerContacts].[Address4] ,
		[IDM_CustomerContacts].[Remarks] ,
		[IDM_CustomerContacts].[CCEmailID] ,
		[IDM_Customers1].[Description] AS IDM_Customers1_Description 
  FROM [IDM_CustomerContacts] 
  INNER JOIN [IDM_Customers] AS [IDM_Customers1]
    ON [IDM_CustomerContacts].[CustomerID] = [IDM_Customers1].[CustomerID]
  WHERE
  [IDM_CustomerContacts].[CustomerID] = @CustomerID
  AND [IDM_CustomerContacts].[SerialNo] = @SerialNo
GO
