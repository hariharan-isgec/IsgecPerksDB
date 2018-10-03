USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaCDLCSelectListFilteres]
  @Filter_TABillNo Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @ComponentID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,TABillNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TABillNo'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_BillDetails].[TABillNo]'
  SET @LGSQL = @LGSQL + ', [TA_BillDetails].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [TA_BillDetails] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[ApprovedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments2]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[CostCenterID] = [HRM_Departments2].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects3]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[ProjectID] = [IDM_Projects3].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_ApprovalWFTypes] AS [TA_ApprovalWFTypes4]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[ApprovalWFTypeID] = [TA_ApprovalWFTypes4].[WFTypeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_Bills] AS [TA_Bills5]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[TABillNo] = [TA_Bills5].[TABillNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities6]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[City1ID] = [TA_Cities6].[CityID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities7]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[City2ID] = [TA_Cities7].[CityID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_CityTypes] AS [TA_CityTypes8]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[CityTypeID] = [TA_CityTypes8].[CityTypeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_Components] AS [TA_Components9]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[ComponentID] = [TA_Components9].[ComponentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies10]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[CurrencyID] = [TA_Currencies10].[CurrencyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_ExpenseHeads] AS [TA_ExpenseHeads11]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[ModeExpenseID] = [TA_ExpenseHeads11].[ExpenseHeadID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_FinanceHeads] AS [TA_FinanceHeads12]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[ModeFinanceID] = [TA_FinanceHeads12].[FinanceHeadID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_LCModes] AS [TA_LCModes13]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[ModeLCID] = [TA_LCModes13].[ModeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_OOEReasons] AS [TA_OOEReasons14]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[OOEReasonID] = [TA_OOEReasons14].[ReasonID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_TravelModes] AS [TA_TravelModes15]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[ModeTravelID] = [TA_TravelModes15].[ModeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Countries] AS [TA_Countries16]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[Country1ID] = [TA_Countries16].[CountryID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Countries] AS [TA_Countries17]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillDetails].[Country2ID] = [TA_Countries17].[CountryID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [TA_BillDetails].[ComponentID] = ''' + STR(@ComponentID) + '''' 
  IF (@Filter_TABillNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [TA_BillDetails].[TABillNo] = ' + STR(@Filter_TABillNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TABillNo' THEN '[TA_BillDetails].[TABillNo]'
                        WHEN 'TABillNo DESC' THEN '[TA_BillDetails].[TABillNo] DESC'
                        WHEN 'Country1ID' THEN '[TA_BillDetails].[Country1ID]'
                        WHEN 'Country1ID DESC' THEN '[TA_BillDetails].[Country1ID] DESC'
                        WHEN 'Country2ID' THEN '[TA_BillDetails].[Country2ID]'
                        WHEN 'Country2ID DESC' THEN '[TA_BillDetails].[Country2ID] DESC'
                        WHEN 'SerialNo' THEN '[TA_BillDetails].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[TA_BillDetails].[SerialNo] DESC'
                        WHEN 'City1ID' THEN '[TA_BillDetails].[City1ID]'
                        WHEN 'City1ID DESC' THEN '[TA_BillDetails].[City1ID] DESC'
                        WHEN 'City1Text' THEN '[TA_BillDetails].[City1Text]'
                        WHEN 'City1Text DESC' THEN '[TA_BillDetails].[City1Text] DESC'
                        WHEN 'City2ID' THEN '[TA_BillDetails].[City2ID]'
                        WHEN 'City2ID DESC' THEN '[TA_BillDetails].[City2ID] DESC'
                        WHEN 'City2Text' THEN '[TA_BillDetails].[City2Text]'
                        WHEN 'City2Text DESC' THEN '[TA_BillDetails].[City2Text] DESC'
                        WHEN 'Date1Time' THEN '[TA_BillDetails].[Date1Time]'
                        WHEN 'Date1Time DESC' THEN '[TA_BillDetails].[Date1Time] DESC'
                        WHEN 'Date2Time' THEN '[TA_BillDetails].[Date2Time]'
                        WHEN 'Date2Time DESC' THEN '[TA_BillDetails].[Date2Time] DESC'
                        WHEN 'ModeTravelID' THEN '[TA_BillDetails].[ModeTravelID]'
                        WHEN 'ModeTravelID DESC' THEN '[TA_BillDetails].[ModeTravelID] DESC'
                        WHEN 'ModeText' THEN '[TA_BillDetails].[ModeText]'
                        WHEN 'ModeText DESC' THEN '[TA_BillDetails].[ModeText] DESC'
                        WHEN 'AmountFactor' THEN '[TA_BillDetails].[AmountFactor]'
                        WHEN 'AmountFactor DESC' THEN '[TA_BillDetails].[AmountFactor] DESC'
                        WHEN 'Remarks' THEN '[TA_BillDetails].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[TA_BillDetails].[Remarks] DESC'
                        WHEN 'ComponentID' THEN '[TA_BillDetails].[ComponentID]'
                        WHEN 'ComponentID DESC' THEN '[TA_BillDetails].[ComponentID] DESC'
                        WHEN 'StayedWithRelative' THEN '[TA_BillDetails].[StayedWithRelative]'
                        WHEN 'StayedWithRelative DESC' THEN '[TA_BillDetails].[StayedWithRelative] DESC'
                        WHEN 'AirportToHotel' THEN '[TA_BillDetails].[AirportToHotel]'
                        WHEN 'AirportToHotel DESC' THEN '[TA_BillDetails].[AirportToHotel] DESC'
                        WHEN 'PassedAmountTotal' THEN '[TA_BillDetails].[PassedAmountTotal]'
                        WHEN 'PassedAmountTotal DESC' THEN '[TA_BillDetails].[PassedAmountTotal] DESC'
                        WHEN 'ModeExpenseID' THEN '[TA_BillDetails].[ModeExpenseID]'
                        WHEN 'ModeExpenseID DESC' THEN '[TA_BillDetails].[ModeExpenseID] DESC'
                        WHEN 'StayedAtSite' THEN '[TA_BillDetails].[StayedAtSite]'
                        WHEN 'StayedAtSite DESC' THEN '[TA_BillDetails].[StayedAtSite] DESC'
                        WHEN 'OOEBySystem' THEN '[TA_BillDetails].[OOEBySystem]'
                        WHEN 'OOEBySystem DESC' THEN '[TA_BillDetails].[OOEBySystem] DESC'
                        WHEN 'AutoCalculated' THEN '[TA_BillDetails].[AutoCalculated]'
                        WHEN 'AutoCalculated DESC' THEN '[TA_BillDetails].[AutoCalculated] DESC'
                        WHEN 'SystemText' THEN '[TA_BillDetails].[SystemText]'
                        WHEN 'SystemText DESC' THEN '[TA_BillDetails].[SystemText] DESC'
                        WHEN 'AmountTotal' THEN '[TA_BillDetails].[AmountTotal]'
                        WHEN 'AmountTotal DESC' THEN '[TA_BillDetails].[AmountTotal] DESC'
                        WHEN 'ModeFinanceID' THEN '[TA_BillDetails].[ModeFinanceID]'
                        WHEN 'ModeFinanceID DESC' THEN '[TA_BillDetails].[ModeFinanceID] DESC'
                        WHEN 'CityTypeID' THEN '[TA_BillDetails].[CityTypeID]'
                        WHEN 'CityTypeID DESC' THEN '[TA_BillDetails].[CityTypeID] DESC'
                        WHEN 'HotelToAirport' THEN '[TA_BillDetails].[HotelToAirport]'
                        WHEN 'HotelToAirport DESC' THEN '[TA_BillDetails].[HotelToAirport] DESC'
                        WHEN 'BillAttached' THEN '[TA_BillDetails].[BillAttached]'
                        WHEN 'BillAttached DESC' THEN '[TA_BillDetails].[BillAttached] DESC'
                        WHEN 'LodgingProvided' THEN '[TA_BillDetails].[LodgingProvided]'
                        WHEN 'LodgingProvided DESC' THEN '[TA_BillDetails].[LodgingProvided] DESC'
                        WHEN 'ApprovedOn' THEN '[TA_BillDetails].[ApprovedOn]'
                        WHEN 'ApprovedOn DESC' THEN '[TA_BillDetails].[ApprovedOn] DESC'
                        WHEN 'StayedInGuestHouse' THEN '[TA_BillDetails].[StayedInGuestHouse]'
                        WHEN 'StayedInGuestHouse DESC' THEN '[TA_BillDetails].[StayedInGuestHouse] DESC'
                        WHEN 'SanctionAttached' THEN '[TA_BillDetails].[SanctionAttached]'
                        WHEN 'SanctionAttached DESC' THEN '[TA_BillDetails].[SanctionAttached] DESC'
                        WHEN 'SanctionDiskFile' THEN '[TA_BillDetails].[SanctionDiskFile]'
                        WHEN 'SanctionDiskFile DESC' THEN '[TA_BillDetails].[SanctionDiskFile] DESC'
                        WHEN 'Setteled' THEN '[TA_BillDetails].[Setteled]'
                        WHEN 'Setteled DESC' THEN '[TA_BillDetails].[Setteled] DESC'
                        WHEN 'ModeLCID' THEN '[TA_BillDetails].[ModeLCID]'
                        WHEN 'ModeLCID DESC' THEN '[TA_BillDetails].[ModeLCID] DESC'
                        WHEN 'SanctionFileName' THEN '[TA_BillDetails].[SanctionFileName]'
                        WHEN 'SanctionFileName DESC' THEN '[TA_BillDetails].[SanctionFileName] DESC'
                        WHEN 'NotStayedAnyWhere' THEN '[TA_BillDetails].[NotStayedAnyWhere]'
                        WHEN 'NotStayedAnyWhere DESC' THEN '[TA_BillDetails].[NotStayedAnyWhere] DESC'
                        WHEN 'StayedInHotel' THEN '[TA_BillDetails].[StayedInHotel]'
                        WHEN 'StayedInHotel DESC' THEN '[TA_BillDetails].[StayedInHotel] DESC'
                        WHEN 'AirportToClientLocation' THEN '[TA_BillDetails].[AirportToClientLocation]'
                        WHEN 'AirportToClientLocation DESC' THEN '[TA_BillDetails].[AirportToClientLocation] DESC'
                        WHEN 'ProjectID' THEN '[TA_BillDetails].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[TA_BillDetails].[ProjectID] DESC'
                        WHEN 'AmountInINR' THEN '[TA_BillDetails].[AmountInINR]'
                        WHEN 'AmountInINR DESC' THEN '[TA_BillDetails].[AmountInINR] DESC'
                        WHEN 'TourExtended' THEN '[TA_BillDetails].[TourExtended]'
                        WHEN 'TourExtended DESC' THEN '[TA_BillDetails].[TourExtended] DESC'
                        WHEN 'CostCenterID' THEN '[TA_BillDetails].[CostCenterID]'
                        WHEN 'CostCenterID DESC' THEN '[TA_BillDetails].[CostCenterID] DESC'
                        WHEN 'BoardingProvided' THEN '[TA_BillDetails].[BoardingProvided]'
                        WHEN 'BoardingProvided DESC' THEN '[TA_BillDetails].[BoardingProvided] DESC'
                        WHEN 'CurrencyID' THEN '[TA_BillDetails].[CurrencyID]'
                        WHEN 'CurrencyID DESC' THEN '[TA_BillDetails].[CurrencyID] DESC'
                        WHEN 'OOEByAccounts' THEN '[TA_BillDetails].[OOEByAccounts]'
                        WHEN 'OOEByAccounts DESC' THEN '[TA_BillDetails].[OOEByAccounts] DESC'
                        WHEN 'OOERemarks' THEN '[TA_BillDetails].[OOERemarks]'
                        WHEN 'OOERemarks DESC' THEN '[TA_BillDetails].[OOERemarks] DESC'
                        WHEN 'AmountRate' THEN '[TA_BillDetails].[AmountRate]'
                        WHEN 'AmountRate DESC' THEN '[TA_BillDetails].[AmountRate] DESC'
                        WHEN 'PassedAmountRate' THEN '[TA_BillDetails].[PassedAmountRate]'
                        WHEN 'PassedAmountRate DESC' THEN '[TA_BillDetails].[PassedAmountRate] DESC'
                        WHEN 'OOEReasonID' THEN '[TA_BillDetails].[OOEReasonID]'
                        WHEN 'OOEReasonID DESC' THEN '[TA_BillDetails].[OOEReasonID] DESC'
                        WHEN 'ApprovalWFTypeID' THEN '[TA_BillDetails].[ApprovalWFTypeID]'
                        WHEN 'ApprovalWFTypeID DESC' THEN '[TA_BillDetails].[ApprovalWFTypeID] DESC'
                        WHEN 'PassedAmountTax' THEN '[TA_BillDetails].[PassedAmountTax]'
                        WHEN 'PassedAmountTax DESC' THEN '[TA_BillDetails].[PassedAmountTax] DESC'
                        WHEN 'AmountTax' THEN '[TA_BillDetails].[AmountTax]'
                        WHEN 'AmountTax DESC' THEN '[TA_BillDetails].[AmountTax] DESC'
                        WHEN 'AmountBasic' THEN '[TA_BillDetails].[AmountBasic]'
                        WHEN 'AmountBasic DESC' THEN '[TA_BillDetails].[AmountBasic] DESC'
                        WHEN 'ConversionFactorINR' THEN '[TA_BillDetails].[ConversionFactorINR]'
                        WHEN 'ConversionFactorINR DESC' THEN '[TA_BillDetails].[ConversionFactorINR] DESC'
                        WHEN 'ApprovedBy' THEN '[TA_BillDetails].[ApprovedBy]'
                        WHEN 'ApprovedBy DESC' THEN '[TA_BillDetails].[ApprovedBy] DESC'
                        WHEN 'AccountsRemarks' THEN '[TA_BillDetails].[AccountsRemarks]'
                        WHEN 'AccountsRemarks DESC' THEN '[TA_BillDetails].[AccountsRemarks] DESC'
                        WHEN 'ApprovalRemarks' THEN '[TA_BillDetails].[ApprovalRemarks]'
                        WHEN 'ApprovalRemarks DESC' THEN '[TA_BillDetails].[ApprovalRemarks] DESC'
                        WHEN 'PassedAmountBasic' THEN '[TA_BillDetails].[PassedAmountBasic]'
                        WHEN 'PassedAmountBasic DESC' THEN '[TA_BillDetails].[PassedAmountBasic] DESC'
                        WHEN 'BillDiskFile' THEN '[TA_BillDetails].[BillDiskFile]'
                        WHEN 'BillDiskFile DESC' THEN '[TA_BillDetails].[BillDiskFile] DESC'
                        WHEN 'PassedAmountFactor' THEN '[TA_BillDetails].[PassedAmountFactor]'
                        WHEN 'PassedAmountFactor DESC' THEN '[TA_BillDetails].[PassedAmountFactor] DESC'
                        WHEN 'PassedAmountInINR' THEN '[TA_BillDetails].[PassedAmountInINR]'
                        WHEN 'PassedAmountInINR DESC' THEN '[TA_BillDetails].[PassedAmountInINR] DESC'
                        WHEN 'BillFileName' THEN '[TA_BillDetails].[BillFileName]'
                        WHEN 'BillFileName DESC' THEN '[TA_BillDetails].[BillFileName] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'HRM_Departments2_Description' THEN '[HRM_Departments2].[Description]'
                        WHEN 'HRM_Departments2_Description DESC' THEN '[HRM_Departments2].[Description] DESC'
                        WHEN 'IDM_Projects3_Description' THEN '[IDM_Projects3].[Description]'
                        WHEN 'IDM_Projects3_Description DESC' THEN '[IDM_Projects3].[Description] DESC'
                        WHEN 'TA_ApprovalWFTypes4_WFTypeDescription' THEN '[TA_ApprovalWFTypes4].[WFTypeDescription]'
                        WHEN 'TA_ApprovalWFTypes4_WFTypeDescription DESC' THEN '[TA_ApprovalWFTypes4].[WFTypeDescription] DESC'
                        WHEN 'TA_Bills5_PurposeOfJourney' THEN '[TA_Bills5].[PurposeOfJourney]'
                        WHEN 'TA_Bills5_PurposeOfJourney DESC' THEN '[TA_Bills5].[PurposeOfJourney] DESC'
                        WHEN 'TA_Cities6_CityName' THEN '[TA_Cities6].[CityName]'
                        WHEN 'TA_Cities6_CityName DESC' THEN '[TA_Cities6].[CityName] DESC'
                        WHEN 'TA_Cities7_CityName' THEN '[TA_Cities7].[CityName]'
                        WHEN 'TA_Cities7_CityName DESC' THEN '[TA_Cities7].[CityName] DESC'
                        WHEN 'TA_CityTypes8_CityTypeName' THEN '[TA_CityTypes8].[CityTypeName]'
                        WHEN 'TA_CityTypes8_CityTypeName DESC' THEN '[TA_CityTypes8].[CityTypeName] DESC'
                        WHEN 'TA_Components9_Description' THEN '[TA_Components9].[Description]'
                        WHEN 'TA_Components9_Description DESC' THEN '[TA_Components9].[Description] DESC'
                        WHEN 'TA_Currencies10_CurrencyName' THEN '[TA_Currencies10].[CurrencyName]'
                        WHEN 'TA_Currencies10_CurrencyName DESC' THEN '[TA_Currencies10].[CurrencyName] DESC'
                        WHEN 'TA_ExpenseHeads11_Description' THEN '[TA_ExpenseHeads11].[Description]'
                        WHEN 'TA_ExpenseHeads11_Description DESC' THEN '[TA_ExpenseHeads11].[Description] DESC'
                        WHEN 'TA_FinanceHeads12_Description' THEN '[TA_FinanceHeads12].[Description]'
                        WHEN 'TA_FinanceHeads12_Description DESC' THEN '[TA_FinanceHeads12].[Description] DESC'
                        WHEN 'TA_LCModes13_ModeName' THEN '[TA_LCModes13].[ModeName]'
                        WHEN 'TA_LCModes13_ModeName DESC' THEN '[TA_LCModes13].[ModeName] DESC'
                        WHEN 'TA_OOEReasons14_Description' THEN '[TA_OOEReasons14].[Description]'
                        WHEN 'TA_OOEReasons14_Description DESC' THEN '[TA_OOEReasons14].[Description] DESC'
                        WHEN 'TA_TravelModes15_ModeName' THEN '[TA_TravelModes15].[ModeName]'
                        WHEN 'TA_TravelModes15_ModeName DESC' THEN '[TA_TravelModes15].[ModeName] DESC'
                        WHEN 'TA_Countries16_CountryName' THEN '[TA_Countries16].[CountryName]'
                        WHEN 'TA_Countries16_CountryName DESC' THEN '[TA_Countries16].[CountryName] DESC'
                        WHEN 'TA_Countries17_CountryName' THEN '[TA_Countries17].[CountryName]'
                        WHEN 'TA_Countries17_CountryName DESC' THEN '[TA_Countries17].[CountryName] DESC'
                        ELSE '[TA_BillDetails].[TABillNo],[TA_BillDetails].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [TA_BillDetails].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [HRM_Departments2].[Description] AS HRM_Departments2_Description,
    [IDM_Projects3].[Description] AS IDM_Projects3_Description,
    [TA_ApprovalWFTypes4].[WFTypeDescription] AS TA_ApprovalWFTypes4_WFTypeDescription,
    [TA_Bills5].[PurposeOfJourney] AS TA_Bills5_PurposeOfJourney,
    [TA_Cities6].[CityName] AS TA_Cities6_CityName,
    [TA_Cities7].[CityName] AS TA_Cities7_CityName,
    [TA_CityTypes8].[CityTypeName] AS TA_CityTypes8_CityTypeName,
    [TA_Components9].[Description] AS TA_Components9_Description,
    [TA_Currencies10].[CurrencyName] AS TA_Currencies10_CurrencyName,
    [TA_ExpenseHeads11].[Description] AS TA_ExpenseHeads11_Description,
    [TA_FinanceHeads12].[Description] AS TA_FinanceHeads12_Description,
    [TA_LCModes13].[ModeName] AS TA_LCModes13_ModeName,
    [TA_OOEReasons14].[Description] AS TA_OOEReasons14_Description,
    [TA_TravelModes15].[ModeName] AS TA_TravelModes15_ModeName,
    [TA_Countries16].[CountryName] AS TA_Countries16_CountryName,
    [TA_Countries17].[CountryName] AS TA_Countries17_CountryName 
  FROM [TA_BillDetails] 
      INNER JOIN #PageIndex
          ON [TA_BillDetails].[TABillNo] = #PageIndex.TABillNo
          AND [TA_BillDetails].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [TA_BillDetails].[ApprovedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments2]
    ON [TA_BillDetails].[CostCenterID] = [HRM_Departments2].[DepartmentID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects3]
    ON [TA_BillDetails].[ProjectID] = [IDM_Projects3].[ProjectID]
  LEFT OUTER JOIN [TA_ApprovalWFTypes] AS [TA_ApprovalWFTypes4]
    ON [TA_BillDetails].[ApprovalWFTypeID] = [TA_ApprovalWFTypes4].[WFTypeID]
  INNER JOIN [TA_Bills] AS [TA_Bills5]
    ON [TA_BillDetails].[TABillNo] = [TA_Bills5].[TABillNo]
  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities6]
    ON [TA_BillDetails].[City1ID] = [TA_Cities6].[CityID]
  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities7]
    ON [TA_BillDetails].[City2ID] = [TA_Cities7].[CityID]
  LEFT OUTER JOIN [TA_CityTypes] AS [TA_CityTypes8]
    ON [TA_BillDetails].[CityTypeID] = [TA_CityTypes8].[CityTypeID]
  INNER JOIN [TA_Components] AS [TA_Components9]
    ON [TA_BillDetails].[ComponentID] = [TA_Components9].[ComponentID]
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies10]
    ON [TA_BillDetails].[CurrencyID] = [TA_Currencies10].[CurrencyID]
  LEFT OUTER JOIN [TA_ExpenseHeads] AS [TA_ExpenseHeads11]
    ON [TA_BillDetails].[ModeExpenseID] = [TA_ExpenseHeads11].[ExpenseHeadID]
  LEFT OUTER JOIN [TA_FinanceHeads] AS [TA_FinanceHeads12]
    ON [TA_BillDetails].[ModeFinanceID] = [TA_FinanceHeads12].[FinanceHeadID]
  LEFT OUTER JOIN [TA_LCModes] AS [TA_LCModes13]
    ON [TA_BillDetails].[ModeLCID] = [TA_LCModes13].[ModeID]
  LEFT OUTER JOIN [TA_OOEReasons] AS [TA_OOEReasons14]
    ON [TA_BillDetails].[OOEReasonID] = [TA_OOEReasons14].[ReasonID]
  LEFT OUTER JOIN [TA_TravelModes] AS [TA_TravelModes15]
    ON [TA_BillDetails].[ModeTravelID] = [TA_TravelModes15].[ModeID]
  LEFT OUTER JOIN [TA_Countries] AS [TA_Countries16]
    ON [TA_BillDetails].[Country1ID] = [TA_Countries16].[CountryID]
  LEFT OUTER JOIN [TA_Countries] AS [TA_Countries17]
    ON [TA_BillDetails].[Country2ID] = [TA_Countries17].[CountryID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
