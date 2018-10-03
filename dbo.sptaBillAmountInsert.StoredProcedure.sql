USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillAmountInsert]
  @TABillNo Int,
  @ComponentID Int,
  @CurrencyID NVarChar(6),
  @CostCenterID NVarChar(6),
  @TotalInCurrency Decimal(18,2),
  @ConversionFactorINR Decimal(8,2),
  @CalculationTypeID NVarChar(10),
  @TotalInINR Decimal(18,2),
  @ProjectID NVarChar(6),
  @Return_TABillNo Int = null OUTPUT, 
  @Return_ComponentID Int = null OUTPUT, 
  @Return_CurrencyID NVarChar(6) = null OUTPUT, 
  @Return_CostCenterID NVarChar(6) = null OUTPUT 
  AS
  INSERT [TA_BillAmount]
  (
   [TABillNo]
  ,[ComponentID]
  ,[CurrencyID]
  ,[CostCenterID]
  ,[TotalInCurrency]
  ,[ConversionFactorINR]
  ,[CalculationTypeID]
  ,[TotalInINR]
  ,[ProjectID]
  )
  VALUES
  (
   @TABillNo
  ,@ComponentID
  ,UPPER(@CurrencyID)
  ,UPPER(@CostCenterID)
  ,@TotalInCurrency
  ,@ConversionFactorINR
  ,@CalculationTypeID
  ,@TotalInINR
  ,@ProjectID
  )
  SET @Return_TABillNo = @TABillNo
  SET @Return_ComponentID = @ComponentID
  SET @Return_CurrencyID = @CurrencyID
  SET @Return_CostCenterID = @CostCenterID
GO
