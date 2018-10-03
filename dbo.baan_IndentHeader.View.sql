USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_IndentHeader]
as
SELECT  
ProjectCode,
IndentNo,
convert(datetime,IndentDate,6) as IndentDate,
IndentStatus,
IndentText,
PreparedBy,
ApprovedBy,
Buyer,
Descr,
Transfered,
convert(datetime,TransferDate,6) as TransferDate,
--ApprovalDate,
IndentType,
Cancelled,
SanctionLevel,
SanctionReference,
IndentPriority,
IndentRev,
ReasonCode
FROM 
OPENQUERY([BAAN],
'SELECT 
t$cprj as ProjectCode,
t$srno as IndentNo,
ttppss932100.t$prdt as IndentDate,
t$ostb as IndentStatus,
t$text as IndentText,
t$prep as PreparedBy,
t$auth as ApprovedBy,
t$buyr as Buyer,
t$desc as Descr,
t$tran as Transfered,
ttppss932100.t$trdt as TransferDate,
--to_char(ttppss932100.t$audt) as ApprovalDate,
t$indt as IndentType,
t$cncl as Cancelled,
t$slvl as SanctionLevel,
t$sref as SanctionReference,
t$prio as IndentPriority,
t$indrv as IndentRev,
t$rcod as ReasonCode
FROM baandb.ttppss932100
where extract(year from baandb.ttppss932100.t$prdt) >= 2010
and extract(year from baandb.ttppss932100.t$trdt) >= 2010
') ;
GO
