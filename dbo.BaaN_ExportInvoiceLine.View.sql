USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BaaN_ExportInvoiceLine]
AS
SELECT  
		PackingListNo,
        SerialNo,
		convert(decimal,InvoiceAmount) as InvoiceAmount
FROM  OPENQUERY(baan,  
'SELECT   
    ttploc911100.t$plno as PackingListNo,
    ttploc911100.t$srno as SerialNo,
    ttploc911100.t$iamt as InvoiceAmount
 FROM  ttploc911100   
')
GO
