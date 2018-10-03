USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetDataInsert]
  @AdjustmentSerialNo Int,
  @ProjectID NVarChar(6),
  @GLCode NVarChar(7),
  @CrAmount Decimal(14,2),
  @DrAmount Decimal(14,2),
  @Amount Decimal(14,2),
  @CrFC Decimal(14,2),
  @DrFC Decimal(14,2),
  @NetFC Decimal(14,2),
  @FC NVarchar(10),
  @AdjustmentEntry Bit,
  @AdjustmentCredit Bit,
  @Quarter Int,
  @FinYear Int,
  @ProjectGroupID Int,
  @Revision Int,
  @Return_ProjectGroupID Int = null OUTPUT, 
  @Return_FinYear Int = null OUTPUT, 
  @Return_Quarter Int = null OUTPUT, 
  @Return_Revision Int = null OUTPUT, 
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_GLCode NVarChar(7) = null OUTPUT, 
  @Return_AdjustmentSerialNo Int = null OUTPUT, 
  @Return_AdjustmentCredit Bit = null OUTPUT 
  AS
  INSERT [COST_CostSheetData]
  (
   [AdjustmentSerialNo]
  ,[ProjectID]
  ,[GLCode]
  ,[CrAmount]
  ,[DrAmount]
  ,[Amount]
  ,[CrFC]
  ,[DrFC]
  ,[NetFC]
  ,[FC]
  ,[AdjustmentEntry]
  ,[AdjustmentCredit]
  ,[Quarter]
  ,[FinYear]
  ,[ProjectGroupID]
  ,[Revision]
  )
  VALUES
  (
   @AdjustmentSerialNo
  ,UPPER(@ProjectID)
  ,UPPER(@GLCode)
  ,@CrAmount
  ,@DrAmount
  ,@Amount
  ,@CrFC
  ,@DrFC
  ,@NetFC
  ,@FC
  ,@AdjustmentEntry
  ,@AdjustmentCredit
  ,@Quarter
  ,@FinYear
  ,@ProjectGroupID
  ,@Revision
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
