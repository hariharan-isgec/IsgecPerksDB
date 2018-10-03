USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBillDetailsSelectByID]
  @LoginID NVarChar(8),
  @TABillNo Int,
  @SerialNo Int 
  AS
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
  [TA_BillDetails].[TABillNo] = @TABillNo
  AND [TA_BillDetails].[SerialNo] = @SerialNo
GO
