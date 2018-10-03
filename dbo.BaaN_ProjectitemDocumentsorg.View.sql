USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BaaN_ProjectitemDocumentsorg]
AS
SELECT  
ProjectCode as ProjectCode,
ElementCode as ElementCode,
ItemCode as ItemCode,
DocumentNo as DocumentNo,
ItemStatus as ItemStatus
FROM  OPENQUERY(baan,  
'SELECT  
ttppdm901100.t$cprj as ProjectCode,
ttppdm901100.t$cspa as ElementCode,
ttppdm901100.t$item as ItemCode,
ttppdm901100.t$cdoc as DocumentNo,
ttppdm901100.t$ests as ItemStatus
FROM  ttppdm901100
')
GO
