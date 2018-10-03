USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrExecutionAttachmentsInsert]
  @SRNNo Int,
  @Description NVarChar(50),
  @FileName NVarChar(250),
  @DiskFile NVarChar(250),
  @Return_SRNNo Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [VR_ExecutionAttachments]
  (
   [SRNNo]
  ,[Description]
  ,[FileName]
  ,[DiskFile]
  )
  VALUES
  (
   @SRNNo
  ,@Description
  ,@FileName
  ,@DiskFile
  )
  SET @Return_SRNNo = @SRNNo
  SET @Return_SerialNo = Scope_Identity()
GO
