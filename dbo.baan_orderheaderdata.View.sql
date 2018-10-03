USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_orderheaderdata]
as
SELECT 
OrderNo,
convert(datetime,orderdate,6) as OrderDate,
SupplierCode,
OrderBasicValue,
OrderTotalValue,
ProjectCode,
BuyerCode
FROM 
OPENQUERY([BAAN],
'SELECT 
ttdpur943200.t$orno as orderno,
to_char(ttdpur943200.t$odat) as orderdate,
ttdpur943200.t$suno as suppliercode,
ttdpur943200.t$bval as orderbasicvalue,
ttdpur943200.t$tval as ordertotalvalue,
ttdpur943200.t$cprj as projectcode,
ttdpur040100.t$ccon as BuyerCode
FROM baandb.ttdpur943200, baandb.ttdpur040100
where extract(year from baandb.ttdpur943200.t$odat) >= 2009
and baandb.ttdpur943200.t$orno = baandb.ttdpur040100.t$orno
') ;
GO
