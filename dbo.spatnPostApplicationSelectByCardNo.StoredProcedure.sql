USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPostApplicationSelectByCardNo]
  @FinYear NVarChar(4),
  @AdvanceApplication Bit,
  @CardNo NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATN_ApplHeader].[LeaveApplID],
		[ATN_ApplHeader].[CardNo],
		[ATN_ApplHeader].[Remarks],
		[ATN_ApplHeader].[AppliedOn],
		[ATN_ApplHeader].[ApplStatusID],
		[ATN_ApplHeader].[PostedOn],
		[ATN_ApplHeader].[PostedBy],
		[ATN_ApplHeader].[PostingRemark],
		[ATN_ApplHeader].[FinYear],
		[ATN_ApplHeader].[AdvanceApplication],
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
		[HRM_Employees2].[CardNo] AS ApprovedBy,
		[HRM_Employees2].[EmployeeName] AS ApprovedByEmployeeName,
		[ATN_ApplicationStatus2].[ApplStatusID] AS ATN_ApplicationStatus2_ApplStatusID,
		[ATN_ApplicationStatus2].[Description] AS ATN_ApplicationStatus2_Description 
  FROM [ATN_ApplHeader] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApplHeader].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus2]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus2].[ApplStatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_Employees1].[ApproverID] = [HRM_Employees2].[CardNo]
  WHERE
  [ATN_ApplHeader].[CardNo] = @CardNo
  AND [ATN_ApplHeader].[FinYear] = @FinYear
  AND [ATN_ApplHeader].[AdvanceApplication] = @AdvanceApplication
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
     CASE @orderBy WHEN 'PostedOn' THEN [ATN_ApplHeader].[PostedOn] END,
     CASE @orderBy WHEN 'PostedOn DESC' THEN [ATN_ApplHeader].[PostedOn] END DESC,
     CASE @orderBy WHEN 'PostedBy' THEN [ATN_ApplHeader].[PostedBy] END,
     CASE @orderBy WHEN 'PostedBy DESC' THEN [ATN_ApplHeader].[PostedBy] END DESC,
     CASE @orderBy WHEN 'PostingRemark' THEN [ATN_ApplHeader].[PostingRemark] END,
     CASE @orderBy WHEN 'PostingRemark DESC' THEN [ATN_ApplHeader].[PostingRemark] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATN_ApplHeader].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATN_ApplHeader].[FinYear] END DESC,
     CASE @orderBy WHEN 'AdvanceApplication' THEN [ATN_ApplHeader].[AdvanceApplication] END,
     CASE @orderBy WHEN 'AdvanceApplication DESC' THEN [ATN_ApplHeader].[AdvanceApplication] END DESC,
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
     CASE @orderBy WHEN 'ATN_ApplicationStatus2_Description DESC' THEN [ATN_ApplicationStatus2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
