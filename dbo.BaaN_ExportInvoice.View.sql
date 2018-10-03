USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BaaN_ExportInvoice]
AS
SELECT  
		PackingListNo,
        ProjectCode,
        LCSerialNo,
		DespatchedFrom,
		PortOfDischarge,
		InvoiceNo,
		InvoiceDate,
		BLNo,
		BLDate,
		DispatchMode,
		Deduction1,
		Deduction2,
		Deduction3,
		SaleTransactionType,
		SaleInvoice
FROM  OPENQUERY(baan,  
'SELECT   
    ttploc901100.t$plno as PackingListNo,
    ttploc901100.t$cprj as ProjectCode,
    ttploc901100.t$lcsr as LCSerialNo,
    trim(ttploc901100.t$load) as DespatchedFrom,
    (trim(ttploc901100.t$pdct) || trim(ttploc901100.t$pdct2)) as PortOfDischarge,
	ttploc901100.t$inno as InvoiceNo,
	ttploc901100.t$indt as InvoiceDate,
	ttploc901100.t$blno as BLNo,
	ttploc901100.t$bldt as BLDate,
	ttploc901100.t$demd as DispatchMode,
	ttploc901100.t$ded1 as Deduction1,
	ttploc901100.t$ded2 as Deduction2,
	ttploc901100.t$ded3 as Deduction3,
	ttploc901100.t$ttyp as SaleTransactionType,
	ttploc901100.t$ninv as SaleInvoice
 FROM  ttploc901100  
where extract(year from ttploc901100.t$indt) >= 2003
and  extract(year from ttploc901100.t$bldt) >= 2003
')
GO
