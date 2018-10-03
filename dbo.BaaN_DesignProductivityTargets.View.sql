USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BaaN_DesignProductivityTargets]
AS
SELECT  
		GroupCode as ManhourGroup,
DrawingGroup as DrawingGroupID,
ActivityCode as ActivityID,
        round(A0HoursTarget,2) as A0HoursTarget,
        round(A1HoursTarget,2) as A1HoursTarget,
		round(A2HoursTarget,2) as A2HoursTarget,
		round(A3HoursTarget,2) as A3HoursTarget,
		round(A4HoursTarget,2) as A4HoursTarget
FROM  OPENQUERY(baan,  
'SELECT   
    ttphrs915100.t$grcd as GroupCode,
ttphrs915100.t$dgid as DrawingGroup,
ttphrs915100.t$actid as ActivityCode,
	ttphrs915100.t$a0hrs as A0HoursTarget,
	ttphrs915100.t$a1hrs as A1HoursTarget,
	ttphrs915100.t$a2hrs as A2HoursTarget,
	ttphrs915100.t$a3hrs as A3HoursTarget,
	ttphrs915100.t$a4hrs as A4HoursTarget
 FROM  ttphrs915100 
')
GO
