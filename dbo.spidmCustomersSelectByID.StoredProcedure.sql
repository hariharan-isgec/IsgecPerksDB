USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmCustomersSelectByID]
  @CustomerID NVarChar(6) 
  AS
  SELECT
		[IDM_Customers].[CustomerID] ,
		[IDM_Customers].[Description] ,
		[IDM_Customers].[ContactPerson] ,
		[IDM_Customers].[EmailID] ,
		[IDM_Customers].[ContactNo] ,
		[IDM_Customers].[Address1] ,
		[IDM_Customers].[Address2] ,
		[IDM_Customers].[Address3] ,
		[IDM_Customers].[Address4] ,
		[IDM_Customers].[ToEMailID] ,
		[IDM_Customers].[CCEmailID]  
  FROM [IDM_Customers] 
  WHERE
  [IDM_Customers].[CustomerID] = @CustomerID
GO
