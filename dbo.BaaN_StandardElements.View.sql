USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[BaaN_StandardElements]
AS
SELECT  
		ElementCode,
		ElementDescription
FROM  OPENQUERY(baan,  
'SELECT   
ttppdm090100.t$cspa as ElementCode,
ttppdm090100.t$desc as ElementDescription
 FROM  ttppdm090100
')
GO
