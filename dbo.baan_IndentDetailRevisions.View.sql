USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_IndentDetailRevisions]
as
SELECT  
ProjectCode    ,                              
IndentNo        ,                             
PRPNo            ,                            
Item   ,                                      
BudgetedPriceBasic,                           
Amount             ,                          
convert(datetime,PlanDeliveryDate,6) as PlanDeliveryDate    ,                         
convert(datetime,PlanOrderDate,6) as PlanOrderDate        ,                        
Element               ,                       
Quantity               ,                      
OrderNo                 ,                     
OrderLineNo              , 
ItemGroup                 ,                   
IndentType                 ,                  
Cancelled                   ,                 
CancelledOrder               ,                
CancelledLine                 ,               
IndentLine                     ,              
IndentRev                       ,             
convert(nvarchar,PlanDeliveryDateFrom) as PlanDeliveryDateFrom  
FROM 
OPENQUERY([BAAN],
'SELECT       
t$cprj    as   ProjectCode       ,       
t$srno    as   IndentNo           ,
t$orno    as   PRPNo              ,
t$item    as   Item                , 
t$pric    as   BudgetedPriceBasic,
t$amoc    as   Amount             ,  
t$pddt    as   PlanDeliveryDate    ,
t$podt    as   PlanOrderDate       ,
t$cspa    as   Element              ,
t$oqan    as   Quantity             ,
t$ordno   as   OrderNo            ,
t$pono    as   OrderLineNo         ,
t$citg    as   ItemGroup           ,
t$indt    as   IndentType          ,
t$cncl    as   Cancelled            ,
t$lorn    as   CancelledOrder      ,
t$lpon    as   CancelledLine       ,
t$line    as   IndentLine          ,
t$indrv   as   IndentRev        ,
to_char(t$pddt1) as PlanDeliveryDateFrom 
FROM baandb.ttppss943100
') ;
GO
