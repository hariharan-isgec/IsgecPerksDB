USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscCommitteesSelectListFilteres]
  @Filter_DivisionID NVarChar(6),
  @Filter_EmployeeID NVarChar(8),
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
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SC_Committees].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [SC_Committees] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions1]'
  SET @LGSQL = @LGSQL + '    ON [SC_Committees].[DivisionID] = [HRM_Divisions1].[DivisionID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [SC_Committees].[EmployeeID] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_DivisionID > '') 
    SET @LGSQL = @LGSQL + ' AND [SC_Committees].[DivisionID] = ''' + @Filter_DivisionID + ''''
  IF (@Filter_EmployeeID > '') 
    SET @LGSQL = @LGSQL + ' AND [SC_Committees].[EmployeeID] = ''' + @Filter_EmployeeID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[SC_Committees].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[SC_Committees].[SerialNo] DESC'
                        WHEN 'IsItUnitLevelCommittee' THEN '[SC_Committees].[IsItUnitLevelCommittee]'
                        WHEN 'IsItUnitLevelCommittee DESC' THEN '[SC_Committees].[IsItUnitLevelCommittee] DESC'
                        WHEN 'DivisionID' THEN '[SC_Committees].[DivisionID]'
                        WHEN 'DivisionID DESC' THEN '[SC_Committees].[DivisionID] DESC'
                        WHEN 'EmployeeID' THEN '[SC_Committees].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[SC_Committees].[EmployeeID] DESC'
                        WHEN 'HRM_Divisions1_Description' THEN '[HRM_Divisions1].[Description]'
                        WHEN 'HRM_Divisions1_Description DESC' THEN '[HRM_Divisions1].[Description] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        ELSE '[SC_Committees].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SC_Committees].* ,
    [HRM_Divisions1].[Description] AS HRM_Divisions1_Description,
    [HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName 
  FROM [SC_Committees] 
      INNER JOIN #PageIndex
          ON [SC_Committees].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions1]
    ON [SC_Committees].[DivisionID] = [HRM_Divisions1].[DivisionID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [SC_Committees].[EmployeeID] = [HRM_Employees2].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
