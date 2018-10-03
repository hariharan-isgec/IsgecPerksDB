USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[BaaN_ProjecMaster]
as
SELECT 
				ProjectCode,
				ProjectName,
				ProjectCountry,
				ProjectGroup
FROM 
OPENQUERY([BAAN],
'SELECT 
				t$cprj as ProjectCode,
				t$desc as ProjectName,
				t$ccty as ProjectCountry,
				t$ccot as ProjectGroup
FROM ttppdm600100
');
GO
