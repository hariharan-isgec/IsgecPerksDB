USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionFilesInsert]
  @RequestID Int,
  @InspectionID Int,
  @FileName NVarChar(250),
  @DiskFIleName NVarChar(50),
  @Return_RequestID Int = null OUTPUT, 
  @Return_InspectionID Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [QCM_InspectionFiles]
  (
   [RequestID]
  ,[InspectionID]
  ,[FileName]
  ,[DiskFIleName]
  )
  VALUES
  (
   @RequestID
  ,@InspectionID
  ,@FileName
  ,@DiskFIleName
  )
  SET @Return_RequestID = @RequestID
  SET @Return_InspectionID = @InspectionID
  SET @Return_SerialNo = Scope_Identity()
GO
