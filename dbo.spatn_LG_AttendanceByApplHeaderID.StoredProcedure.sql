USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatn_LG_AttendanceByApplHeaderID]
  @ApplHeaderID Int,
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATN_Attendance].*,
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
		[ATN_LeaveTypes4].[LeaveTypeID] AS ATN_LeaveTypes4_LeaveTypeID,
		[ATN_LeaveTypes4].[Description] AS ATN_LeaveTypes4_Description,
		[ATN_LeaveTypes4].[OBALApplicable] AS ATN_LeaveTypes4_OBALApplicable,
		[ATN_LeaveTypes4].[OBALMonthly] AS ATN_LeaveTypes4_OBALMonthly,
		[ATN_LeaveTypes4].[OpeningBalance] AS ATN_LeaveTypes4_OpeningBalance,
		[ATN_LeaveTypes4].[CarryForward] AS ATN_LeaveTypes4_CarryForward,
		[ATN_LeaveTypes4].[ForwardToLeaveTypeID] AS ATN_LeaveTypes4_ForwardToLeaveTypeID,
		[ATN_LeaveTypes4].[AdvanceApplicable] AS ATN_LeaveTypes4_AdvanceApplicable,
		[ATN_LeaveTypes4].[SpecialSanctionRequired] AS ATN_LeaveTypes4_SpecialSanctionRequired,
		[ATN_LeaveTypes4].[SpecialSanctionBy] AS ATN_LeaveTypes4_SpecialSanctionBy,
		[ATN_LeaveTypes4].[Applyiable] AS ATN_LeaveTypes4_Applyiable,
		[ATN_LeaveTypes4].[Postable] AS ATN_LeaveTypes4_Postable,
		[ATN_LeaveTypes4].[PostedLeaveTypeID] AS ATN_LeaveTypes4_PostedLeaveTypeID,
		[ATN_LeaveTypes4].[Sequence] AS ATN_LeaveTypes4_Sequence,
		[ATN_LeaveTypes4].[MainType] AS ATN_LeaveTypes4_MainType,
		[ATN_LeaveTypes5].[LeaveTypeID] AS ATN_LeaveTypes5_LeaveTypeID,
		[ATN_LeaveTypes5].[Description] AS ATN_LeaveTypes5_Description,
		[ATN_LeaveTypes5].[OBALApplicable] AS ATN_LeaveTypes5_OBALApplicable,
		[ATN_LeaveTypes5].[OBALMonthly] AS ATN_LeaveTypes5_OBALMonthly,
		[ATN_LeaveTypes5].[OpeningBalance] AS ATN_LeaveTypes5_OpeningBalance,
		[ATN_LeaveTypes5].[CarryForward] AS ATN_LeaveTypes5_CarryForward,
		[ATN_LeaveTypes5].[ForwardToLeaveTypeID] AS ATN_LeaveTypes5_ForwardToLeaveTypeID,
		[ATN_LeaveTypes5].[AdvanceApplicable] AS ATN_LeaveTypes5_AdvanceApplicable,
		[ATN_LeaveTypes5].[SpecialSanctionRequired] AS ATN_LeaveTypes5_SpecialSanctionRequired,
		[ATN_LeaveTypes5].[SpecialSanctionBy] AS ATN_LeaveTypes5_SpecialSanctionBy,
		[ATN_LeaveTypes5].[Applyiable] AS ATN_LeaveTypes5_Applyiable,
		[ATN_LeaveTypes5].[Postable] AS ATN_LeaveTypes5_Postable,
		[ATN_LeaveTypes5].[PostedLeaveTypeID] AS ATN_LeaveTypes5_PostedLeaveTypeID,
		[ATN_LeaveTypes5].[Sequence] AS ATN_LeaveTypes5_Sequence,
		[ATN_LeaveTypes5].[MainType] AS ATN_LeaveTypes5_MainType,
		[ATN_ApplicationStatus6].[ApplStatusID] AS ATN_ApplicationStatus6_ApplStatusID,
		[ATN_ApplicationStatus6].[Description] AS ATN_ApplicationStatus6_Description 
  FROM [ATN_Attendance] 
  LEFT OUTER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus1]
    ON [ATN_Attendance].[PunchStatusID] = [ATN_PunchStatus1].[PunchStatusID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes2]
    ON [ATN_Attendance].[Applied1LeaveTypeID] = [ATN_LeaveTypes2].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]
    ON [ATN_Attendance].[Applied2LeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes4]
    ON [ATN_Attendance].[Posted1LeaveTypeID] = [ATN_LeaveTypes4].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes5]
    ON [ATN_Attendance].[Posted2LeaveTypeID] = [ATN_LeaveTypes5].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus6]
    ON [ATN_Attendance].[ApplStatusID] = [ATN_ApplicationStatus6].[ApplStatusID]
  WHERE
  [ATN_Attendance].[ApplHeaderID] = @ApplHeaderID  
  ORDER BY [ATN_Attendance].[AttenDate]
   
  SET @RecordCount = @@RowCount
GO
