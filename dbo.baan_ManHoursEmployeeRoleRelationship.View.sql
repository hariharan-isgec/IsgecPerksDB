USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_ManHoursEmployeeRoleRelationship]
as
SELECT  
EmployeeCode,
RoleId,
EmployeeStatus,
GroupCode
FROM 
OPENQUERY([BAAN],
'SELECT 
t$emno as EmployeeCode,
t$rlid as RoleId,
t$stat as EmployeeStatus,
t$grcd as GroupCode
FROM baandb.ttphrs906100
') ;
GO
