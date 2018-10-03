USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentStatusDelete]
  @Original_DocumentStatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_DocumentStatus]
  WHERE
  [IDM_DocumentStatus].[DocumentStatusID] = @Original_DocumentStatusID
  SET @RowCount = @@RowCount
GO
