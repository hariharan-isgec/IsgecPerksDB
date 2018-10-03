USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_LinkIRPurchaseInvoice]
as
SELECT  
PurchaseInvoice as PurchaseInvoice, 
IRNO as           IRNO,             
Project as        Project,          
Supplier as       Supplier,         
Amount as         Amount,           
OrderNumber as    OrderNumber,      
LinkUser as       LinkUser,             
LikedOn as        LikedOn,          
Linkedat as       Linkedat
FROM 
OPENQUERY([BAAN],
'SELECT 
t$invn as PurchaseInvoice,     
t$ninv as IRNO,                
t$cprj as Project,             
t$suno as Supplier,            
t$amoc as Amount,              
t$orno as OrderNumber,         
t$user as LinkUser,                
to_char(t$lkdt) as LikedOn,             
t$lktm as Linkedat 
FROM baandb.ttfacp901200
') ;
GO
