USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmEmployeeEMailGroupSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
 ,EMailGroup NVarChar(50) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CardNo'  SET @LGSQL = @LGSQL + ', EMailGroup'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[HRM_EmployeeEMailGroup].[CardNo]'  SET @LGSQL = @LGSQL + ', [HRM_EmployeeEMailGroup].[EMailGroup]'  SET @LGSQL = @LGSQL + ' FROM [HRM_EmployeeEMailGroup] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_EMailGroups] AS [HRM_EMailGroups1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_EmployeeEMailGroup].[EMailGroup] = [HRM_EMailGroups1].[EMailGroup]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_EmployeeEMailGroup].[CardNo] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CardNo' THEN '[HRM_EmployeeEMailGroup].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_EmployeeEMailGroup].[CardNo] DESC'
                        WHEN 'EMailGroup' THEN '[HRM_EmployeeEMailGroup].[EMailGroup]'
                        WHEN 'EMailGroup DESC' THEN '[HRM_EmployeeEMailGroup].[EMailGroup] DESC'
                        WHEN 'HRM_EMailGroups1_EMailGroup' THEN '[HRM_EMailGroups1].[EMailGroup]'
                        WHEN 'HRM_EMailGroups1_EMailGroup DESC' THEN '[HRM_EMailGroups1].[EMailGroup] DESC'
                        WHEN 'HRM_EMailGroups1_Description' THEN '[HRM_EMailGroups1].[Description]'
                        WHEN 'HRM_EMailGroups1_Description DESC' THEN '[HRM_EMailGroups1].[Description] DESC'
                        WHEN 'HRM_Employees2_CardNo' THEN '[HRM_Employees2].[CardNo]'
                        WHEN 'HRM_Employees2_CardNo DESC' THEN '[HRM_Employees2].[CardNo] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        WHEN 'HRM_Employees2_C_DateOfJoining' THEN '[HRM_Employees2].[C_DateOfJoining]'
                        WHEN 'HRM_Employees2_C_DateOfJoining DESC' THEN '[HRM_Employees2].[C_DateOfJoining] DESC'
                        WHEN 'HRM_Employees2_C_CompanyID' THEN '[HRM_Employees2].[C_CompanyID]'
                        WHEN 'HRM_Employees2_C_CompanyID DESC' THEN '[HRM_Employees2].[C_CompanyID] DESC'
                        WHEN 'HRM_Employees2_C_DivisionID' THEN '[HRM_Employees2].[C_DivisionID]'
                        WHEN 'HRM_Employees2_C_DivisionID DESC' THEN '[HRM_Employees2].[C_DivisionID] DESC'
                        WHEN 'HRM_Employees2_C_OfficeID' THEN '[HRM_Employees2].[C_OfficeID]'
                        WHEN 'HRM_Employees2_C_OfficeID DESC' THEN '[HRM_Employees2].[C_OfficeID] DESC'
                        WHEN 'HRM_Employees2_C_DepartmentID' THEN '[HRM_Employees2].[C_DepartmentID]'
                        WHEN 'HRM_Employees2_C_DepartmentID DESC' THEN '[HRM_Employees2].[C_DepartmentID] DESC'
                        WHEN 'HRM_Employees2_C_DesignationID' THEN '[HRM_Employees2].[C_DesignationID]'
                        WHEN 'HRM_Employees2_C_DesignationID DESC' THEN '[HRM_Employees2].[C_DesignationID] DESC'
                        WHEN 'HRM_Employees2_ActiveState' THEN '[HRM_Employees2].[ActiveState]'
                        WHEN 'HRM_Employees2_ActiveState DESC' THEN '[HRM_Employees2].[ActiveState] DESC'
                        ELSE '[HRM_EmployeeEMailGroup].[CardNo],[HRM_EmployeeEMailGroup].[EMailGroup]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_EmployeeEMailGroup].[CardNo],
		[HRM_EmployeeEMailGroup].[EMailGroup],
		[HRM_EMailGroups1].[EMailGroup] AS HRM_EMailGroups1_EMailGroup,
		[HRM_EMailGroups1].[Description] AS HRM_EMailGroups1_Description,
		[HRM_Employees2].[CardNo] AS HRM_Employees2_CardNo,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees2].[C_DateOfJoining] AS HRM_Employees2_C_DateOfJoining,
		[HRM_Employees2].[C_CompanyID] AS HRM_Employees2_C_CompanyID,
		[HRM_Employees2].[C_DivisionID] AS HRM_Employees2_C_DivisionID,
		[HRM_Employees2].[C_OfficeID] AS HRM_Employees2_C_OfficeID,
		[HRM_Employees2].[C_DepartmentID] AS HRM_Employees2_C_DepartmentID,
		[HRM_Employees2].[C_DesignationID] AS HRM_Employees2_C_DesignationID,
		[HRM_Employees2].[ActiveState] AS HRM_Employees2_ActiveState 
  FROM [HRM_EmployeeEMailGroup] 
    	INNER JOIN #PageIndex
          ON [HRM_EmployeeEMailGroup].[CardNo] = #PageIndex.CardNo
          AND [HRM_EmployeeEMailGroup].[EMailGroup] = #PageIndex.EMailGroup
  INNER JOIN [HRM_EMailGroups] AS [HRM_EMailGroups1]
    ON [HRM_EmployeeEMailGroup].[EMailGroup] = [HRM_EMailGroups1].[EMailGroup]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_EmployeeEMailGroup].[CardNo] = [HRM_Employees2].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
