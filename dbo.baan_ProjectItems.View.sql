USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[baan_ProjectItems]
as
SELECT  
ProjectCode as ProjectCode,
ItemCode as ItemCode  ,   
ItemDescription as ItemDescription     ,
ItemGroupCode as ItemGroupCode 
FROM 
OPENQUERY([BAAN],
'SELECT 
 t$cprj as ProjectCode,
 t$item as ItemCode  ,   
 t$desc as ItemDescription   ,  
 t$citg as ItemGroupCode 
FROM baandb.ttppdm605100
') ;
GO
