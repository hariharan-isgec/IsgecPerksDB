USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentSizesUpdate]
  @Original_DocumentSizeID NVarChar(2), 
  @DocumentSizeID NVarChar(2),
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_DocumentSizes] SET 
   [DocumentSizeID] = @DocumentSizeID
  ,[Description] = @Description
  WHERE
  [DocumentSizeID] = @Original_DocumentSizeID
  SET @RowCount = @@RowCount
GO
