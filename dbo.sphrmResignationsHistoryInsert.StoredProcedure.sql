USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmResignationsHistoryInsert]
  @CardNo NVarChar(8),
  @StatusID NVarChar(2),
  @ResignedOn DateTime,
  @ReleavedOn DateTime,
  @Remarks NVarChar(250),
  @Executed Bit,
  @Cancelled Bit,
  @ProcessedBy NVarChar(8),
  @ProcessedOn DateTime,
  @Return_ResignID Int = null OUTPUT
  AS
  INSERT [HRM_Resignations]
  (
   [CardNo]
  ,[StatusID]
  ,[ResignedOn]
  ,[ReleavedOn]
  ,[Remarks]
  ,[Executed]
  ,[Cancelled]
  ,[ProcessedBy]
  ,[ProcessedOn]
  )
  VALUES
  (
   @CardNo
  ,@StatusID
  ,@ResignedOn
  ,@ReleavedOn
  ,@Remarks
  ,@Executed
  ,@Cancelled
  ,@ProcessedBy
  ,@ProcessedOn
  )
  SET @Return_ResignID = Scope_Identity()
GO
