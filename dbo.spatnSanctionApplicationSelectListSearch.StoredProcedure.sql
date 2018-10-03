USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSanctionApplicationSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @ApplStatusID Int,
  @SanctionedBy NVarChar(8),
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  LeaveApplID Int NOT NULL
  )
  INSERT INTO #PageIndex (LeaveApplID)
  SELECT [ATN_ApplHeader].[LeaveApplID] FROM [ATN_ApplHeader]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApplHeader].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus2]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus2].[ApplStatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [ATN_ApplHeader].[SanctionedBy] = [HRM_Employees3].[CardNo]
 WHERE  
      [ATN_ApplHeader].[ApplStatusID] = @ApplStatusID
  AND [ATN_ApplHeader].[SanctionedBy] = @SanctionedBy
  AND [ATN_ApplHeader].[FinYear] = @FinYear
   AND ( 
         STR(ISNULL([ATN_ApplHeader].[LeaveApplID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_ApplHeader].[ApplStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[SanctionRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[SanctionedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[VerifierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[ApproverID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplicationStatus2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[VerifierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[ApproverID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees3].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees3].[C_DesignationID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'LeaveApplID' THEN [ATN_ApplHeader].[LeaveApplID] END,
     CASE @orderBy WHEN 'LeaveApplID DESC' THEN [ATN_ApplHeader].[LeaveApplID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [ATN_ApplHeader].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [ATN_ApplHeader].[CardNo] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [ATN_ApplHeader].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [ATN_ApplHeader].[Remarks] END DESC,
     CASE @orderBy WHEN 'AppliedOn' THEN [ATN_ApplHeader].[AppliedOn] END,
     CASE @orderBy WHEN 'AppliedOn DESC' THEN [ATN_ApplHeader].[AppliedOn] END DESC,
     CASE @orderBy WHEN 'ApplStatusID' THEN [ATN_ApplHeader].[ApplStatusID] END,
     CASE @orderBy WHEN 'ApplStatusID DESC' THEN [ATN_ApplHeader].[ApplStatusID] END DESC,
     CASE @orderBy WHEN 'SanctionRemark' THEN [ATN_ApplHeader].[SanctionRemark] END,
     CASE @orderBy WHEN 'SanctionRemark DESC' THEN [ATN_ApplHeader].[SanctionRemark] END DESC,
     CASE @orderBy WHEN 'SanctionOn' THEN [ATN_ApplHeader].[SanctionOn] END,
     CASE @orderBy WHEN 'SanctionOn DESC' THEN [ATN_ApplHeader].[SanctionOn] END DESC,
     CASE @orderBy WHEN 'SanctionedBy' THEN [ATN_ApplHeader].[SanctionedBy] END,
     CASE @orderBy WHEN 'SanctionedBy DESC' THEN [ATN_ApplHeader].[SanctionedBy] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATN_ApplHeader].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATN_ApplHeader].[FinYear] END DESC,
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
     CASE @orderBy WHEN 'ATN_ApplicationStatus2_ApplStatusID' THEN [ATN_ApplicationStatus2].[ApplStatusID] END,
     CASE @orderBy WHEN 'ATN_ApplicationStatus2_ApplStatusID DESC' THEN [ATN_ApplicationStatus2].[ApplStatusID] END DESC,
     CASE @orderBy WHEN 'ATN_ApplicationStatus2_Description' THEN [ATN_ApplicationStatus2].[Description] END,
     CASE @orderBy WHEN 'ATN_ApplicationStatus2_Description DESC' THEN [ATN_ApplicationStatus2].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_CardNo' THEN [HRM_Employees3].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees3_CardNo DESC' THEN [HRM_Employees3].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_EmployeeName' THEN [HRM_Employees3].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees3_EmployeeName DESC' THEN [HRM_Employees3].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_VerificationRequired' THEN [HRM_Employees3].[VerificationRequired] END,
     CASE @orderBy WHEN 'HRM_Employees3_VerificationRequired DESC' THEN [HRM_Employees3].[VerificationRequired] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_VerifierID' THEN [HRM_Employees3].[VerifierID] END,
     CASE @orderBy WHEN 'HRM_Employees3_VerifierID DESC' THEN [HRM_Employees3].[VerifierID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_ApprovalRequired' THEN [HRM_Employees3].[ApprovalRequired] END,
     CASE @orderBy WHEN 'HRM_Employees3_ApprovalRequired DESC' THEN [HRM_Employees3].[ApprovalRequired] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_ApproverID' THEN [HRM_Employees3].[ApproverID] END,
     CASE @orderBy WHEN 'HRM_Employees3_ApproverID DESC' THEN [HRM_Employees3].[ApproverID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_C_DateOfJoining' THEN [HRM_Employees3].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'HRM_Employees3_C_DateOfJoining DESC' THEN [HRM_Employees3].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_C_DateOfReleaving' THEN [HRM_Employees3].[C_DateOfReleaving] END,
     CASE @orderBy WHEN 'HRM_Employees3_C_DateOfReleaving DESC' THEN [HRM_Employees3].[C_DateOfReleaving] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_C_CompanyID' THEN [HRM_Employees3].[C_CompanyID] END,
     CASE @orderBy WHEN 'HRM_Employees3_C_CompanyID DESC' THEN [HRM_Employees3].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_C_DivisionID' THEN [HRM_Employees3].[C_DivisionID] END,
     CASE @orderBy WHEN 'HRM_Employees3_C_DivisionID DESC' THEN [HRM_Employees3].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_C_OfficeID' THEN [HRM_Employees3].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees3_C_OfficeID DESC' THEN [HRM_Employees3].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_C_DepartmentID' THEN [HRM_Employees3].[C_DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Employees3_C_DepartmentID DESC' THEN [HRM_Employees3].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_C_DesignationID' THEN [HRM_Employees3].[C_DesignationID] END,
     CASE @orderBy WHEN 'HRM_Employees3_C_DesignationID DESC' THEN [HRM_Employees3].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_ActiveState' THEN [HRM_Employees3].[ActiveState] END,
     CASE @orderBy WHEN 'HRM_Employees3_ActiveState DESC' THEN [HRM_Employees3].[ActiveState] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ATN_ApplHeader].[LeaveApplID],
		[ATN_ApplHeader].[CardNo],
		[ATN_ApplHeader].[Remarks],
		[ATN_ApplHeader].[AppliedOn],
		[ATN_ApplHeader].[ApplStatusID],
		[ATN_ApplHeader].[SanctionRemark],
		[ATN_ApplHeader].[SanctionOn],
		[ATN_ApplHeader].[SanctionedBy],
		[ATN_ApplHeader].[FinYear],
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
		[ATN_ApplicationStatus2].[ApplStatusID] AS ATN_ApplicationStatus2_ApplStatusID,
		[ATN_ApplicationStatus2].[Description] AS ATN_ApplicationStatus2_Description,
		[HRM_Employees3].[CardNo] AS HRM_Employees3_CardNo,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
		[HRM_Employees3].[VerificationRequired] AS HRM_Employees3_VerificationRequired,
		[HRM_Employees3].[VerifierID] AS HRM_Employees3_VerifierID,
		[HRM_Employees3].[ApprovalRequired] AS HRM_Employees3_ApprovalRequired,
		[HRM_Employees3].[ApproverID] AS HRM_Employees3_ApproverID,
		[HRM_Employees3].[C_DateOfJoining] AS HRM_Employees3_C_DateOfJoining,
		[HRM_Employees3].[C_DateOfReleaving] AS HRM_Employees3_C_DateOfReleaving,
		[HRM_Employees3].[C_CompanyID] AS HRM_Employees3_C_CompanyID,
		[HRM_Employees3].[C_DivisionID] AS HRM_Employees3_C_DivisionID,
		[HRM_Employees3].[C_OfficeID] AS HRM_Employees3_C_OfficeID,
		[HRM_Employees3].[C_DepartmentID] AS HRM_Employees3_C_DepartmentID,
		[HRM_Employees3].[C_DesignationID] AS HRM_Employees3_C_DesignationID,
		[HRM_Employees3].[ActiveState] AS HRM_Employees3_ActiveState 
  FROM [ATN_ApplHeader] 
    	INNER JOIN #PageIndex
          ON [ATN_ApplHeader].[LeaveApplID] = #PageIndex.LeaveApplID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApplHeader].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus2]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus2].[ApplStatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [ATN_ApplHeader].[SanctionedBy] = [HRM_Employees3].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
