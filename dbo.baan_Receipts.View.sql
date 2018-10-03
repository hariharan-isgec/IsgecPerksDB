USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_Receipts]
as
SELECT  
OrderNo 						as 	OrderNo ,  
OrderLineNo 					as	OrderLineNo  ,     
Sequence 						as	Sequence  ,        
SupplierCode 					as  SupplierCode  ,    
Project 						as  Project  ,         
ItemCode 						as  ItemCode  ,        
POPrice 						as  POPrice  ,   
convert(datetime,ReceiptDate,6) as  ReceiptDate  ,     
InvoicedQuantity  				as  InvoicedQuantity  , 
InvoicedAmount 					as  InvoicedAmount  ,  
ReceiptNumber 					as  ReceiptNumber   ,
PackingSlipNumber 				as  PackingSlipNumber  ,
InvoiceNumber 					as  InvoiceNumber  ,   
convert(datetime,InvoiceDate,6)	as  InvoiceDate  ,    
convert(decimal(18,4),QuantityonPackingSlip) as 	QuantityonPackingSlip,
DeliveredQty					as  DeliveredQty ,    
BackOrderQty  					as  BackOrderQty ,   
ApprovedQuantity  				as  ApprovedQuantity ,
RejectedQuantity  				as  RejectedQuantity ,
convert(decimal(18,2),Amount) 						as  Amount ,          
Matched  						as  Matched  ,        
Company  						as  Company  ,        
FinanceCompany					as	FinanceCompany 
FROM 
OPENQUERY([BAAN],
'SELECT 
t$orno as OrderNo,
t$pono as OrderLineNo,
t$srnb as Sequence,
t$suno as SupplierCode,
t$cprj as Project,
t$item as ItemCode,
t$pric as POPrice,
t$date as ReceiptDate,
t$iqan as InvoicedQuantity ,
t$iamt as InvoicedAmount,
t$reno as ReceiptNumber,
t$dino as PackingSlipNumber,
t$invn as InvoiceNumber,
to_char(t$invd) as InvoiceDate,
t$diqu as QuantityonPackingSlip,
t$dqua as DeliveredQty,
t$bqua as BackOrderQty ,
t$quap as ApprovedQuantity ,
t$quad as RejectedQuantity,
t$amnt as Amount,
t$matc as Matched ,
t$comp as Company ,
t$fico as FinanceCompany 
FROM baandb.ttdpur045200
where extract(year from baandb.ttdpur045200.t$date) >= 2009
') ;
GO
