USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BaaN_ProjectitemDocuments]
AS
SELECT  
ProjectCode as ProjectCode,
DocumentNo as DocumentNo,
ItemCode as ItemCode,
DocumentDescription as DocumentDescription,
DocumentRevision as DocumentRevision
FROM  OPENQUERY(baan,  
'SELECT  
ttppdm903100.t$cprj as ProjectCode,
ttppdm903100.t$cdoc as DocumentNo,
ttppdm903100.t$item as ItemCode,
ttppdm911100.t$desc as DocumentDescription,
ttppdm911100.t$rvno as DocumentRevision
FROM  ttppdm903100, ttppdm911100
where ttppdm903100.t$cprj = ttppdm911100.t$cprj
and ttppdm903100.t$cdoc = ttppdm911100.t$cdoc
')
GO
