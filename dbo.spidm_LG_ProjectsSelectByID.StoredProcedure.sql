USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidm_LG_ProjectsSelectByID]
  @ProjectID NVarChar(6),
  @PRFilter Bit,
  @LoginID  NVarChar(8)    
  AS
	IF (@PRFilter = 0)
		SELECT
			[IDM_Projects].[ProjectID] ,
			[IDM_Projects].[Description] ,
			[IDM_Projects].[CustomerID] ,
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
			[IDM_Customers1].[Description] AS IDM_Customers1_Description 
		FROM [IDM_Projects] 
		LEFT OUTER JOIN [IDM_Customers] AS [IDM_Customers1]
			ON [IDM_Projects].[CustomerID] = [IDM_Customers1].[CustomerID]
		WHERE
		[IDM_Projects].[ProjectID] = @ProjectID 
  ELSE
		SELECT
			[IDM_Projects].[ProjectID] ,
			[IDM_Projects].[Description] ,
			[IDM_Projects].[CustomerID] ,
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
			[IDM_Customers1].[Description] AS IDM_Customers1_Description 
		FROM [IDM_Projects] 
		LEFT OUTER JOIN [IDM_Customers] AS [IDM_Customers1]
			ON [IDM_Projects].[CustomerID] = [IDM_Customers1].[CustomerID]
		WHERE
		    [IDM_Projects].[ProjectID] = @ProjectID
    AND [IDM_Projects].[ProjectID] IN (SELECT PROJECTID FROM IDM_ProjectsByEmployee WHERE CardNo = @LoginID)
GO
