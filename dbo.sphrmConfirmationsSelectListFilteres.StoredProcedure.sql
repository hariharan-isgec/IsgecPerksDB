USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmConfirmationsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @Confirmed Bit,
  @ActiveState Bit,
  @Freezed Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  CardNo NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (CardNo) ' + 
               'SELECT [HRM_Employees].[CardNo] FROM [HRM_Employees] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies1].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions2].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices3]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices3].[OfficeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments4]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments4].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects5]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_ProjectSiteID] = [DCM_Projects5].[ProjectCode]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations6]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations6].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Status] AS [HRM_Status7]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_StatusID] = [HRM_Status7].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_JoiningStates] AS [HRM_JoiningStates8]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_JoinngStateID] = [HRM_JoiningStates8].[JoiningStateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users9]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users9].[UserName]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[Confirmed] = ''' + CONVERT(NVarChar(10), @Confirmed) + ''''
  SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[ActiveState] = ''' + CONVERT(NVarChar(10), @ActiveState) + ''''
  SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[Freezed] = ''' + CONVERT(NVarChar(10), @Freezed) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CardNo' THEN '[HRM_Employees].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_Employees].[CardNo] DESC'
                        WHEN 'EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[HRM_Employees].[EmployeeName] DESC'
                        WHEN 'C_DateOfJoining' THEN '[HRM_Employees].[C_DateOfJoining]'
                        WHEN 'C_DateOfJoining DESC' THEN '[HRM_Employees].[C_DateOfJoining] DESC'
                        WHEN 'C_CompanyID' THEN '[HRM_Employees].[C_CompanyID]'
                        WHEN 'C_CompanyID DESC' THEN '[HRM_Employees].[C_CompanyID] DESC'
                        WHEN 'C_DivisionID' THEN '[HRM_Employees].[C_DivisionID]'
                        WHEN 'C_DivisionID DESC' THEN '[HRM_Employees].[C_DivisionID] DESC'
                        WHEN 'C_OfficeID' THEN '[HRM_Employees].[C_OfficeID]'
                        WHEN 'C_OfficeID DESC' THEN '[HRM_Employees].[C_OfficeID] DESC'
                        WHEN 'C_DepartmentID' THEN '[HRM_Employees].[C_DepartmentID]'
                        WHEN 'C_DepartmentID DESC' THEN '[HRM_Employees].[C_DepartmentID] DESC'
                        WHEN 'C_ProjectSiteID' THEN '[HRM_Employees].[C_ProjectSiteID]'
                        WHEN 'C_ProjectSiteID DESC' THEN '[HRM_Employees].[C_ProjectSiteID] DESC'
                        WHEN 'C_DesignationID' THEN '[HRM_Employees].[C_DesignationID]'
                        WHEN 'C_DesignationID DESC' THEN '[HRM_Employees].[C_DesignationID] DESC'
                        WHEN 'C_BasicSalary' THEN '[HRM_Employees].[C_BasicSalary]'
                        WHEN 'C_BasicSalary DESC' THEN '[HRM_Employees].[C_BasicSalary] DESC'
                        WHEN 'C_StatusID' THEN '[HRM_Employees].[C_StatusID]'
                        WHEN 'C_StatusID DESC' THEN '[HRM_Employees].[C_StatusID] DESC'
                        WHEN 'C_StatusRemark' THEN '[HRM_Employees].[C_StatusRemark]'
                        WHEN 'C_StatusRemark DESC' THEN '[HRM_Employees].[C_StatusRemark] DESC'
                        WHEN 'C_JoinngStateID' THEN '[HRM_Employees].[C_JoinngStateID]'
                        WHEN 'C_JoinngStateID DESC' THEN '[HRM_Employees].[C_JoinngStateID] DESC'
                        WHEN 'Confirmed' THEN '[HRM_Employees].[Confirmed]'
                        WHEN 'Confirmed DESC' THEN '[HRM_Employees].[Confirmed] DESC'
                        WHEN 'C_ConfirmedOn' THEN '[HRM_Employees].[C_ConfirmedOn]'
                        WHEN 'C_ConfirmedOn DESC' THEN '[HRM_Employees].[C_ConfirmedOn] DESC'
                        WHEN 'C_ConfirmationRemark' THEN '[HRM_Employees].[C_ConfirmationRemark]'
                        WHEN 'C_ConfirmationRemark DESC' THEN '[HRM_Employees].[C_ConfirmationRemark] DESC'
                        WHEN 'ActiveState' THEN '[HRM_Employees].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[HRM_Employees].[ActiveState] DESC'
                        WHEN 'Freezed' THEN '[HRM_Employees].[Freezed]'
                        WHEN 'Freezed DESC' THEN '[HRM_Employees].[Freezed] DESC'
                        WHEN 'ModifiedBy' THEN '[HRM_Employees].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[HRM_Employees].[ModifiedBy] DESC'
                        WHEN 'ModifiedOn' THEN '[HRM_Employees].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[HRM_Employees].[ModifiedOn] DESC'
                        WHEN 'ModifiedEvent' THEN '[HRM_Employees].[ModifiedEvent]'
                        WHEN 'ModifiedEvent DESC' THEN '[HRM_Employees].[ModifiedEvent] DESC'
                        WHEN 'HRM_Companies1_CompanyID' THEN '[HRM_Companies1].[CompanyID]'
                        WHEN 'HRM_Companies1_CompanyID DESC' THEN '[HRM_Companies1].[CompanyID] DESC'
                        WHEN 'HRM_Companies1_Description' THEN '[HRM_Companies1].[Description]'
                        WHEN 'HRM_Companies1_Description DESC' THEN '[HRM_Companies1].[Description] DESC'
                        WHEN 'HRM_Companies1_ShortName' THEN '[HRM_Companies1].[ShortName]'
                        WHEN 'HRM_Companies1_ShortName DESC' THEN '[HRM_Companies1].[ShortName] DESC'
                        WHEN 'HRM_Companies1_BaaNID' THEN '[HRM_Companies1].[BaaNID]'
                        WHEN 'HRM_Companies1_BaaNID DESC' THEN '[HRM_Companies1].[BaaNID] DESC'
                        WHEN 'HRM_Divisions2_DivisionID' THEN '[HRM_Divisions2].[DivisionID]'
                        WHEN 'HRM_Divisions2_DivisionID DESC' THEN '[HRM_Divisions2].[DivisionID] DESC'
                        WHEN 'HRM_Divisions2_Description' THEN '[HRM_Divisions2].[Description]'
                        WHEN 'HRM_Divisions2_Description DESC' THEN '[HRM_Divisions2].[Description] DESC'
                        WHEN 'HRM_Offices3_OfficeID' THEN '[HRM_Offices3].[OfficeID]'
                        WHEN 'HRM_Offices3_OfficeID DESC' THEN '[HRM_Offices3].[OfficeID] DESC'
                        WHEN 'HRM_Offices3_Description' THEN '[HRM_Offices3].[Description]'
                        WHEN 'HRM_Offices3_Description DESC' THEN '[HRM_Offices3].[Description] DESC'
                        WHEN 'HRM_Offices3_Address' THEN '[HRM_Offices3].[Address]'
                        WHEN 'HRM_Offices3_Address DESC' THEN '[HRM_Offices3].[Address] DESC'
                        WHEN 'HRM_Offices3_City' THEN '[HRM_Offices3].[City]'
                        WHEN 'HRM_Offices3_City DESC' THEN '[HRM_Offices3].[City] DESC'
                        WHEN 'HRM_Departments4_DepartmentID' THEN '[HRM_Departments4].[DepartmentID]'
                        WHEN 'HRM_Departments4_DepartmentID DESC' THEN '[HRM_Departments4].[DepartmentID] DESC'
                        WHEN 'HRM_Departments4_Description' THEN '[HRM_Departments4].[Description]'
                        WHEN 'HRM_Departments4_Description DESC' THEN '[HRM_Departments4].[Description] DESC'
                        WHEN 'DCM_Projects5_ProjectCode' THEN '[DCM_Projects5].[ProjectCode]'
                        WHEN 'DCM_Projects5_ProjectCode DESC' THEN '[DCM_Projects5].[ProjectCode] DESC'
                        WHEN 'DCM_Projects5_Description' THEN '[DCM_Projects5].[Description]'
                        WHEN 'DCM_Projects5_Description DESC' THEN '[DCM_Projects5].[Description] DESC'
                        WHEN 'HRM_Designations6_DesignationID' THEN '[HRM_Designations6].[DesignationID]'
                        WHEN 'HRM_Designations6_DesignationID DESC' THEN '[HRM_Designations6].[DesignationID] DESC'
                        WHEN 'HRM_Designations6_Description' THEN '[HRM_Designations6].[Description]'
                        WHEN 'HRM_Designations6_Description DESC' THEN '[HRM_Designations6].[Description] DESC'
                        WHEN 'HRM_Designations6_ShortName' THEN '[HRM_Designations6].[ShortName]'
                        WHEN 'HRM_Designations6_ShortName DESC' THEN '[HRM_Designations6].[ShortName] DESC'
                        WHEN 'HRM_Designations6_Sequence' THEN '[HRM_Designations6].[Sequence]'
                        WHEN 'HRM_Designations6_Sequence DESC' THEN '[HRM_Designations6].[Sequence] DESC'
                        WHEN 'HRM_Status7_StatusID' THEN '[HRM_Status7].[StatusID]'
                        WHEN 'HRM_Status7_StatusID DESC' THEN '[HRM_Status7].[StatusID] DESC'
                        WHEN 'HRM_Status7_Description' THEN '[HRM_Status7].[Description]'
                        WHEN 'HRM_Status7_Description DESC' THEN '[HRM_Status7].[Description] DESC'
                        WHEN 'HRM_Status7_Sequence' THEN '[HRM_Status7].[Sequence]'
                        WHEN 'HRM_Status7_Sequence DESC' THEN '[HRM_Status7].[Sequence] DESC'
                        WHEN 'HRM_JoiningStates8_JoiningStateID' THEN '[HRM_JoiningStates8].[JoiningStateID]'
                        WHEN 'HRM_JoiningStates8_JoiningStateID DESC' THEN '[HRM_JoiningStates8].[JoiningStateID] DESC'
                        WHEN 'HRM_JoiningStates8_Description' THEN '[HRM_JoiningStates8].[Description]'
                        WHEN 'HRM_JoiningStates8_Description DESC' THEN '[HRM_JoiningStates8].[Description] DESC'
                        WHEN 'aspnet_Users9_UserName' THEN '[aspnet_Users9].[UserName]'
                        WHEN 'aspnet_Users9_UserName DESC' THEN '[aspnet_Users9].[UserName] DESC'
                        WHEN 'aspnet_Users9_UserFullName' THEN '[aspnet_Users9].[UserFullName]'
                        WHEN 'aspnet_Users9_UserFullName DESC' THEN '[aspnet_Users9].[UserFullName] DESC'
                        ELSE '[HRM_Employees].[CardNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[C_DateOfJoining],
		[HRM_Employees].[C_CompanyID],
		[HRM_Employees].[C_DivisionID],
		[HRM_Employees].[C_OfficeID],
		[HRM_Employees].[C_DepartmentID],
		[HRM_Employees].[C_ProjectSiteID],
		[HRM_Employees].[C_DesignationID],
		[HRM_Employees].[C_BasicSalary],
		[HRM_Employees].[C_StatusID],
		[HRM_Employees].[C_StatusRemark],
		[HRM_Employees].[C_JoinngStateID],
		[HRM_Employees].[Confirmed],
		[HRM_Employees].[C_ConfirmedOn],
		[HRM_Employees].[C_ConfirmationRemark],
		[HRM_Employees].[ActiveState],
		[HRM_Employees].[Freezed],
		[HRM_Employees].[ModifiedBy],
		[HRM_Employees].[ModifiedOn],
		[HRM_Employees].[ModifiedEvent],
		[HRM_Companies1].[CompanyID] AS HRM_Companies1_CompanyID,
		[HRM_Companies1].[Description] AS HRM_Companies1_Description,
		[HRM_Companies1].[ShortName] AS HRM_Companies1_ShortName,
		[HRM_Companies1].[BaaNID] AS HRM_Companies1_BaaNID,
		[HRM_Divisions2].[DivisionID] AS HRM_Divisions2_DivisionID,
		[HRM_Divisions2].[Description] AS HRM_Divisions2_Description,
		[HRM_Offices3].[OfficeID] AS HRM_Offices3_OfficeID,
		[HRM_Offices3].[Description] AS HRM_Offices3_Description,
		[HRM_Offices3].[Address] AS HRM_Offices3_Address,
		[HRM_Offices3].[City] AS HRM_Offices3_City,
		[HRM_Departments4].[DepartmentID] AS HRM_Departments4_DepartmentID,
		[HRM_Departments4].[Description] AS HRM_Departments4_Description,
		[DCM_Projects5].[ProjectCode] AS DCM_Projects5_ProjectCode,
		[DCM_Projects5].[Description] AS DCM_Projects5_Description,
		[HRM_Designations6].[DesignationID] AS HRM_Designations6_DesignationID,
		[HRM_Designations6].[Description] AS HRM_Designations6_Description,
		[HRM_Designations6].[ShortName] AS HRM_Designations6_ShortName,
		[HRM_Designations6].[Sequence] AS HRM_Designations6_Sequence,
		[HRM_Status7].[StatusID] AS HRM_Status7_StatusID,
		[HRM_Status7].[Description] AS HRM_Status7_Description,
		[HRM_Status7].[Sequence] AS HRM_Status7_Sequence,
		[HRM_JoiningStates8].[JoiningStateID] AS HRM_JoiningStates8_JoiningStateID,
		[HRM_JoiningStates8].[Description] AS HRM_JoiningStates8_Description,
		[aspnet_Users9].[UserName] AS aspnet_Users9_UserName,
		[aspnet_Users9].[UserFullName] AS aspnet_Users9_UserFullName 
  FROM [HRM_Employees] 
    	INNER JOIN #PageIndex
          ON [HRM_Employees].[CardNo] = #PageIndex.CardNo
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies1]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies1].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions2]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions2].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices3]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices3].[OfficeID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments4]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments4].[DepartmentID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects5]
    ON [HRM_Employees].[C_ProjectSiteID] = [DCM_Projects5].[ProjectCode]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations6]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations6].[DesignationID]
  LEFT OUTER JOIN [HRM_Status] AS [HRM_Status7]
    ON [HRM_Employees].[C_StatusID] = [HRM_Status7].[StatusID]
  LEFT OUTER JOIN [HRM_JoiningStates] AS [HRM_JoiningStates8]
    ON [HRM_Employees].[C_JoinngStateID] = [HRM_JoiningStates8].[JoiningStateID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users9]
    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users9].[UserName]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
