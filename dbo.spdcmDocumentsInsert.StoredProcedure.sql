USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmDocumentsInsert]
  @ProjectID NVarChar(6),
  @DocumentID NVarChar(30),
  @RevisionNo NVarChar(2),
  @Description NVarChar(100),
  @Return_ProjectID NVarChar(6) = null OUTPUT
  AS
  INSERT [DCM_Documents]
  (
   [ProjectID]
  ,[DocumentID]
  ,[RevisionNo]
  ,[Description]
  )
  VALUES
  (
   @ProjectID
  ,@DocumentID
  ,@RevisionNo
  ,@Description
  )
  SET @Return_ProjectID = @ProjectID
GO
