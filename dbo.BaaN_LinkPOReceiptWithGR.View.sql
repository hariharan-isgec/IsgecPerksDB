USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[BaaN_LinkPOReceiptWithGR]
AS
SELECT  
ProjectCode,
OrderNo,
POLineNo,
SequenceNo,
ItemCode,
GRNo,
GRDate,
TransporterCode,
ReceiptNo,
FromCity,
ToCity 
FROM  OPENQUERY(baan,  
'SELECT  
ttdpur952100.t$cprj as ProjectCode,
ttdpur952100.t$orno as OrderNo,
ttdpur952100.t$pono as POLineNo,
ttdpur952100.t$srnb as SequenceNo,
ttdpur952100.t$item as ItemCode,
ttdpur952100.t$grno  as GRNo,
ttdpur952100.t$date as GRDate,
ttdpur952100.t$tcod as TransporterCode,
ttdpur952100.t$reno as ReceiptNo,
ttdpur952100.t$fcty as FromCity,
ttdpur952100.t$tcty as ToCity 
FROM  ttdpur952100
')
GO
