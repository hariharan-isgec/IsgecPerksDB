USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatn_LG_atnAverageDelayInRegularization]
@FinYear NVarChar(4), 
@ForMonth Int,
@ForLeaveTypes NVarChar(100) 
AS
BEGIN
SELECT TOP (100) PERCENT 
			dbo.ATN_Attendance.CardNo, 
			dbo.HRM_Employees.EmployeeName, 
      AVG(DATEDIFF(d, dbo.ATN_Attendance.AttenDate, dbo.ATN_ApplHeader.AppliedOn)) AS DelayInDays, 
      dbo.HRM_Departments.Description 
FROM  dbo.ATN_Attendance  
			INNER JOIN dbo.ATN_ApplHeader 
				ON dbo.ATN_Attendance.ApplHeaderID = dbo.ATN_ApplHeader.LeaveApplID 
			INNER JOIN dbo.HRM_Employees 
				ON dbo.ATN_Attendance.CardNo = dbo.HRM_Employees.CardNo 
			INNER JOIN dbo.HRM_Departments 
				ON dbo.HRM_Employees.C_DepartmentID = dbo.HRM_Departments.DepartmentID
WHERE (dbo.HRM_Employees.ActiveState = 1)
			AND (dbo.ATN_Attendance.Applied = 1) 
			AND (DATEDIFF(d, dbo.ATN_Attendance.AttenDate, dbo.ATN_ApplHeader.AppliedOn) > 0) 
			AND (dbo.ATN_Attendance.FinYear = @FinYear) 
			AND (MONTH(dbo.ATN_Attendance.AttenDate) = @ForMonth) 
			AND (dbo.ATN_Attendance.Applied1LeaveTypeID IN (@ForLeaveTypes) OR dbo.ATN_Attendance.Applied2LeaveTypeID IN (@ForLeaveTypes)) 
GROUP BY dbo.ATN_Attendance.CardNo, dbo.HRM_Employees.EmployeeName, dbo.HRM_Departments.Description
ORDER BY dbo.HRM_Departments.Description, dbo.ATN_Attendance.CardNo

END

--AS
--BEGIN
--
--SELECT     TOP (100) PERCENT dbo.ATN_Attendance.CardNo, dbo.HRM_Employees.EmployeeName, AVG(DATEDIFF(d, dbo.ATN_Attendance.AttenDate, 
--                      dbo.ATN_ApplHeader.AppliedOn)) AS AvgDelay, dbo.HRM_Departments.Description
--FROM         dbo.ATN_Attendance INNER JOIN
--                      dbo.ATN_ApplHeader ON dbo.ATN_Attendance.ApplHeaderID = dbo.ATN_ApplHeader.LeaveApplID INNER JOIN
--                      dbo.HRM_Employees ON dbo.ATN_Attendance.CardNo = dbo.HRM_Employees.CardNo INNER JOIN
--                      dbo.HRM_Departments ON dbo.HRM_Employees.C_DepartmentID = dbo.HRM_Departments.DepartmentID
--WHERE     (dbo.ATN_Attendance.Applied = 1) AND (MONTH(dbo.ATN_Attendance.AttenDate) = 6) AND (dbo.ATN_Attendance.Applied1LeaveTypeID = N'SP') AND 
--                      (DATEDIFF(d, dbo.ATN_Attendance.AttenDate, dbo.ATN_ApplHeader.AppliedOn) > 0) OR
--                      (dbo.ATN_Attendance.Applied = 1) AND (MONTH(dbo.ATN_Attendance.AttenDate) = 6) AND (DATEDIFF(d, dbo.ATN_Attendance.AttenDate, 
--                      dbo.ATN_ApplHeader.AppliedOn) > 0) AND (dbo.ATN_Attendance.Applied2LeaveTypeID = N'SP')
--GROUP BY dbo.ATN_Attendance.CardNo, dbo.HRM_Employees.EmployeeName, dbo.HRM_Departments.Description
--ORDER BY dbo.HRM_Departments.Description, dbo.ATN_Attendance.CardNo
GO
