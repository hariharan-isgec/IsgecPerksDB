USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatn_LG_AttendanceByCardNoDate]
  @CardNo NVarChar(8),
  @AttenDate DateTime
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
		[ATN_Attendance].[FinYear],
		[ATN_Attendance].[Applied],
		[ATN_Attendance].[AppliedValue],
		[ATN_Attendance].[Applied1LeaveTypeID],
		[ATN_Attendance].[Applied2LeaveTypeID],
		[ATN_Attendance].[Posted],
		[ATN_Attendance].[Posted1LeaveTypeID],
		[ATN_Attendance].[Posted2LeaveTypeID],
		[ATN_Attendance].[ApplHeaderID],
		[ATN_Attendance].[ApplStatusID],
		[ATN_Attendance].[FinalValue],
		[ATN_Attendance].[AdvanceApplication],
		[ATN_Attendance].[Destination],
		[ATN_Attendance].[Purpose] 
  FROM [ATN_Attendance] 
  WHERE 
      [ATN_Attendance].[CardNo] = @CardNo
  AND [ATN_Attendance].[AttenDate] = @AttenDate
GO
