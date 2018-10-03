USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomerTmtlHeaderSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,TmtlID Int NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,CustomerID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TmtlID'  SET @LGSQL = @LGSQL + ', ProjectID'  SET @LGSQL = @LGSQL + ', CustomerID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[DCM_CustomerTmtlHeader].[TmtlID]'  SET @LGSQL = @LGSQL + ', [DCM_CustomerTmtlHeader].[ProjectID]'  SET @LGSQL = @LGSQL + ', [DCM_CustomerTmtlHeader].[CustomerID]'  SET @LGSQL = @LGSQL + ' FROM [DCM_CustomerTmtlHeader] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [DCM_Customers] AS [DCM_Customers1]'
  SET @LGSQL = @LGSQL + '    ON [DCM_CustomerTmtlHeader].[CustomerID] = [DCM_Customers1].[CustomerID]'
  SET @LGSQL = @LGSQL + '    AND [DCM_CustomerTmtlHeader].[ProjectID] = [DCM_Customers1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [DCM_CustomerTmtlHeader].[ProjectID] = [DCM_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [DCM_TmtlStatus] AS [DCM_TmtlStatus3]'
  SET @LGSQL = @LGSQL + '    ON [DCM_CustomerTmtlHeader].[TmtlStatusID] = [DCM_TmtlStatus3].[StatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TmtlID' THEN '[DCM_CustomerTmtlHeader].[TmtlID]'
                        WHEN 'TmtlID DESC' THEN '[DCM_CustomerTmtlHeader].[TmtlID] DESC'
                        WHEN 'ProjectID' THEN '[DCM_CustomerTmtlHeader].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[DCM_CustomerTmtlHeader].[ProjectID] DESC'
                        WHEN 'CustomerID' THEN '[DCM_CustomerTmtlHeader].[CustomerID]'
                        WHEN 'CustomerID DESC' THEN '[DCM_CustomerTmtlHeader].[CustomerID] DESC'
                        WHEN 'TmtlReference' THEN '[DCM_CustomerTmtlHeader].[TmtlReference]'
                        WHEN 'TmtlReference DESC' THEN '[DCM_CustomerTmtlHeader].[TmtlReference] DESC'
                        WHEN 'Subject' THEN '[DCM_CustomerTmtlHeader].[Subject]'
                        WHEN 'Subject DESC' THEN '[DCM_CustomerTmtlHeader].[Subject] DESC'
                        WHEN 'Remarks' THEN '[DCM_CustomerTmtlHeader].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[DCM_CustomerTmtlHeader].[Remarks] DESC'
                        WHEN 'TmtlStatusID' THEN '[DCM_CustomerTmtlHeader].[TmtlStatusID]'
                        WHEN 'TmtlStatusID DESC' THEN '[DCM_CustomerTmtlHeader].[TmtlStatusID] DESC'
                        WHEN 'CreatedOn' THEN '[DCM_CustomerTmtlHeader].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[DCM_CustomerTmtlHeader].[CreatedOn] DESC'
                        WHEN 'CreatedBy' THEN '[DCM_CustomerTmtlHeader].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[DCM_CustomerTmtlHeader].[CreatedBy] DESC'
                        WHEN 'ApprovedOn' THEN '[DCM_CustomerTmtlHeader].[ApprovedOn]'
                        WHEN 'ApprovedOn DESC' THEN '[DCM_CustomerTmtlHeader].[ApprovedOn] DESC'
                        WHEN 'ApprovedBy' THEN '[DCM_CustomerTmtlHeader].[ApprovedBy]'
                        WHEN 'ApprovedBy DESC' THEN '[DCM_CustomerTmtlHeader].[ApprovedBy] DESC'
                        WHEN 'DCM_Customers1_CustomerID' THEN '[DCM_Customers1].[CustomerID]'
                        WHEN 'DCM_Customers1_CustomerID DESC' THEN '[DCM_Customers1].[CustomerID] DESC'
                        WHEN 'DCM_Customers1_ProjectID' THEN '[DCM_Customers1].[ProjectID]'
                        WHEN 'DCM_Customers1_ProjectID DESC' THEN '[DCM_Customers1].[ProjectID] DESC'
                        WHEN 'DCM_Customers1_Description' THEN '[DCM_Customers1].[Description]'
                        WHEN 'DCM_Customers1_Description DESC' THEN '[DCM_Customers1].[Description] DESC'
                        WHEN 'DCM_Customers1_Address1' THEN '[DCM_Customers1].[Address1]'
                        WHEN 'DCM_Customers1_Address1 DESC' THEN '[DCM_Customers1].[Address1] DESC'
                        WHEN 'DCM_Customers1_Address2' THEN '[DCM_Customers1].[Address2]'
                        WHEN 'DCM_Customers1_Address2 DESC' THEN '[DCM_Customers1].[Address2] DESC'
                        WHEN 'DCM_Customers1_Address3' THEN '[DCM_Customers1].[Address3]'
                        WHEN 'DCM_Customers1_Address3 DESC' THEN '[DCM_Customers1].[Address3] DESC'
                        WHEN 'DCM_Customers1_Address4' THEN '[DCM_Customers1].[Address4]'
                        WHEN 'DCM_Customers1_Address4 DESC' THEN '[DCM_Customers1].[Address4] DESC'
                        WHEN 'DCM_Customers1_ToEMailID' THEN '[DCM_Customers1].[ToEMailID]'
                        WHEN 'DCM_Customers1_ToEMailID DESC' THEN '[DCM_Customers1].[ToEMailID] DESC'
                        WHEN 'DCM_Customers1_CCEmailID' THEN '[DCM_Customers1].[CCEmailID]'
                        WHEN 'DCM_Customers1_CCEmailID DESC' THEN '[DCM_Customers1].[CCEmailID] DESC'
                        WHEN 'DCM_Projects2_ProjectID' THEN '[DCM_Projects2].[ProjectID]'
                        WHEN 'DCM_Projects2_ProjectID DESC' THEN '[DCM_Projects2].[ProjectID] DESC'
                        WHEN 'DCM_Projects2_Description' THEN '[DCM_Projects2].[Description]'
                        WHEN 'DCM_Projects2_Description DESC' THEN '[DCM_Projects2].[Description] DESC'
                        WHEN 'DCM_Projects2_ProjectCode' THEN '[DCM_Projects2].[ProjectCode]'
                        WHEN 'DCM_Projects2_ProjectCode DESC' THEN '[DCM_Projects2].[ProjectCode] DESC'
                        WHEN 'DCM_TmtlStatus3_StatusID' THEN '[DCM_TmtlStatus3].[StatusID]'
                        WHEN 'DCM_TmtlStatus3_StatusID DESC' THEN '[DCM_TmtlStatus3].[StatusID] DESC'
                        WHEN 'DCM_TmtlStatus3_Description' THEN '[DCM_TmtlStatus3].[Description]'
                        WHEN 'DCM_TmtlStatus3_Description DESC' THEN '[DCM_TmtlStatus3].[Description] DESC'
                        ELSE '[DCM_CustomerTmtlHeader].[TmtlID],[DCM_CustomerTmtlHeader].[ProjectID],[DCM_CustomerTmtlHeader].[CustomerID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[DCM_CustomerTmtlHeader].[TmtlID],
		[DCM_CustomerTmtlHeader].[ProjectID],
		[DCM_CustomerTmtlHeader].[CustomerID],
		[DCM_CustomerTmtlHeader].[TmtlReference],
		[DCM_CustomerTmtlHeader].[Subject],
		[DCM_CustomerTmtlHeader].[Remarks],
		[DCM_CustomerTmtlHeader].[TmtlStatusID],
		[DCM_CustomerTmtlHeader].[CreatedOn],
		[DCM_CustomerTmtlHeader].[CreatedBy],
		[DCM_CustomerTmtlHeader].[ApprovedOn],
		[DCM_CustomerTmtlHeader].[ApprovedBy],
		[DCM_Customers1].[CustomerID] AS DCM_Customers1_CustomerID,
		[DCM_Customers1].[ProjectID] AS DCM_Customers1_ProjectID,
		[DCM_Customers1].[Description] AS DCM_Customers1_Description,
		[DCM_Customers1].[Address1] AS DCM_Customers1_Address1,
		[DCM_Customers1].[Address2] AS DCM_Customers1_Address2,
		[DCM_Customers1].[Address3] AS DCM_Customers1_Address3,
		[DCM_Customers1].[Address4] AS DCM_Customers1_Address4,
		[DCM_Customers1].[ToEMailID] AS DCM_Customers1_ToEMailID,
		[DCM_Customers1].[CCEmailID] AS DCM_Customers1_CCEmailID,
		[DCM_Projects2].[ProjectID] AS DCM_Projects2_ProjectID,
		[DCM_Projects2].[Description] AS DCM_Projects2_Description,
		[DCM_Projects2].[ProjectCode] AS DCM_Projects2_ProjectCode,
		[DCM_TmtlStatus3].[StatusID] AS DCM_TmtlStatus3_StatusID,
		[DCM_TmtlStatus3].[Description] AS DCM_TmtlStatus3_Description 
  FROM [DCM_CustomerTmtlHeader] 
    	INNER JOIN #PageIndex
          ON [DCM_CustomerTmtlHeader].[TmtlID] = #PageIndex.TmtlID
          AND [DCM_CustomerTmtlHeader].[ProjectID] = #PageIndex.ProjectID
          AND [DCM_CustomerTmtlHeader].[CustomerID] = #PageIndex.CustomerID
  LEFT OUTER JOIN [DCM_Customers] AS [DCM_Customers1]
    ON [DCM_CustomerTmtlHeader].[CustomerID] = [DCM_Customers1].[CustomerID]
    AND [DCM_CustomerTmtlHeader].[ProjectID] = [DCM_Customers1].[ProjectID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects2]
    ON [DCM_CustomerTmtlHeader].[ProjectID] = [DCM_Projects2].[ProjectID]
  LEFT OUTER JOIN [DCM_TmtlStatus] AS [DCM_TmtlStatus3]
    ON [DCM_CustomerTmtlHeader].[TmtlStatusID] = [DCM_TmtlStatus3].[StatusID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
