USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatn_LG_ShortLeaveCompensated]
@CardNo NVarChar(8),
@AttenDate DateTime 
AS
BEGIN
SELECT     TOP (7) CardNo, AttenDate, Punch1Time, Punch2Time, CASE WHEN PunchStatusid = 'PR' THEN 525 - DATEDIFF(mi, CONVERT(datetime, 
                      '01/01/2000' + REPLACE(STR(CASE WHEN Punch1Time < 9.00 THEN 9.00 ELSE Punch1Time END, 6, 2), '.', ':') + ':00'), CONVERT(datetime, 
                      '01/01/2000' + REPLACE(STR(Punch2Time, 6, 2), '.', ':') + ':00')) ELSE 247 - DATEDIFF(mi, CONVERT(datetime, 
                      '01/01/2000' + REPLACE(STR(CASE WHEN Punch1Time < 9.00 THEN 9.00 ELSE Punch1Time END, 6, 2), '.', ':') + ':00'), CONVERT(datetime, 
                      '01/01/2000' + REPLACE(STR(Punch2Time, 6, 2), '.', ':') + ':00')) END AS difmin
FROM         dbo.ATN_Attendance
WHERE     (CardNo = @CardNo) AND (PunchStatusID IN ('PR', 'AS', 'AF')) AND (AttenDate > @AttenDate) 
					AND (Punch1Time > 0.00 AND Punch2Time > 0.00) 
END
GO
