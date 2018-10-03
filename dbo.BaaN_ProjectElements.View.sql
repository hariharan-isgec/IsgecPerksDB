USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BaaN_ProjectElements]
AS
SELECT  
		ProjectCode,
        ElementCode,
		ElementDescription
FROM  OPENQUERY(baan,  
'SELECT   
ttpptc100100.t$cprj as ProjectCode,
ttpptc100100.t$cspa as ElementCode,
ttpptc100100.t$desc as ElementDescription
 FROM  ttpptc100100
')
GO
