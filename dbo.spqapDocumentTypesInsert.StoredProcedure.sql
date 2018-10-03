USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapDocumentTypesInsert]
  @DocumentName NVarChar(50),
  @Return_DocumentTypeID Int = null OUTPUT 
  AS
  INSERT [QAP_DocumentTypes]
  (
   [DocumentName]
  )
  VALUES
  (
   @DocumentName
  )
  SET @Return_DocumentTypeID = Scope_Identity()
GO
