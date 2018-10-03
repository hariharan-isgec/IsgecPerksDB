USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BaaN_PackingListDetails]
AS
SELECT  
		PackingListNo,
        ProjectCode,
        LCSerialNo,
		DespatchedFrom,
		PortOfDischarge
FROM  OPENQUERY(baan,  
'SELECT   
    ttploc901100.t$plno as PackingListNo,
    ttploc901100.t$cprj as ProjectCode,
    ttploc901100.t$lcsr as LCSerialNo,
    trim(ttploc901100.t$load) as DespatchedFrom,
    (trim(ttploc901100.t$pdct) || trim(ttploc901100.t$pdct2)) as PortOfDischarge
 FROM  ttploc901100   
')
GO
