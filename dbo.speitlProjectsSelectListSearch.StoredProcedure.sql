USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlProjectsSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID)
  SELECT [IDM_Projects].[ProjectID] FROM [IDM_Projects]
  LEFT OUTER JOIN [EITL_Suppliers] AS [EITL_Suppliers1]
    ON [IDM_Projects].[BusinessPartnerID] = [EITL_Suppliers1].[SupplierID]
 WHERE  
   ( 
         LOWER(ISNULL([IDM_Projects].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[CustomerOrderReference],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[ContactPerson],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[EmailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[ContactNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[Address1],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[Address2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[Address3],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[Address4],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[ToEMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[CCEmailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[ProjectSiteEMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[ProjectSiteEMailPassword],'')) LIKE @KeyWord1
     OR STR(ISNULL([IDM_Projects].[LastNumber], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[BusinessPartnerID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [IDM_Projects].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [IDM_Projects].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [IDM_Projects].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [IDM_Projects].[Description] END DESC,
     CASE @OrderBy WHEN 'CustomerOrderReference' THEN [IDM_Projects].[CustomerOrderReference] END,
     CASE @OrderBy WHEN 'CustomerOrderReference DESC' THEN [IDM_Projects].[CustomerOrderReference] END DESC,
     CASE @OrderBy WHEN 'ContactPerson' THEN [IDM_Projects].[ContactPerson] END,
     CASE @OrderBy WHEN 'ContactPerson DESC' THEN [IDM_Projects].[ContactPerson] END DESC,
     CASE @OrderBy WHEN 'EmailID' THEN [IDM_Projects].[EmailID] END,
     CASE @OrderBy WHEN 'EmailID DESC' THEN [IDM_Projects].[EmailID] END DESC,
     CASE @OrderBy WHEN 'ContactNo' THEN [IDM_Projects].[ContactNo] END,
     CASE @OrderBy WHEN 'ContactNo DESC' THEN [IDM_Projects].[ContactNo] END DESC,
     CASE @OrderBy WHEN 'Address1' THEN [IDM_Projects].[Address1] END,
     CASE @OrderBy WHEN 'Address1 DESC' THEN [IDM_Projects].[Address1] END DESC,
     CASE @OrderBy WHEN 'Address2' THEN [IDM_Projects].[Address2] END,
     CASE @OrderBy WHEN 'Address2 DESC' THEN [IDM_Projects].[Address2] END DESC,
     CASE @OrderBy WHEN 'Address3' THEN [IDM_Projects].[Address3] END,
     CASE @OrderBy WHEN 'Address3 DESC' THEN [IDM_Projects].[Address3] END DESC,
     CASE @OrderBy WHEN 'Address4' THEN [IDM_Projects].[Address4] END,
     CASE @OrderBy WHEN 'Address4 DESC' THEN [IDM_Projects].[Address4] END DESC,
     CASE @OrderBy WHEN 'ToEMailID' THEN [IDM_Projects].[ToEMailID] END,
     CASE @OrderBy WHEN 'ToEMailID DESC' THEN [IDM_Projects].[ToEMailID] END DESC,
     CASE @OrderBy WHEN 'CCEmailID' THEN [IDM_Projects].[CCEmailID] END,
     CASE @OrderBy WHEN 'CCEmailID DESC' THEN [IDM_Projects].[CCEmailID] END DESC,
     CASE @OrderBy WHEN 'ProjectSiteEMailID' THEN [IDM_Projects].[ProjectSiteEMailID] END,
     CASE @OrderBy WHEN 'ProjectSiteEMailID DESC' THEN [IDM_Projects].[ProjectSiteEMailID] END DESC,
     CASE @OrderBy WHEN 'ProjectSiteEMailPassword' THEN [IDM_Projects].[ProjectSiteEMailPassword] END,
     CASE @OrderBy WHEN 'ProjectSiteEMailPassword DESC' THEN [IDM_Projects].[ProjectSiteEMailPassword] END DESC,
     CASE @OrderBy WHEN 'LastNumber' THEN [IDM_Projects].[LastNumber] END,
     CASE @OrderBy WHEN 'LastNumber DESC' THEN [IDM_Projects].[LastNumber] END DESC,
     CASE @OrderBy WHEN 'BusinessPartnerID' THEN [IDM_Projects].[BusinessPartnerID] END,
     CASE @OrderBy WHEN 'BusinessPartnerID DESC' THEN [IDM_Projects].[BusinessPartnerID] END DESC,
     CASE @OrderBy WHEN 'EITL_Suppliers1_SupplierName' THEN [EITL_Suppliers1].[SupplierName] END,
     CASE @OrderBy WHEN 'EITL_Suppliers1_SupplierName DESC' THEN [EITL_Suppliers1].[SupplierName] END DESC 

    SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [IDM_Projects].[ProjectID] = #PageIndex.ProjectID
  LEFT OUTER JOIN [EITL_Suppliers] AS [EITL_Suppliers1]
    ON [IDM_Projects].[BusinessPartnerID] = [EITL_Suppliers1].[SupplierID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
