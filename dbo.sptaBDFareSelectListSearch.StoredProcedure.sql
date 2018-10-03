USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBDFareSelectListSearch]
  @Filter_TABillNo Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @ComponentID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,TABillNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (TABillNo, SerialNo)
  SELECT [TA_BillDetails].[TABillNo], [TA_BillDetails].[SerialNo] FROM [TA_BillDetails]
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
      [TA_BillDetails].[ComponentID] = (@ComponentID) 
       AND [TA_BillDetails].[TABillNo] = (@Filter_TABillNo)
   AND ( 
         STR(ISNULL([TA_BillDetails].[TABillNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[Country1ID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[Country2ID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[City1ID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[City1Text],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[City2ID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[City2Text],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[ModeTravelID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[ModeText],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[AmountFactor], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[ComponentID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[PassedAmountTotal], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[ModeExpenseID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[SystemText],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[AmountTotal], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[ModeFinanceID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[CityTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[SanctionDiskFile],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[ModeLCID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[SanctionFileName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[ProjectID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[AmountInINR], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[CostCenterID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[CurrencyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[OOERemarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[AmountRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[PassedAmountRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[OOEReasonID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[ApprovalWFTypeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[PassedAmountTax], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[AmountTax], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[AmountBasic], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[ConversionFactorINR], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[ApprovedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[AccountsRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[ApprovalRemarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[PassedAmountBasic], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[BillDiskFile],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[PassedAmountFactor], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillDetails].[PassedAmountInINR], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillDetails].[BillFileName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'TABillNo' THEN [TA_BillDetails].[TABillNo] END,
     CASE @OrderBy WHEN 'TABillNo DESC' THEN [TA_BillDetails].[TABillNo] END DESC,
     CASE @OrderBy WHEN 'Country1ID' THEN [TA_BillDetails].[Country1ID] END,
     CASE @OrderBy WHEN 'Country1ID DESC' THEN [TA_BillDetails].[Country1ID] END DESC,
     CASE @OrderBy WHEN 'Country2ID' THEN [TA_BillDetails].[Country2ID] END,
     CASE @OrderBy WHEN 'Country2ID DESC' THEN [TA_BillDetails].[Country2ID] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [TA_BillDetails].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [TA_BillDetails].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'City1ID' THEN [TA_BillDetails].[City1ID] END,
     CASE @OrderBy WHEN 'City1ID DESC' THEN [TA_BillDetails].[City1ID] END DESC,
     CASE @OrderBy WHEN 'City1Text' THEN [TA_BillDetails].[City1Text] END,
     CASE @OrderBy WHEN 'City1Text DESC' THEN [TA_BillDetails].[City1Text] END DESC,
     CASE @OrderBy WHEN 'City2ID' THEN [TA_BillDetails].[City2ID] END,
     CASE @OrderBy WHEN 'City2ID DESC' THEN [TA_BillDetails].[City2ID] END DESC,
     CASE @OrderBy WHEN 'City2Text' THEN [TA_BillDetails].[City2Text] END,
     CASE @OrderBy WHEN 'City2Text DESC' THEN [TA_BillDetails].[City2Text] END DESC,
     CASE @OrderBy WHEN 'Date1Time' THEN [TA_BillDetails].[Date1Time] END,
     CASE @OrderBy WHEN 'Date1Time DESC' THEN [TA_BillDetails].[Date1Time] END DESC,
     CASE @OrderBy WHEN 'Date2Time' THEN [TA_BillDetails].[Date2Time] END,
     CASE @OrderBy WHEN 'Date2Time DESC' THEN [TA_BillDetails].[Date2Time] END DESC,
     CASE @OrderBy WHEN 'ModeTravelID' THEN [TA_BillDetails].[ModeTravelID] END,
     CASE @OrderBy WHEN 'ModeTravelID DESC' THEN [TA_BillDetails].[ModeTravelID] END DESC,
     CASE @OrderBy WHEN 'ModeText' THEN [TA_BillDetails].[ModeText] END,
     CASE @OrderBy WHEN 'ModeText DESC' THEN [TA_BillDetails].[ModeText] END DESC,
     CASE @OrderBy WHEN 'AmountFactor' THEN [TA_BillDetails].[AmountFactor] END,
     CASE @OrderBy WHEN 'AmountFactor DESC' THEN [TA_BillDetails].[AmountFactor] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [TA_BillDetails].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [TA_BillDetails].[Remarks] END DESC,
     CASE @OrderBy WHEN 'ComponentID' THEN [TA_BillDetails].[ComponentID] END,
     CASE @OrderBy WHEN 'ComponentID DESC' THEN [TA_BillDetails].[ComponentID] END DESC,
     CASE @OrderBy WHEN 'StayedWithRelative' THEN [TA_BillDetails].[StayedWithRelative] END,
     CASE @OrderBy WHEN 'StayedWithRelative DESC' THEN [TA_BillDetails].[StayedWithRelative] END DESC,
     CASE @OrderBy WHEN 'AirportToHotel' THEN [TA_BillDetails].[AirportToHotel] END,
     CASE @OrderBy WHEN 'AirportToHotel DESC' THEN [TA_BillDetails].[AirportToHotel] END DESC,
     CASE @OrderBy WHEN 'PassedAmountTotal' THEN [TA_BillDetails].[PassedAmountTotal] END,
     CASE @OrderBy WHEN 'PassedAmountTotal DESC' THEN [TA_BillDetails].[PassedAmountTotal] END DESC,
     CASE @OrderBy WHEN 'ModeExpenseID' THEN [TA_BillDetails].[ModeExpenseID] END,
     CASE @OrderBy WHEN 'ModeExpenseID DESC' THEN [TA_BillDetails].[ModeExpenseID] END DESC,
     CASE @OrderBy WHEN 'StayedAtSite' THEN [TA_BillDetails].[StayedAtSite] END,
     CASE @OrderBy WHEN 'StayedAtSite DESC' THEN [TA_BillDetails].[StayedAtSite] END DESC,
     CASE @OrderBy WHEN 'OOEBySystem' THEN [TA_BillDetails].[OOEBySystem] END,
     CASE @OrderBy WHEN 'OOEBySystem DESC' THEN [TA_BillDetails].[OOEBySystem] END DESC,
     CASE @OrderBy WHEN 'AutoCalculated' THEN [TA_BillDetails].[AutoCalculated] END,
     CASE @OrderBy WHEN 'AutoCalculated DESC' THEN [TA_BillDetails].[AutoCalculated] END DESC,
     CASE @OrderBy WHEN 'SystemText' THEN [TA_BillDetails].[SystemText] END,
     CASE @OrderBy WHEN 'SystemText DESC' THEN [TA_BillDetails].[SystemText] END DESC,
     CASE @OrderBy WHEN 'AmountTotal' THEN [TA_BillDetails].[AmountTotal] END,
     CASE @OrderBy WHEN 'AmountTotal DESC' THEN [TA_BillDetails].[AmountTotal] END DESC,
     CASE @OrderBy WHEN 'ModeFinanceID' THEN [TA_BillDetails].[ModeFinanceID] END,
     CASE @OrderBy WHEN 'ModeFinanceID DESC' THEN [TA_BillDetails].[ModeFinanceID] END DESC,
     CASE @OrderBy WHEN 'CityTypeID' THEN [TA_BillDetails].[CityTypeID] END,
     CASE @OrderBy WHEN 'CityTypeID DESC' THEN [TA_BillDetails].[CityTypeID] END DESC,
     CASE @OrderBy WHEN 'HotelToAirport' THEN [TA_BillDetails].[HotelToAirport] END,
     CASE @OrderBy WHEN 'HotelToAirport DESC' THEN [TA_BillDetails].[HotelToAirport] END DESC,
     CASE @OrderBy WHEN 'BillAttached' THEN [TA_BillDetails].[BillAttached] END,
     CASE @OrderBy WHEN 'BillAttached DESC' THEN [TA_BillDetails].[BillAttached] END DESC,
     CASE @OrderBy WHEN 'LodgingProvided' THEN [TA_BillDetails].[LodgingProvided] END,
     CASE @OrderBy WHEN 'LodgingProvided DESC' THEN [TA_BillDetails].[LodgingProvided] END DESC,
     CASE @OrderBy WHEN 'ApprovedOn' THEN [TA_BillDetails].[ApprovedOn] END,
     CASE @OrderBy WHEN 'ApprovedOn DESC' THEN [TA_BillDetails].[ApprovedOn] END DESC,
     CASE @OrderBy WHEN 'StayedInGuestHouse' THEN [TA_BillDetails].[StayedInGuestHouse] END,
     CASE @OrderBy WHEN 'StayedInGuestHouse DESC' THEN [TA_BillDetails].[StayedInGuestHouse] END DESC,
     CASE @OrderBy WHEN 'SanctionAttached' THEN [TA_BillDetails].[SanctionAttached] END,
     CASE @OrderBy WHEN 'SanctionAttached DESC' THEN [TA_BillDetails].[SanctionAttached] END DESC,
     CASE @OrderBy WHEN 'SanctionDiskFile' THEN [TA_BillDetails].[SanctionDiskFile] END,
     CASE @OrderBy WHEN 'SanctionDiskFile DESC' THEN [TA_BillDetails].[SanctionDiskFile] END DESC,
     CASE @OrderBy WHEN 'Setteled' THEN [TA_BillDetails].[Setteled] END,
     CASE @OrderBy WHEN 'Setteled DESC' THEN [TA_BillDetails].[Setteled] END DESC,
     CASE @OrderBy WHEN 'ModeLCID' THEN [TA_BillDetails].[ModeLCID] END,
     CASE @OrderBy WHEN 'ModeLCID DESC' THEN [TA_BillDetails].[ModeLCID] END DESC,
     CASE @OrderBy WHEN 'SanctionFileName' THEN [TA_BillDetails].[SanctionFileName] END,
     CASE @OrderBy WHEN 'SanctionFileName DESC' THEN [TA_BillDetails].[SanctionFileName] END DESC,
     CASE @OrderBy WHEN 'NotStayedAnyWhere' THEN [TA_BillDetails].[NotStayedAnyWhere] END,
     CASE @OrderBy WHEN 'NotStayedAnyWhere DESC' THEN [TA_BillDetails].[NotStayedAnyWhere] END DESC,
     CASE @OrderBy WHEN 'StayedInHotel' THEN [TA_BillDetails].[StayedInHotel] END,
     CASE @OrderBy WHEN 'StayedInHotel DESC' THEN [TA_BillDetails].[StayedInHotel] END DESC,
     CASE @OrderBy WHEN 'AirportToClientLocation' THEN [TA_BillDetails].[AirportToClientLocation] END,
     CASE @OrderBy WHEN 'AirportToClientLocation DESC' THEN [TA_BillDetails].[AirportToClientLocation] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [TA_BillDetails].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TA_BillDetails].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'AmountInINR' THEN [TA_BillDetails].[AmountInINR] END,
     CASE @OrderBy WHEN 'AmountInINR DESC' THEN [TA_BillDetails].[AmountInINR] END DESC,
     CASE @OrderBy WHEN 'TourExtended' THEN [TA_BillDetails].[TourExtended] END,
     CASE @OrderBy WHEN 'TourExtended DESC' THEN [TA_BillDetails].[TourExtended] END DESC,
     CASE @OrderBy WHEN 'CostCenterID' THEN [TA_BillDetails].[CostCenterID] END,
     CASE @OrderBy WHEN 'CostCenterID DESC' THEN [TA_BillDetails].[CostCenterID] END DESC,
     CASE @OrderBy WHEN 'BoardingProvided' THEN [TA_BillDetails].[BoardingProvided] END,
     CASE @OrderBy WHEN 'BoardingProvided DESC' THEN [TA_BillDetails].[BoardingProvided] END DESC,
     CASE @OrderBy WHEN 'CurrencyID' THEN [TA_BillDetails].[CurrencyID] END,
     CASE @OrderBy WHEN 'CurrencyID DESC' THEN [TA_BillDetails].[CurrencyID] END DESC,
     CASE @OrderBy WHEN 'OOEByAccounts' THEN [TA_BillDetails].[OOEByAccounts] END,
     CASE @OrderBy WHEN 'OOEByAccounts DESC' THEN [TA_BillDetails].[OOEByAccounts] END DESC,
     CASE @OrderBy WHEN 'OOERemarks' THEN [TA_BillDetails].[OOERemarks] END,
     CASE @OrderBy WHEN 'OOERemarks DESC' THEN [TA_BillDetails].[OOERemarks] END DESC,
     CASE @OrderBy WHEN 'AmountRate' THEN [TA_BillDetails].[AmountRate] END,
     CASE @OrderBy WHEN 'AmountRate DESC' THEN [TA_BillDetails].[AmountRate] END DESC,
     CASE @OrderBy WHEN 'PassedAmountRate' THEN [TA_BillDetails].[PassedAmountRate] END,
     CASE @OrderBy WHEN 'PassedAmountRate DESC' THEN [TA_BillDetails].[PassedAmountRate] END DESC,
     CASE @OrderBy WHEN 'OOEReasonID' THEN [TA_BillDetails].[OOEReasonID] END,
     CASE @OrderBy WHEN 'OOEReasonID DESC' THEN [TA_BillDetails].[OOEReasonID] END DESC,
     CASE @OrderBy WHEN 'ApprovalWFTypeID' THEN [TA_BillDetails].[ApprovalWFTypeID] END,
     CASE @OrderBy WHEN 'ApprovalWFTypeID DESC' THEN [TA_BillDetails].[ApprovalWFTypeID] END DESC,
     CASE @OrderBy WHEN 'PassedAmountTax' THEN [TA_BillDetails].[PassedAmountTax] END,
     CASE @OrderBy WHEN 'PassedAmountTax DESC' THEN [TA_BillDetails].[PassedAmountTax] END DESC,
     CASE @OrderBy WHEN 'AmountTax' THEN [TA_BillDetails].[AmountTax] END,
     CASE @OrderBy WHEN 'AmountTax DESC' THEN [TA_BillDetails].[AmountTax] END DESC,
     CASE @OrderBy WHEN 'AmountBasic' THEN [TA_BillDetails].[AmountBasic] END,
     CASE @OrderBy WHEN 'AmountBasic DESC' THEN [TA_BillDetails].[AmountBasic] END DESC,
     CASE @OrderBy WHEN 'ConversionFactorINR' THEN [TA_BillDetails].[ConversionFactorINR] END,
     CASE @OrderBy WHEN 'ConversionFactorINR DESC' THEN [TA_BillDetails].[ConversionFactorINR] END DESC,
     CASE @OrderBy WHEN 'ApprovedBy' THEN [TA_BillDetails].[ApprovedBy] END,
     CASE @OrderBy WHEN 'ApprovedBy DESC' THEN [TA_BillDetails].[ApprovedBy] END DESC,
     CASE @OrderBy WHEN 'AccountsRemarks' THEN [TA_BillDetails].[AccountsRemarks] END,
     CASE @OrderBy WHEN 'AccountsRemarks DESC' THEN [TA_BillDetails].[AccountsRemarks] END DESC,
     CASE @OrderBy WHEN 'ApprovalRemarks' THEN [TA_BillDetails].[ApprovalRemarks] END,
     CASE @OrderBy WHEN 'ApprovalRemarks DESC' THEN [TA_BillDetails].[ApprovalRemarks] END DESC,
     CASE @OrderBy WHEN 'PassedAmountBasic' THEN [TA_BillDetails].[PassedAmountBasic] END,
     CASE @OrderBy WHEN 'PassedAmountBasic DESC' THEN [TA_BillDetails].[PassedAmountBasic] END DESC,
     CASE @OrderBy WHEN 'BillDiskFile' THEN [TA_BillDetails].[BillDiskFile] END,
     CASE @OrderBy WHEN 'BillDiskFile DESC' THEN [TA_BillDetails].[BillDiskFile] END DESC,
     CASE @OrderBy WHEN 'PassedAmountFactor' THEN [TA_BillDetails].[PassedAmountFactor] END,
     CASE @OrderBy WHEN 'PassedAmountFactor DESC' THEN [TA_BillDetails].[PassedAmountFactor] END DESC,
     CASE @OrderBy WHEN 'PassedAmountInINR' THEN [TA_BillDetails].[PassedAmountInINR] END,
     CASE @OrderBy WHEN 'PassedAmountInINR DESC' THEN [TA_BillDetails].[PassedAmountInINR] END DESC,
     CASE @OrderBy WHEN 'BillFileName' THEN [TA_BillDetails].[BillFileName] END,
     CASE @OrderBy WHEN 'BillFileName DESC' THEN [TA_BillDetails].[BillFileName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Departments2_Description' THEN [HRM_Departments2].[Description] END,
     CASE @OrderBy WHEN 'HRM_Departments2_Description DESC' THEN [HRM_Departments2].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects3_Description' THEN [IDM_Projects3].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects3_Description DESC' THEN [IDM_Projects3].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_ApprovalWFTypes4_WFTypeDescription' THEN [TA_ApprovalWFTypes4].[WFTypeDescription] END,
     CASE @OrderBy WHEN 'TA_ApprovalWFTypes4_WFTypeDescription DESC' THEN [TA_ApprovalWFTypes4].[WFTypeDescription] END DESC,
     CASE @OrderBy WHEN 'TA_Bills5_PurposeOfJourney' THEN [TA_Bills5].[PurposeOfJourney] END,
     CASE @OrderBy WHEN 'TA_Bills5_PurposeOfJourney DESC' THEN [TA_Bills5].[PurposeOfJourney] END DESC,
     CASE @OrderBy WHEN 'TA_Cities6_CityName' THEN [TA_Cities6].[CityName] END,
     CASE @OrderBy WHEN 'TA_Cities6_CityName DESC' THEN [TA_Cities6].[CityName] END DESC,
     CASE @OrderBy WHEN 'TA_Cities7_CityName' THEN [TA_Cities7].[CityName] END,
     CASE @OrderBy WHEN 'TA_Cities7_CityName DESC' THEN [TA_Cities7].[CityName] END DESC,
     CASE @OrderBy WHEN 'TA_CityTypes8_CityTypeName' THEN [TA_CityTypes8].[CityTypeName] END,
     CASE @OrderBy WHEN 'TA_CityTypes8_CityTypeName DESC' THEN [TA_CityTypes8].[CityTypeName] END DESC,
     CASE @OrderBy WHEN 'TA_Components9_Description' THEN [TA_Components9].[Description] END,
     CASE @OrderBy WHEN 'TA_Components9_Description DESC' THEN [TA_Components9].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_Currencies10_CurrencyName' THEN [TA_Currencies10].[CurrencyName] END,
     CASE @OrderBy WHEN 'TA_Currencies10_CurrencyName DESC' THEN [TA_Currencies10].[CurrencyName] END DESC,
     CASE @OrderBy WHEN 'TA_ExpenseHeads11_Description' THEN [TA_ExpenseHeads11].[Description] END,
     CASE @OrderBy WHEN 'TA_ExpenseHeads11_Description DESC' THEN [TA_ExpenseHeads11].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_FinanceHeads12_Description' THEN [TA_FinanceHeads12].[Description] END,
     CASE @OrderBy WHEN 'TA_FinanceHeads12_Description DESC' THEN [TA_FinanceHeads12].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_LCModes13_ModeName' THEN [TA_LCModes13].[ModeName] END,
     CASE @OrderBy WHEN 'TA_LCModes13_ModeName DESC' THEN [TA_LCModes13].[ModeName] END DESC,
     CASE @OrderBy WHEN 'TA_OOEReasons14_Description' THEN [TA_OOEReasons14].[Description] END,
     CASE @OrderBy WHEN 'TA_OOEReasons14_Description DESC' THEN [TA_OOEReasons14].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_TravelModes15_ModeName' THEN [TA_TravelModes15].[ModeName] END,
     CASE @OrderBy WHEN 'TA_TravelModes15_ModeName DESC' THEN [TA_TravelModes15].[ModeName] END DESC,
     CASE @OrderBy WHEN 'TA_Countries16_CountryName' THEN [TA_Countries16].[CountryName] END,
     CASE @OrderBy WHEN 'TA_Countries16_CountryName DESC' THEN [TA_Countries16].[CountryName] END DESC,
     CASE @OrderBy WHEN 'TA_Countries17_CountryName' THEN [TA_Countries17].[CountryName] END,
     CASE @OrderBy WHEN 'TA_Countries17_CountryName DESC' THEN [TA_Countries17].[CountryName] END DESC 

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
