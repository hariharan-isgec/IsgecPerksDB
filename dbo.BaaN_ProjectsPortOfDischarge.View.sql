USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[BaaN_ProjectsPortOfDischarge]
AS
SELECT  
        ProjectCode,
        LCSerialNo,
				ProjectPortOfDischarge
FROM  OPENQUERY(baan,  
'SELECT   
     ttploc840100.t$cprj as ProjectCode,
     ttploc840100.t$lcsr as LCSerialNo,
     (trim(ttploc840100.t$pdct) || trim(ttploc840100.t$pdct2)) as ProjectPortOfDischarge 
 FROM  ttploc840100
')
GO
