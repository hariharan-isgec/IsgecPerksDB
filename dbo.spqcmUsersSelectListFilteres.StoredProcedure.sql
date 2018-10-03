USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmUsersSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @ActiveState Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,UserName NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UserName'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[aspnet_Users].[UserName]'
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
  SET @LGSQL = @LGSQL + ' AND [aspnet_Users].[ActiveState] = ''' + CONVERT(NVarChar(10), @ActiveState) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserName' THEN '[aspnet_Users].[UserName]'
                        WHEN 'UserName DESC' THEN '[aspnet_Users].[UserName] DESC'
                        WHEN 'UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'UserFullName DESC' THEN '[aspnet_Users].[UserFullName] DESC'
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
                        WHEN 'Contractual' THEN '[aspnet_Users].[Contractual]'
                        WHEN 'Contractual DESC' THEN '[aspnet_Users].[Contractual] DESC'
                        WHEN 'ActiveState' THEN '[aspnet_Users].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[aspnet_Users].[ActiveState] DESC'
                        WHEN 'MobileNo' THEN '[aspnet_Users].[MobileNo]'
                        WHEN 'MobileNo DESC' THEN '[aspnet_Users].[MobileNo] DESC'
                        WHEN 'EMailID' THEN '[aspnet_Users].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[aspnet_Users].[EMailID] DESC'
                        WHEN 'ExtnNo' THEN '[aspnet_Users].[ExtnNo]'
                        WHEN 'ExtnNo DESC' THEN '[aspnet_Users].[ExtnNo] DESC'
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
                        ELSE '[aspnet_Users].[UserName]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[aspnet_Users].[UserName] ,
		[aspnet_Users].[UserFullName] ,
		[aspnet_Users].[C_CompanyID] ,
		[aspnet_Users].[C_DivisionID] ,
		[aspnet_Users].[C_OfficeID] ,
		[aspnet_Users].[C_DepartmentID] ,
		[aspnet_Users].[C_DesignationID] ,
		[aspnet_Users].[Contractual] ,
		[aspnet_Users].[ActiveState] ,
		[aspnet_Users].[MobileNo] ,
		[aspnet_Users].[EMailID] ,
		[aspnet_Users].[ExtnNo] ,
		[HRM_Companies2].[Description] AS HRM_Companies2_Description,
		[HRM_Departments3].[Description] AS HRM_Departments3_Description,
		[HRM_Designations4].[Description] AS HRM_Designations4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Offices6].[Description] AS HRM_Offices6_Description 
  FROM [aspnet_Users] 
    	INNER JOIN #PageIndex
          ON [aspnet_Users].[UserName] = #PageIndex.UserName
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
