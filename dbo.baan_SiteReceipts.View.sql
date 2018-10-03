USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_SiteReceipts]
as
SELECT  
 OrderNo              as  	 OrderNo,            
   OrderLineNo               as      OrderLineNo,     
EnggLineno as EnggLineno   ,   
   ReceivedQuantity     as      ReceivedQuantity, 
   ItemCode             as      ItemCode,         
   ReceiveRemarks       as      ReceiveRemarks,   
   ReceiveDate          as      ReceiveDate,      
   ErectonDate          as      ErectonDate,      
   ProjectCode          as      ProjectCode,      
   ElementCode          as      ElementCode,      
   ErectionRemarks     as      ErectionRemarks, 
   ErectionQuantity    as      ErectionQuantity,
   GRNo                 as      GRNo,             
   LocationCode         as      LocationCode,     
   DamagedQuantity      as      DamagedQuantity,  
   ShortageQuantity     as      ShortageQuantity, 
   Unit                  as      Unit
FROM 
OPENQUERY([BAAN],
'SELECT 
t$orno as    OrderNo,  
t$pono as    OrderLineNo,
  t$lineno as  EnggLineNo,
  t$qty     as ReceivedQuantity,
  t$item    as ItemCode,
  t$rema    as ReceiveRemarks,
  to_char(t$redt)    as ReceiveDate,
  to_char(t$erdt)    as ErectonDate,
  t$cprj    as ProjectCode,
  t$cspa    as ElementCode,
  t$erem    as ErectionRemarks,
  t$eqty    as ErectionQuantity,
  t$grno    as GRNo,
  t$cloc    as LocationCode,
  t$dqty    as DamagedQuantity,
  t$sqty    as ShortageQuantity,
  t$cuni    as Unit
FROM baandb.ttppdm937100
where t$qty > 0
') ;
GO
