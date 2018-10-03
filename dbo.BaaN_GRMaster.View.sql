USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BaaN_GRMaster]
AS
SELECT  
		ProjectCode,
        SupplierCode,
		GRNo,
		GRDate
FROM  OPENQUERY(baan,  
'SELECT   
ttdpur950200.t$cprj as ProjectCode,
ttdpur950200.t$suno as SupplierCode,
ttdpur950200.t$grno as GRNo,
ttdpur950200.t$date as GRDate
FROM  ttdpur950200  
where extract(year from ttdpur950200.t$date) >= 2003
')
GO
