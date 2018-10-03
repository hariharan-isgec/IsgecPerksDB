USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentTypesDelete]
  @Original_DocumentTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_DocumentTypes]
  WHERE
  [IDM_DocumentTypes].[DocumentTypeID] = @Original_DocumentTypeID
  SET @RowCount = @@RowCount
GO
