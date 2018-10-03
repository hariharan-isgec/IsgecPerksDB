USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_POLineRevision]
as
SELECT  
OrderNo				as OrderNo			,
OrderLineNo         as OrderLineNo        ,
SupplierCode        as SupplierCode       ,
ItemCode            as ItemCode           ,
POPrice             as POPrice            ,
PurchasePrice       as PurchasePrice      ,
ConversionFact      as ConversionFact     ,
ItemGroup           as ItemGroup          ,
OrderDate           as OrderDate          ,
convert(datetime,PlannedDeliveryDate,6) as PlannedDeliveryDate,
Quantity            as Quantity           ,
PurchaseUnit        as PurchaseUnit       ,
Amount              as Amount             ,
Country             as Country            ,
ProjectCode         as ProjectCode        ,
ElementCode         as ElementCode        ,
CostComponent       as CostComponent      ,
Logincode           as Logincode          ,
UserCode            as UserCode           ,
OrderLineText       as OrderLineText      ,
RevisionNo			as RevisionNo       ,
convert(datetime,RevisionDate,6) as RevisionDate,
OrderQuantity       as OrderQuantity      ,
ItemMasterText      as ItemMasterText     ,
BasicAmount         as BasicAmount        ,
NetAmount           as NetAmount          
FROM 
OPENQUERY([BAAN],
'SELECT 
t$orno      as OrderNo     ,        
t$pono      as OrderLineNo  ,       
t$suno      as SupplierCode  ,      
t$item      as ItemCode       ,     
t$pric      as POPrice         ,    
t$cupp      as PurchasePrice    ,   
t$cvpp      as ConversionFact    ,  
t$citg      as ItemGroup          , 
t$odat      as OrderDate           ,
t$ddta      as PlannedDeliveryDate ,
t$qana      as Quantity            ,
t$cuqp      as PurchaseUnit        ,
t$amta      as Amount              ,
t$ccty      as Country             ,
t$cprj      as ProjectCode         ,
t$cspa      as ElementCode         ,
t$ccco      as CostComponent       ,
t$logn      as Logincode           ,
t$user      as UserCode                ,
t$txta      as OrderLineText       ,
t$rvno      as RevisionNo        ,
t$rvdt      as RevisionDate       ,
t$oqua      as OrderQuantity       ,
t$itxt      as ItemMasterText      ,
t$bamt      as BasicAmount         ,
t$tamt      as NetAmount           
FROM baandb.ttdpur971200
where extract(year from baandb.ttdpur971200.t$rvdt) >= 2010
union
SELECT 
t$orno      as OrderNo     ,        
t$pono      as OrderLineNo  ,       
t$suno      as SupplierCode  ,      
t$item      as ItemCode       ,     
t$pric      as POPrice         ,    
t$cupp      as PurchasePrice    ,   
t$cvpp      as ConversionFact    ,  
t$citg      as ItemGroup          , 
t$odat      as OrderDate           ,
t$ddta      as PlannedDeliveryDate ,
t$qana      as Quantity            ,
t$cuqp      as PurchaseUnit        ,
t$amta      as Amount              ,
t$ccty      as Country             ,
t$cprj      as ProjectCode         ,
t$cspa      as ElementCode         ,
t$ccco      as CostComponent       ,
t$logn      as Logincode           ,
t$user      as UserCode                ,
t$txta      as OrderLineText       ,
t$rvno      as RevisionNo        ,
t$rvdt      as RevisionDate       ,
t$oqua      as OrderQuantity       ,
t$itxt      as ItemMasterText      ,
t$bamt      as BasicAmount         ,
t$tamt      as NetAmount           
FROM baandb.ttdpur971300
where extract(year from baandb.ttdpur971300.t$rvdt) >= 2010
') ;
GO
