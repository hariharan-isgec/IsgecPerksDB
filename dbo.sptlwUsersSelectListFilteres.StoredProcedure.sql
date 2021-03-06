USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwUsersSelectListFilteres]
  @Filter_C_CompanyID NVarChar(6),
  @Filter_C_DivisionID NVarChar(6),
  @Filter_C_OfficeID Int,
  @Filter_C_DepartmentID NVarChar(6),
  @Filter_C_DesignationID Int,
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
 ,LoginID NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'LoginID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[aspnet_Users].[LoginID]'
  SET @LGSQL = @LGSQL + ' FROM [aspnet_Users] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies2]'
  SET @LGSQL = @LGSQL + '    ON [aspnet_Users].[C_CompanyID] = [HRM_Companies2].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments3]'
  SET @LGSQL = @LGSQL + '    ON [aspnet_Users].[C_DepartmentID] = [HRM_Departments3].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations4]'
  SET @LGSQL = @LGSQL + '    ON [aspnet_Users].[C_DesignationID] = [HRM_Designations4].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]'
  SET @LGSQL = @LGSQL + '    ON [aspnet_Users].[C_DivisionID] = [HRM_Divisions5].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices6]'
  SET @LGSQL = @LGSQL + '    ON [aspnet_Users].[C_OfficeID] = [HRM_Offices6].[OfficeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_C_CompanyID > '') 
    SET @LGSQL = @LGSQL + ' AND [aspnet_Users].[C_CompanyID] = ''' + @Filter_C_CompanyID + ''''
  IF (@Filter_C_DivisionID > '') 
    SET @LGSQL = @LGSQL + ' AND [aspnet_Users].[C_DivisionID] = ''' + @Filter_C_DivisionID + ''''
  IF (@Filter_C_OfficeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [aspnet_Users].[C_OfficeID] = ' + STR(@Filter_C_OfficeID)
  IF (@Filter_C_DepartmentID > '') 
    SET @LGSQL = @LGSQL + ' AND [aspnet_Users].[C_DepartmentID] = ''' + @Filter_C_DepartmentID + ''''
  IF (@Filter_C_DesignationID > 0) 
    SET @LGSQL = @LGSQL + ' AND [aspnet_Users].[C_DesignationID] = ' + STR(@Filter_C_DesignationID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LoginID' THEN '[aspnet_Users].[LoginID]'
                        WHEN 'LoginID DESC' THEN '[aspnet_Users].[LoginID] DESC'
                        WHEN 'UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'UserFullName DESC' THEN '[aspnet_Users].[UserFullName] DESC'
                        WHEN 'ExtnNo' THEN '[aspnet_Users].[ExtnNo]'
                        WHEN 'ExtnNo DESC' THEN '[aspnet_Users].[ExtnNo] DESC'
                        WHEN 'MobileNo' THEN '[aspnet_Users].[MobileNo]'
                        WHEN 'MobileNo DESC' THEN '[aspnet_Users].[MobileNo] DESC'
                        WHEN 'EMailID' THEN '[aspnet_Users].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[aspnet_Users].[EMailID] DESC'
                        WHEN 'C_DateOfJoining' THEN '[aspnet_Users].[C_DateOfJoining]'
                        WHEN 'C_DateOfJoining DESC' THEN '[aspnet_Users].[C_DateOfJoining] DESC'
                        WHEN 'C_CompanyID' THEN '[aspnet_Users].[C_CompanyID]'
                        WHEN 'C_CompanyID DESC' THEN '[aspnet_Users].[C_CompanyID] DESC'
                        WHEN 'C_DivisionID' THEN '[aspnet_Users].[C_DivisionID]'
                        WHEN 'C_DivisionID DESC' THEN '[aspnet_Users].[C_DivisionID] DESC'
                        WHEN 'C_OfficeID' THEN '[aspnet_Users].[C_OfficeID]'
                        WHEN 'C_OfficeID DESC' THEN '[aspnet_Users].[C_OfficeID] DESC'
                        WHEN 'C_DepartmentID' THEN '[aspnet_Users].[C_DepartmentID]'
                        WHEN 'C_DepartmentID DESC' THEN '[aspnet_Users].[C_DepartmentID] DESC'
                        WHEN 'C_DesignationID' THEN '[aspnet_Users].[C_DesignationID]'
                        WHEN 'C_DesignationID DESC' THEN '[aspnet_Users].[C_DesignationID] DESC'
                        WHEN 'ActiveState' THEN '[aspnet_Users].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[aspnet_Users].[ActiveState] DESC'
                        WHEN 'Contractual' THEN '[aspnet_Users].[Contractual]'
                        WHEN 'Contractual DESC' THEN '[aspnet_Users].[Contractual] DESC'
                        WHEN 'wp_user' THEN '[aspnet_Users].[wp_user]'
                        WHEN 'wp_user DESC' THEN '[aspnet_Users].[wp_user] DESC'
                        WHEN 'pw' THEN '[aspnet_Users].[pw]'
                        WHEN 'pw DESC' THEN '[aspnet_Users].[pw] DESC'
                        WHEN 'HRM_Companies2_Description' THEN '[HRM_Companies2].[Description]'
                        WHEN 'HRM_Companies2_Description DESC' THEN '[HRM_Companies2].[Description] DESC'
                        WHEN 'HRM_Departments3_Description' THEN '[HRM_Departments3].[Description]'
                        WHEN 'HRM_Departments3_Description DESC' THEN '[HRM_Departments3].[Description] DESC'
                        WHEN 'HRM_Designations4_Description' THEN '[HRM_Designations4].[Description]'
                        WHEN 'HRM_Designations4_Description DESC' THEN '[HRM_Designations4].[Description] DESC'
                        WHEN 'HRM_Divisions5_Description' THEN '[HRM_Divisions5].[Description]'
                        WHEN 'HRM_Divisions5_Description DESC' THEN '[HRM_Divisions5].[Description] DESC'
                        WHEN 'HRM_Offices6_Description' THEN '[HRM_Offices6].[Description]'
                        WHEN 'HRM_Offices6_Description DESC' THEN '[HRM_Offices6].[Description] DESC'
                        ELSE '[aspnet_Users].[LoginID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [aspnet_Users].* ,
    [HRM_Companies2].[Description] AS HRM_Companies2_Description,
    [HRM_Departments3].[Description] AS HRM_Departments3_Description,
    [HRM_Designations4].[Description] AS HRM_Designations4_Description,
    [HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
    [HRM_Offices6].[Description] AS HRM_Offices6_Description 
  FROM [aspnet_Users] 
      INNER JOIN #PageIndex
          ON [aspnet_Users].[LoginID] = #PageIndex.LoginID
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies2]
    ON [aspnet_Users].[C_CompanyID] = [HRM_Companies2].[CompanyID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments3]
    ON [aspnet_Users].[C_DepartmentID] = [HRM_Departments3].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations4]
    ON [aspnet_Users].[C_DesignationID] = [HRM_Designations4].[DesignationID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [aspnet_Users].[C_DivisionID] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices6]
    ON [aspnet_Users].[C_OfficeID] = [HRM_Offices6].[OfficeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
