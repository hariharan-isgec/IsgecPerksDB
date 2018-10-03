USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_SanctionHistory]
as
SELECT  
SanctionNo,
SerialNo,
ProjectCode,
ElementCode,
convert(decimal,SanctionAmount)as SanctionAmount,
ReasonCode,
Remarks,
ArrovedBy,
EnteredBy,
convert(datetime,EnteredOn,6) as EnteredOn
FROM 
OPENQUERY([BAAN],
'SELECT
t$sanno as SanctionNo,
t$srno as SerialNo,
t$cprj as ProjectCode,
t$cspa as ElementCode,
t$sanamt as SanctionAmount,
t$cdis as ReasonCode,
t$rema as Remarks,
t$aprb as ArrovedBy,
t$user as EnteredBy,
t$trdt as EnteredOn
FROM baandb.ttpptc902100
where extract(year from baandb.ttpptc902100.t$trdt) >= 2010
') ;
GO
