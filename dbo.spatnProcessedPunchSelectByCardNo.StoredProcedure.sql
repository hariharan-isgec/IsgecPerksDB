USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnProcessedPunchSelectByCardNo]
  @FinYear NVarChar(4),
  @CardNo NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATN_Attendance].[AttenID],
		[ATN_Attendance].[AttenDate],
		[ATN_Attendance].[CardNo],
		[ATN_Attendance].[Punch1Time],
		[ATN_Attendance].[Punch2Time],
		[ATN_Attendance].[PunchStatusID],
		[ATN_Attendance].[Punch9Time],
		[ATN_Attendance].[PunchValue],
		[ATN_Attendance].[FinalValue],
		[ATN_Attendance].[Applied],
		[ATN_Attendance].[NeedsRegularization],
		[ATN_Attendance].[FinYear],
		[ATN_Attendance].[AdvanceApplication],
		[ATN_Attendance].[MannuallyCorrected],
		[ATN_Attendance].[HoliDay],
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
		[ATN_PunchStatus2].[PunchStatusID] AS ATN_PunchStatus2_PunchStatusID,
		[ATN_PunchStatus2].[Description] AS ATN_PunchStatus2_Description,
		[ATN_PunchStatus2].[PunchValue] AS ATN_PunchStatus2_PunchValue 
  FROM [ATN_Attendance] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_Attendance].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus2]
    ON [ATN_Attendance].[PunchStatusID] = [ATN_PunchStatus2].[PunchStatusID]
  WHERE
  [ATN_Attendance].[CardNo] = @CardNo
  AND [ATN_Attendance].[FinYear] = @FinYear
  ORDER BY
     CASE @orderBy WHEN 'AttenID' THEN [ATN_Attendance].[AttenID] END,
     CASE @orderBy WHEN 'AttenID DESC' THEN [ATN_Attendance].[AttenID] END DESC,
     CASE @orderBy WHEN 'AttenDate' THEN [ATN_Attendance].[AttenDate] END,
     CASE @orderBy WHEN 'AttenDate DESC' THEN [ATN_Attendance].[AttenDate] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [ATN_Attendance].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [ATN_Attendance].[CardNo] END DESC,
     CASE @orderBy WHEN 'Punch1Time' THEN [ATN_Attendance].[Punch1Time] END,
     CASE @orderBy WHEN 'Punch1Time DESC' THEN [ATN_Attendance].[Punch1Time] END DESC,
     CASE @orderBy WHEN 'Punch2Time' THEN [ATN_Attendance].[Punch2Time] END,
     CASE @orderBy WHEN 'Punch2Time DESC' THEN [ATN_Attendance].[Punch2Time] END DESC,
     CASE @orderBy WHEN 'PunchStatusID' THEN [ATN_Attendance].[PunchStatusID] END,
     CASE @orderBy WHEN 'PunchStatusID DESC' THEN [ATN_Attendance].[PunchStatusID] END DESC,
     CASE @orderBy WHEN 'Punch9Time' THEN [ATN_Attendance].[Punch9Time] END,
     CASE @orderBy WHEN 'Punch9Time DESC' THEN [ATN_Attendance].[Punch9Time] END DESC,
     CASE @orderBy WHEN 'PunchValue' THEN [ATN_Attendance].[PunchValue] END,
     CASE @orderBy WHEN 'PunchValue DESC' THEN [ATN_Attendance].[PunchValue] END DESC,
     CASE @orderBy WHEN 'FinalValue' THEN [ATN_Attendance].[FinalValue] END,
     CASE @orderBy WHEN 'FinalValue DESC' THEN [ATN_Attendance].[FinalValue] END DESC,
     CASE @orderBy WHEN 'Applied' THEN [ATN_Attendance].[Applied] END,
     CASE @orderBy WHEN 'Applied DESC' THEN [ATN_Attendance].[Applied] END DESC,
     CASE @orderBy WHEN 'NeedsRegularization' THEN [ATN_Attendance].[NeedsRegularization] END,
     CASE @orderBy WHEN 'NeedsRegularization DESC' THEN [ATN_Attendance].[NeedsRegularization] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATN_Attendance].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATN_Attendance].[FinYear] END DESC,
     CASE @orderBy WHEN 'AdvanceApplication' THEN [ATN_Attendance].[AdvanceApplication] END,
     CASE @orderBy WHEN 'AdvanceApplication DESC' THEN [ATN_Attendance].[AdvanceApplication] END DESC,
     CASE @orderBy WHEN 'MannuallyCorrected' THEN [ATN_Attendance].[MannuallyCorrected] END,
     CASE @orderBy WHEN 'MannuallyCorrected DESC' THEN [ATN_Attendance].[MannuallyCorrected] END DESC,
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
     CASE @orderBy WHEN 'ATN_PunchStatus2_PunchStatusID' THEN [ATN_PunchStatus2].[PunchStatusID] END,
     CASE @orderBy WHEN 'ATN_PunchStatus2_PunchStatusID DESC' THEN [ATN_PunchStatus2].[PunchStatusID] END DESC,
     CASE @orderBy WHEN 'ATN_PunchStatus2_Description' THEN [ATN_PunchStatus2].[Description] END,
     CASE @orderBy WHEN 'ATN_PunchStatus2_Description DESC' THEN [ATN_PunchStatus2].[Description] END DESC,
     CASE @orderBy WHEN 'ATN_PunchStatus2_PunchValue' THEN [ATN_PunchStatus2].[PunchValue] END,
     CASE @orderBy WHEN 'ATN_PunchStatus2_PunchValue DESC' THEN [ATN_PunchStatus2].[PunchValue] END DESC 
  SET @RecordCount = @@RowCount
GO
