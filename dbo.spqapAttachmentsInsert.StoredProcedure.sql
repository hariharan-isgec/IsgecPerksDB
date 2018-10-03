USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapAttachmentsInsert]
  @RequestNo Int,
  @Description NVarChar(50),
  @FileName NVarChar(250),
  @DiskFile NVarChar(250),
  @StatusID Int,
  @Return_RequestNo Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [QAP_Attachments]
  (
   [RequestNo]
  ,[Description]
  ,[FileName]
  ,[DiskFile]
  ,[StatusID]
  )
  VALUES
  (
   @RequestNo
  ,@Description
  ,@FileName
  ,@DiskFile
  ,@StatusID
  )
  SET @Return_RequestNo = @RequestNo
  SET @Return_SerialNo = Scope_Identity()
GO
