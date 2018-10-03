USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create VIEW [dbo].[BaaN_CargoNatureofPayment]
AS
SELECT  
		NatureofPayment as NatureofPayment,      
     PaymentDescription as PaymentDescription
FROM  OPENQUERY(baan,  
'SELECT   
		ttploc957100.T$natr as NatureofPayment,      
     ttploc957100.T$desc as PaymentDescription
 FROM  ttploc957100
')
GO
