USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATN_TotAbsDays]
AS
SELECT     sum(punchvalue) AS TotAbsdays
FROM         dbo.ATN_Attendance
WHERE     
      (   (PunchStatusID = 'AS' AND (Applied2LeaveTypeID <> 'OD' OR Applied2LeaveTypeID <> 'SP' OR Applied2LeaveTypeID IS NULL)) 
      or (PunchStatusID = 'AF' AND (Applied1LeaveTypeID <> 'OD' OR Applied1LeaveTypeID <> 'SP' OR Applied1LeaveTypeID IS NULL)) 
      or (PunchStatusID = 'AD' AND (Applied1LeaveTypeID <> 'OD' OR Applied1LeaveTypeID <> 'SP' OR Applied1LeaveTypeID IS NULL)) 
      )
      AND (MONTH(AttenDate) = 12) AND (YEAR(AttenDate) = 2012)
GO
