USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpChaneRequestInsert]
  @ApplID Int,
  @RequestedBy NVarChar(8),
  @RequestedOn DateTime,
  @RequestTypeID Int,
  @ChangeSubject NVarChar(1000),
  @ChangeDetails NVarChar(2000),
  @ReturnRemarks NVarChar(100),
  @ApprovedBy NVarChar(8),
  @ApprovedOn DateTime,
  @EvaluationByIT NVarChar(2000),
  @EvaluationByITOn DateTime,
  @EvaluationByESC NVarChar(2000),
  @EvaluationByESCOn DateTime,
  @Justification NVarChar(1000),
  @StatusID Int,
  @PriorityID Int,
  @MSLPortalNumber NVarChar(50),
  @MSLPortalOn DateTime,
  @EffortEstimation Decimal(10,2),
  @PlannedDeliveryDate DateTime,
  @ActualDeliveryDate DateTime,
  @ClosingRemarks NVarChar(100),
  @Return_ApplID Int = null OUTPUT, 
  @Return_RequestID Int = null OUTPUT 
  AS
  INSERT [ERP_ChaneRequest]
  (
   [ApplID]
  ,[RequestedBy]
  ,[RequestedOn]
  ,[RequestTypeID]
  ,[ChangeSubject]
  ,[ChangeDetails]
  ,[ReturnRemarks]
  ,[ApprovedBy]
  ,[ApprovedOn]
  ,[EvaluationByIT]
  ,[EvaluationByITOn]
  ,[EvaluationByESC]
  ,[EvaluationByESCOn]
  ,[Justification]
  ,[StatusID]
  ,[PriorityID]
  ,[MSLPortalNumber]
  ,[MSLPortalOn]
  ,[EffortEstimation]
  ,[PlannedDeliveryDate]
  ,[ActualDeliveryDate]
  ,[ClosingRemarks]
  )
  VALUES
  (
   @ApplID
  ,@RequestedBy
  ,@RequestedOn
  ,@RequestTypeID
  ,@ChangeSubject
  ,@ChangeDetails
  ,@ReturnRemarks
  ,@ApprovedBy
  ,@ApprovedOn
  ,@EvaluationByIT
  ,@EvaluationByITOn
  ,@EvaluationByESC
  ,@EvaluationByESCOn
  ,@Justification
  ,@StatusID
  ,@PriorityID
  ,@MSLPortalNumber
  ,@MSLPortalOn
  ,@EffortEstimation
  ,@PlannedDeliveryDate
  ,@ActualDeliveryDate
  ,@ClosingRemarks
  )
  SET @Return_ApplID = @ApplID
  SET @Return_RequestID = Scope_Identity()
GO
