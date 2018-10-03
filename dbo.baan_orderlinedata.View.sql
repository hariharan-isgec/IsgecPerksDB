USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_orderlinedata]
as
SELECT 
OrderNo,
OrderLineNo,   
Element,
Item,   
convert(decimal(18,4),Quantity) as Quantity,   
convert(datetime,deliverydate,6) as DeliveryDate,   
convert(decimal(18,2),LineBasicValue) as LineBasicValue,   
LineTotalValue,   
SupplierCode,   
Unit,   
ProjectCode,   
OtherCharges1,   
OtherCharges2,    
OtherCharges1Code,   
OtherCharges2Code,   
EDValue,   
EDRate,    
StateCode,   
SalesTaxCode,   
SalesTaxValue  
FROM 
OPENQUERY([BAAN],
'SELECT 
ttdpur944200.t$orno as orderno,
ttdpur944200.t$pono as orderlineno,   
ttdpur944200.t$element as element,
ttdpur944200.t$item as item,   
ttdpur944200.t$oqua as quantity,   
to_char(ttdpur944200.t$ddtb) as deliverydate,   
ttdpur944200.t$bval as linebasicvalue,   
ttdpur944200.t$tval as linetotalvalue,   
ttdpur944200.t$suno as suppliercode,   
ttdpur944200.t$cuqp as unit,   
ttdpur944200.t$cprj as projectcode,   
ttdpur944200.t$oc1 as othercharges1,   
ttdpur944200.t$oc2 as othercharges2,    
ttdpur944200.t$occ1 as othercharges1code,   
ttdpur944200.t$occ2 as othercharges2code,   
ttdpur944200.t$edv as edvalue,   
ttdpur944200.t$edr as edrate,    
ttdpur944200.t$scty as statecode,   
ttdpur944200.t$svat as salestaxcode,   
ttdpur944200.t$stv as salestaxvalue  
FROM baandb.ttdpur944200
where extract(year from ttdpur944200.t$ddtb) >= 2009
') ;
GO
