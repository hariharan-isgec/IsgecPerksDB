USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnLeaveLedgerSelectByID]
  @RecordID Int
  AS
  SELECT
		[ATN_LeaveLedger].[RecordID],
		[ATN_LeaveLedger].[TranType],
		[ATN_LeaveLedger].[TranDate],
		[ATN_LeaveLedger].[CardNo],
		[ATN_LeaveLedger].[LeaveTypeID],
		[ATN_LeaveLedger].[InProcessDays],
		[ATN_LeaveLedger].[Days],
		[ATN_LeaveLedger].[FinYear],
		[ATN_LeaveLedger].[ApplHeaderID],
		[ATN_LeaveLedger].[ApplDetailID],
		[ATN_TranType1].[TranType] AS ATN_TranType1_TranType,
		[ATN_TranType1].[Description] AS ATN_TranType1_Description,
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
		[ATN_LeaveTypes3].[LeaveTypeID] AS ATN_LeaveTypes3_LeaveTypeID,
		[ATN_LeaveTypes3].[Description] AS ATN_LeaveTypes3_Description,
		[ATN_LeaveTypes3].[OBALApplicable] AS ATN_LeaveTypes3_OBALApplicable,
		[ATN_LeaveTypes3].[OBALMonthly] AS ATN_LeaveTypes3_OBALMonthly,
		[ATN_LeaveTypes3].[OpeningBalance] AS ATN_LeaveTypes3_OpeningBalance,
		[ATN_LeaveTypes3].[CarryForward] AS ATN_LeaveTypes3_CarryForward,
		[ATN_LeaveTypes3].[ForwardToLeaveTypeID] AS ATN_LeaveTypes3_ForwardToLeaveTypeID,
		[ATN_LeaveTypes3].[AdvanceApplicable] AS ATN_LeaveTypes3_AdvanceApplicable,
		[ATN_LeaveTypes3].[SpecialSanctionRequired] AS ATN_LeaveTypes3_SpecialSanctionRequired,
		[ATN_LeaveTypes3].[SpecialSanctionBy] AS ATN_LeaveTypes3_SpecialSanctionBy,
		[ATN_LeaveTypes3].[Applyiable] AS ATN_LeaveTypes3_Applyiable,
		[ATN_LeaveTypes3].[Postable] AS ATN_LeaveTypes3_Postable,
		[ATN_LeaveTypes3].[PostedLeaveTypeID] AS ATN_LeaveTypes3_PostedLeaveTypeID,
		[ATN_FinYear4].[FinYear] AS ATN_FinYear4_FinYear,
		[ATN_FinYear4].[Description] AS ATN_FinYear4_Description,
		[ATN_FinYear4].[StartDate] AS ATN_FinYear4_StartDate,
		[ATN_FinYear4].[EndDate] AS ATN_FinYear4_EndDate,
		[ATN_FinYear4].[Active] AS ATN_FinYear4_Active 
  FROM [ATN_LeaveLedger] 
  INNER JOIN [ATN_TranType] AS [ATN_TranType1]
    ON [ATN_LeaveLedger].[TranType] = [ATN_TranType1].[TranType]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ATN_LeaveLedger].[CardNo] = [HRM_Employees2].[CardNo]
  INNER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]
    ON [ATN_LeaveLedger].[LeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]
  INNER JOIN [ATN_FinYear] AS [ATN_FinYear4]
    ON [ATN_LeaveLedger].[FinYear] = [ATN_FinYear4].[FinYear]
  WHERE
  [ATN_LeaveLedger].[RecordID] = @RecordID
GO
