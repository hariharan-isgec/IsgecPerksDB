USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BaaN_SupplierBills]
AS
SELECT  
				IRNo,
        IRDate,
				SupplierCode,
				SupplierBillNo,
				SupplierBillDate,
				Amount,
				ProjectCode,
				BillOfLadding,
				NatureOfExpense,
				ChargeCode,
				CargoType
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
     ttfacp100200.t$cont as CargoType
 FROM  ttfacp100200
')
GO
