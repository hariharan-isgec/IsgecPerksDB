USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_ReceiptsExtention]
as
SELECT  
OrderNo 						as 	OrderNo ,  
OrderLineNo 					as	OrderLineNo  ,     
Sequence 						as	Sequence  , 
convert(decimal(18,2),BasicPrice) as BasicPrice  
FROM 
OPENQUERY([BAAN],
'SELECT 
t$orno as OrderNo,
t$pono as OrderLineNo,
t$srnb as Sequence,
t$pric as BasicPrice
FROM baandb.ttdpur901200
') ;
GO
