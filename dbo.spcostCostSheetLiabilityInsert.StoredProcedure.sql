USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetLiabilityInsert]
  @ProjectGroupID Int,
  @FinYear Int,
  @Quarter Int,
  @Revision Int,
  @ProjectID NVarChar(6),
  @GLCode NVarChar(7),
  @AdjustmentSerialNo Int,
  @AdjustmentCredit Bit,
  @CrAmount Decimal(14,2),
  @DrAmount Decimal(14,2),
  @Amount Decimal(14,2),
  @AdjustmentEntry Bit,
  @CrFC Decimal(14,2),
  @DrFC Decimal(14,2),
  @NetFC Decimal(14,2),
  @FC NVarChar(10),
  @Return_ProjectGroupID Int = null OUTPUT, 
  @Return_FinYear Int = null OUTPUT, 
  @Return_Quarter Int = null OUTPUT, 
  @Return_Revision Int = null OUTPUT, 
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_GLCode NVarChar(7) = null OUTPUT, 
  @Return_AdjustmentSerialNo Int = null OUTPUT, 
  @Return_AdjustmentCredit Bit = null OUTPUT 
  AS
  INSERT [COST_CostSheetLiability]
  (
   [ProjectGroupID]
  ,[FinYear]
  ,[Quarter]
  ,[Revision]
  ,[ProjectID]
  ,[GLCode]
  ,[AdjustmentSerialNo]
  ,[AdjustmentCredit]
  ,[CrAmount]
  ,[DrAmount]
  ,[Amount]
  ,[AdjustmentEntry]
  ,[CrFC]
  ,[DrFC]
  ,[NetFC]
  ,[FC]
  )
  VALUES
  (
   @ProjectGroupID
  ,@FinYear
  ,@Quarter
  ,@Revision
  ,UPPER(@ProjectID)
  ,UPPER(@GLCode)
  ,@AdjustmentSerialNo
  ,@AdjustmentCredit
  ,@CrAmount
  ,@DrAmount
  ,@Amount
  ,@AdjustmentEntry
  ,@CrFC
  ,@DrFC
  ,@NetFC
  ,@FC
  )
  SET @Return_ProjectGroupID = @ProjectGroupID
  SET @Return_FinYear = @FinYear
  SET @Return_Quarter = @Quarter
  SET @Return_Revision = @Revision
  SET @Return_ProjectID = @ProjectID
  SET @Return_GLCode = @GLCode
  SET @Return_AdjustmentSerialNo = @AdjustmentSerialNo
  SET @Return_AdjustmentCredit = @AdjustmentCredit
GO
