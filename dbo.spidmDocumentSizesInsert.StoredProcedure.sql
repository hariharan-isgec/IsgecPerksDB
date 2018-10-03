USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentSizesInsert]
  @DocumentSizeID NVarChar(2),
  @Description NVarChar(30),
  @Return_DocumentSizeID NVarChar(2) = null OUTPUT
  AS
  INSERT [IDM_DocumentSizes]
  (
   [DocumentSizeID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@DocumentSizeID)
  ,@Description
  )
  SET @Return_DocumentSizeID = @DocumentSizeID
GO
