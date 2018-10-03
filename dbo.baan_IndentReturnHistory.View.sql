USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_IndentReturnHistory]
as
SELECT  
ProjectCode as ProjectCode,
IndentNo as IndentNo,           
PRPNo as PRPNo,              
Item as Item,                 
BudgetedPriceBasic as BudgetedPriceBasic,
Amount as Amount,               
PlanDeliveryDate as PlanDeliveryDate,    
PlanOrderDate as PlanOrderdate,       
ElementCode as ElementCode,              
Quantity as Quantity ,            
IndentType as IndentType ,         
Remarks as Remarks ,             
EntryUser as EntryUser,                 
ReturnDate as ReturnDate,             
Returned as Returned ,            
ReturnText as ReturnText,                 
ReturnSequence as ReturnSequence,            
BuyerCode as BuyerCode ,               
IndentDate as IndentDate,          
TransferDate as TransferDate,    
ReasonCode as ReasonCode
FROM 
OPENQUERY([BAAN],
'SELECT 
t$cprj as ProjectCode,
t$srno as IndentNo,           
t$orno as PRPNo,              
t$item as Item,                 
t$pric as BudgetedPriceBasic,
t$amoc as Amount,               
to_char(t$pddt) as PlanDeliveryDate,    
to_char(t$podt) as PlanOrderDate,       
t$cspa as ElementCode,              
t$oqan as Quantity ,            
t$indt as IndentType ,         
t$vrem as Remarks ,             
t$vusr as EntryUser,                 
t$rtdt as ReturnDate,             
t$rtnd as Returned ,            
t$txta as ReturnText,                 
t$srnb as ReturnSequence,            
t$buyr as BuyerCode ,               
to_char(t$prdt) as IndentDate,          
to_char(t$trdt) as TransferDate,      
t$rscd as ReasonCode               
FROM baandb.ttppss937100
where extract(year from baandb.ttppss937100.t$trdt) >= 2010
') ;
GO
