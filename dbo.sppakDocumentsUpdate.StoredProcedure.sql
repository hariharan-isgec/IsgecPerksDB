USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakDocumentsUpdate]
  @Original_DocumentNo Int, 
  @DocumentID NVarChar(50),
  @DocumentRevision NVarChar(10),
  @Description NVarChar(100),
  @ExternalDocument Bit,
  @Filename NVarChar(100),
  @DisskFile NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_Documents] SET 
   [DocumentID] = @DocumentID
  ,[DocumentRevision] = @DocumentRevision
  ,[Description] = @Description
  ,[ExternalDocument] = @ExternalDocument
  ,[Filename] = @Filename
  ,[DisskFile] = @DisskFile
  WHERE
  [DocumentNo] = @Original_DocumentNo
  SET @RowCount = @@RowCount
GO
