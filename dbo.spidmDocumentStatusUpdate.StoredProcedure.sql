USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentStatusUpdate]
  @Original_DocumentStatusID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_DocumentStatus] SET 
   [Description] = @Description
  WHERE
  [DocumentStatusID] = @Original_DocumentStatusID
  SET @RowCount = @@RowCount
GO
