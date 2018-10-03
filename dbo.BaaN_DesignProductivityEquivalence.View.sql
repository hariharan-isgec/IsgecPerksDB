USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BaaN_DesignProductivityEquivalence]
AS
SELECT  
		DrawingGroupCode,
        round(A0Hours,2) as A0Hours,
        round(A1Hours,2) as A1Hours,
		round(A2Hours,2) as A2Hours,
		round(A3Hours,2) as A3Hours,
		round(A4Hours,2) as A4Hours
FROM  OPENQUERY(baan,  
'SELECT   
    ttphrs916100.t$grcd as DrawingGroupCode,
	ttphrs916100.t$a0hrs as A0Hours,
	ttphrs916100.t$a1hrs as A1Hours,
	ttphrs916100.t$a2hrs as A2Hours,
	ttphrs916100.t$a3hrs as A3Hours,
	ttphrs916100.t$a4hrs as A4Hours
 FROM  ttphrs916100 
')
GO
