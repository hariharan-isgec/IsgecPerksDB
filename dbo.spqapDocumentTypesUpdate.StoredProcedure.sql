USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapDocumentTypesUpdate]
  @Original_DocumentTypeID Int, 
  @DocumentName NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [QAP_DocumentTypes] SET 
   [DocumentName] = @DocumentName
  WHERE
  [DocumentTypeID] = @Original_DocumentTypeID
  SET @RowCount = @@RowCount
GO
