USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnLeaveTypesSelectByID]
  @LeaveTypeID NVarChar(2)
  AS
  SELECT
		[ATN_LeaveTypes].[LeaveTypeID],
		[ATN_LeaveTypes].[Description],
		[ATN_LeaveTypes].[OBALApplicable],
		[ATN_LeaveTypes].[OBALMonthly],
		[ATN_LeaveTypes].[OpeningBalance],
		[ATN_LeaveTypes].[CarryForward],
		[ATN_LeaveTypes].[ForwardToLeaveTypeID],
		[ATN_LeaveTypes].[AdvanceApplicable],
		[ATN_LeaveTypes].[SpecialSanctionRequired],
		[ATN_LeaveTypes].[SpecialSanctionBy],
		[ATN_LeaveTypes].[Applyiable],
		[ATN_LeaveTypes].[Postable],
		[ATN_LeaveTypes].[PostedLeaveTypeID],
		[ATN_LeaveTypes].[Sequence],
		[ATN_LeaveTypes].[MainType],
		[ATN_LeaveTypes1].[LeaveTypeID] AS ATN_LeaveTypes1_LeaveTypeID,
		[ATN_LeaveTypes1].[Description] AS ATN_LeaveTypes1_Description,
		[ATN_LeaveTypes1].[OBALApplicable] AS ATN_LeaveTypes1_OBALApplicable,
		[ATN_LeaveTypes1].[OBALMonthly] AS ATN_LeaveTypes1_OBALMonthly,
		[ATN_LeaveTypes1].[OpeningBalance] AS ATN_LeaveTypes1_OpeningBalance,
		[ATN_LeaveTypes1].[CarryForward] AS ATN_LeaveTypes1_CarryForward,
		[ATN_LeaveTypes1].[ForwardToLeaveTypeID] AS ATN_LeaveTypes1_ForwardToLeaveTypeID,
		[ATN_LeaveTypes1].[AdvanceApplicable] AS ATN_LeaveTypes1_AdvanceApplicable,
		[ATN_LeaveTypes1].[SpecialSanctionRequired] AS ATN_LeaveTypes1_SpecialSanctionRequired,
		[ATN_LeaveTypes1].[SpecialSanctionBy] AS ATN_LeaveTypes1_SpecialSanctionBy,
		[ATN_LeaveTypes1].[Applyiable] AS ATN_LeaveTypes1_Applyiable,
		[ATN_LeaveTypes1].[Postable] AS ATN_LeaveTypes1_Postable,
		[ATN_LeaveTypes1].[PostedLeaveTypeID] AS ATN_LeaveTypes1_PostedLeaveTypeID,
		[ATN_LeaveTypes1].[Sequence] AS ATN_LeaveTypes1_Sequence,
		[ATN_LeaveTypes1].[MainType] AS ATN_LeaveTypes1_MainType,
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
		[ATN_LeaveTypes3].[Sequence] AS ATN_LeaveTypes3_Sequence,
		[ATN_LeaveTypes3].[MainType] AS ATN_LeaveTypes3_MainType 
  FROM [ATN_LeaveTypes] 
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes1]
    ON [ATN_LeaveTypes].[ForwardToLeaveTypeID] = [ATN_LeaveTypes1].[LeaveTypeID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ATN_LeaveTypes].[SpecialSanctionBy] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]
    ON [ATN_LeaveTypes].[PostedLeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]
  WHERE
  [ATN_LeaveTypes].[LeaveTypeID] = @LeaveTypeID
GO
