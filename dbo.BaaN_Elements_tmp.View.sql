USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[BaaN_Elements_tmp]
AS
SELECT  
		ProjectCode,
    ElementCode,
		ElementDescription,
		EnggEnabled,
		EnggStatus
FROM  OPENQUERY(baan,  
'SELECT   
ttpptc100100.t$cprj as ProjectCode,
ttpptc100100.t$cspa as ElementCode,
ttpptc100100.t$desc as ElementDescription,
ttpptc100100.t$eerq as EnggEnabled,
ttpptc100100.t$erst as EnggStatus  
 FROM  ttpptc100100
')
GO
