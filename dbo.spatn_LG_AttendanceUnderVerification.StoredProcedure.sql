USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatn_LG_AttendanceUnderVerification]
  @VerifiedBy NVarChar(8),
  @FinYear NVarChar(4),
  @ApplStatusID Int,
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATN_Attendance].[AttenID],
		[ATN_Attendance].[AttenDate],
		[ATN_Attendance].[CardNo],
		[ATN_Attendance].[Applied1LeaveTypeID],
		[ATN_Attendance].[Applied2LeaveTypeID],
		[ATN_Attendance].[ApplHeaderID],
		[ATN_Attendance].[ApplStatusID],
		[ATN_Attendance].[Destination],
		[ATN_Attendance].[Purpose],
    [HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[ATN_LeaveTypes2].[Description] AS ATN_LeaveTypes2_Description,
		[ATN_LeaveTypes3].[Description] AS ATN_LeaveTypes3_Description,
    [ATN_ApplHeader4].[VerifiedBy] AS ATN_ApplHeader4_VerifiedBy,
    [HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName
  FROM [ATN_Attendance] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_Attendance].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes2]
    ON [ATN_Attendance].[Applied1LeaveTypeID] = [ATN_LeaveTypes2].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]
    ON [ATN_Attendance].[Applied2LeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]
  LEFT OUTER JOIN [ATN_ApplHeader] AS [ATN_ApplHeader4]
    ON [ATN_Attendance].[ApplHeaderID] = [ATN_ApplHeader4].[LeaveApplID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [ATN_ApplHeader4].[VerifiedBy] = [HRM_Employees5].[CardNo]
  WHERE
        [ATN_Attendance].[FinYear] = @FinYear  
    AND [ATN_Attendance].[ApplStatusID] = @ApplStatusID  
    AND [ATN_ApplHeader4].[VerifiedBy] = @VerifiedBy 

  ORDER BY [ATN_Attendance].[AttenDate],[ATN_Attendance].[CardNo]
   
  SET @RecordCount = @@RowCount
GO
