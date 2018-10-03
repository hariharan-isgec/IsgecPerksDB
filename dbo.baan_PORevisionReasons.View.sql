USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[baan_PORevisionReasons]
as
SELECT  
ReasonCode 		as ReasonCode 			,
ReasonDescription as ReasonDescription      
FROM 
OPENQUERY([BAAN],
'SELECT 
t$crcd      as ReasonCode     ,        
t$dsca     as ReasonDescription 
FROM baandb.ttcmcs017100
') ;
GO
