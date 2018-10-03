USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapDocumentTypesDelete]
  @Original_DocumentTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QAP_DocumentTypes]
  WHERE
  [QAP_DocumentTypes].[DocumentTypeID] = @Original_DocumentTypeID
  SET @RowCount = @@RowCount
GO
