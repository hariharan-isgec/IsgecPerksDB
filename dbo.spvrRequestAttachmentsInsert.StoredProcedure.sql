USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestAttachmentsInsert]
  @RequestNo Int,
  @Description NVarChar(50),
  @FileName NVarChar(250),
  @DiskFile NVarChar(250),
  @Return_RequestNo Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [VR_RequestAttachments]
  (
   [RequestNo]
  ,[Description]
  ,[FileName]
  ,[DiskFile]
  )
  VALUES
  (
   @RequestNo
  ,@Description
  ,@FileName
  ,@DiskFile
  )
  SET @Return_RequestNo = @RequestNo
  SET @Return_SerialNo = Scope_Identity()
GO
