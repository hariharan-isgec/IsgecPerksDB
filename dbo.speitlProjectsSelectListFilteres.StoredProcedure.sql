USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlProjectsSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_Projects].[ProjectID]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_Projects] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [EITL_Suppliers] AS [EITL_Suppliers1]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Projects].[BusinessPartnerID] = [EITL_Suppliers1].[SupplierID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[IDM_Projects].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[IDM_Projects].[ProjectID] DESC'
                        WHEN 'Description' THEN '[IDM_Projects].[Description]'
                        WHEN 'Description DESC' THEN '[IDM_Projects].[Description] DESC'
                        WHEN 'CustomerOrderReference' THEN '[IDM_Projects].[CustomerOrderReference]'
                        WHEN 'CustomerOrderReference DESC' THEN '[IDM_Projects].[CustomerOrderReference] DESC'
                        WHEN 'ContactPerson' THEN '[IDM_Projects].[ContactPerson]'
                        WHEN 'ContactPerson DESC' THEN '[IDM_Projects].[ContactPerson] DESC'
                        WHEN 'EmailID' THEN '[IDM_Projects].[EmailID]'
                        WHEN 'EmailID DESC' THEN '[IDM_Projects].[EmailID] DESC'
                        WHEN 'ContactNo' THEN '[IDM_Projects].[ContactNo]'
                        WHEN 'ContactNo DESC' THEN '[IDM_Projects].[ContactNo] DESC'
                        WHEN 'Address1' THEN '[IDM_Projects].[Address1]'
                        WHEN 'Address1 DESC' THEN '[IDM_Projects].[Address1] DESC'
                        WHEN 'Address2' THEN '[IDM_Projects].[Address2]'
                        WHEN 'Address2 DESC' THEN '[IDM_Projects].[Address2] DESC'
                        WHEN 'Address3' THEN '[IDM_Projects].[Address3]'
                        WHEN 'Address3 DESC' THEN '[IDM_Projects].[Address3] DESC'
                        WHEN 'Address4' THEN '[IDM_Projects].[Address4]'
                        WHEN 'Address4 DESC' THEN '[IDM_Projects].[Address4] DESC'
                        WHEN 'ToEMailID' THEN '[IDM_Projects].[ToEMailID]'
                        WHEN 'ToEMailID DESC' THEN '[IDM_Projects].[ToEMailID] DESC'
                        WHEN 'CCEmailID' THEN '[IDM_Projects].[CCEmailID]'
                        WHEN 'CCEmailID DESC' THEN '[IDM_Projects].[CCEmailID] DESC'
                        WHEN 'ProjectSiteEMailID' THEN '[IDM_Projects].[ProjectSiteEMailID]'
                        WHEN 'ProjectSiteEMailID DESC' THEN '[IDM_Projects].[ProjectSiteEMailID] DESC'
                        WHEN 'ProjectSiteEMailPassword' THEN '[IDM_Projects].[ProjectSiteEMailPassword]'
                        WHEN 'ProjectSiteEMailPassword DESC' THEN '[IDM_Projects].[ProjectSiteEMailPassword] DESC'
                        WHEN 'LastNumber' THEN '[IDM_Projects].[LastNumber]'
                        WHEN 'LastNumber DESC' THEN '[IDM_Projects].[LastNumber] DESC'
                        WHEN 'BusinessPartnerID' THEN '[IDM_Projects].[BusinessPartnerID]'
                        WHEN 'BusinessPartnerID DESC' THEN '[IDM_Projects].[BusinessPartnerID] DESC'
                        WHEN 'EITL_Suppliers1_SupplierName' THEN '[EITL_Suppliers1].[SupplierName]'
                        WHEN 'EITL_Suppliers1_SupplierName DESC' THEN '[EITL_Suppliers1].[SupplierName] DESC'
                        ELSE '[IDM_Projects].[ProjectID]'
                    END
  EXEC (@LGSQL)

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
