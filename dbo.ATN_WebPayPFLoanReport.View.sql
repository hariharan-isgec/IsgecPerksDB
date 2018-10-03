USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATN_WebPayPFLoanReport]
AS
select
  *  
FROM OPENQUERY(WEBPAY,
  'select a.fk_Emp_code,e.first_name, a.InstallAmt, a.PaidPrinc,a.PaidIntrest,a.PrincBalance 
   from trnEmploanAdvInstallment as a 
   inner join MstEmployee as e on e.pk_emp_code=a.fk_Emp_code
   where 
	   Paymonth=9 
	   and PayYear=2016 
	   and fk_paycode=''L00009''  
	   and Process_flag=''Y'' 
   order by fk_Emp_code'
)
GO
