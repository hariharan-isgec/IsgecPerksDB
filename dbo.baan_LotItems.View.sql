USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[baan_LotItems]
as
SELECT  
ProjectCode  as ProjectCode ,   
 ElementCode  as ElementCode,    
 LOTItemCode  as LOTItemCode,    
 SerialNo    as SerialNo,
 Line  as Line,   
 DesignItemCode    as  DesignItemCode ,  
 DesignQuantity      as DesignQunatity ,  
 DesignUnit  as  DesignUnit,    
 Weight  as   Weight,   
 Quantity  as   Quantity  , 
 Unit  as  Unit,
 OrderNo  as  OrderNo  ,  
OrderLineNo as OrderLineNo
FROM 
OPENQUERY([BAAN],
'SELECT 
 t$cprj  as ProjectCode ,   
 t$cspa  as ElementCode,    
 t$pitem  as LOTItemCode,    
 t$srno    as SerialNo,
 t$lineno  as Line,   
 t$item    as  DesignItemCode ,  
 t$qty      as DesignQuantity ,  
 t$cuni  as  DesignUnit,    
 t$wght  as   Weight,   
 t$cqty  as   Quantity  , 
 t$ccuni  as  Unit,
 t$orno  as  OrderNo  ,  
t$pono  as OrderLineNo
FROM baandb.ttppdm902100
') ;
GO
