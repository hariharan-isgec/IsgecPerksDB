USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpChaneRequestUpdate]
  @Original_ApplID Int, 
  @Original_RequestID Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [ERP_ChaneRequest] SET 
   [ApplID] = @ApplID
  ,[RequestedBy] = @RequestedBy
  ,[RequestedOn] = @RequestedOn
  ,[RequestTypeID] = @RequestTypeID
  ,[ChangeSubject] = @ChangeSubject
  ,[ChangeDetails] = @ChangeDetails
  ,[ReturnRemarks] = @ReturnRemarks
  ,[ApprovedBy] = @ApprovedBy
  ,[ApprovedOn] = @ApprovedOn
  ,[EvaluationByIT] = @EvaluationByIT
  ,[EvaluationByITOn] = @EvaluationByITOn
  ,[EvaluationByESC] = @EvaluationByESC
  ,[EvaluationByESCOn] = @EvaluationByESCOn
  ,[Justification] = @Justification
  ,[StatusID] = @StatusID
  ,[PriorityID] = @PriorityID
  ,[MSLPortalNumber] = @MSLPortalNumber
  ,[MSLPortalOn] = @MSLPortalOn
  ,[EffortEstimation] = @EffortEstimation
  ,[PlannedDeliveryDate] = @PlannedDeliveryDate
  ,[ActualDeliveryDate] = @ActualDeliveryDate
  ,[ClosingRemarks] = @ClosingRemarks
  WHERE
  [ApplID] = @Original_ApplID
  AND [RequestID] = @Original_RequestID
  SET @RowCount = @@RowCount
GO
