USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[baan_OrderMaxRevisionDate]
as
SELECT 
OrderNo,
RevisionDate
FROM 
OPENQUERY([BAAN],
'SELECT 
ttdpur970200.t$orno as OrderNo,
Max(ttdpur970200.t$rvdt) as RevisionDate
FROM baandb.ttdpur970200
where extract(year from baandb.ttdpur970200.t$rvdt) >= 2010
group by ttdpur970200.t$orno
') ;
GO
