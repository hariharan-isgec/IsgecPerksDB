USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[baan_EmergencyIndentReasons]
as
SELECT  
ReasonCode,
ReasonDescription
FROM 
OPENQUERY([BAAN],
'SELECT 
t$rcod as ReasonCode,
t$desc as ReasonDescription
FROM baandb.ttppss944100
') ;
GO
