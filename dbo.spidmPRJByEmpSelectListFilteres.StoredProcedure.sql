USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmPRJByEmpSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @Filter_CardNo NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
	@HRM_Employees1_ActiveState Bit, 
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', CardNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_ProjectsByEmployee].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [IDM_ProjectsByEmployee].[CardNo]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_ProjectsByEmployee] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [IDM_ProjectsByEmployee].[CardNo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [IDM_ProjectsByEmployee].[ProjectID] = [IDM_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE [HRM_Employees1].[ActiveState] = ' + str(@HRM_Employees1_ActiveState)  
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_ProjectsByEmployee].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_ProjectsByEmployee].[CardNo] = ''' + @Filter_CardNo + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[IDM_ProjectsByEmployee].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[IDM_ProjectsByEmployee].[ProjectID] DESC'
                        WHEN 'CardNo' THEN '[IDM_ProjectsByEmployee].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[IDM_ProjectsByEmployee].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'IDM_Projects2_Description' THEN '[IDM_Projects].[Description]'
                        WHEN 'IDM_Projects2_Description DESC' THEN '[IDM_Projects2].[Description] DESC'
                        ELSE '[IDM_ProjectsByEmployee].[ProjectID],[IDM_ProjectsByEmployee].[CardNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[IDM_ProjectsByEmployee].[ProjectID] ,
		[IDM_ProjectsByEmployee].[CardNo] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [IDM_ProjectsByEmployee] 
    	INNER JOIN #PageIndex
          ON [IDM_ProjectsByEmployee].[ProjectID] = #PageIndex.ProjectID
          AND [IDM_ProjectsByEmployee].[CardNo] = #PageIndex.CardNo
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [IDM_ProjectsByEmployee].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [IDM_ProjectsByEmployee].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
