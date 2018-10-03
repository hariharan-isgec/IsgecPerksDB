USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[PLM_ReleasedEPMDocuments]
as
SELECT 
documentNumber as documentNumber, 
ReleaseDate as ReleaseDate
FROM 
OPENQUERY([PLM],
'select 
documentNumber as DocumentNumber, 
updateStampA2 as ReleaseDate
from PLM_veReleasedEPMDocument 
')
GO
