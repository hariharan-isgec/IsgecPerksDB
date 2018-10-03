USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetDataUpdate]
  @Original_ProjectGroupID Int, 
  @Original_FinYear Int, 
  @Original_Quarter Int, 
  @Original_Revision Int, 
  @Original_ProjectID NVarChar(6), 
  @Original_GLCode NVarChar(7), 
  @Original_AdjustmentSerialNo Int, 
  @Original_AdjustmentCredit Bit, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_CostSheetData] SET 
   [AdjustmentSerialNo] = @AdjustmentSerialNo
  ,[ProjectID] = @ProjectID
  ,[GLCode] = @GLCode
  ,[CrAmount] = @CrAmount
  ,[DrAmount] = @DrAmount
  ,[Amount] = @Amount
  ,[CrFC] = @CrFC
  ,[DrFC] = @DrFC
  ,[NetFC] = @NetFC
  ,[FC] = @FC  
  ,[AdjustmentEntry] = @AdjustmentEntry
  ,[AdjustmentCredit] = @AdjustmentCredit
  ,[Quarter] = @Quarter
  ,[FinYear] = @FinYear
  ,[ProjectGroupID] = @ProjectGroupID
  ,[Revision] = @Revision
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
