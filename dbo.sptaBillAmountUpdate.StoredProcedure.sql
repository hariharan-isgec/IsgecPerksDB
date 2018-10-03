USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillAmountUpdate]
  @Original_TABillNo Int, 
  @Original_ComponentID Int, 
  @Original_CurrencyID NVarChar(6), 
  @Original_CostCenterID NVarChar(6), 
  @TABillNo Int,
  @ComponentID Int,
  @CurrencyID NVarChar(6),
  @CostCenterID NVarChar(6),
  @TotalInCurrency Decimal(18,2),
  @ConversionFactorINR Decimal(8,2),
  @CalculationTypeID NVarChar(10),
  @TotalInINR Decimal(18,2),
  @ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_BillAmount] SET 
   [TABillNo] = @TABillNo
  ,[ComponentID] = @ComponentID
  ,[CurrencyID] = @CurrencyID
  ,[CostCenterID] = @CostCenterID
  ,[TotalInCurrency] = @TotalInCurrency
  ,[ConversionFactorINR] = @ConversionFactorINR
  ,[CalculationTypeID] = @CalculationTypeID
  ,[TotalInINR] = @TotalInINR
  ,[ProjectID] = @ProjectID
  WHERE
  [TABillNo] = @Original_TABillNo
  AND [ComponentID] = @Original_ComponentID
  AND [CurrencyID] = @Original_CurrencyID
  AND [CostCenterID] = @Original_CostCenterID
  SET @RowCount = @@RowCount
GO
