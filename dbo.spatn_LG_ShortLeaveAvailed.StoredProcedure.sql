USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spatn_LG_ShortLeaveAvailed]
@FinYear Int
AS
BEGIN
SELECT     TOP (100) PERCENT dbo.ATN_Attendance.AttenID, dbo.ATN_Attendance.AttenDate, dbo.ATN_Attendance.CardNo, 
                      CASE WHEN Punch1Time < 9.00 THEN 9.00 ELSE Punch1Time END AS Punch1Time, dbo.ATN_Attendance.Punch2Time, CONVERT(datetime, 
                      '01/01/2000' + REPLACE(STR(CASE WHEN Punch1Time < 9.00 THEN 9.00 ELSE Punch1Time END, 6, 2), '.', ':') + ':00') AS p1t, CONVERT(datetime, 
                      '01/01/2000' + REPLACE(STR(dbo.ATN_Attendance.Punch2Time, 6, 2), '.', ':') + ':00') AS p2t, 525 - DATEDIFF(mi, CONVERT(datetime, 
                      '01/01/2000' + REPLACE(STR(CASE WHEN Punch1Time < 9.00 THEN 9.00 ELSE Punch1Time END, 6, 2), '.', ':') + ':00'), CONVERT(datetime, 
                      '01/01/2000' + REPLACE(STR(dbo.ATN_Attendance.Punch2Time, 6, 2), '.', ':') + ':00')) AS difmin, dbo.HRM_EmployeeDetails.EmployeeName, 
                      dbo.HRM_EmployeeDetails.Designation, dbo.HRM_EmployeeDetails.Department, dbo.HRM_EmployeeDetails.Division, 
                      dbo.HRM_EmployeeDetails.Location
FROM         dbo.ATN_Attendance INNER JOIN
                      dbo.HRM_EmployeeDetails ON dbo.ATN_Attendance.CardNo = dbo.HRM_EmployeeDetails.CardNo
WHERE     (dbo.ATN_Attendance.FinYear = @FinYear) AND (dbo.ATN_Attendance.Applied1LeaveTypeID = 'SH') AND (dbo.ATN_Attendance.Posted = 1) AND 
                      (525 - DATEDIFF(mi, CONVERT(datetime, '01/01/2000' + REPLACE(STR(CASE WHEN Punch1Time < 9.00 THEN 9.00 ELSE Punch1Time END, 6, 2), '.', ':') 
                      + ':00'), CONVERT(datetime, '01/01/2000' + REPLACE(STR(dbo.ATN_Attendance.Punch2Time, 6, 2), '.', ':') + ':00')) > 0) OR
                      (dbo.ATN_Attendance.FinYear = @FinYear) AND (dbo.ATN_Attendance.Posted = 1) AND (525 - DATEDIFF(mi, CONVERT(datetime, 
                      '01/01/2000' + REPLACE(STR(CASE WHEN Punch1Time < 9.00 THEN 9.00 ELSE Punch1Time END, 6, 2), '.', ':') + ':00'), CONVERT(datetime, 
                      '01/01/2000' + REPLACE(STR(dbo.ATN_Attendance.Punch2Time, 6, 2), '.', ':') + ':00')) > 0) AND (dbo.ATN_Attendance.Applied2LeaveTypeID = 'SH')
ORDER BY difmin DESC, dbo.ATN_Attendance.CardNo, dbo.ATN_Attendance.AttenDate
END
GO
