USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrm_LG_SiteTransfersSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @U_UnderTransfer Bit,
  @Resigned Bit,
  @ActiveState Bit,
  @Confirmed Bit,
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations1].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies2].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions3]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions3].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices4]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices4].[OfficeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments5]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments5].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects6]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_ProjectSiteID] = [DCM_Projects6].[ProjectCode]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies7]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_CompanyID] = [HRM_Companies7].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions8]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_DivisionID] = [HRM_Divisions8].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices9]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_OfficeID] = [HRM_Offices9].[OfficeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments10]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_DepartmentID] = [HRM_Departments10].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects11]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_ProjectSiteID] = [DCM_Projects11].[ProjectCode]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users12]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users12].[UserName]'
  SET @LGSQL = @LGSQL + '  WHERE [HRM_Employees].[C_OfficeID] = 6 '
  SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[U_UnderTransfer] = ''' + CONVERT(NVarChar(10), @U_UnderTransfer) + ''''
  SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[Resigned] = ''' + CONVERT(NVarChar(10), @Resigned) + ''''
  SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[ActiveState] = ''' + CONVERT(NVarChar(10), @ActiveState) + ''''
  --SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[Confirmed] = ''' + CONVERT(NVarChar(10), @Confirmed) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CardNo' THEN '[HRM_Employees].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_Employees].[CardNo] DESC'
                        WHEN 'EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[HRM_Employees].[EmployeeName] DESC'
                        WHEN 'C_DateOfJoining' THEN '[HRM_Employees].[C_DateOfJoining]'
                        WHEN 'C_DateOfJoining DESC' THEN '[HRM_Employees].[C_DateOfJoining] DESC'
                        WHEN 'C_DesignationID' THEN '[HRM_Employees].[C_DesignationID]'
                        WHEN 'C_DesignationID DESC' THEN '[HRM_Employees].[C_DesignationID] DESC'
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
                        WHEN 'U_UnderTransfer' THEN '[HRM_Employees].[U_UnderTransfer]'
                        WHEN 'U_UnderTransfer DESC' THEN '[HRM_Employees].[U_UnderTransfer] DESC'
                        WHEN 'U_CompanyID' THEN '[HRM_Employees].[U_CompanyID]'
                        WHEN 'U_CompanyID DESC' THEN '[HRM_Employees].[U_CompanyID] DESC'
                        WHEN 'U_DivisionID' THEN '[HRM_Employees].[U_DivisionID]'
                        WHEN 'U_DivisionID DESC' THEN '[HRM_Employees].[U_DivisionID] DESC'
                        WHEN 'U_OfficeID' THEN '[HRM_Employees].[U_OfficeID]'
                        WHEN 'U_OfficeID DESC' THEN '[HRM_Employees].[U_OfficeID] DESC'
                        WHEN 'U_DepartmentID' THEN '[HRM_Employees].[U_DepartmentID]'
                        WHEN 'U_DepartmentID DESC' THEN '[HRM_Employees].[U_DepartmentID] DESC'
                        WHEN 'U_ProjectSiteID' THEN '[HRM_Employees].[U_ProjectSiteID]'
                        WHEN 'U_ProjectSiteID DESC' THEN '[HRM_Employees].[U_ProjectSiteID] DESC'
                        WHEN 'U_ActiveState' THEN '[HRM_Employees].[U_ActiveState]'
                        WHEN 'U_ActiveState DESC' THEN '[HRM_Employees].[U_ActiveState] DESC'
                        WHEN 'C_TransferedOn' THEN '[HRM_Employees].[C_TransferedOn]'
                        WHEN 'C_TransferedOn DESC' THEN '[HRM_Employees].[C_TransferedOn] DESC'
                        WHEN 'C_TransferRemark' THEN '[HRM_Employees].[C_TransferRemark]'
                        WHEN 'C_TransferRemark DESC' THEN '[HRM_Employees].[C_TransferRemark] DESC'
                        WHEN 'Resigned' THEN '[HRM_Employees].[Resigned]'
                        WHEN 'Resigned DESC' THEN '[HRM_Employees].[Resigned] DESC'
                        WHEN 'ActiveState' THEN '[HRM_Employees].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[HRM_Employees].[ActiveState] DESC'
                        WHEN 'Confirmed' THEN '[HRM_Employees].[Confirmed]'
                        WHEN 'Confirmed DESC' THEN '[HRM_Employees].[Confirmed] DESC'
                        WHEN 'ModifiedBy' THEN '[HRM_Employees].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[HRM_Employees].[ModifiedBy] DESC'
                        WHEN 'ModifiedOn' THEN '[HRM_Employees].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[HRM_Employees].[ModifiedOn] DESC'
                        WHEN 'ModifiedEvent' THEN '[HRM_Employees].[ModifiedEvent]'
                        WHEN 'ModifiedEvent DESC' THEN '[HRM_Employees].[ModifiedEvent] DESC'
                        WHEN 'ActiveStateEventName' THEN '[HRM_Employees].[ActiveStateEventName]'
                        WHEN 'ActiveStateEventName DESC' THEN '[HRM_Employees].[ActiveStateEventName] DESC'
                        WHEN 'HRM_Designations1_DesignationID' THEN '[HRM_Designations1].[DesignationID]'
                        WHEN 'HRM_Designations1_DesignationID DESC' THEN '[HRM_Designations1].[DesignationID] DESC'
                        WHEN 'HRM_Designations1_Description' THEN '[HRM_Designations1].[Description]'
                        WHEN 'HRM_Designations1_Description DESC' THEN '[HRM_Designations1].[Description] DESC'
                        WHEN 'HRM_Designations1_ShortName' THEN '[HRM_Designations1].[ShortName]'
                        WHEN 'HRM_Designations1_ShortName DESC' THEN '[HRM_Designations1].[ShortName] DESC'
                        WHEN 'HRM_Designations1_Sequence' THEN '[HRM_Designations1].[Sequence]'
                        WHEN 'HRM_Designations1_Sequence DESC' THEN '[HRM_Designations1].[Sequence] DESC'
                        WHEN 'HRM_Companies2_CompanyID' THEN '[HRM_Companies2].[CompanyID]'
                        WHEN 'HRM_Companies2_CompanyID DESC' THEN '[HRM_Companies2].[CompanyID] DESC'
                        WHEN 'HRM_Companies2_Description' THEN '[HRM_Companies2].[Description]'
                        WHEN 'HRM_Companies2_Description DESC' THEN '[HRM_Companies2].[Description] DESC'
                        WHEN 'HRM_Companies2_ShortName' THEN '[HRM_Companies2].[ShortName]'
                        WHEN 'HRM_Companies2_ShortName DESC' THEN '[HRM_Companies2].[ShortName] DESC'
                        WHEN 'HRM_Companies2_BaaNID' THEN '[HRM_Companies2].[BaaNID]'
                        WHEN 'HRM_Companies2_BaaNID DESC' THEN '[HRM_Companies2].[BaaNID] DESC'
                        WHEN 'HRM_Divisions3_DivisionID' THEN '[HRM_Divisions3].[DivisionID]'
                        WHEN 'HRM_Divisions3_DivisionID DESC' THEN '[HRM_Divisions3].[DivisionID] DESC'
                        WHEN 'HRM_Divisions3_Description' THEN '[HRM_Divisions3].[Description]'
                        WHEN 'HRM_Divisions3_Description DESC' THEN '[HRM_Divisions3].[Description] DESC'
                        WHEN 'HRM_Offices4_OfficeID' THEN '[HRM_Offices4].[OfficeID]'
                        WHEN 'HRM_Offices4_OfficeID DESC' THEN '[HRM_Offices4].[OfficeID] DESC'
                        WHEN 'HRM_Offices4_Description' THEN '[HRM_Offices4].[Description]'
                        WHEN 'HRM_Offices4_Description DESC' THEN '[HRM_Offices4].[Description] DESC'
                        WHEN 'HRM_Offices4_Address' THEN '[HRM_Offices4].[Address]'
                        WHEN 'HRM_Offices4_Address DESC' THEN '[HRM_Offices4].[Address] DESC'
                        WHEN 'HRM_Offices4_City' THEN '[HRM_Offices4].[City]'
                        WHEN 'HRM_Offices4_City DESC' THEN '[HRM_Offices4].[City] DESC'
                        WHEN 'HRM_Departments5_DepartmentID' THEN '[HRM_Departments5].[DepartmentID]'
                        WHEN 'HRM_Departments5_DepartmentID DESC' THEN '[HRM_Departments5].[DepartmentID] DESC'
                        WHEN 'HRM_Departments5_Description' THEN '[HRM_Departments5].[Description]'
                        WHEN 'HRM_Departments5_Description DESC' THEN '[HRM_Departments5].[Description] DESC'
                        WHEN 'DCM_Projects6_ProjectCode' THEN '[DCM_Projects6].[ProjectCode]'
                        WHEN 'DCM_Projects6_ProjectCode DESC' THEN '[DCM_Projects6].[ProjectCode] DESC'
                        WHEN 'DCM_Projects6_Description' THEN '[DCM_Projects6].[Description]'
                        WHEN 'DCM_Projects6_Description DESC' THEN '[DCM_Projects6].[Description] DESC'
                        WHEN 'HRM_Companies7_CompanyID' THEN '[HRM_Companies7].[CompanyID]'
                        WHEN 'HRM_Companies7_CompanyID DESC' THEN '[HRM_Companies7].[CompanyID] DESC'
                        WHEN 'HRM_Companies7_Description' THEN '[HRM_Companies7].[Description]'
                        WHEN 'HRM_Companies7_Description DESC' THEN '[HRM_Companies7].[Description] DESC'
                        WHEN 'HRM_Companies7_ShortName' THEN '[HRM_Companies7].[ShortName]'
                        WHEN 'HRM_Companies7_ShortName DESC' THEN '[HRM_Companies7].[ShortName] DESC'
                        WHEN 'HRM_Companies7_BaaNID' THEN '[HRM_Companies7].[BaaNID]'
                        WHEN 'HRM_Companies7_BaaNID DESC' THEN '[HRM_Companies7].[BaaNID] DESC'
                        WHEN 'HRM_Divisions8_DivisionID' THEN '[HRM_Divisions8].[DivisionID]'
                        WHEN 'HRM_Divisions8_DivisionID DESC' THEN '[HRM_Divisions8].[DivisionID] DESC'
                        WHEN 'HRM_Divisions8_Description' THEN '[HRM_Divisions8].[Description]'
                        WHEN 'HRM_Divisions8_Description DESC' THEN '[HRM_Divisions8].[Description] DESC'
                        WHEN 'HRM_Offices9_OfficeID' THEN '[HRM_Offices9].[OfficeID]'
                        WHEN 'HRM_Offices9_OfficeID DESC' THEN '[HRM_Offices9].[OfficeID] DESC'
                        WHEN 'HRM_Offices9_Description' THEN '[HRM_Offices9].[Description]'
                        WHEN 'HRM_Offices9_Description DESC' THEN '[HRM_Offices9].[Description] DESC'
                        WHEN 'HRM_Offices9_Address' THEN '[HRM_Offices9].[Address]'
                        WHEN 'HRM_Offices9_Address DESC' THEN '[HRM_Offices9].[Address] DESC'
                        WHEN 'HRM_Offices9_City' THEN '[HRM_Offices9].[City]'
                        WHEN 'HRM_Offices9_City DESC' THEN '[HRM_Offices9].[City] DESC'
                        WHEN 'HRM_Departments10_DepartmentID' THEN '[HRM_Departments10].[DepartmentID]'
                        WHEN 'HRM_Departments10_DepartmentID DESC' THEN '[HRM_Departments10].[DepartmentID] DESC'
                        WHEN 'HRM_Departments10_Description' THEN '[HRM_Departments10].[Description]'
                        WHEN 'HRM_Departments10_Description DESC' THEN '[HRM_Departments10].[Description] DESC'
                        WHEN 'DCM_Projects11_ProjectCode' THEN '[DCM_Projects11].[ProjectCode]'
                        WHEN 'DCM_Projects11_ProjectCode DESC' THEN '[DCM_Projects11].[ProjectCode] DESC'
                        WHEN 'DCM_Projects11_Description' THEN '[DCM_Projects11].[Description]'
                        WHEN 'DCM_Projects11_Description DESC' THEN '[DCM_Projects11].[Description] DESC'
                        WHEN 'aspnet_Users12_UserName' THEN '[aspnet_Users12].[UserName]'
                        WHEN 'aspnet_Users12_UserName DESC' THEN '[aspnet_Users12].[UserName] DESC'
                        WHEN 'aspnet_Users12_UserFullName' THEN '[aspnet_Users12].[UserFullName]'
                        WHEN 'aspnet_Users12_UserFullName DESC' THEN '[aspnet_Users12].[UserFullName] DESC'
                        ELSE '[HRM_Employees].[CardNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[C_DateOfJoining],
		[HRM_Employees].[C_DesignationID],
		[HRM_Employees].[C_CompanyID],
		[HRM_Employees].[C_DivisionID],
		[HRM_Employees].[C_OfficeID],
		[HRM_Employees].[C_DepartmentID],
		[HRM_Employees].[C_ProjectSiteID],
		[HRM_Employees].[U_UnderTransfer],
		[HRM_Employees].[U_CompanyID],
		[HRM_Employees].[U_DivisionID],
		[HRM_Employees].[U_OfficeID],
		[HRM_Employees].[U_DepartmentID],
		[HRM_Employees].[U_ProjectSiteID],
		[HRM_Employees].[U_ActiveState],
		[HRM_Employees].[C_TransferedOn],
		[HRM_Employees].[C_TransferRemark],
		[HRM_Employees].[Resigned],
		[HRM_Employees].[ActiveState],
		[HRM_Employees].[Confirmed],
		[HRM_Employees].[ModifiedBy],
		[HRM_Employees].[ModifiedOn],
		[HRM_Employees].[ModifiedEvent],
		[HRM_Employees].[ActiveStateEventName],
		[HRM_Designations1].[DesignationID] AS HRM_Designations1_DesignationID,
		[HRM_Designations1].[Description] AS HRM_Designations1_Description,
		[HRM_Designations1].[ShortName] AS HRM_Designations1_ShortName,
		[HRM_Designations1].[Sequence] AS HRM_Designations1_Sequence,
		[HRM_Companies2].[CompanyID] AS HRM_Companies2_CompanyID,
		[HRM_Companies2].[Description] AS HRM_Companies2_Description,
		[HRM_Companies2].[ShortName] AS HRM_Companies2_ShortName,
		[HRM_Companies2].[BaaNID] AS HRM_Companies2_BaaNID,
		[HRM_Divisions3].[DivisionID] AS HRM_Divisions3_DivisionID,
		[HRM_Divisions3].[Description] AS HRM_Divisions3_Description,
		[HRM_Offices4].[OfficeID] AS HRM_Offices4_OfficeID,
		[HRM_Offices4].[Description] AS HRM_Offices4_Description,
		[HRM_Offices4].[Address] AS HRM_Offices4_Address,
		[HRM_Offices4].[City] AS HRM_Offices4_City,
		[HRM_Departments5].[DepartmentID] AS HRM_Departments5_DepartmentID,
		[HRM_Departments5].[Description] AS HRM_Departments5_Description,
		[DCM_Projects6].[ProjectCode] AS DCM_Projects6_ProjectCode,
		[DCM_Projects6].[Description] AS DCM_Projects6_Description,
		[HRM_Companies7].[CompanyID] AS HRM_Companies7_CompanyID,
		[HRM_Companies7].[Description] AS HRM_Companies7_Description,
		[HRM_Companies7].[ShortName] AS HRM_Companies7_ShortName,
		[HRM_Companies7].[BaaNID] AS HRM_Companies7_BaaNID,
		[HRM_Divisions8].[DivisionID] AS HRM_Divisions8_DivisionID,
		[HRM_Divisions8].[Description] AS HRM_Divisions8_Description,
		[HRM_Offices9].[OfficeID] AS HRM_Offices9_OfficeID,
		[HRM_Offices9].[Description] AS HRM_Offices9_Description,
		[HRM_Offices9].[Address] AS HRM_Offices9_Address,
		[HRM_Offices9].[City] AS HRM_Offices9_City,
		[HRM_Departments10].[DepartmentID] AS HRM_Departments10_DepartmentID,
		[HRM_Departments10].[Description] AS HRM_Departments10_Description,
		[DCM_Projects11].[ProjectCode] AS DCM_Projects11_ProjectCode,
		[DCM_Projects11].[Description] AS DCM_Projects11_Description,
		[aspnet_Users12].[UserName] AS aspnet_Users12_UserName,
		[aspnet_Users12].[UserFullName] AS aspnet_Users12_UserFullName 
  FROM [HRM_Employees] 
    	INNER JOIN #PageIndex
          ON [HRM_Employees].[CardNo] = #PageIndex.CardNo
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations1]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations1].[DesignationID]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies2]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies2].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions3]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions3].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices4]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices4].[OfficeID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments5]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments5].[DepartmentID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects6]
    ON [HRM_Employees].[C_ProjectSiteID] = [DCM_Projects6].[ProjectCode]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies7]
    ON [HRM_Employees].[U_CompanyID] = [HRM_Companies7].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions8]
    ON [HRM_Employees].[U_DivisionID] = [HRM_Divisions8].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices9]
    ON [HRM_Employees].[U_OfficeID] = [HRM_Offices9].[OfficeID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments10]
    ON [HRM_Employees].[U_DepartmentID] = [HRM_Departments10].[DepartmentID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects11]
    ON [HRM_Employees].[U_ProjectSiteID] = [DCM_Projects11].[ProjectCode]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users12]
    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users12].[UserName]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
