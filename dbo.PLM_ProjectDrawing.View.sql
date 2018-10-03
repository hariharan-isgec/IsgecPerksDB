USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[PLM_ProjectDrawing]
as
SELECT 
				ProjectCode,
				DrawingNo,
        DrawingName,
        Revision,
				DrawingStatus,
        CreatedOn  
FROM 
OPENQUERY([PLM],
'SELECT     wcadmin.PDMLinkProduct.namecontainerInfo AS ProjectCode, 
						wcadmin.EPMDocumentMaster.name AS DrawingName, 
            wcadmin.EPMDocumentMaster.documentNumber AS DrawingNo, 
						wcadmin.EPMDocumentMaster.createStampA2 AS CreatedOn, 
            wcadmin.EPMDocument.statestate AS DrawingStatus, 
						wcadmin.EPMDocument.versionIdA2versionInfo AS Revision 
FROM        wcadmin.EPMDocumentMaster 
						INNER JOIN wcadmin.EPMDocument 
								ON wcadmin.EPMDocumentMaster.idA2A2 = wcadmin.EPMDocument.idA3masterReference 
						INNER JOIN wcadmin.PDMLinkProduct 
								ON wcadmin.EPMDocumentMaster.idA3containerReference = wcadmin.PDMLinkProduct.idA2A2
 
')
GO
