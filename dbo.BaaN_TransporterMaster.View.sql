USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[BaaN_TransporterMaster]
AS
SELECT  
		TransporterCode,
        TransporterName
FROM  OPENQUERY(baan,  
'SELECT   
ttdind115100.t$trcd as TransporterCode,
ttdind115100.t$nama as TransporterName
FROM  ttdind115100  
')
GO
