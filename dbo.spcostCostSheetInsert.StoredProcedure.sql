USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetInsert]
  @ProjectGroupID Int,
  @FinYear Int,
  @Quarter Int,
  @Revision Int,
  @StatusID Int,
  @AutoUpdateERPData Bit,
  @LockERPData Bit,
  @LockAdjustmentEntry Bit,
  @Remarks NVarChar(250),
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @ApproverRemarks NVarChar(250),
  @ApprovedBy NVarChar(8),
  @ApprovedOn DateTime,
  @Return_ProjectGroupID Int = null OUTPUT, 
  @Return_FinYear Int = null OUTPUT, 
  @Return_Quarter Int = null OUTPUT, 
  @Return_Revision Int = null OUTPUT 
  AS
  INSERT [COST_CostSheet]
  (
   [ProjectGroupID]
  ,[FinYear]
  ,[Quarter]
  ,[Revision]
  ,[StatusID]
  ,[AutoUpdateERPData]
  ,[LockERPData]
  ,[LockAdjustmentEntry]
  ,[Remarks]
  ,[CreatedBy]
  ,[CreatedOn]
  ,[ApproverRemarks]
  ,[ApprovedBy]
  ,[ApprovedOn]
  )
  VALUES
  (
   @ProjectGroupID
  ,@FinYear
  ,@Quarter
  ,@Revision
  ,@StatusID
  ,@AutoUpdateERPData
  ,@LockERPData
  ,@LockAdjustmentEntry
  ,@Remarks
  ,@CreatedBy
  ,@CreatedOn
  ,@ApproverRemarks
  ,@ApprovedBy
  ,@ApprovedOn
  )
  SET @Return_ProjectGroupID = @ProjectGroupID
  SET @Return_FinYear = @FinYear
  SET @Return_Quarter = @Quarter
  SET @Return_Revision = @Revision
GO
