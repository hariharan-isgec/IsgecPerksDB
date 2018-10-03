USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatn_LG_AllTSToBeWavedoffForMonth]
  @ForMonth int,
  @FinYear NVarChar(4),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATN_Attendance].[AttenID],
		[ATN_Attendance].[AttenDate],
		[ATN_Attendance].[CardNo],
		[ATN_Attendance].[Punch1Time],
		[ATN_Attendance].[Punch2Time],
		[ATN_Attendance].[Punch9Time],
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
		[ATN_Attendance].[MannuallyCorrected],
		[ATN_Attendance].[Destination],
		[ATN_Attendance].[Purpose],
		[ATN_Attendance].[ConfigID],
		[ATN_Attendance].[ConfigDetailID],
		[ATN_Attendance].[ConfigStatus],
		[ATN_Attendance].[TSStatus],
		[ATN_Attendance].[TSStatusBy],
		[ATN_Attendance].[TSStatusOn],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [ATN_Attendance] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_Attendance].[CardNo] = [HRM_Employees1].[CardNo]
  WHERE
        [ATN_Attendance].[PunchStatusID] = 'TS' 
    AND [ATN_Attendance].[TSStatus] = 'TS' 
		AND [ATN_Attendance].[Applied] = 0 
    AND MONTH([ATN_Attendance].[AttenDate]) = @ForMonth 
    AND [ATN_Attendance].[FinYear] = @FinYear 
  SET @RecordCount = @@RowCount
GO
