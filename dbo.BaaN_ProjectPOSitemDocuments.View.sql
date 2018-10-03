USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[BaaN_ProjectPOSitemDocuments]
AS
SELECT  
ProjectCode as ProjectCode,
DocumentNo as DocumentNo,
ItemCode as ItemCode,
DocumentDescription as DocumentDescription,
DocumentRevision as DocumentRevision
FROM  OPENQUERY(baan,  
'SELECT  
ttppdm913100.t$cprj as ProjectCode,
ttppdm913100.t$cdoc as DocumentNo,
ttppdm913100.t$item as ItemCode,
ttppdm911100.t$desc as DocumentDescription,
ttppdm911100.t$rvno as DocumentRevision
FROM  ttppdm913100, ttppdm911100
where ttppdm913100.t$cprj = ttppdm911100.t$cprj
and ttppdm913100.t$cdoc = ttppdm911100.t$cdoc
')
GO
