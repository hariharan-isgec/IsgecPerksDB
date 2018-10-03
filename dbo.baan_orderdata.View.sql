USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[baan_orderdata]
as
SELECT * FROM 
OPENQUERY([BAAN],
'SELECT 
ttdpur943200.t$orno as orderno,
to_char(ttdpur943200.t$odat) as orderdate,
ttdpur943200.t$bval as orderbasicvalue,
ttdpur943200.t$tval as ordertotalvalue,
ttdpur944200.t$pono as orderlineno,   
ttdpur944200.t$element as element,
ttdpur944200.t$item as item,   
ttdpur944200.t$oqua as quantity,   
to_char(ttdpur944200.t$ddtb) as deliverydate,   
ttdpur944200.t$bval as linebasicvalue,   
ttdpur944200.t$tval as linetotalvalue,   
ttdpur944200.t$suno as suppliercode,   
ttdpur944200.t$cuqp as unit,   
ttdpur944200.t$cprj as project,   
ttdpur944200.t$oc1 as othercharges1,   
ttdpur944200.t$oc2 as othercharges2,    
ttdpur944200.t$occ1 as othercharges1code,   
ttdpur944200.t$occ2 as othercharges2code,   
ttdpur944200.t$edv as edvalue,   
ttdpur944200.t$edr as edrate,    
ttdpur944200.t$scty as statecode,   
ttdpur944200.t$svat as salestaxcode,   
ttdpur944200.t$stv as salestaxvalue  
FROM baandb.ttdpur943200,baandb.ttdpur944200
where baandb.ttdpur943200.t$orno = baandb.ttdpur944200.t$orno
') ;
GO
