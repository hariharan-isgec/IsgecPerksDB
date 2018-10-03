USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[baan_ManHoursActivity]
as
SELECT  
ActivityID,
ActivityDescription,
ActivityType,
MainActivity
FROM 
OPENQUERY([BAAN],
'SELECT 
t$actid as ActivityID,
t$acdesc as ActivityDescription,
t$actype as ActivityType,
t$acmain as MainActivity
FROM baandb.ttphrs908100
') ;
GO
