USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetLiabilityUpdate]
  @Original_ProjectGroupID Int, 
  @Original_FinYear Int, 
  @Original_Quarter Int, 
  @Original_Revision Int, 
  @Original_ProjectID NVarChar(6), 
  @Original_GLCode NVarChar(7), 
  @Original_AdjustmentSerialNo Int, 
  @Original_AdjustmentCredit Bit, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_CostSheetLiability] SET 
   [ProjectGroupID] = @ProjectGroupID
  ,[FinYear] = @FinYear
  ,[Quarter] = @Quarter
  ,[Revision] = @Revision
  ,[ProjectID] = @ProjectID
  ,[GLCode] = @GLCode
  ,[AdjustmentSerialNo] = @AdjustmentSerialNo
  ,[AdjustmentCredit] = @AdjustmentCredit
  ,[CrAmount] = @CrAmount
  ,[DrAmount] = @DrAmount
  ,[Amount] = @Amount
  ,[AdjustmentEntry] = @AdjustmentEntry
  ,[CrFC] = @CrFC
  ,[DrFC] = @DrFC
  ,[NetFC] = @NetFC
  ,[FC] = @FC
  WHERE
  [ProjectGroupID] = @Original_ProjectGroupID
  AND [FinYear] = @Original_FinYear
  AND [Quarter] = @Original_Quarter
  AND [Revision] = @Original_Revision
  AND [ProjectID] = @Original_ProjectID
  AND [GLCode] = @Original_GLCode
  AND [AdjustmentSerialNo] = @Original_AdjustmentSerialNo
  AND [AdjustmentCredit] = @Original_AdjustmentCredit
  SET @RowCount = @@RowCount
GO
