USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATNv_SiteAttendanceData]    
AS
	SELECT CardNo,EmployeeName,DataMonth,FinYear,C_ProjectSiteID,
         [D1],[D2],[D3],[D4],[D5],[D6],[D7],[D8],[D9],[D10],[D11],[D12],[D13],[D14],[D15],[D16],[D17],[D18],[D19],[D20],[D21],[D22],[D23],[D24],[D25],[D26],[D27],[D28],[D29],[D30],[D31] 
	FROM (SELECT     
					dbo.ATN_Attendance.CardNo, 
					dbo.HRM_Employees.EmployeeName, 
					MONTH(dbo.ATN_Attendance.AttenDate) AS DataMonth, 
					dbo.ATN_Attendance.FinYear, 
					dbo.HRM_Employees.C_ProjectSiteID,
					'D' + LTRIM(STR(DAY(dbo.ATN_Attendance.AttenDate))) AS DataDay, 
					CASE dbo.ATN_Attendance.Applied 
							WHEN 1 THEN ISNULL(Applied1LeaveTypeID, ISNULL(Applied2LeaveTypeID, PunchStatusID)) 
							WHEN 0 THEN PunchStatusID 
					END AS DataStatus    
				FROM dbo.ATN_Attendance 
					   INNER JOIN dbo.HRM_Employees ON dbo.ATN_Attendance.CardNo = dbo.HRM_Employees.CardNo 
				WHERE  dbo.ATN_Attendance.SiteAttendance = 1
              and dbo.HRM_Employees.ActiveState = 1 
              AND ATN_Attendance.FinYear=2017   
      ) AS Atnd1 
	PIVOT 
	( 
		max(DataStatus)
		FOR DataDay IN ([D1],[D2],[D3],[D4],[D5],[D6],[D7],[D8],[D9],[D10],[D11],[D12],[D13],[D14],[D15],[D16],[D17],[D18],[D19],[D20],[D21],[D22],[D23],[D24],[D25],[D26],[D27],[D28],[D29],[D30],[D31]) 
	) as AtndPt 


              --HRM_Employees.C_OfficeID=6
GO
