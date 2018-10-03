USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidm_LG_ProjectsSelectList]
  @LoginID NvarChar(8),
  @PRFilter Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  IF (@PRFilter = 0)
    BEGIN
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
			WHERE 1 = 1  
			ORDER BY
				 CASE @orderBy WHEN 'ProjectID' THEN [IDM_Projects].[ProjectID] END,
				 CASE @orderBy WHEN 'ProjectID DESC' THEN [IDM_Projects].[ProjectID] END DESC,
				 CASE @orderBy WHEN 'Description' THEN [IDM_Projects].[Description] END,
				 CASE @orderBy WHEN 'Description DESC' THEN [IDM_Projects].[Description] END DESC,
				 CASE @orderBy WHEN 'CustomerID' THEN [IDM_Projects].[CustomerID] END,
				 CASE @orderBy WHEN 'CustomerID DESC' THEN [IDM_Projects].[CustomerID] END DESC,
				 CASE @orderBy WHEN 'CustomerOrderReference' THEN [IDM_Projects].[CustomerOrderReference] END,
				 CASE @orderBy WHEN 'CustomerOrderReference DESC' THEN [IDM_Projects].[CustomerOrderReference] END DESC,
				 CASE @orderBy WHEN 'ContactPerson' THEN [IDM_Projects].[ContactPerson] END,
				 CASE @orderBy WHEN 'ContactPerson DESC' THEN [IDM_Projects].[ContactPerson] END DESC,
				 CASE @orderBy WHEN 'EmailID' THEN [IDM_Projects].[EmailID] END,
				 CASE @orderBy WHEN 'EmailID DESC' THEN [IDM_Projects].[EmailID] END DESC,
				 CASE @orderBy WHEN 'ContactNo' THEN [IDM_Projects].[ContactNo] END,
				 CASE @orderBy WHEN 'ContactNo DESC' THEN [IDM_Projects].[ContactNo] END DESC,
				 CASE @orderBy WHEN 'Address1' THEN [IDM_Projects].[Address1] END,
				 CASE @orderBy WHEN 'Address1 DESC' THEN [IDM_Projects].[Address1] END DESC,
				 CASE @orderBy WHEN 'Address2' THEN [IDM_Projects].[Address2] END,
				 CASE @orderBy WHEN 'Address2 DESC' THEN [IDM_Projects].[Address2] END DESC,
				 CASE @orderBy WHEN 'Address3' THEN [IDM_Projects].[Address3] END,
				 CASE @orderBy WHEN 'Address3 DESC' THEN [IDM_Projects].[Address3] END DESC,
				 CASE @orderBy WHEN 'Address4' THEN [IDM_Projects].[Address4] END,
				 CASE @orderBy WHEN 'Address4 DESC' THEN [IDM_Projects].[Address4] END DESC,
				 CASE @orderBy WHEN 'ToEMailID' THEN [IDM_Projects].[ToEMailID] END,
				 CASE @orderBy WHEN 'ToEMailID DESC' THEN [IDM_Projects].[ToEMailID] END DESC,
				 CASE @orderBy WHEN 'CCEmailID' THEN [IDM_Projects].[CCEmailID] END,
				 CASE @orderBy WHEN 'CCEmailID DESC' THEN [IDM_Projects].[CCEmailID] END DESC,
				 CASE @orderBy WHEN 'IDM_Customers1_Description' THEN [IDM_Customers1].[Description] END,
				 CASE @orderBy WHEN 'IDM_Customers1_Description DESC' THEN [IDM_Customers1].[Description] END DESC 
			SET @RecordCount = @@RowCount
		END
  ELSE
		BEGIN
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
			WHERE [IDM_Projects].[ProjectID] IN (SELECT PROJECTID FROM IDM_ProjectsByEmployee WHERE CardNo = @LoginID)    
			ORDER BY
				 CASE @orderBy WHEN 'ProjectID' THEN [IDM_Projects].[ProjectID] END,
				 CASE @orderBy WHEN 'ProjectID DESC' THEN [IDM_Projects].[ProjectID] END DESC,
				 CASE @orderBy WHEN 'Description' THEN [IDM_Projects].[Description] END,
				 CASE @orderBy WHEN 'Description DESC' THEN [IDM_Projects].[Description] END DESC,
				 CASE @orderBy WHEN 'CustomerID' THEN [IDM_Projects].[CustomerID] END,
				 CASE @orderBy WHEN 'CustomerID DESC' THEN [IDM_Projects].[CustomerID] END DESC,
				 CASE @orderBy WHEN 'CustomerOrderReference' THEN [IDM_Projects].[CustomerOrderReference] END,
				 CASE @orderBy WHEN 'CustomerOrderReference DESC' THEN [IDM_Projects].[CustomerOrderReference] END DESC,
				 CASE @orderBy WHEN 'ContactPerson' THEN [IDM_Projects].[ContactPerson] END,
				 CASE @orderBy WHEN 'ContactPerson DESC' THEN [IDM_Projects].[ContactPerson] END DESC,
				 CASE @orderBy WHEN 'EmailID' THEN [IDM_Projects].[EmailID] END,
				 CASE @orderBy WHEN 'EmailID DESC' THEN [IDM_Projects].[EmailID] END DESC,
				 CASE @orderBy WHEN 'ContactNo' THEN [IDM_Projects].[ContactNo] END,
				 CASE @orderBy WHEN 'ContactNo DESC' THEN [IDM_Projects].[ContactNo] END DESC,
				 CASE @orderBy WHEN 'Address1' THEN [IDM_Projects].[Address1] END,
				 CASE @orderBy WHEN 'Address1 DESC' THEN [IDM_Projects].[Address1] END DESC,
				 CASE @orderBy WHEN 'Address2' THEN [IDM_Projects].[Address2] END,
				 CASE @orderBy WHEN 'Address2 DESC' THEN [IDM_Projects].[Address2] END DESC,
				 CASE @orderBy WHEN 'Address3' THEN [IDM_Projects].[Address3] END,
				 CASE @orderBy WHEN 'Address3 DESC' THEN [IDM_Projects].[Address3] END DESC,
				 CASE @orderBy WHEN 'Address4' THEN [IDM_Projects].[Address4] END,
				 CASE @orderBy WHEN 'Address4 DESC' THEN [IDM_Projects].[Address4] END DESC,
				 CASE @orderBy WHEN 'ToEMailID' THEN [IDM_Projects].[ToEMailID] END,
				 CASE @orderBy WHEN 'ToEMailID DESC' THEN [IDM_Projects].[ToEMailID] END DESC,
				 CASE @orderBy WHEN 'CCEmailID' THEN [IDM_Projects].[CCEmailID] END,
				 CASE @orderBy WHEN 'CCEmailID DESC' THEN [IDM_Projects].[CCEmailID] END DESC,
				 CASE @orderBy WHEN 'IDM_Customers1_Description' THEN [IDM_Customers1].[Description] END,
				 CASE @orderBy WHEN 'IDM_Customers1_Description DESC' THEN [IDM_Customers1].[Description] END DESC 
			SET @RecordCount = @@RowCount
    END
GO
