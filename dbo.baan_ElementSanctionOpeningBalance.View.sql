USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_ElementSanctionOpeningBalance]
as
SELECT  
ProjectCode,
ElementCode,
BudgetedAmount,
OpeningBalance,
convert(datetime,OpeningBalanceDate,6) as OpeningBalanceDate,
EnteredBy,
convert(datetime,EnteredOn,6) as EnteredOn
FROM 
OPENQUERY([BAAN],
'SELECT 
t$cprj as ProjectCode,
t$cspa as ElementCode,
t$budg as BudgetedAmount,
t$opbl as OpeningBalance,
to_char(t$opdt) as OpeningBalanceDate,
t$enus as EnteredBy,
to_char(t$endt) as EnteredOn
FROM baandb.ttpptc938100
') ;
GO
