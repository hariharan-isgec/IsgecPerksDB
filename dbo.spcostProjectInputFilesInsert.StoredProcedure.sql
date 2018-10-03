USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectInputFilesInsert]
  @ProjectGroupID Int,
  @FinYear Int,
  @Quarter Int,
  @SerialNo Int,
  @Description NVarChar(50),
  @FileName NVarChar(250),
  @DiskFile NVarChar(250),
  @Return_ProjectGroupID Int = null OUTPUT, 
  @Return_FinYear Int = null OUTPUT, 
  @Return_Quarter Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [COST_ProjectInputFiles]
  (
   [ProjectGroupID]
  ,[FinYear]
  ,[Quarter]
  ,[SerialNo]
  ,[Description]
  ,[FileName]
  ,[DiskFile]
  )
  VALUES
  (
   @ProjectGroupID
  ,@FinYear
  ,@Quarter
  ,@SerialNo
  ,@Description
  ,@FileName
  ,@DiskFile
  )
  SET @Return_ProjectGroupID = @ProjectGroupID
  SET @Return_FinYear = @FinYear
  SET @Return_Quarter = @Quarter
  SET @Return_SerialNo = @SerialNo
GO
