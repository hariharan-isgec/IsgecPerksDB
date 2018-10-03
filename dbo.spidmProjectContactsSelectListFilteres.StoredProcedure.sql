USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmProjectContactsSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_ProjectContacts].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [IDM_ProjectContacts].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_ProjectContacts] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [IDM_ProjectContacts].[CardNo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [IDM_ProjectContacts].[ProjectID] = [IDM_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_ProjectContacts].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[IDM_ProjectContacts].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[IDM_ProjectContacts].[ProjectID] DESC'
                        WHEN 'SerialNo' THEN '[IDM_ProjectContacts].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[IDM_ProjectContacts].[SerialNo] DESC'
                        WHEN 'CardNo' THEN '[IDM_ProjectContacts].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[IDM_ProjectContacts].[CardNo] DESC'
                        WHEN 'ContactPerson' THEN '[IDM_ProjectContacts].[ContactPerson]'
                        WHEN 'ContactPerson DESC' THEN '[IDM_ProjectContacts].[ContactPerson] DESC'
                        WHEN 'EmailID' THEN '[IDM_ProjectContacts].[EmailID]'
                        WHEN 'EmailID DESC' THEN '[IDM_ProjectContacts].[EmailID] DESC'
                        WHEN 'ContactNo' THEN '[IDM_ProjectContacts].[ContactNo]'
                        WHEN 'ContactNo DESC' THEN '[IDM_ProjectContacts].[ContactNo] DESC'
                        WHEN 'Address1' THEN '[IDM_ProjectContacts].[Address1]'
                        WHEN 'Address1 DESC' THEN '[IDM_ProjectContacts].[Address1] DESC'
                        WHEN 'Address2' THEN '[IDM_ProjectContacts].[Address2]'
                        WHEN 'Address2 DESC' THEN '[IDM_ProjectContacts].[Address2] DESC'
                        WHEN 'Address3' THEN '[IDM_ProjectContacts].[Address3]'
                        WHEN 'Address3 DESC' THEN '[IDM_ProjectContacts].[Address3] DESC'
                        WHEN 'Address4' THEN '[IDM_ProjectContacts].[Address4]'
                        WHEN 'Address4 DESC' THEN '[IDM_ProjectContacts].[Address4] DESC'
                        WHEN 'Remarks' THEN '[IDM_ProjectContacts].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[IDM_ProjectContacts].[Remarks] DESC'
                        WHEN 'CCEmailID' THEN '[IDM_ProjectContacts].[CCEmailID]'
                        WHEN 'CCEmailID DESC' THEN '[IDM_ProjectContacts].[CCEmailID] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'IDM_Projects2_Description' THEN '[IDM_Projects].[Description]'
                        WHEN 'IDM_Projects2_Description DESC' THEN '[IDM_Projects2].[Description] DESC'
                        ELSE '[IDM_ProjectContacts].[ProjectID],[IDM_ProjectContacts].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[IDM_ProjectContacts].[ProjectID] ,
		[IDM_ProjectContacts].[SerialNo] ,
		[IDM_ProjectContacts].[CardNo] ,
		[IDM_ProjectContacts].[ContactPerson] ,
		[IDM_ProjectContacts].[EmailID] ,
		[IDM_ProjectContacts].[ContactNo] ,
		[IDM_ProjectContacts].[Address1] ,
		[IDM_ProjectContacts].[Address2] ,
		[IDM_ProjectContacts].[Address3] ,
		[IDM_ProjectContacts].[Address4] ,
		[IDM_ProjectContacts].[Remarks] ,
		[IDM_ProjectContacts].[CCEmailID] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [IDM_ProjectContacts] 
    	INNER JOIN #PageIndex
          ON [IDM_ProjectContacts].[ProjectID] = #PageIndex.ProjectID
          AND [IDM_ProjectContacts].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [IDM_ProjectContacts].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [IDM_ProjectContacts].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
