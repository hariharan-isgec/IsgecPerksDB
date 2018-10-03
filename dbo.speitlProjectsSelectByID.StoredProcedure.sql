USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlProjectsSelectByID]
  @LoginID NVarChar(8),
  @ProjectID NVarChar(6) 
  AS
  SELECT
		[IDM_Projects].[ProjectID] ,
		[IDM_Projects].[Description] ,
		[IDM_Projects].[CustomerOrderReference] ,
		[IDM_Projects].[ContactPerson] ,
		[IDM_Projects].[EmailID] ,
		[IDM_Projects].[ContactNo] ,
		[IDM_Projects].[Address1] ,
		[IDM_Projects].[Address2] ,
		[IDM_Projects].[Address3] ,
		[IDM_Projects].[Address4] ,
		[IDM_Projects].[ToEMailID] ,
		[IDM_Projects].[CCEmailID] ,
		[IDM_Projects].[ProjectSiteEMailID] ,
		[IDM_Projects].[ProjectSiteEMailPassword] ,
		[IDM_Projects].[LastNumber] ,
		[IDM_Projects].[BusinessPartnerID] ,
		[EITL_Suppliers1].[SupplierName] AS EITL_Suppliers1_SupplierName 
  FROM [IDM_Projects] 
  LEFT OUTER JOIN [EITL_Suppliers] AS [EITL_Suppliers1]
    ON [IDM_Projects].[BusinessPartnerID] = [EITL_Suppliers1].[SupplierID]
  WHERE
  [IDM_Projects].[ProjectID] = @ProjectID
GO
