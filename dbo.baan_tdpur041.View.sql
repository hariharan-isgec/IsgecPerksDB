USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[baan_tdpur041]
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
ProjectCode         as ProjectCode        ,
ElementCode         as ElementCode        ,
CostComponent       as CostComponent      ,
OrderLineText       as OrderLineText    
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
t$cprj      as ProjectCode         ,
t$cspa      as ElementCode         ,
t$ccco      as CostComponent       ,
t$txta      as OrderLineText      
FROM baandb.ttdpur041200
where extract(year from baandb.ttdpur041200.t$odat) >= 2010
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
t$cprj      as ProjectCode         ,
t$cspa      as ElementCode         ,
t$ccco      as CostComponent       ,
t$txta      as OrderLineText      
FROM baandb.ttdpur041300
where extract(year from baandb.ttdpur041300.t$odat) >= 2010
') ;
GO
