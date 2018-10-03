USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillAmountSelectListFilteres]
  @Filter_TABillNo Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,TABillNo Int NOT NULL
 ,ComponentID Int NOT NULL
 ,CurrencyID NVarChar(6) NOT NULL
 ,CostCenterID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TABillNo'
  SET @LGSQL = @LGSQL + ', ComponentID'
  SET @LGSQL = @LGSQL + ', CurrencyID'
  SET @LGSQL = @LGSQL + ', CostCenterID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_BillAmount].[TABillNo]'
  SET @LGSQL = @LGSQL + ', [TA_BillAmount].[ComponentID]'
  SET @LGSQL = @LGSQL + ', [TA_BillAmount].[CurrencyID]'
  SET @LGSQL = @LGSQL + ', [TA_BillAmount].[CostCenterID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_BillAmount] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Departments] AS [HRM_Departments1]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillAmount].[CostCenterID] = [HRM_Departments1].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_Bills] AS [TA_Bills2]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillAmount].[TABillNo] = [TA_Bills2].[TABillNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_CalcMethod] AS [TA_CalcMethod3]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillAmount].[CalculationTypeID] = [TA_CalcMethod3].[CalculationTypeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_Components] AS [TA_Components4]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillAmount].[ComponentID] = [TA_Components4].[ComponentID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_Currencies] AS [TA_Currencies5]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillAmount].[CurrencyID] = [TA_Currencies5].[CurrencyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillAmount].[ProjectID] = [IDM_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_TABillNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [TA_BillAmount].[TABillNo] = ' + STR(@Filter_TABillNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TABillNo' THEN '[TA_BillAmount].[TABillNo]'
                        WHEN 'TABillNo DESC' THEN '[TA_BillAmount].[TABillNo] DESC'
                        WHEN 'ComponentID' THEN '[TA_BillAmount].[ComponentID]'
                        WHEN 'ComponentID DESC' THEN '[TA_BillAmount].[ComponentID] DESC'
                        WHEN 'CurrencyID' THEN '[TA_BillAmount].[CurrencyID]'
                        WHEN 'CurrencyID DESC' THEN '[TA_BillAmount].[CurrencyID] DESC'
                        WHEN 'CostCenterID' THEN '[TA_BillAmount].[CostCenterID]'
                        WHEN 'CostCenterID DESC' THEN '[TA_BillAmount].[CostCenterID] DESC'
                        WHEN 'TotalInCurrency' THEN '[TA_BillAmount].[TotalInCurrency]'
                        WHEN 'TotalInCurrency DESC' THEN '[TA_BillAmount].[TotalInCurrency] DESC'
                        WHEN 'ConversionFactorINR' THEN '[TA_BillAmount].[ConversionFactorINR]'
                        WHEN 'ConversionFactorINR DESC' THEN '[TA_BillAmount].[ConversionFactorINR] DESC'
                        WHEN 'CalculationTypeID' THEN '[TA_BillAmount].[CalculationTypeID]'
                        WHEN 'CalculationTypeID DESC' THEN '[TA_BillAmount].[CalculationTypeID] DESC'
                        WHEN 'TotalInINR' THEN '[TA_BillAmount].[TotalInINR]'
                        WHEN 'TotalInINR DESC' THEN '[TA_BillAmount].[TotalInINR] DESC'
                        WHEN 'ProjectID' THEN '[TA_BillAmount].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[TA_BillAmount].[ProjectID] DESC'
                        WHEN 'HRM_Departments1_Description' THEN '[HRM_Departments1].[Description]'
                        WHEN 'HRM_Departments1_Description DESC' THEN '[HRM_Departments1].[Description] DESC'
                        WHEN 'TA_Bills2_PurposeOfJourney' THEN '[TA_Bills2].[PurposeOfJourney]'
                        WHEN 'TA_Bills2_PurposeOfJourney DESC' THEN '[TA_Bills2].[PurposeOfJourney] DESC'
                        WHEN 'TA_CalcMethod3_CalculationDescription' THEN '[TA_CalcMethod3].[CalculationDescription]'
                        WHEN 'TA_CalcMethod3_CalculationDescription DESC' THEN '[TA_CalcMethod3].[CalculationDescription] DESC'
                        WHEN 'TA_Components4_Description' THEN '[TA_Components4].[Description]'
                        WHEN 'TA_Components4_Description DESC' THEN '[TA_Components4].[Description] DESC'
                        WHEN 'TA_Currencies5_CurrencyName' THEN '[TA_Currencies5].[CurrencyName]'
                        WHEN 'TA_Currencies5_CurrencyName DESC' THEN '[TA_Currencies5].[CurrencyName] DESC'
                        WHEN 'IDM_Projects1_Description' THEN '[IDM_Projects1].[Description]'
                        WHEN 'IDM_Projects1_Description DESC' THEN '[IDM_Projects1].[Description] DESC'
                        ELSE '[TA_BillAmount].[TABillNo],[TA_BillAmount].[ComponentID],[TA_BillAmount].[CurrencyID],[TA_BillAmount].[CostCenterID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
      INNER JOIN #PageIndex
          ON [TA_BillAmount].[TABillNo] = #PageIndex.TABillNo
          AND [TA_BillAmount].[ComponentID] = #PageIndex.ComponentID
          AND [TA_BillAmount].[CurrencyID] = #PageIndex.CurrencyID
          AND [TA_BillAmount].[CostCenterID] = #PageIndex.CostCenterID
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
