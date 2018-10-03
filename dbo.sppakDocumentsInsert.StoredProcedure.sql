USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakDocumentsInsert]
  @DocumentID NVarChar(50),
  @DocumentRevision NVarChar(10),
  @Description NVarChar(100),
  @ExternalDocument Bit,
  @Filename NVarChar(100),
  @DisskFile NVarChar(50),
  @Return_DocumentNo Int = null OUTPUT 
  AS
  INSERT [PAK_Documents]
  (
   [DocumentID]
  ,[DocumentRevision]
  ,[Description]
  ,[ExternalDocument]
  ,[Filename]
  ,[DisskFile]
  )
  VALUES
  (
   @DocumentID
  ,@DocumentRevision
  ,@Description
  ,@ExternalDocument
  ,@Filename
  ,@DisskFile
  )
  SET @Return_DocumentNo = Scope_Identity()
GO
