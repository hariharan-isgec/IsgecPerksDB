USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrm_LG_SiteTransfersHistorySelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @Executed Bit,
  @Cancelled Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  TransferID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (TransferID) ' + 
               'SELECT [HRM_Transfers].[TransferID] FROM [HRM_Transfers] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Transfers].[CardNo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Companies] AS [HRM_Companies2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Transfers].[CompanyID] = [HRM_Companies2].[CompanyID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Divisions] AS [HRM_Divisions3]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Transfers].[DivisionID] = [HRM_Divisions3].[DivisionID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Offices] AS [HRM_Offices4]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Transfers].[OfficeID] = [HRM_Offices4].[OfficeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Departments] AS [HRM_Departments5]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Transfers].[DepartmentID] = [HRM_Departments5].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Transfers].[ProcessedBy] = [HRM_Employees6].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE [HRM_Employees1].[C_OfficeID] = 6 '
  SET @LGSQL = @LGSQL + ' AND [HRM_Transfers].[Executed] = ''' + CONVERT(NVarChar(10), @Executed) + ''''
  SET @LGSQL = @LGSQL + ' AND [HRM_Transfers].[Cancelled] = ''' + CONVERT(NVarChar(10), @Cancelled) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TransferID' THEN '[HRM_Transfers].[TransferID]'
                        WHEN 'TransferID DESC' THEN '[HRM_Transfers].[TransferID] DESC'
                        WHEN 'CardNo' THEN '[HRM_Transfers].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_Transfers].[CardNo] DESC'
                        WHEN 'CompanyID' THEN '[HRM_Transfers].[CompanyID]'
                        WHEN 'CompanyID DESC' THEN '[HRM_Transfers].[CompanyID] DESC'
                        WHEN 'DivisionID' THEN '[HRM_Transfers].[DivisionID]'
                        WHEN 'DivisionID DESC' THEN '[HRM_Transfers].[DivisionID] DESC'
                        WHEN 'OfficeID' THEN '[HRM_Transfers].[OfficeID]'
                        WHEN 'OfficeID DESC' THEN '[HRM_Transfers].[OfficeID] DESC'
                        WHEN 'DepartmentID' THEN '[HRM_Transfers].[DepartmentID]'
                        WHEN 'DepartmentID DESC' THEN '[HRM_Transfers].[DepartmentID] DESC'
                        WHEN 'ProjectSiteID' THEN '[HRM_Transfers].[ProjectSiteID]'
                        WHEN 'ProjectSiteID DESC' THEN '[HRM_Transfers].[ProjectSiteID] DESC'
                        WHEN 'TransferedOn' THEN '[HRM_Transfers].[TransferedOn]'
                        WHEN 'TransferedOn DESC' THEN '[HRM_Transfers].[TransferedOn] DESC'
                        WHEN 'Remarks' THEN '[HRM_Transfers].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[HRM_Transfers].[Remarks] DESC'
                        WHEN 'ActiveState' THEN '[HRM_Transfers].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[HRM_Transfers].[ActiveState] DESC'
                        WHEN 'Executed' THEN '[HRM_Transfers].[Executed]'
                        WHEN 'Executed DESC' THEN '[HRM_Transfers].[Executed] DESC'
                        WHEN 'Cancelled' THEN '[HRM_Transfers].[Cancelled]'
                        WHEN 'Cancelled DESC' THEN '[HRM_Transfers].[Cancelled] DESC'
                        WHEN 'ProcessedBy' THEN '[HRM_Transfers].[ProcessedBy]'
                        WHEN 'ProcessedBy DESC' THEN '[HRM_Transfers].[ProcessedBy] DESC'
                        WHEN 'ProcessedOn' THEN '[HRM_Transfers].[ProcessedOn]'
                        WHEN 'ProcessedOn DESC' THEN '[HRM_Transfers].[ProcessedOn] DESC'
                        WHEN 'HRM_Employees1_CardNo' THEN '[HRM_Employees1].[CardNo]'
                        WHEN 'HRM_Employees1_CardNo DESC' THEN '[HRM_Employees1].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees1_C_DateOfJoining' THEN '[HRM_Employees1].[C_DateOfJoining]'
                        WHEN 'HRM_Employees1_C_DateOfJoining DESC' THEN '[HRM_Employees1].[C_DateOfJoining] DESC'
                        WHEN 'HRM_Employees1_C_CompanyID' THEN '[HRM_Employees1].[C_CompanyID]'
                        WHEN 'HRM_Employees1_C_CompanyID DESC' THEN '[HRM_Employees1].[C_CompanyID] DESC'
                        WHEN 'HRM_Employees1_C_DivisionID' THEN '[HRM_Employees1].[C_DivisionID]'
                        WHEN 'HRM_Employees1_C_DivisionID DESC' THEN '[HRM_Employees1].[C_DivisionID] DESC'
                        WHEN 'HRM_Employees1_C_OfficeID' THEN '[HRM_Employees1].[C_OfficeID]'
                        WHEN 'HRM_Employees1_C_OfficeID DESC' THEN '[HRM_Employees1].[C_OfficeID] DESC'
                        WHEN 'HRM_Employees1_C_DepartmentID' THEN '[HRM_Employees1].[C_DepartmentID]'
                        WHEN 'HRM_Employees1_C_DepartmentID DESC' THEN '[HRM_Employees1].[C_DepartmentID] DESC'
                        WHEN 'HRM_Employees1_C_ProjectSiteID' THEN '[HRM_Employees1].[C_ProjectSiteID]'
                        WHEN 'HRM_Employees1_C_ProjectSiteID DESC' THEN '[HRM_Employees1].[C_ProjectSiteID] DESC'
                        WHEN 'HRM_Employees1_C_DesignationID' THEN '[HRM_Employees1].[C_DesignationID]'
                        WHEN 'HRM_Employees1_C_DesignationID DESC' THEN '[HRM_Employees1].[C_DesignationID] DESC'
                        WHEN 'HRM_Employees1_ActiveState' THEN '[HRM_Employees1].[ActiveState]'
                        WHEN 'HRM_Employees1_ActiveState DESC' THEN '[HRM_Employees1].[ActiveState] DESC'
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
                        WHEN 'HRM_Employees6_CardNo' THEN '[HRM_Employees6].[CardNo]'
                        WHEN 'HRM_Employees6_CardNo DESC' THEN '[HRM_Employees6].[CardNo] DESC'
                        WHEN 'HRM_Employees6_EmployeeName' THEN '[HRM_Employees6].[EmployeeName]'
                        WHEN 'HRM_Employees6_EmployeeName DESC' THEN '[HRM_Employees6].[EmployeeName] DESC'
                        WHEN 'HRM_Employees6_C_DateOfJoining' THEN '[HRM_Employees6].[C_DateOfJoining]'
                        WHEN 'HRM_Employees6_C_DateOfJoining DESC' THEN '[HRM_Employees6].[C_DateOfJoining] DESC'
                        WHEN 'HRM_Employees6_C_CompanyID' THEN '[HRM_Employees6].[C_CompanyID]'
                        WHEN 'HRM_Employees6_C_CompanyID DESC' THEN '[HRM_Employees6].[C_CompanyID] DESC'
                        WHEN 'HRM_Employees6_C_DivisionID' THEN '[HRM_Employees6].[C_DivisionID]'
                        WHEN 'HRM_Employees6_C_DivisionID DESC' THEN '[HRM_Employees6].[C_DivisionID] DESC'
                        WHEN 'HRM_Employees6_C_OfficeID' THEN '[HRM_Employees6].[C_OfficeID]'
                        WHEN 'HRM_Employees6_C_OfficeID DESC' THEN '[HRM_Employees6].[C_OfficeID] DESC'
                        WHEN 'HRM_Employees6_C_DepartmentID' THEN '[HRM_Employees6].[C_DepartmentID]'
                        WHEN 'HRM_Employees6_C_DepartmentID DESC' THEN '[HRM_Employees6].[C_DepartmentID] DESC'
                        WHEN 'HRM_Employees6_C_ProjectSiteID' THEN '[HRM_Employees6].[C_ProjectSiteID]'
                        WHEN 'HRM_Employees6_C_ProjectSiteID DESC' THEN '[HRM_Employees6].[C_ProjectSiteID] DESC'
                        WHEN 'HRM_Employees6_C_DesignationID' THEN '[HRM_Employees6].[C_DesignationID]'
                        WHEN 'HRM_Employees6_C_DesignationID DESC' THEN '[HRM_Employees6].[C_DesignationID] DESC'
                        WHEN 'HRM_Employees6_ActiveState' THEN '[HRM_Employees6].[ActiveState]'
                        WHEN 'HRM_Employees6_ActiveState DESC' THEN '[HRM_Employees6].[ActiveState] DESC'
                        ELSE '[HRM_Transfers].[TransferID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Transfers].[TransferID],
		[HRM_Transfers].[CardNo],
		[HRM_Transfers].[CompanyID],
		[HRM_Transfers].[DivisionID],
		[HRM_Transfers].[OfficeID],
		[HRM_Transfers].[DepartmentID],
		[HRM_Transfers].[ProjectSiteID],
		[HRM_Transfers].[TransferedOn],
		[HRM_Transfers].[Remarks],
		[HRM_Transfers].[ActiveState],
		[HRM_Transfers].[Executed],
		[HRM_Transfers].[Cancelled],
		[HRM_Transfers].[ProcessedBy],
		[HRM_Transfers].[ProcessedOn],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees1].[C_DateOfJoining] AS HRM_Employees1_C_DateOfJoining,
		[HRM_Employees1].[C_CompanyID] AS HRM_Employees1_C_CompanyID,
		[HRM_Employees1].[C_DivisionID] AS HRM_Employees1_C_DivisionID,
		[HRM_Employees1].[C_OfficeID] AS HRM_Employees1_C_OfficeID,
		[HRM_Employees1].[C_DepartmentID] AS HRM_Employees1_C_DepartmentID,
		[HRM_Employees1].[C_ProjectSiteID] AS HRM_Employees1_C_ProjectSiteID,
		[HRM_Employees1].[C_DesignationID] AS HRM_Employees1_C_DesignationID,
		[HRM_Employees1].[ActiveState] AS HRM_Employees1_ActiveState,
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
		[HRM_Employees6].[CardNo] AS HRM_Employees6_CardNo,
		[HRM_Employees6].[EmployeeName] AS HRM_Employees6_EmployeeName,
		[HRM_Employees6].[C_DateOfJoining] AS HRM_Employees6_C_DateOfJoining,
		[HRM_Employees6].[C_CompanyID] AS HRM_Employees6_C_CompanyID,
		[HRM_Employees6].[C_DivisionID] AS HRM_Employees6_C_DivisionID,
		[HRM_Employees6].[C_OfficeID] AS HRM_Employees6_C_OfficeID,
		[HRM_Employees6].[C_DepartmentID] AS HRM_Employees6_C_DepartmentID,
		[HRM_Employees6].[C_ProjectSiteID] AS HRM_Employees6_C_ProjectSiteID,
		[HRM_Employees6].[C_DesignationID] AS HRM_Employees6_C_DesignationID,
		[HRM_Employees6].[ActiveState] AS HRM_Employees6_ActiveState 
  FROM [HRM_Transfers] 
    	INNER JOIN #PageIndex
          ON [HRM_Transfers].[TransferID] = #PageIndex.TransferID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Transfers].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [HRM_Companies] AS [HRM_Companies2]
    ON [HRM_Transfers].[CompanyID] = [HRM_Companies2].[CompanyID]
  INNER JOIN [HRM_Divisions] AS [HRM_Divisions3]
    ON [HRM_Transfers].[DivisionID] = [HRM_Divisions3].[DivisionID]
  INNER JOIN [HRM_Offices] AS [HRM_Offices4]
    ON [HRM_Transfers].[OfficeID] = [HRM_Offices4].[OfficeID]
  INNER JOIN [HRM_Departments] AS [HRM_Departments5]
    ON [HRM_Transfers].[DepartmentID] = [HRM_Departments5].[DepartmentID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]
    ON [HRM_Transfers].[ProcessedBy] = [HRM_Employees6].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
