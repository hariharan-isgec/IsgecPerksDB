USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnEmployeesSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @ActiveState Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  CardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (CardNo)
  SELECT [HRM_Employees].[CardNo] FROM [HRM_Employees]
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
      [HRM_Employees].[ActiveState] = @ActiveState
   AND ( 
         LOWER(ISNULL([HRM_Employees].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[VerifierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ApproverID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_ProjectSiteID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[VerifierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[ApproverID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[VerifierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[ApproverID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees2].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees2].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies3].[CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies3].[ShortName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies3].[BaaNID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Divisions4].[DivisionID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Divisions4].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices5].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices5].[Address],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices5].[City],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments6].[DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments6].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Designations7].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Designations7].[ShortName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Designations7].[Sequence], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CardNo' THEN [HRM_Employees].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_Employees].[CardNo] END DESC,
     CASE @orderBy WHEN 'EmployeeName' THEN [HRM_Employees].[EmployeeName] END,
     CASE @orderBy WHEN 'EmployeeName DESC' THEN [HRM_Employees].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'VerificationRequired' THEN [HRM_Employees].[VerificationRequired] END,
     CASE @orderBy WHEN 'VerificationRequired DESC' THEN [HRM_Employees].[VerificationRequired] END DESC,
     CASE @orderBy WHEN 'VerifierID' THEN [HRM_Employees].[VerifierID] END,
     CASE @orderBy WHEN 'VerifierID DESC' THEN [HRM_Employees].[VerifierID] END DESC,
     CASE @orderBy WHEN 'ApprovalRequired' THEN [HRM_Employees].[ApprovalRequired] END,
     CASE @orderBy WHEN 'ApprovalRequired DESC' THEN [HRM_Employees].[ApprovalRequired] END DESC,
     CASE @orderBy WHEN 'ApproverID' THEN [HRM_Employees].[ApproverID] END,
     CASE @orderBy WHEN 'ApproverID DESC' THEN [HRM_Employees].[ApproverID] END DESC,
     CASE @orderBy WHEN 'C_DateOfJoining' THEN [HRM_Employees].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'C_DateOfJoining DESC' THEN [HRM_Employees].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'C_DateOfReleaving' THEN [HRM_Employees].[C_DateOfReleaving] END,
     CASE @orderBy WHEN 'C_DateOfReleaving DESC' THEN [HRM_Employees].[C_DateOfReleaving] END DESC,
     CASE @orderBy WHEN 'C_CompanyID' THEN [HRM_Employees].[C_CompanyID] END,
     CASE @orderBy WHEN 'C_CompanyID DESC' THEN [HRM_Employees].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'C_DivisionID' THEN [HRM_Employees].[C_DivisionID] END,
     CASE @orderBy WHEN 'C_DivisionID DESC' THEN [HRM_Employees].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'C_OfficeID' THEN [HRM_Employees].[C_OfficeID] END,
     CASE @orderBy WHEN 'C_OfficeID DESC' THEN [HRM_Employees].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'C_DepartmentID' THEN [HRM_Employees].[C_DepartmentID] END,
     CASE @orderBy WHEN 'C_DepartmentID DESC' THEN [HRM_Employees].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'C_DesignationID' THEN [HRM_Employees].[C_DesignationID] END,
     CASE @orderBy WHEN 'C_DesignationID DESC' THEN [HRM_Employees].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'ActiveState' THEN [HRM_Employees].[ActiveState] END,
     CASE @orderBy WHEN 'ActiveState DESC' THEN [HRM_Employees].[ActiveState] END DESC,
     CASE @orderBy WHEN 'C_ConfirmedOn' THEN [HRM_Employees].[C_ConfirmedOn] END,
     CASE @orderBy WHEN 'C_ConfirmedOn DESC' THEN [HRM_Employees].[C_ConfirmedOn] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo' THEN [HRM_Employees1].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo DESC' THEN [HRM_Employees1].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_VerificationRequired' THEN [HRM_Employees1].[VerificationRequired] END,
     CASE @orderBy WHEN 'HRM_Employees1_VerificationRequired DESC' THEN [HRM_Employees1].[VerificationRequired] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_VerifierID' THEN [HRM_Employees1].[VerifierID] END,
     CASE @orderBy WHEN 'HRM_Employees1_VerifierID DESC' THEN [HRM_Employees1].[VerifierID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_ApprovalRequired' THEN [HRM_Employees1].[ApprovalRequired] END,
     CASE @orderBy WHEN 'HRM_Employees1_ApprovalRequired DESC' THEN [HRM_Employees1].[ApprovalRequired] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_ApproverID' THEN [HRM_Employees1].[ApproverID] END,
     CASE @orderBy WHEN 'HRM_Employees1_ApproverID DESC' THEN [HRM_Employees1].[ApproverID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DateOfJoining' THEN [HRM_Employees1].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DateOfJoining DESC' THEN [HRM_Employees1].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DateOfReleaving' THEN [HRM_Employees1].[C_DateOfReleaving] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DateOfReleaving DESC' THEN [HRM_Employees1].[C_DateOfReleaving] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_CompanyID' THEN [HRM_Employees1].[C_CompanyID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_CompanyID DESC' THEN [HRM_Employees1].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DivisionID' THEN [HRM_Employees1].[C_DivisionID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DivisionID DESC' THEN [HRM_Employees1].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_OfficeID' THEN [HRM_Employees1].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_OfficeID DESC' THEN [HRM_Employees1].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DepartmentID' THEN [HRM_Employees1].[C_DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DepartmentID DESC' THEN [HRM_Employees1].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DesignationID' THEN [HRM_Employees1].[C_DesignationID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DesignationID DESC' THEN [HRM_Employees1].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_ActiveState' THEN [HRM_Employees1].[ActiveState] END,
     CASE @orderBy WHEN 'HRM_Employees1_ActiveState DESC' THEN [HRM_Employees1].[ActiveState] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_ConfirmedOn' THEN [HRM_Employees1].[C_ConfirmedOn] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_ConfirmedOn DESC' THEN [HRM_Employees1].[C_ConfirmedOn] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo' THEN [HRM_Employees2].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo DESC' THEN [HRM_Employees2].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_VerificationRequired' THEN [HRM_Employees2].[VerificationRequired] END,
     CASE @orderBy WHEN 'HRM_Employees2_VerificationRequired DESC' THEN [HRM_Employees2].[VerificationRequired] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_VerifierID' THEN [HRM_Employees2].[VerifierID] END,
     CASE @orderBy WHEN 'HRM_Employees2_VerifierID DESC' THEN [HRM_Employees2].[VerifierID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_ApprovalRequired' THEN [HRM_Employees2].[ApprovalRequired] END,
     CASE @orderBy WHEN 'HRM_Employees2_ApprovalRequired DESC' THEN [HRM_Employees2].[ApprovalRequired] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_ApproverID' THEN [HRM_Employees2].[ApproverID] END,
     CASE @orderBy WHEN 'HRM_Employees2_ApproverID DESC' THEN [HRM_Employees2].[ApproverID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_DateOfJoining' THEN [HRM_Employees2].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_DateOfJoining DESC' THEN [HRM_Employees2].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_DateOfReleaving' THEN [HRM_Employees2].[C_DateOfReleaving] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_DateOfReleaving DESC' THEN [HRM_Employees2].[C_DateOfReleaving] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_CompanyID' THEN [HRM_Employees2].[C_CompanyID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_CompanyID DESC' THEN [HRM_Employees2].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_DivisionID' THEN [HRM_Employees2].[C_DivisionID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_DivisionID DESC' THEN [HRM_Employees2].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_OfficeID' THEN [HRM_Employees2].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_OfficeID DESC' THEN [HRM_Employees2].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_DepartmentID' THEN [HRM_Employees2].[C_DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_DepartmentID DESC' THEN [HRM_Employees2].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_DesignationID' THEN [HRM_Employees2].[C_DesignationID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_DesignationID DESC' THEN [HRM_Employees2].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_ActiveState' THEN [HRM_Employees2].[ActiveState] END,
     CASE @orderBy WHEN 'HRM_Employees2_ActiveState DESC' THEN [HRM_Employees2].[ActiveState] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_ConfirmedOn' THEN [HRM_Employees2].[C_ConfirmedOn] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_ConfirmedOn DESC' THEN [HRM_Employees2].[C_ConfirmedOn] END DESC,
     CASE @orderBy WHEN 'HRM_Companies3_CompanyID' THEN [HRM_Companies3].[CompanyID] END,
     CASE @orderBy WHEN 'HRM_Companies3_CompanyID DESC' THEN [HRM_Companies3].[CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Companies3_Description' THEN [HRM_Companies3].[Description] END,
     CASE @orderBy WHEN 'HRM_Companies3_Description DESC' THEN [HRM_Companies3].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies3_ShortName' THEN [HRM_Companies3].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Companies3_ShortName DESC' THEN [HRM_Companies3].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Companies3_BaaNID' THEN [HRM_Companies3].[BaaNID] END,
     CASE @orderBy WHEN 'HRM_Companies3_BaaNID DESC' THEN [HRM_Companies3].[BaaNID] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions4_DivisionID' THEN [HRM_Divisions4].[DivisionID] END,
     CASE @orderBy WHEN 'HRM_Divisions4_DivisionID DESC' THEN [HRM_Divisions4].[DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions4_Description' THEN [HRM_Divisions4].[Description] END,
     CASE @orderBy WHEN 'HRM_Divisions4_Description DESC' THEN [HRM_Divisions4].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices5_OfficeID' THEN [HRM_Offices5].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices5_OfficeID DESC' THEN [HRM_Offices5].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices5_Description' THEN [HRM_Offices5].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices5_Description DESC' THEN [HRM_Offices5].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices5_Address' THEN [HRM_Offices5].[Address] END,
     CASE @orderBy WHEN 'HRM_Offices5_Address DESC' THEN [HRM_Offices5].[Address] END DESC,
     CASE @orderBy WHEN 'HRM_Offices5_City' THEN [HRM_Offices5].[City] END,
     CASE @orderBy WHEN 'HRM_Offices5_City DESC' THEN [HRM_Offices5].[City] END DESC,
     CASE @orderBy WHEN 'HRM_Departments6_DepartmentID' THEN [HRM_Departments6].[DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Departments6_DepartmentID DESC' THEN [HRM_Departments6].[DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Departments6_Description' THEN [HRM_Departments6].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments6_Description DESC' THEN [HRM_Departments6].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations7_DesignationID' THEN [HRM_Designations7].[DesignationID] END,
     CASE @orderBy WHEN 'HRM_Designations7_DesignationID DESC' THEN [HRM_Designations7].[DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Designations7_Description' THEN [HRM_Designations7].[Description] END,
     CASE @orderBy WHEN 'HRM_Designations7_Description DESC' THEN [HRM_Designations7].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations7_ShortName' THEN [HRM_Designations7].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Designations7_ShortName DESC' THEN [HRM_Designations7].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Designations7_Sequence' THEN [HRM_Designations7].[Sequence] END,
     CASE @orderBy WHEN 'HRM_Designations7_Sequence DESC' THEN [HRM_Designations7].[Sequence] END DESC 

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
