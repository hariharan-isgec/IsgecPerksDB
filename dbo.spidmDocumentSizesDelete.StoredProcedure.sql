USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentSizesDelete]
  @Original_DocumentSizeID NVarChar(2),
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_DocumentSizes]
  WHERE
  [IDM_DocumentSizes].[DocumentSizeID] = @Original_DocumentSizeID
  SET @RowCount = @@RowCount
GO
