USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[BaaN_StdItem]
as
SELECT *  
FROM 
OPENQUERY([BAAN],
'SELECT 
	t$item as ItemCode,
	t$dsca as Description,
	t$citg as ItemGroup,
	t$wght as Weight,
	t$cuni as Unit,
	t$csig as Signal   
FROM ttiitm001100
');
GO
