USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapAttachmentStatesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QAP_AttachmentStates].[StatusID] ,
		[QAP_AttachmentStates].[Description]  
  FROM [QAP_AttachmentStates] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [QAP_AttachmentStates].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [QAP_AttachmentStates].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [QAP_AttachmentStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [QAP_AttachmentStates].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
