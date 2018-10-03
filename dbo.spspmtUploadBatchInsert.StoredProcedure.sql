USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtUploadBatchInsert]
  @Description NVarChar(50),
  @StartedOn DateTime,
  @Return_UploadBatchNo Int = null OUTPUT 
  AS
  INSERT [SPMT_UploadBatch]
  (
   [Description]
  ,[StartedOn]
  )
  VALUES
  (
   @Description
  ,@StartedOn
  )
  SET @Return_UploadBatchNo = Scope_Identity()
GO
