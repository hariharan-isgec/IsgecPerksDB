USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnAttendanceStatusSelectByID]
  @AttenID Int
  AS
  SELECT
		[ATN_Attendance].[AttenID],
		[ATN_Attendance].[AttenDate],
		[ATN_Attendance].[CardNo],
		[ATN_Attendance].[Punch1Time],
		[ATN_Attendance].[Punch2Time],
		[ATN_Attendance].[PunchStatusID],
		[ATN_Attendance].[PunchValue],
		[ATN_Attendance].[NeedsRegularization],
		[ATN_Attendance].[Applied],
		[ATN_Attendance].[Applied1LeaveTypeID],
		[ATN_Attendance].[Applied2LeaveTypeID],
		[ATN_Attendance].[ApplHeaderID],
		[ATN_Attendance].[ApplStatusID],
		[ATN_Attendance].[Posted],
		[ATN_Attendance].[FinYear],
		[ATN_PunchStatus1].[PunchStatusID] AS ATN_PunchStatus1_PunchStatusID,
		[ATN_PunchStatus1].[Description] AS ATN_PunchStatus1_Description,
		[ATN_PunchStatus1].[PunchValue] AS ATN_PunchStatus1_PunchValue,
		[ATN_LeaveTypes2].[LeaveTypeID] AS ATN_LeaveTypes2_LeaveTypeID,
		[ATN_LeaveTypes2].[Description] AS ATN_LeaveTypes2_Description,
		[ATN_LeaveTypes2].[OBALApplicable] AS ATN_LeaveTypes2_OBALApplicable,
		[ATN_LeaveTypes2].[OBALMonthly] AS ATN_LeaveTypes2_OBALMonthly,
		[ATN_LeaveTypes2].[OpeningBalance] AS ATN_LeaveTypes2_OpeningBalance,
		[ATN_LeaveTypes2].[CarryForward] AS ATN_LeaveTypes2_CarryForward,
		[ATN_LeaveTypes2].[ForwardToLeaveTypeID] AS ATN_LeaveTypes2_ForwardToLeaveTypeID,
		[ATN_LeaveTypes2].[AdvanceApplicable] AS ATN_LeaveTypes2_AdvanceApplicable,
		[ATN_LeaveTypes2].[SpecialSanctionRequired] AS ATN_LeaveTypes2_SpecialSanctionRequired,
		[ATN_LeaveTypes2].[SpecialSanctionBy] AS ATN_LeaveTypes2_SpecialSanctionBy,
		[ATN_LeaveTypes2].[Applyiable] AS ATN_LeaveTypes2_Applyiable,
		[ATN_LeaveTypes2].[Postable] AS ATN_LeaveTypes2_Postable,
		[ATN_LeaveTypes2].[PostedLeaveTypeID] AS ATN_LeaveTypes2_PostedLeaveTypeID,
		[ATN_LeaveTypes2].[Sequence] AS ATN_LeaveTypes2_Sequence,
		[ATN_LeaveTypes2].[MainType] AS ATN_LeaveTypes2_MainType,
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
		[ATN_LeaveTypes3].[MainType] AS ATN_LeaveTypes3_MainType,
		[ATN_ApplicationStatus4].[ApplStatusID] AS ATN_ApplicationStatus4_ApplStatusID,
		[ATN_ApplicationStatus4].[Description] AS ATN_ApplicationStatus4_Description 
  FROM [ATN_Attendance] 
  INNER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus1]
    ON [ATN_Attendance].[PunchStatusID] = [ATN_PunchStatus1].[PunchStatusID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes2]
    ON [ATN_Attendance].[Applied1LeaveTypeID] = [ATN_LeaveTypes2].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]
    ON [ATN_Attendance].[Applied2LeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus4]
    ON [ATN_Attendance].[ApplStatusID] = [ATN_ApplicationStatus4].[ApplStatusID]
  WHERE
  [ATN_Attendance].[AttenID] = @AttenID
GO
