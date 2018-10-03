USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATN_PivotNAttendance]
AS
SELECT     dbo.ATN_Attendance.CardNo, dbo.HRM_Employees.EmployeeName, 
					'D' + LTRIM(STR(DAY(dbo.ATN_Attendance.AttenDate))) AS D_Day, 
                      MONTH(dbo.ATN_Attendance.AttenDate) AS D_Mon, 
				CASE posted 
					WHEN 1 THEN ISNULL(Applied1LeaveTypeID, ISNULL(Applied2LeaveTypeID, PunchStatusID)) 
					WHEN 0 THEN PunchStatusID 
				END + ',' + STR(dbo.ATN_Attendance.Punch1Time, 5, 2) + ',' + STR(ISNULL(dbo.ATN_Attendance.Punch9Time,'00.00'), 5, 
                      2) AS PStatus, dbo.HRM_Employees.VerifierID AS VrfID, dbo.HRM_Employees.ApproverID AS AprID
FROM         dbo.ATN_Attendance INNER JOIN
                      dbo.HRM_Employees ON dbo.ATN_Attendance.CardNo = dbo.HRM_Employees.CardNo 
  --and dbo.Hrm_employees.c_officeid = 1
GO
