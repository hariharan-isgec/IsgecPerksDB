USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnEmployeesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @ActiveState Bit,
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[VerifierID] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[ApproverID] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies3]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies3].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions4].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices5]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices5].[OfficeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments6]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments6].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations7]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations7].[DesignationID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[ActiveState] = ''' + CONVERT(NVarChar(10), @ActiveState) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CardNo' THEN '[HRM_Employees].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_Employees].[CardNo] DESC'
                        WHEN 'EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[HRM_Employees].[EmployeeName] DESC'
                        WHEN 'VerificationRequired' THEN '[HRM_Employees].[VerificationRequired]'
                        WHEN 'VerificationRequired DESC' THEN '[HRM_Employees].[VerificationRequired] DESC'
                        WHEN 'VerifierID' THEN '[HRM_Employees].[VerifierID]'
                        WHEN 'VerifierID DESC' THEN '[HRM_Employees].[VerifierID] DESC'
                        WHEN 'ApprovalRequired' THEN '[HRM_Employees].[ApprovalRequired]'
                        WHEN 'ApprovalRequired DESC' THEN '[HRM_Employees].[ApprovalRequired] DESC'
                        WHEN 'ApproverID' THEN '[HRM_Employees].[ApproverID]'
                        WHEN 'ApproverID DESC' THEN '[HRM_Employees].[ApproverID] DESC'
                        WHEN 'C_DateOfJoining' THEN '[HRM_Employees].[C_DateOfJoining]'
                        WHEN 'C_DateOfJoining DESC' THEN '[HRM_Employees].[C_DateOfJoining] DESC'
                        WHEN 'C_DateOfReleaving' THEN '[HRM_Employees].[C_DateOfReleaving]'
                        WHEN 'C_DateOfReleaving DESC' THEN '[HRM_Employees].[C_DateOfReleaving] DESC'
                        WHEN 'C_CompanyID' THEN '[HRM_Employees].[C_CompanyID]'
                        WHEN 'C_CompanyID DESC' THEN '[HRM_Employees].[C_CompanyID] DESC'
                        WHEN 'C_DivisionID' THEN '[HRM_Employees].[C_DivisionID]'
                        WHEN 'C_DivisionID DESC' THEN '[HRM_Employees].[C_DivisionID] DESC'
                        WHEN 'C_OfficeID' THEN '[HRM_Employees].[C_OfficeID]'
                        WHEN 'C_OfficeID DESC' THEN '[HRM_Employees].[C_OfficeID] DESC'
                        WHEN 'C_DepartmentID' THEN '[HRM_Employees].[C_DepartmentID]'
                        WHEN 'C_DepartmentID DESC' THEN '[HRM_Employees].[C_DepartmentID] DESC'
                        WHEN 'C_DesignationID' THEN '[HRM_Employees].[C_DesignationID]'
                        WHEN 'C_DesignationID DESC' THEN '[HRM_Employees].[C_DesignationID] DESC'
                        WHEN 'ActiveState' THEN '[HRM_Employees].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[HRM_Employees].[ActiveState] DESC'
                        WHEN 'C_ConfirmedOn' THEN '[HRM_Employees].[C_ConfirmedOn]'
                        WHEN 'C_ConfirmedOn DESC' THEN '[HRM_Employees].[C_ConfirmedOn] DESC'
                        WHEN 'HRM_Employees1_CardNo' THEN '[HRM_Employees1].[CardNo]'
                        WHEN 'HRM_Employees1_CardNo DESC' THEN '[HRM_Employees1].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees1_VerificationRequired' THEN '[HRM_Employees1].[VerificationRequired]'
                        WHEN 'HRM_Employees1_VerificationRequired DESC' THEN '[HRM_Employees1].[VerificationRequired] DESC'
                        WHEN 'HRM_Employees1_VerifierID' THEN '[HRM_Employees1].[VerifierID]'
                        WHEN 'HRM_Employees1_VerifierID DESC' THEN '[HRM_Employees1].[VerifierID] DESC'
                        WHEN 'HRM_Employees1_ApprovalRequired' THEN '[HRM_Employees1].[ApprovalRequired]'
                        WHEN 'HRM_Employees1_ApprovalRequired DESC' THEN '[HRM_Employees1].[ApprovalRequired] DESC'
                        WHEN 'HRM_Employees1_ApproverID' THEN '[HRM_Employees1].[ApproverID]'
                        WHEN 'HRM_Employees1_ApproverID DESC' THEN '[HRM_Employees1].[ApproverID] DESC'
                        WHEN 'HRM_Employees1_C_DateOfJoining' THEN '[HRM_Employees1].[C_DateOfJoining]'
                        WHEN 'HRM_Employees1_C_DateOfJoining DESC' THEN '[HRM_Employees1].[C_DateOfJoining] DESC'
                        WHEN 'HRM_Employees1_C_DateOfReleaving' THEN '[HRM_Employees1].[C_DateOfReleaving]'
                        WHEN 'HRM_Employees1_C_DateOfReleaving DESC' THEN '[HRM_Employees1].[C_DateOfReleaving] DESC'
                        WHEN 'HRM_Employees1_C_CompanyID' THEN '[HRM_Employees1].[C_CompanyID]'
                        WHEN 'HRM_Employees1_C_CompanyID DESC' THEN '[HRM_Employees1].[C_CompanyID] DESC'
                        WHEN 'HRM_Employees1_C_DivisionID' THEN '[HRM_Employees1].[C_DivisionID]'
                        WHEN 'HRM_Employees1_C_DivisionID DESC' THEN '[HRM_Employees1].[C_DivisionID] DESC'
                        WHEN 'HRM_Employees1_C_OfficeID' THEN '[HRM_Employees1].[C_OfficeID]'
                        WHEN 'HRM_Employees1_C_OfficeID DESC' THEN '[HRM_Employees1].[C_OfficeID] DESC'
                        WHEN 'HRM_Employees1_C_DepartmentID' THEN '[HRM_Employees1].[C_DepartmentID]'
                        WHEN 'HRM_Employees1_C_DepartmentID DESC' THEN '[HRM_Employees1].[C_DepartmentID] DESC'
                        WHEN 'HRM_Employees1_C_DesignationID' THEN '[HRM_Employees1].[C_DesignationID]'
                        WHEN 'HRM_Employees1_C_DesignationID DESC' THEN '[HRM_Employees1].[C_DesignationID] DESC'
                        WHEN 'HRM_Employees1_ActiveState' THEN '[HRM_Employees1].[ActiveState]'
                        WHEN 'HRM_Employees1_ActiveState DESC' THEN '[HRM_Employees1].[ActiveState] DESC'
                        WHEN 'HRM_Employees1_C_ConfirmedOn' THEN '[HRM_Employees1].[C_ConfirmedOn]'
                        WHEN 'HRM_Employees1_C_ConfirmedOn DESC' THEN '[HRM_Employees1].[C_ConfirmedOn] DESC'
                        WHEN 'HRM_Employees2_CardNo' THEN '[HRM_Employees2].[CardNo]'
                        WHEN 'HRM_Employees2_CardNo DESC' THEN '[HRM_Employees2].[CardNo] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        WHEN 'HRM_Employees2_VerificationRequired' THEN '[HRM_Employees2].[VerificationRequired]'
                        WHEN 'HRM_Employees2_VerificationRequired DESC' THEN '[HRM_Employees2].[VerificationRequired] DESC'
                        WHEN 'HRM_Employees2_VerifierID' THEN '[HRM_Employees2].[VerifierID]'
                        WHEN 'HRM_Employees2_VerifierID DESC' THEN '[HRM_Employees2].[VerifierID] DESC'
                        WHEN 'HRM_Employees2_ApprovalRequired' THEN '[HRM_Employees2].[ApprovalRequired]'
                        WHEN 'HRM_Employees2_ApprovalRequired DESC' THEN '[HRM_Employees2].[ApprovalRequired] DESC'
                        WHEN 'HRM_Employees2_ApproverID' THEN '[HRM_Employees2].[ApproverID]'
                        WHEN 'HRM_Employees2_ApproverID DESC' THEN '[HRM_Employees2].[ApproverID] DESC'
                        WHEN 'HRM_Employees2_C_DateOfJoining' THEN '[HRM_Employees2].[C_DateOfJoining]'
                        WHEN 'HRM_Employees2_C_DateOfJoining DESC' THEN '[HRM_Employees2].[C_DateOfJoining] DESC'
                        WHEN 'HRM_Employees2_C_DateOfReleaving' THEN '[HRM_Employees2].[C_DateOfReleaving]'
                        WHEN 'HRM_Employees2_C_DateOfReleaving DESC' THEN '[HRM_Employees2].[C_DateOfReleaving] DESC'
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
                        WHEN 'HRM_Employees2_C_ConfirmedOn' THEN '[HRM_Employees2].[C_ConfirmedOn]'
                        WHEN 'HRM_Employees2_C_ConfirmedOn DESC' THEN '[HRM_Employees2].[C_ConfirmedOn] DESC'
                        WHEN 'HRM_Companies3_CompanyID' THEN '[HRM_Companies3].[CompanyID]'
                        WHEN 'HRM_Companies3_CompanyID DESC' THEN '[HRM_Companies3].[CompanyID] DESC'
                        WHEN 'HRM_Companies3_Description' THEN '[HRM_Companies3].[Description]'
                        WHEN 'HRM_Companies3_Description DESC' THEN '[HRM_Companies3].[Description] DESC'
                        WHEN 'HRM_Companies3_ShortName' THEN '[HRM_Companies3].[ShortName]'
                        WHEN 'HRM_Companies3_ShortName DESC' THEN '[HRM_Companies3].[ShortName] DESC'
                        WHEN 'HRM_Companies3_BaaNID' THEN '[HRM_Companies3].[BaaNID]'
                        WHEN 'HRM_Companies3_BaaNID DESC' THEN '[HRM_Companies3].[BaaNID] DESC'
                        WHEN 'HRM_Divisions4_DivisionID' THEN '[HRM_Divisions4].[DivisionID]'
                        WHEN 'HRM_Divisions4_DivisionID DESC' THEN '[HRM_Divisions4].[DivisionID] DESC'
                        WHEN 'HRM_Divisions4_Description' THEN '[HRM_Divisions4].[Description]'
                        WHEN 'HRM_Divisions4_Description DESC' THEN '[HRM_Divisions4].[Description] DESC'
                        WHEN 'HRM_Offices5_OfficeID' THEN '[HRM_Offices5].[OfficeID]'
                        WHEN 'HRM_Offices5_OfficeID DESC' THEN '[HRM_Offices5].[OfficeID] DESC'
                        WHEN 'HRM_Offices5_Description' THEN '[HRM_Offices5].[Description]'
                        WHEN 'HRM_Offices5_Description DESC' THEN '[HRM_Offices5].[Description] DESC'
                        WHEN 'HRM_Offices5_Address' THEN '[HRM_Offices5].[Address]'
                        WHEN 'HRM_Offices5_Address DESC' THEN '[HRM_Offices5].[Address] DESC'
                        WHEN 'HRM_Offices5_City' THEN '[HRM_Offices5].[City]'
                        WHEN 'HRM_Offices5_City DESC' THEN '[HRM_Offices5].[City] DESC'
                        WHEN 'HRM_Departments6_DepartmentID' THEN '[HRM_Departments6].[DepartmentID]'
                        WHEN 'HRM_Departments6_DepartmentID DESC' THEN '[HRM_Departments6].[DepartmentID] DESC'
                        WHEN 'HRM_Departments6_Description' THEN '[HRM_Departments6].[Description]'
                        WHEN 'HRM_Departments6_Description DESC' THEN '[HRM_Departments6].[Description] DESC'
                        WHEN 'HRM_Designations7_DesignationID' THEN '[HRM_Designations7].[DesignationID]'
                        WHEN 'HRM_Designations7_DesignationID DESC' THEN '[HRM_Designations7].[DesignationID] DESC'
                        WHEN 'HRM_Designations7_Description' THEN '[HRM_Designations7].[Description]'
                        WHEN 'HRM_Designations7_Description DESC' THEN '[HRM_Designations7].[Description] DESC'
                        WHEN 'HRM_Designations7_ShortName' THEN '[HRM_Designations7].[ShortName]'
                        WHEN 'HRM_Designations7_ShortName DESC' THEN '[HRM_Designations7].[ShortName] DESC'
                        WHEN 'HRM_Designations7_Sequence' THEN '[HRM_Designations7].[Sequence]'
                        WHEN 'HRM_Designations7_Sequence DESC' THEN '[HRM_Designations7].[Sequence] DESC'
                        ELSE '[HRM_Employees].[CardNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[VerificationRequired],
		[HRM_Employees].[VerifierID],
		[HRM_Employees].[ApprovalRequired],
		[HRM_Employees].[ApproverID],
		[HRM_Employees].[C_DateOfJoining],
		[HRM_Employees].[C_DateOfReleaving],
		[HRM_Employees].[C_CompanyID],
		[HRM_Employees].[C_DivisionID],
		[HRM_Employees].[C_OfficeID],
		[HRM_Employees].[C_DepartmentID],
		[HRM_Employees].[C_DesignationID],
		[HRM_Employees].[ActiveState],
		[HRM_Employees].[C_ConfirmedOn],
		[HRM_Employees].[C_ProjectSiteID],
		[HRM_Employees].[Contractual],
		[HRM_Employees].[CategoryID],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees1].[VerificationRequired] AS HRM_Employees1_VerificationRequired,
		[HRM_Employees1].[VerifierID] AS HRM_Employees1_VerifierID,
		[HRM_Employees1].[ApprovalRequired] AS HRM_Employees1_ApprovalRequired,
		[HRM_Employees1].[ApproverID] AS HRM_Employees1_ApproverID,
		[HRM_Employees1].[C_DateOfJoining] AS HRM_Employees1_C_DateOfJoining,
		[HRM_Employees1].[C_DateOfReleaving] AS HRM_Employees1_C_DateOfReleaving,
		[HRM_Employees1].[C_CompanyID] AS HRM_Employees1_C_CompanyID,
		[HRM_Employees1].[C_DivisionID] AS HRM_Employees1_C_DivisionID,
		[HRM_Employees1].[C_OfficeID] AS HRM_Employees1_C_OfficeID,
		[HRM_Employees1].[C_DepartmentID] AS HRM_Employees1_C_DepartmentID,
		[HRM_Employees1].[C_DesignationID] AS HRM_Employees1_C_DesignationID,
		[HRM_Employees1].[ActiveState] AS HRM_Employees1_ActiveState,
		[HRM_Employees1].[C_ConfirmedOn] AS HRM_Employees1_C_ConfirmedOn,
		[HRM_Employees2].[CardNo] AS HRM_Employees2_CardNo,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees2].[VerificationRequired] AS HRM_Employees2_VerificationRequired,
		[HRM_Employees2].[VerifierID] AS HRM_Employees2_VerifierID,
		[HRM_Employees2].[ApprovalRequired] AS HRM_Employees2_ApprovalRequired,
		[HRM_Employees2].[ApproverID] AS HRM_Employees2_ApproverID,
		[HRM_Employees2].[C_DateOfJoining] AS HRM_Employees2_C_DateOfJoining,
		[HRM_Employees2].[C_DateOfReleaving] AS HRM_Employees2_C_DateOfReleaving,
		[HRM_Employees2].[C_CompanyID] AS HRM_Employees2_C_CompanyID,
		[HRM_Employees2].[C_DivisionID] AS HRM_Employees2_C_DivisionID,
		[HRM_Employees2].[C_OfficeID] AS HRM_Employees2_C_OfficeID,
		[HRM_Employees2].[C_DepartmentID] AS HRM_Employees2_C_DepartmentID,
		[HRM_Employees2].[C_DesignationID] AS HRM_Employees2_C_DesignationID,
		[HRM_Employees2].[ActiveState] AS HRM_Employees2_ActiveState,
		[HRM_Employees2].[C_ConfirmedOn] AS HRM_Employees2_C_ConfirmedOn,
		[HRM_Companies3].[CompanyID] AS HRM_Companies3_CompanyID,
		[HRM_Companies3].[Description] AS HRM_Companies3_Description,
		[HRM_Companies3].[ShortName] AS HRM_Companies3_ShortName,
		[HRM_Companies3].[BaaNID] AS HRM_Companies3_BaaNID,
		[HRM_Divisions4].[DivisionID] AS HRM_Divisions4_DivisionID,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[HRM_Offices5].[OfficeID] AS HRM_Offices5_OfficeID,
		[HRM_Offices5].[Description] AS HRM_Offices5_Description,
		[HRM_Offices5].[Address] AS HRM_Offices5_Address,
		[HRM_Offices5].[City] AS HRM_Offices5_City,
		[HRM_Departments6].[DepartmentID] AS HRM_Departments6_DepartmentID,
		[HRM_Departments6].[Description] AS HRM_Departments6_Description,
		[HRM_Designations7].[DesignationID] AS HRM_Designations7_DesignationID,
		[HRM_Designations7].[Description] AS HRM_Designations7_Description,
		[HRM_Designations7].[ShortName] AS HRM_Designations7_ShortName,
		[HRM_Designations7].[Sequence] AS HRM_Designations7_Sequence 
  FROM [HRM_Employees] 
    	INNER JOIN #PageIndex
          ON [HRM_Employees].[CardNo] = #PageIndex.CardNo
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Employees].[VerifierID] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_Employees].[ApproverID] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies3]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies3].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices5]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices5].[OfficeID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments6]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments6].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations7]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations7].[DesignationID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
