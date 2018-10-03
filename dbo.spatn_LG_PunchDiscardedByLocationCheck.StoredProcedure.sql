USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spatn_LG_PunchDiscardedByLocationCheck]
  @ForDate NvarChar(10)  
  AS
  BEGIN
		SELECT     TOP (100) PERCENT dbo.ATN_Attendance.AttenID, dbo.ATN_Attendance.AttenDate, dbo.ATN_Attendance.CardNo, dbo.ATN_Attendance.Punch1Time, 
													dbo.ATN_Attendance.Punch2Time, dbo.ATN_Attendance.FirstPunchMachine, dbo.ATN_Attendance.SecondPunchMachine, 
													dbo.HRM_Employees.EmployeeName, dbo.HRM_Employees.C_OfficeID, dbo.HRM_Offices.Description AS OfficeID
		FROM         dbo.ATN_Attendance INNER JOIN
													dbo.HRM_Employees ON dbo.ATN_Attendance.CardNo = dbo.HRM_Employees.CardNo LEFT OUTER JOIN
													dbo.HRM_Offices ON dbo.HRM_Employees.C_OfficeID = dbo.HRM_Offices.OfficeID
		WHERE     APPLIED=0 AND(dbo.ATN_Attendance.AttenDate = CONVERT(datetime, @ForDate, 103)) AND (dbo.ATN_Attendance.Punch1Time > 0) AND 
													(dbo.ATN_Attendance.Punch2Time <= 0) AND (dbo.ATN_Attendance.CardNo IN
															(SELECT     CardNo
																FROM          dbo.ATN_RawPunch
																WHERE      (PunchDate = CONVERT(datetime, @ForDate, 103)) AND (Punch1Time > 0) AND (Punch2Time > 0)))
		ORDER BY dbo.ATN_Attendance.CardNo
  END
GO
