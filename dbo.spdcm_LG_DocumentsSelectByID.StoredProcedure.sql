USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spdcm_LG_DocumentsSelectByID]
  @DocumentID NVarChar(30),
  @RevisionNo NVarChar(2)
  AS
  SELECT
		[DCM_Documents].[DocumentID],
		[DCM_Documents].[Description],
		[DCM_Documents].[RevisionNo],
		[DCM_Documents].[ProjectID],
		[DCM_Documents].[Locked],
		[DCM_Projects1].[ProjectID] AS DCM_Projects1_ProjectID,
		[DCM_Projects1].[Description] AS DCM_Projects1_Description 
  FROM [DCM_Documents] 
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects1]
    ON [DCM_Documents].[ProjectID] = [DCM_Projects1].[ProjectID]
  WHERE
  [DCM_Documents].[DocumentID] = @DocumentID
  AND [DCM_Documents].[RevisionNo] = @RevisionNo
GO
