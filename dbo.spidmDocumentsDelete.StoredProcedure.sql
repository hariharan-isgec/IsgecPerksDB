USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentsDelete]
  @Original_ProjectID NVarChar(6),
  @Original_DocumentID NVarChar(30),
  @Original_RevisionNo NVarChar(2),
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_Documents]
  WHERE
  [IDM_Documents].[ProjectID] = @Original_ProjectID
  AND [IDM_Documents].[DocumentID] = @Original_DocumentID
  AND [IDM_Documents].[RevisionNo] = @Original_RevisionNo
  SET @RowCount = @@RowCount
GO
