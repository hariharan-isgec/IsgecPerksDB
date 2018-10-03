USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SupplierBill]
AS
SELECT  
			IRNo, 
			IRDate, 
			SupplierCode, 
			SupplierName, 
			ProjectCode, 
			ProjectName, 
			SupplierBillNo, 
			SupplierBillDate, 
			Amount
FROM  OPENQUERY(baan,  
'SELECT
		 T$NINV as IRNo, 
                                                             to_char(ttfacp100200.T$irdt) as IRDate, 
                                                             ttfacp100200.T$SUNO as SupplierCode, 
                                                             ttfacp100200.T$ISUP As SupplierBillNo,
                                                             to_char(ttfacp100200.T$invd) as SupplierBillDate, 
                                                             ttfacp100200.T$amnt as Amount, 
                                                             ttfacp100200.T$cprj as ProjectCode,
                                                             ttccom020200.T$nama  As SupplierName,
                                                             ttppdm600200.T$desc As  ProjectName    
                                    from ttfacp100200, ttccom020200, ttppdm600200
                                    where ttccom020200.T$suno = ttfacp100200.T$suno 
                                        and ttppdm600200.T$cprj = ttfacp100200.T$cprj ')
                       AS derivedtbl_1
GO
