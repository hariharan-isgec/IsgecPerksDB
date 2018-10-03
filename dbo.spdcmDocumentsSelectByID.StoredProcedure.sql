USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmDocumentsSelectByID]
  @ProjectID NVarChar(6),
  @DocumentID NVarChar(30),
  @RevisionNo NVarChar(2) 
  AS
  SELECT
		[DCM_Documents].[ProjectID],
		[DCM_Documents].[DocumentID],
		[DCM_Documents].[RevisionNo],
		[DCM_Documents].[Description],
		[DCM_Documents].[Locked],
		[DCM_Documents].[TmtlID],
		[DCM_Projects1].[ProjectID] AS DCM_Projects1_ProjectID,
		[DCM_Projects1].[Description] AS DCM_Projects1_Description,
		[DCM_Projects1].[ProjectCode] AS DCM_Projects1_ProjectCode 
  FROM [DCM_Documents] 
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects1]
    ON [DCM_Documents].[ProjectID] = [DCM_Projects1].[ProjectID]
  WHERE
  [DCM_Documents].[ProjectID] = @ProjectID
  AND [DCM_Documents].[DocumentID] = @DocumentID
  AND [DCM_Documents].[RevisionNo] = @RevisionNo
GO
