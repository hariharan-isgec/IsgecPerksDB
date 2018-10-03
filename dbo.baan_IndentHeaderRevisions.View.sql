USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_IndentHeaderRevisions]
as
SELECT     
ProjectCode,                 
IndentNo   ,                
convert(datetime,IndentDate,6) as IndentDate,           
IndentStatus  ,              
PreparedBy     ,             
ApprovedBy      ,            
Buyer            ,           
Descr             ,          
Transfered         ,         
convert(datetime,TransferDate,6) TransferDate,
ApprovalDate,    
IndentType        ,          
Cancelled          ,         
SanctionLevel       ,        
SanctionReference    ,       
IndentPriority        ,      
IndentRev              ,     
convert(datetime,RevisionDate) as RevisionDate            ,    
DeisgnEngineer           ,   
SanctionType,                
ApprovalNo   ,               
ReasonCode
FROM 
OPENQUERY([BAAN],
'SELECT 
 t$cprj  as   ProjectCode,                      
 t$srno  as   IndentNo   ,               
 t$prdt  as   IndentDate   ,              
 t$ostb  as   IndentStatus  ,             
 t$prep  as   PreparedBy     ,               
 t$auth  as   ApprovedBy      ,              
 t$buyr  as   Buyer            ,           
 t$desc  as   Descr             ,    
 t$tran  as   Transfered         ,         
 t$trdt  as   TransferDate        ,        
 to_char(t$audt)  as   ApprovalDate          ,      
 to_char(t$indt)  as   IndentType        ,
 t$cncl  as   Cancelled          ,         
 t$slvl  as   SanctionLevel       ,       
 t$sref  as   SanctionReference    ,      
 t$prio  as   IndentPriority        ,     
 t$indrv as   IndentRev              ,    
 t$rvdat as   RevisionDate            ,     
 t$deng  as   DeisgnEngineer           ,  
 t$styp  as   SanctionType,
 t$apno  as   ApprovalNo   ,             
 t$rcod  as   ReasonCode
FROM baandb.ttppss942100
where extract(year from baandb.ttppss942100.t$prdt) >= 2010
and extract(year from baandb.ttppss942100.t$trdt) >= 2010
') ;
GO
