USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[BaaN_NonRegularSuppliers]
AS
SELECT  
		SuplierCode,
        SuplierName
FROM  OPENQUERY(baan,  
'SELECT   
ttdpur998100.t$suno as SuplierCode,
ttdpur998100.t$nama as SuplierName
FROM  ttdpur998100  
')
GO
