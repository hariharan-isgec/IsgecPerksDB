USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBillLastSelectByID]
  @LoginID NVarChar(8),
  @TABillNo Int 
  AS
  SELECT
    [TA_BillLast].* ,
    [HRM_Companies1].[Description] AS HRM_Companies1_Description,
    [HRM_Departments2].[Description] AS HRM_Departments2_Description,
    [HRM_Departments3].[Description] AS HRM_Departments3_Description,
    [HRM_Designations4].[Description] AS HRM_Designations4_Description,
    [HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
    [HRM_Employees6].[EmployeeName] AS HRM_Employees6_EmployeeName,
    [HRM_Employees7].[EmployeeName] AS HRM_Employees7_EmployeeName,
    [HRM_Employees8].[EmployeeName] AS HRM_Employees8_EmployeeName,
    [HRM_Employees9].[EmployeeName] AS HRM_Employees9_EmployeeName,
    [HRM_Employees10].[EmployeeName] AS HRM_Employees10_EmployeeName,
    [HRM_Employees11].[EmployeeName] AS HRM_Employees11_EmployeeName,
    [IDM_Projects12].[Description] AS IDM_Projects12_Description,
    [TA_ApprovalWFTypes13].[WFTypeDescription] AS TA_ApprovalWFTypes13_WFTypeDescription,
    [TA_BillStates14].[Description] AS TA_BillStates14_Description,
    [TA_CalcMethod15].[CalculationDescription] AS TA_CalcMethod15_CalculationDescription,
    [TA_Categories16].[cmba] AS TA_Categories16_cmba,
    [TA_Cities17].[CityName] AS TA_Cities17_CityName,
    [TA_Cities18].[CityName] AS TA_Cities18_CityName,
    [TA_Components19].[Description] AS TA_Components19_Description,
    [TA_Currencies20].[CurrencyName] AS TA_Currencies20_CurrencyName,
    [TA_OOEReasons21].[Description] AS TA_OOEReasons21_Description,
    [TA_PrjCalcMethod22].[Description] AS TA_PrjCalcMethod22_Description,
    [TA_TravelTypes23].[TravelTypeDescription] AS TA_TravelTypes23_TravelTypeDescription 
  FROM [TA_BillLast] 
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies1]
    ON [TA_BillLast].[CompanyID] = [HRM_Companies1].[CompanyID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments2]
    ON [TA_BillLast].[CostCenterID] = [HRM_Departments2].[DepartmentID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments3]
    ON [TA_BillLast].[DepartmentID] = [HRM_Departments3].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations4]
    ON [TA_BillLast].[DesignationID] = [HRM_Designations4].[DesignationID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [TA_BillLast].[DivisionID] = [HRM_Divisions5].[DivisionID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees6]
    ON [TA_BillLast].[EmployeeID] = [HRM_Employees6].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]
    ON [TA_BillLast].[PostedBy] = [HRM_Employees7].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees8]
    ON [TA_BillLast].[ApprovedBy] = [HRM_Employees8].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees9]
    ON [TA_BillLast].[ApprovedByCC] = [HRM_Employees9].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees10]
    ON [TA_BillLast].[ApprovedBySA] = [HRM_Employees10].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees11]
    ON [TA_BillLast].[VerifiedBy] = [HRM_Employees11].[CardNo]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects12]
    ON [TA_BillLast].[ProjectID] = [IDM_Projects12].[ProjectID]
  LEFT OUTER JOIN [TA_ApprovalWFTypes] AS [TA_ApprovalWFTypes13]
    ON [TA_BillLast].[ApprovalWFTypeID] = [TA_ApprovalWFTypes13].[WFTypeID]
  INNER JOIN [TA_BillStates] AS [TA_BillStates14]
    ON [TA_BillLast].[BillStatusID] = [TA_BillStates14].[BillStatusID]
  LEFT OUTER JOIN [TA_CalcMethod] AS [TA_CalcMethod15]
    ON [TA_BillLast].[CalculationTypeID] = [TA_CalcMethod15].[CalculationTypeID]
  LEFT OUTER JOIN [TA_Categories] AS [TA_Categories16]
    ON [TA_BillLast].[TACategoryID] = [TA_Categories16].[CategoryID]
  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities17]
    ON [TA_BillLast].[DestinationCity] = [TA_Cities17].[CityID]
  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities18]
    ON [TA_BillLast].[CityOfOrigin] = [TA_Cities18].[CityID]
  INNER JOIN [TA_Components] AS [TA_Components19]
    ON [TA_BillLast].[ComponentID] = [TA_Components19].[ComponentID]
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies20]
    ON [TA_BillLast].[BillCurrencyID] = [TA_Currencies20].[CurrencyID]
  LEFT OUTER JOIN [TA_OOEReasons] AS [TA_OOEReasons21]
    ON [TA_BillLast].[OOEReasonID] = [TA_OOEReasons21].[ReasonID]
  LEFT OUTER JOIN [TA_PrjCalcMethod] AS [TA_PrjCalcMethod22]
    ON [TA_BillLast].[PrjCalcType] = [TA_PrjCalcMethod22].[ProjectCalcID]
  INNER JOIN [TA_TravelTypes] AS [TA_TravelTypes23]
    ON [TA_BillLast].[TravelTypeID] = [TA_TravelTypes23].[TravelTypeID]
  WHERE
  [TA_BillLast].[TABillNo] = @TABillNo
GO
