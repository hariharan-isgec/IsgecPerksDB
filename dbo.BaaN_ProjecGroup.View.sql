USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[BaaN_ProjecGroup]
as
SELECT 
							ProjectGroup,
							ProjectGroupDescription
FROM 
OPENQUERY([BAAN],
'SELECT 
				t$ccot as ProjectGroup,
				t$desc as ProjectGroupDescription
FROM ttppdm065100
');
GO
