USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillAmountSelectByID]
  @LoginID NVarChar(8),
  @TABillNo Int,
  @ComponentID Int,
  @CurrencyID NVarChar(6),
  @CostCenterID NVarChar(6) 
  AS
  SELECT
		[TA_BillAmount].[TABillNo] ,
		[TA_BillAmount].[ComponentID] ,
		[TA_BillAmount].[CurrencyID] ,
		[TA_BillAmount].[CostCenterID] ,
		[TA_BillAmount].[TotalInCurrency] ,
		[TA_BillAmount].[ConversionFactorINR] ,
		[TA_BillAmount].[CalculationTypeID] ,
		[TA_BillAmount].[TotalInINR] ,
		[TA_BillAmount].[ProjectID] ,
		[HRM_Departments1].[Description] AS HRM_Departments1_Description,
		[TA_Bills2].[PurposeOfJourney] AS TA_Bills2_PurposeOfJourney,
		[TA_CalcMethod3].[CalculationDescription] AS TA_CalcMethod3_CalculationDescription,
		[TA_Components4].[Description] AS TA_Components4_Description,
		[TA_Currencies5].[CurrencyName] AS TA_Currencies5_CurrencyName,
		[IDM_Projects1].[Description] AS IDM_Projects1_Description 
  FROM [TA_BillAmount] 
  INNER JOIN [HRM_Departments] AS [HRM_Departments1]
    ON [TA_BillAmount].[CostCenterID] = [HRM_Departments1].[DepartmentID]
  INNER JOIN [TA_Bills] AS [TA_Bills2]
    ON [TA_BillAmount].[TABillNo] = [TA_Bills2].[TABillNo]
  LEFT OUTER JOIN [TA_CalcMethod] AS [TA_CalcMethod3]
    ON [TA_BillAmount].[CalculationTypeID] = [TA_CalcMethod3].[CalculationTypeID]
  INNER JOIN [TA_Components] AS [TA_Components4]
    ON [TA_BillAmount].[ComponentID] = [TA_Components4].[ComponentID]
  INNER JOIN [TA_Currencies] AS [TA_Currencies5]
    ON [TA_BillAmount].[CurrencyID] = [TA_Currencies5].[CurrencyID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [TA_BillAmount].[ProjectID] = [IDM_Projects1].[ProjectID]
  WHERE
  [TA_BillAmount].[TABillNo] = @TABillNo
  AND [TA_BillAmount].[ComponentID] = @ComponentID
  AND [TA_BillAmount].[CurrencyID] = @CurrencyID
  AND [TA_BillAmount].[CostCenterID] = @CostCenterID
GO
