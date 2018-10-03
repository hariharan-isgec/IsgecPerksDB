USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_ManHours]
as
SELECT  
EmployeeCode,
RoleID,
--WorkingDate ,
--EntryDate ,
convert(datetime,replace(WorkingDate,'-',' '),6) as WorkingDate     ,
convert(datetime,replace(EntryDate,'-',' '),6) as EntryDate     ,
ActivityID     ,
ProjectCode      , 
ElementCode       ,
Hours  ,
SerialNo,
Remarks  ,     
ManhourGroup,
DrawingCategory,
DrawingSerialNo,
DrawingSize,
DrawingElement,
DrawingGroupID,
DrawingNo,
Estimate  ,    
EstimateSeq,      
SubActivityID
FROM 
OPENQUERY([BAAN],
'SELECT 
t$emno as EmployeeCode,
t$rlid as RoleID,
to_char(t$tdate) as WorkingDate     ,
to_char(t$edate) as EntryDate     ,
t$actid as ActivityID     ,
t$cprj as ProjectCode      , 
t$cspa as ElementCode       ,
t$hrs as Hours  ,
t$srno as SerialNo,
t$remk as Remarks  ,     
t$grcd as ManhourGroup  ,
t$dcat as DrawingCategory,
t$dsno as DrawingSerialNo,
t$dsiz as DrawingSize,
t$dele as DrawingElement,
t$dgid as DrawingGroupID,
t$cdoc as DrawingNo,
t$cbdg as Estimate  ,    
t$bunu as EstimateSeq,      
t$sact as SubActivityID
FROM baandb.ttphrs910100
where extract(year from baandb.ttphrs910100.t$tdate) >= 2010
and extract(year from baandb.ttphrs910100.t$edate) >= 2010
') ;
GO
