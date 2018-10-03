USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[BaaN_SupplierBills_Backup]
AS
SELECT  IRNo,
        IRDate,
				SupplierCode,
				SupplierBillNo,
				SupplierBillDate,
				Amount,
				ProjectCode,
				BillOfLadding,
				NatureOfExpense,
				ChargeCode,
				CargoType,
				PackingListNo,
				DespatchedFrom,
				PortOfDischarge,
				PortOfDischargeMaster, 
        ProjectCountry      
FROM  OPENQUERY(baan,  
'SELECT   
		 ttfacp100200.T$ninv as IRNo, 
     to_char(ttfacp100200.T$irdt) as IRDate, 
     ttfacp100200.T$SUNO as SupplierCode, 
     ttfacp100200.T$ISUP As SupplierBillNo,
     to_char(ttfacp100200.T$invd) as SupplierBillDate, 
     ttfacp100200.T$amnt as Amount, 
     ttfacp100200.T$cprj as ProjectCode,
     ttfacp100200.t$blno as BillOfLadding,
     ttfacp100200.t$natr as NatureOfExpense,
     ttfacp100200.t$chcd as ChargeCode,
     ttfacp100200.t$cont as CargoType,
     ttfacp902200.t$plno as PackingListNo,
     trim(ttploc901100.t$load) as DespatchedFrom,
     (trim(ttploc901100.t$pdct) || trim(ttploc901100.t$pdct2)) as PortOfDischarge,
     (trim(ttploc840100.t$pdct) || trim(ttploc840100.t$pdct2)) as PortOfDischargeMaster,
     ttppdm600200.t$ccty as ProjectCountry      
 FROM  ttfacp100200, ttfacp902200, ttploc901100, ttploc840100, ttppdm600200             
 WHERE ttfacp902200.t$ninv = ttfacp100200.t$ninv   
 AND   ttploc901100.t$plno = ttfacp902200.t$plno    
 AND   (ttploc840100.t$cprj = ttploc901100.t$cprj AND ttploc840100.t$lcsr = ttploc901100.t$lcsr)
 AND   ttppdm600200.t$cprj (+)  = ttfacp100200.t$cprj     
') AS SupplierBills
GO
