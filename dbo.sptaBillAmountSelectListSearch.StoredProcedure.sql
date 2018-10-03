USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillAmountSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,TABillNo Int NOT NULL
 ,ComponentID Int NOT NULL
 ,CurrencyID NVarChar(6) NOT NULL
 ,CostCenterID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (TABillNo, ComponentID, CurrencyID, CostCenterID)
  SELECT [TA_BillAmount].[TABillNo], [TA_BillAmount].[ComponentID], [TA_BillAmount].[CurrencyID], [TA_BillAmount].[CostCenterID] FROM [TA_BillAmount]
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
   ( 
         STR(ISNULL([TA_BillAmount].[TABillNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillAmount].[ComponentID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillAmount].[CurrencyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillAmount].[CostCenterID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillAmount].[TotalInCurrency], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillAmount].[ConversionFactorINR], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillAmount].[CalculationTypeID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillAmount].[TotalInINR], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillAmount].[ProjectID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'TABillNo' THEN [TA_BillAmount].[TABillNo] END,
     CASE @OrderBy WHEN 'TABillNo DESC' THEN [TA_BillAmount].[TABillNo] END DESC,
     CASE @OrderBy WHEN 'ComponentID' THEN [TA_BillAmount].[ComponentID] END,
     CASE @OrderBy WHEN 'ComponentID DESC' THEN [TA_BillAmount].[ComponentID] END DESC,
     CASE @OrderBy WHEN 'CurrencyID' THEN [TA_BillAmount].[CurrencyID] END,
     CASE @OrderBy WHEN 'CurrencyID DESC' THEN [TA_BillAmount].[CurrencyID] END DESC,
     CASE @OrderBy WHEN 'CostCenterID' THEN [TA_BillAmount].[CostCenterID] END,
     CASE @OrderBy WHEN 'CostCenterID DESC' THEN [TA_BillAmount].[CostCenterID] END DESC,
     CASE @OrderBy WHEN 'TotalInCurrency' THEN [TA_BillAmount].[TotalInCurrency] END,
     CASE @OrderBy WHEN 'TotalInCurrency DESC' THEN [TA_BillAmount].[TotalInCurrency] END DESC,
     CASE @OrderBy WHEN 'ConversionFactorINR' THEN [TA_BillAmount].[ConversionFactorINR] END,
     CASE @OrderBy WHEN 'ConversionFactorINR DESC' THEN [TA_BillAmount].[ConversionFactorINR] END DESC,
     CASE @OrderBy WHEN 'CalculationTypeID' THEN [TA_BillAmount].[CalculationTypeID] END,
     CASE @OrderBy WHEN 'CalculationTypeID DESC' THEN [TA_BillAmount].[CalculationTypeID] END DESC,
     CASE @OrderBy WHEN 'TotalInINR' THEN [TA_BillAmount].[TotalInINR] END,
     CASE @OrderBy WHEN 'TotalInINR DESC' THEN [TA_BillAmount].[TotalInINR] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [TA_BillAmount].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TA_BillAmount].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'HRM_Departments1_Description' THEN [HRM_Departments1].[Description] END,
     CASE @OrderBy WHEN 'HRM_Departments1_Description DESC' THEN [HRM_Departments1].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_Bills2_PurposeOfJourney' THEN [TA_Bills2].[PurposeOfJourney] END,
     CASE @OrderBy WHEN 'TA_Bills2_PurposeOfJourney DESC' THEN [TA_Bills2].[PurposeOfJourney] END DESC,
     CASE @OrderBy WHEN 'TA_CalcMethod3_CalculationDescription' THEN [TA_CalcMethod3].[CalculationDescription] END,
     CASE @OrderBy WHEN 'TA_CalcMethod3_CalculationDescription DESC' THEN [TA_CalcMethod3].[CalculationDescription] END DESC,
     CASE @OrderBy WHEN 'TA_Components4_Description' THEN [TA_Components4].[Description] END,
     CASE @OrderBy WHEN 'TA_Components4_Description DESC' THEN [TA_Components4].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_Currencies5_CurrencyName' THEN [TA_Currencies5].[CurrencyName] END,
     CASE @OrderBy WHEN 'TA_Currencies5_CurrencyName DESC' THEN [TA_Currencies5].[CurrencyName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects1_Description' THEN [IDM_Projects1].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects1_Description DESC' THEN [IDM_Projects1].[Description] END DESC 

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
