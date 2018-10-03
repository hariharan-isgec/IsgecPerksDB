USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[baan_ManHoursRoles]
as
SELECT  
RoleID,
RoleDescription,
SessionNo
FROM 
OPENQUERY([BAAN],
'SELECT 
t$rlid as RoleID,
t$rldesc    as RoleDescription,
t$sess      as SessionNo
FROM baandb.ttphrs905100
') ;
GO
