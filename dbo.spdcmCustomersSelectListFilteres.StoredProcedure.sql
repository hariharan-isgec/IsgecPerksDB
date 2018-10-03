USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomersSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CustomerID NVarChar(6) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CustomerID'  SET @LGSQL = @LGSQL + ', ProjectID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[DCM_Customers].[CustomerID]'  SET @LGSQL = @LGSQL + ', [DCM_Customers].[ProjectID]'  SET @LGSQL = @LGSQL + ' FROM [DCM_Customers] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [DCM_Customers].[ProjectID] = [DCM_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CustomerID' THEN '[DCM_Customers].[CustomerID]'
                        WHEN 'CustomerID DESC' THEN '[DCM_Customers].[CustomerID] DESC'
                        WHEN 'ProjectID' THEN '[DCM_Customers].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[DCM_Customers].[ProjectID] DESC'
                        WHEN 'Description' THEN '[DCM_Customers].[Description]'
                        WHEN 'Description DESC' THEN '[DCM_Customers].[Description] DESC'
                        WHEN 'Address1' THEN '[DCM_Customers].[Address1]'
                        WHEN 'Address1 DESC' THEN '[DCM_Customers].[Address1] DESC'
                        WHEN 'Address2' THEN '[DCM_Customers].[Address2]'
                        WHEN 'Address2 DESC' THEN '[DCM_Customers].[Address2] DESC'
                        WHEN 'Address3' THEN '[DCM_Customers].[Address3]'
                        WHEN 'Address3 DESC' THEN '[DCM_Customers].[Address3] DESC'
                        WHEN 'Address4' THEN '[DCM_Customers].[Address4]'
                        WHEN 'Address4 DESC' THEN '[DCM_Customers].[Address4] DESC'
                        WHEN 'ToEMailID' THEN '[DCM_Customers].[ToEMailID]'
                        WHEN 'ToEMailID DESC' THEN '[DCM_Customers].[ToEMailID] DESC'
                        WHEN 'CCEmailID' THEN '[DCM_Customers].[CCEmailID]'
                        WHEN 'CCEmailID DESC' THEN '[DCM_Customers].[CCEmailID] DESC'
                        WHEN 'DCM_Projects1_ProjectID' THEN '[DCM_Projects1].[ProjectID]'
                        WHEN 'DCM_Projects1_ProjectID DESC' THEN '[DCM_Projects1].[ProjectID] DESC'
                        WHEN 'DCM_Projects1_Description' THEN '[DCM_Projects1].[Description]'
                        WHEN 'DCM_Projects1_Description DESC' THEN '[DCM_Projects1].[Description] DESC'
                        ELSE '[DCM_Customers].[CustomerID],[DCM_Customers].[ProjectID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[DCM_Customers].[CustomerID],
		[DCM_Customers].[ProjectID],
		[DCM_Customers].[Description],
		[DCM_Customers].[Address1],
		[DCM_Customers].[Address2],
		[DCM_Customers].[Address3],
		[DCM_Customers].[Address4],
		[DCM_Customers].[ToEMailID],
		[DCM_Customers].[CCEmailID],
		[DCM_Projects1].[ProjectID] AS DCM_Projects1_ProjectID,
		[DCM_Projects1].[Description] AS DCM_Projects1_Description 
  FROM [DCM_Customers] 
    	INNER JOIN #PageIndex
          ON [DCM_Customers].[CustomerID] = #PageIndex.CustomerID
          AND [DCM_Customers].[ProjectID] = #PageIndex.ProjectID
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects1]
    ON [DCM_Customers].[ProjectID] = [DCM_Projects1].[ProjectID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
