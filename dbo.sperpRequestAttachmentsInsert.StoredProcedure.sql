USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestAttachmentsInsert]
  @ApplID Int,
  @RequestID Int,
  @Description NVarChar(100),
  @FileName NVarChar(250),
  @DiskFile NVarChar(250),
  @Return_ApplID Int = null OUTPUT, 
  @Return_RequestID Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [ERP_RequestAttachments]
  (
   [ApplID]
  ,[RequestID]
  ,[Description]
  ,[FileName]
  ,[DiskFile]
  )
  VALUES
  (
   @ApplID
  ,@RequestID
  ,@Description
  ,@FileName
  ,@DiskFile
  )
  SET @Return_ApplID = @ApplID
  SET @Return_RequestID = @RequestID
  SET @Return_SerialNo = Scope_Identity()
GO
