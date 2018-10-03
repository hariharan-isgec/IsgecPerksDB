USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_ManHoursGroup]
as
SELECT  
GroupCode,
GroupDescription,
PrintSequence
FROM 
OPENQUERY([BAAN],
'SELECT 
t$grcd as GroupCode,
t$desc as GroupDescription,
t$pseq as PrintSequence
FROM baandb.ttphrs911100
') ;
GO
