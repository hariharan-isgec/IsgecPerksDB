USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BaaN_ProjectDocuments]
AS
SELECT  
ProjectCode as ProjectCode,
DocumentNo as DocumentNo,
DocumentName as DocumentName,
RevisionNo as RevisionNo,
FirstReleaseDate as FirstReleaseDate,
ManuallyCreated as ManuallyCreated
FROM  OPENQUERY(baan,  
'SELECT  
ttppdm911100.t$cprj as ProjectCode,
ttppdm911100.t$cdoc as DocumentNo,
ttppdm911100.t$desc as DocumentName,
ttppdm911100.t$rvno as RevisionNo,
ttppdm911100.t$rdat as FirstReleaseDate,
ttppdm911100.t$mnul as ManuallyCreated
FROM  ttppdm911100
where extract(year from ttppdm911100.t$rdat) >= 2009
')
GO
