USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[baan_ItemGroup]
as
SELECT  
ItemGroupCode				as ItemGroupCode			,
ItemGroupDescription          as ItemGroupDescription        
FROM 
OPENQUERY([BAAN],
'SELECT 
t$citg      as ItemGroupCode     ,        
t$dsca      as ItemGroupDescription  
FROM baandb.ttcmcs023100
') ;
GO
