USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostAdjustmentEntryInsert]
  @ProjectID NVarChar(6),
  @CrGLCode NVarChar(7),
  @DrGLCode NVarChar(7),
  @Amount Decimal(14,2),
  @Active Bit,
  @Remarks NVarChar(250),
  @FinYear Int,
  @ProjectGroupID Int,
  @Revision Int,
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @Quarter Int,
  @Return_ProjectGroupID Int = null OUTPUT, 
  @Return_FinYear Int = null OUTPUT, 
  @Return_Quarter Int = null OUTPUT, 
  @Return_Revision Int = null OUTPUT, 
  @Return_AdjustmentSerialNo Int = null OUTPUT 
  AS
  INSERT [COST_AdjustmentEntry]
  (
   [ProjectID]
  ,[CrGLCode]
  ,[DrGLCode]
  ,[Amount]
  ,[Active]
  ,[Remarks]
  ,[FinYear]
  ,[ProjectGroupID]
  ,[Revision]
  ,[CreatedBy]
  ,[CreatedOn]
  ,[Quarter]
  )
  VALUES
  (
   @ProjectID
  ,@CrGLCode
  ,@DrGLCode
  ,@Amount
  ,@Active
  ,@Remarks
  ,@FinYear
  ,@ProjectGroupID
  ,@Revision
  ,@CreatedBy
  ,@CreatedOn
  ,@Quarter
  )
  SET @Return_ProjectGroupID = @ProjectGroupID
  SET @Return_FinYear = @FinYear
  SET @Return_Quarter = @Quarter
  SET @Return_Revision = @Revision
  SET @Return_AdjustmentSerialNo = Scope_Identity()
GO
