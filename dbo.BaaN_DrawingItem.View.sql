USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[BaaN_DrawingItem]
as
SELECT 
				ProjectCode,
				DrawingNo,
				ItemCode,
        Element,
        Item    
FROM 
OPENQUERY([BAAN],
'SELECT 
				ttppdm903100.t$cprj as ProjectCode,
				trim(ttppdm903100.t$cdoc) as DrawingNo,
				trim(ttppdm903100.t$item) as ItemCode,
        ttppdm902100.t$cspa As Element,
        ttppdm902100.t$pitem As Item 

FROM ttppdm903100, ttppdm902100 
WHERE (ttppdm902100.t$cprj = ttppdm903100.t$cprj and ttppdm902100.t$item = ttppdm903100.t$item)
');
GO
