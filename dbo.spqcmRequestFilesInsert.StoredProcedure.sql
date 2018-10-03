USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRequestFilesInsert]
  @RequestID Int,
  @FileName NVarChar(250),
  @DiskFIleName NVarChar(50),
  @Return_RequestID Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [QCM_RequestFiles]
  (
   [RequestID]
  ,[FileName]
  ,[DiskFIleName]
  )
  VALUES
  (
   @RequestID
  ,@FileName
  ,@DiskFIleName
  )
  SET @Return_RequestID = @RequestID
  SET @Return_SerialNo = Scope_Identity()
GO
