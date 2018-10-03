USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_ReasonOfIndentReturn]
as
SELECT  
ReasonCode,
ReasonDescription
FROM 
OPENQUERY([BAAN],
'SELECT 
t$rscd as ReasonCode,
t$desc as ReasonDescription
FROM baandb.ttppss938100
') ;
GO
