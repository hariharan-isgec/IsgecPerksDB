USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPODocumentFileInsert]
  @SerialNo Int,
  @DocumentLineNo Int,
  @Description NVarChar(50),
  @FileName NVarChar(250),
  @DiskFile NVarChar(250),
  @Return_SerialNo Int = null OUTPUT, 
  @Return_DocumentLineNo Int = null OUTPUT, 
  @Return_FileNo Int = null OUTPUT 
  AS
  INSERT [EITL_PODocumentFile]
  (
   [SerialNo]
  ,[DocumentLineNo]
  ,[Description]
  ,[FileName]
  ,[DiskFile]
  )
  VALUES
  (
   @SerialNo
  ,@DocumentLineNo
  ,@Description
  ,@FileName
  ,@DiskFile
  )
  SET @Return_SerialNo = @SerialNo
  SET @Return_DocumentLineNo = @DocumentLineNo
  SET @Return_FileNo = Scope_Identity()
GO
