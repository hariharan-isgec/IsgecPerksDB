USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[baan_BaaNUsers]
as
SELECT  
UserCode as UserCode,
UserName as UserName
FROM 
OPENQUERY([BAAN],
'SELECT 
t$user as UserCode,
t$name as UserName
FROM baandb.tttaad200000
') ;
GO
