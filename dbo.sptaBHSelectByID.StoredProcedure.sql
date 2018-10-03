USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sptaBHSelectByID]
  @LoginID NVarChar(8),
  @TABillNo Int 
  AS
  SELECT
    [TA_Bills].* ,
    [HRM_Companies1].[Description] AS HRM_Companies1_Description,
    [HRM_Departments2].[Description] AS HRM_Departments2_Description,
    [HRM_Designations3].[Description] AS HRM_Designations3_Description,
    [HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
    [HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName,
    [HRM_Employees6].[EmployeeName] AS HRM_Employees6_EmployeeName,
    [HRM_Employees7].[EmployeeName] AS HRM_Employees7_EmployeeName,
    [HRM_Employees8].[EmployeeName] AS HRM_Employees8_EmployeeName,
    [HRM_Employees9].[EmployeeName] AS HRM_Employees9_EmployeeName,
    [HRM_Employees10].[EmployeeName] AS HRM_Employees10_EmployeeName,
    [IDM_Projects11].[Description] AS IDM_Projects11_Description,
    [TA_ApprovalWFTypes12].[WFTypeDescription] AS TA_ApprovalWFTypes12_WFTypeDescription,
    [TA_Categories13].[cmba] AS TA_Categories13_cmba,
    [TA_Cities14].[CityName] AS TA_Cities14_CityName,
    [TA_Currencies15].[CurrencyName] AS TA_Currencies15_CurrencyName,
    [TA_BillStates16].[Description] AS TA_BillStates16_Description,
    [TA_TravelTypes17].[TravelTypeDescription] AS TA_TravelTypes17_TravelTypeDescription,
    [TA_OOEReasons18].[Description] AS TA_OOEReasons18_Description,
    [HRM_Departments1].[Description] AS HRM_Departments1_Description,
    [TA_Components2].[Description] AS TA_Components2_Description,
    [TA_CalcMethod1].[CalculationDescription] AS TA_CalcMethod1_CalculationDescription,
    [TA_PrjCalcMethod1].[Description] AS TA_PrjCalcMethod1_Description,
    [TA_Cities1].[CityName] AS TA_Cities1_CityName 
  FROM [TA_Bills] 
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies1]
    ON [TA_Bills].[CompanyID] = [HRM_Companies1].[CompanyID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments2]
    ON [TA_Bills].[DepartmentID] = [HRM_Departments2].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations3]
    ON [TA_Bills].[DesignationID] = [HRM_Designations3].[DesignationID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [TA_Bills].[DivisionID] = [HRM_Divisions4].[DivisionID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [TA_Bills].[EmployeeID] = [HRM_Employees5].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]
    ON [TA_Bills].[PostedBy] = [HRM_Employees6].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]
    ON [TA_Bills].[ApprovedBy] = [HRM_Employees7].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees8]
    ON [TA_Bills].[ApprovedByCC] = [HRM_Employees8].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees9]
    ON [TA_Bills].[ApprovedBySA] = [HRM_Employees9].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees10]
    ON [TA_Bills].[VerifiedBy] = [HRM_Employees10].[CardNo]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects11]
    ON [TA_Bills].[ProjectID] = [IDM_Projects11].[ProjectID]
  LEFT OUTER JOIN [TA_ApprovalWFTypes] AS [TA_ApprovalWFTypes12]
    ON [TA_Bills].[ApprovalWFTypeID] = [TA_ApprovalWFTypes12].[WFTypeID]
  LEFT OUTER JOIN [TA_Categories] AS [TA_Categories13]
    ON [TA_Bills].[TACategoryID] = [TA_Categories13].[CategoryID]
  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities14]
    ON [TA_Bills].[DestinationCity] = [TA_Cities14].[CityID]
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies15]
    ON [TA_Bills].[BillCurrencyID] = [TA_Currencies15].[CurrencyID]
  INNER JOIN [TA_BillStates] AS [TA_BillStates16]
    ON [TA_Bills].[BillStatusID] = [TA_BillStates16].[BillStatusID]
  INNER JOIN [TA_TravelTypes] AS [TA_TravelTypes17]
    ON [TA_Bills].[TravelTypeID] = [TA_TravelTypes17].[TravelTypeID]
  LEFT OUTER JOIN [TA_OOEReasons] AS [TA_OOEReasons18]
    ON [TA_Bills].[OOEReasonID] = [TA_OOEReasons18].[ReasonID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments1]
    ON [TA_Bills].[CostCenterID] = [HRM_Departments1].[DepartmentID]
  LEFT OUTER JOIN [TA_Components] AS [TA_Components2]
    ON [TA_Bills].[ComponentID] = [TA_Components2].[ComponentID]
  LEFT OUTER JOIN [TA_CalcMethod] AS [TA_CalcMethod1]
    ON [TA_Bills].[CalculationTypeID] = [TA_CalcMethod1].[CalculationTypeID]
  LEFT OUTER JOIN [TA_PrjCalcMethod] AS [TA_PrjCalcMethod1]
    ON [TA_Bills].[PrjCalcType] = [TA_PrjCalcMethod1].[ProjectCalcID]
  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities1]
    ON [TA_Bills].[CityOfOrigin] = [TA_Cities1].[CityID]
  WHERE
  [TA_Bills].[TABillNo] = @TABillNo
GO
