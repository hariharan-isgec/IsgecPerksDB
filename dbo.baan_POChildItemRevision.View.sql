USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[baan_POChildItemRevision]
as
SELECT  
Project         as ProjectCode        ,    
Element         as ElementCode        ,    
ParentItem      as ParentItem     ,        
SrNo            as SrNo           ,        
LineItem        as LineItem         ,        
Item            as Item           ,        
Quantity        as Quantity       ,        
Unit            as Unit           ,        
Weight          as Weight         ,        
LotQty          as LotQty     ,             
LotUnit         as LotUnit         ,       
MatBudgLineItem as MatBudgLineItem ,       
OrderNo         as OrderNo        ,        
OrderLineno    as OrderLineno,             
RevisionNo     as RevisionNo  ,            
convert(datetime,RevisionDate,6)   as RevisionDate ,           
ItemMasterText  as ItemMasterText          

FROM 
OPENQUERY([BAAN],
'SELECT 
t$cprj      as Project    ,     
  t$cspa      as Element     ,    
  t$ests      as ElementStatus,  
  t$pitem     as ParentItem    , 
  t$srno      as SrNo          ,
  t$lineno    as Lineitem       ,
  t$item      as Item          ,  
  t$qty       as Quantity       , 
  t$cuni      as Unit            ,
  t$wght      as Weight          ,
  t$cqty      as LotQty           ,   
  t$ccuni     as LotUnit           ,  
  t$sern      as MatBudgLineItem    ,  
  t$orno      as OrderNo            ,
  t$pono      as OrderLineno,
  t$rvno      as RevisionNo  ,        
  t$rvdt      as RevisionDate ,       
  t$itxt      as ItemMasterText     
FROM baandb.ttppdm972100
where extract(year from baandb.ttppdm972100.t$rvdt) >= 2010
') ;
GO
