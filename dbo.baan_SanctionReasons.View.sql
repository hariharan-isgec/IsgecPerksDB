USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[baan_SanctionReasons]
as
SELECT  
ReasonCode as ReasonCode,
ReasonDescription as ReasonDescription
FROM 
OPENQUERY([BAAN],
'select 
t$serc as ReasonCode, 
t$desc as ReasonDescription 
from baandb.ttppdm907100 
where t$rtyp = 1
') ;
GO
