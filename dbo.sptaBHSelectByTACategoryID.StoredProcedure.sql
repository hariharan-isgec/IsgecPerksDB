USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sptaBHSelectByTACategoryID]
  @TACategoryID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  [TA_Bills].[TACategoryID] = @TACategoryID
  ORDER BY
     CASE @OrderBy WHEN 'TABillNo' THEN [TA_Bills].[TABillNo] END,
     CASE @OrderBy WHEN 'TABillNo DESC' THEN [TA_Bills].[TABillNo] END DESC,
     CASE @OrderBy WHEN 'TravelTypeID' THEN [TA_Bills].[TravelTypeID] END,
     CASE @OrderBy WHEN 'TravelTypeID DESC' THEN [TA_Bills].[TravelTypeID] END DESC,
     CASE @OrderBy WHEN 'CityOfOrigin' THEN [TA_Bills].[CityOfOrigin] END,
     CASE @OrderBy WHEN 'CityOfOrigin DESC' THEN [TA_Bills].[CityOfOrigin] END DESC,
     CASE @OrderBy WHEN 'DestinationCity' THEN [TA_Bills].[DestinationCity] END,
     CASE @OrderBy WHEN 'DestinationCity DESC' THEN [TA_Bills].[DestinationCity] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [TA_Bills].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TA_Bills].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'TrainingProgram' THEN [TA_Bills].[TrainingProgram] END,
     CASE @OrderBy WHEN 'TrainingProgram DESC' THEN [TA_Bills].[TrainingProgram] END DESC,
     CASE @OrderBy WHEN 'SameDayVisit' THEN [TA_Bills].[SameDayVisit] END,
     CASE @OrderBy WHEN 'SameDayVisit DESC' THEN [TA_Bills].[SameDayVisit] END DESC,
     CASE @OrderBy WHEN 'Within25KM' THEN [TA_Bills].[Within25KM] END,
     CASE @OrderBy WHEN 'Within25KM DESC' THEN [TA_Bills].[Within25KM] END DESC,
     CASE @OrderBy WHEN 'SiteToAnotherSite' THEN [TA_Bills].[SiteToAnotherSite] END,
     CASE @OrderBy WHEN 'SiteToAnotherSite DESC' THEN [TA_Bills].[SiteToAnotherSite] END DESC,
     CASE @OrderBy WHEN 'TaxiHired' THEN [TA_Bills].[TaxiHired] END,
     CASE @OrderBy WHEN 'TaxiHired DESC' THEN [TA_Bills].[TaxiHired] END DESC,
     CASE @OrderBy WHEN 'OwnVehicleUsed' THEN [TA_Bills].[OwnVehicleUsed] END,
     CASE @OrderBy WHEN 'OwnVehicleUsed DESC' THEN [TA_Bills].[OwnVehicleUsed] END DESC,
     CASE @OrderBy WHEN 'PurposeOfJourney' THEN [TA_Bills].[PurposeOfJourney] END,
     CASE @OrderBy WHEN 'PurposeOfJourney DESC' THEN [TA_Bills].[PurposeOfJourney] END DESC,
     CASE @OrderBy WHEN 'BriefTourReport' THEN [TA_Bills].[BriefTourReport] END,
     CASE @OrderBy WHEN 'BriefTourReport DESC' THEN [TA_Bills].[BriefTourReport] END DESC,
     CASE @OrderBy WHEN 'TotalClaimedAmount' THEN [TA_Bills].[TotalClaimedAmount] END,
     CASE @OrderBy WHEN 'TotalClaimedAmount DESC' THEN [TA_Bills].[TotalClaimedAmount] END DESC,
     CASE @OrderBy WHEN 'EmployeeID' THEN [TA_Bills].[EmployeeID] END,
     CASE @OrderBy WHEN 'EmployeeID DESC' THEN [TA_Bills].[EmployeeID] END DESC,
     CASE @OrderBy WHEN 'TACategoryID' THEN [TA_Bills].[TACategoryID] END,
     CASE @OrderBy WHEN 'TACategoryID DESC' THEN [TA_Bills].[TACategoryID] END DESC,
     CASE @OrderBy WHEN 'TotalPayableAmount' THEN [TA_Bills].[TotalPayableAmount] END,
     CASE @OrderBy WHEN 'TotalPayableAmount DESC' THEN [TA_Bills].[TotalPayableAmount] END DESC,
     CASE @OrderBy WHEN 'ApprovedBySAOn' THEN [TA_Bills].[ApprovedBySAOn] END,
     CASE @OrderBy WHEN 'ApprovedBySAOn DESC' THEN [TA_Bills].[ApprovedBySAOn] END DESC,
     CASE @OrderBy WHEN 'TotalPassedAmount' THEN [TA_Bills].[TotalPassedAmount] END,
     CASE @OrderBy WHEN 'TotalPassedAmount DESC' THEN [TA_Bills].[TotalPassedAmount] END DESC,
     CASE @OrderBy WHEN 'TotalFinancedAmount' THEN [TA_Bills].[TotalFinancedAmount] END,
     CASE @OrderBy WHEN 'TotalFinancedAmount DESC' THEN [TA_Bills].[TotalFinancedAmount] END DESC,
     CASE @OrderBy WHEN 'ApprovedByCC' THEN [TA_Bills].[ApprovedByCC] END,
     CASE @OrderBy WHEN 'ApprovedByCC DESC' THEN [TA_Bills].[ApprovedByCC] END DESC,
     CASE @OrderBy WHEN 'SanctionedDA' THEN [TA_Bills].[SanctionedDA] END,
     CASE @OrderBy WHEN 'SanctionedDA DESC' THEN [TA_Bills].[SanctionedDA] END DESC,
     CASE @OrderBy WHEN 'SanctionedLodging' THEN [TA_Bills].[SanctionedLodging] END,
     CASE @OrderBy WHEN 'SanctionedLodging DESC' THEN [TA_Bills].[SanctionedLodging] END DESC,
     CASE @OrderBy WHEN 'ApprovedBySA' THEN [TA_Bills].[ApprovedBySA] END,
     CASE @OrderBy WHEN 'ApprovedBySA DESC' THEN [TA_Bills].[ApprovedBySA] END DESC,
     CASE @OrderBy WHEN 'CostCenterID' THEN [TA_Bills].[CostCenterID] END,
     CASE @OrderBy WHEN 'CostCenterID DESC' THEN [TA_Bills].[CostCenterID] END DESC,
     CASE @OrderBy WHEN 'ApprovedOn' THEN [TA_Bills].[ApprovedOn] END,
     CASE @OrderBy WHEN 'ApprovedOn DESC' THEN [TA_Bills].[ApprovedOn] END DESC,
     CASE @OrderBy WHEN 'ApprovedByCCOn' THEN [TA_Bills].[ApprovedByCCOn] END,
     CASE @OrderBy WHEN 'ApprovedByCCOn DESC' THEN [TA_Bills].[ApprovedByCCOn] END DESC,
     CASE @OrderBy WHEN 'BillStatusID' THEN [TA_Bills].[BillStatusID] END,
     CASE @OrderBy WHEN 'BillStatusID DESC' THEN [TA_Bills].[BillStatusID] END DESC,
     CASE @OrderBy WHEN 'ApprovalWFTypeID' THEN [TA_Bills].[ApprovalWFTypeID] END,
     CASE @OrderBy WHEN 'ApprovalWFTypeID DESC' THEN [TA_Bills].[ApprovalWFTypeID] END DESC,
     CASE @OrderBy WHEN 'OOERemarks' THEN [TA_Bills].[OOERemarks] END,
     CASE @OrderBy WHEN 'OOERemarks DESC' THEN [TA_Bills].[OOERemarks] END DESC,
     CASE @OrderBy WHEN 'DepartmentID' THEN [TA_Bills].[DepartmentID] END,
     CASE @OrderBy WHEN 'DepartmentID DESC' THEN [TA_Bills].[DepartmentID] END DESC,
     CASE @OrderBy WHEN 'DesignationID' THEN [TA_Bills].[DesignationID] END,
     CASE @OrderBy WHEN 'DesignationID DESC' THEN [TA_Bills].[DesignationID] END DESC,
     CASE @OrderBy WHEN 'Contractual' THEN [TA_Bills].[Contractual] END,
     CASE @OrderBy WHEN 'Contractual DESC' THEN [TA_Bills].[Contractual] END DESC,
     CASE @OrderBy WHEN 'PrjCalcType' THEN [TA_Bills].[PrjCalcType] END,
     CASE @OrderBy WHEN 'PrjCalcType DESC' THEN [TA_Bills].[PrjCalcType] END DESC,
     CASE @OrderBy WHEN 'DivisionID' THEN [TA_Bills].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [TA_Bills].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'PostedBy' THEN [TA_Bills].[PostedBy] END,
     CASE @OrderBy WHEN 'PostedBy DESC' THEN [TA_Bills].[PostedBy] END DESC,
     CASE @OrderBy WHEN 'ComponentID' THEN [TA_Bills].[ComponentID] END,
     CASE @OrderBy WHEN 'ComponentID DESC' THEN [TA_Bills].[ComponentID] END DESC,
     CASE @OrderBy WHEN 'NonTechnical' THEN [TA_Bills].[NonTechnical] END,
     CASE @OrderBy WHEN 'NonTechnical DESC' THEN [TA_Bills].[NonTechnical] END DESC,
     CASE @OrderBy WHEN 'Setteled' THEN [TA_Bills].[Setteled] END,
     CASE @OrderBy WHEN 'Setteled DESC' THEN [TA_Bills].[Setteled] END DESC,
     CASE @OrderBy WHEN 'OOEReasonID' THEN [TA_Bills].[OOEReasonID] END,
     CASE @OrderBy WHEN 'OOEReasonID DESC' THEN [TA_Bills].[OOEReasonID] END DESC,
     CASE @OrderBy WHEN 'StartDateTime' THEN [TA_Bills].[StartDateTime] END,
     CASE @OrderBy WHEN 'StartDateTime DESC' THEN [TA_Bills].[StartDateTime] END DESC,
     CASE @OrderBy WHEN 'ApprovalAttached' THEN [TA_Bills].[ApprovalAttached] END,
     CASE @OrderBy WHEN 'ApprovalAttached DESC' THEN [TA_Bills].[ApprovalAttached] END DESC,
     CASE @OrderBy WHEN 'ERPDocumentNo' THEN [TA_Bills].[ERPDocumentNo] END,
     CASE @OrderBy WHEN 'ERPDocumentNo DESC' THEN [TA_Bills].[ERPDocumentNo] END DESC,
     CASE @OrderBy WHEN 'PostedOn' THEN [TA_Bills].[PostedOn] END,
     CASE @OrderBy WHEN 'PostedOn DESC' THEN [TA_Bills].[PostedOn] END DESC,
     CASE @OrderBy WHEN 'SARemarks' THEN [TA_Bills].[SARemarks] END,
     CASE @OrderBy WHEN 'SARemarks DESC' THEN [TA_Bills].[SARemarks] END DESC,
     CASE @OrderBy WHEN 'ReportAttached' THEN [TA_Bills].[ReportAttached] END,
     CASE @OrderBy WHEN 'ReportAttached DESC' THEN [TA_Bills].[ReportAttached] END DESC,
     CASE @OrderBy WHEN 'CalculationTypeID' THEN [TA_Bills].[CalculationTypeID] END,
     CASE @OrderBy WHEN 'CalculationTypeID DESC' THEN [TA_Bills].[CalculationTypeID] END DESC,
     CASE @OrderBy WHEN 'EndDateTime' THEN [TA_Bills].[EndDateTime] END,
     CASE @OrderBy WHEN 'EndDateTime DESC' THEN [TA_Bills].[EndDateTime] END DESC,
     CASE @OrderBy WHEN 'SanctionDiskFile' THEN [TA_Bills].[SanctionDiskFile] END,
     CASE @OrderBy WHEN 'SanctionDiskFile DESC' THEN [TA_Bills].[SanctionDiskFile] END DESC,
     CASE @OrderBy WHEN 'ApprovalDiskFile' THEN [TA_Bills].[ApprovalDiskFile] END,
     CASE @OrderBy WHEN 'ApprovalDiskFile DESC' THEN [TA_Bills].[ApprovalDiskFile] END DESC,
     CASE @OrderBy WHEN 'ReceivedOn' THEN [TA_Bills].[ReceivedOn] END,
     CASE @OrderBy WHEN 'ReceivedOn DESC' THEN [TA_Bills].[ReceivedOn] END DESC,
     CASE @OrderBy WHEN 'OOEByAccounts' THEN [TA_Bills].[OOEByAccounts] END,
     CASE @OrderBy WHEN 'OOEByAccounts DESC' THEN [TA_Bills].[OOEByAccounts] END DESC,
     CASE @OrderBy WHEN 'ERPBatchNo' THEN [TA_Bills].[ERPBatchNo] END,
     CASE @OrderBy WHEN 'ERPBatchNo DESC' THEN [TA_Bills].[ERPBatchNo] END DESC,
     CASE @OrderBy WHEN 'CCRemarks' THEN [TA_Bills].[CCRemarks] END,
     CASE @OrderBy WHEN 'CCRemarks DESC' THEN [TA_Bills].[CCRemarks] END DESC,
     CASE @OrderBy WHEN 'ApprovalFileName' THEN [TA_Bills].[ApprovalFileName] END,
     CASE @OrderBy WHEN 'ApprovalFileName DESC' THEN [TA_Bills].[ApprovalFileName] END DESC,
     CASE @OrderBy WHEN 'VerifiedBy' THEN [TA_Bills].[VerifiedBy] END,
     CASE @OrderBy WHEN 'VerifiedBy DESC' THEN [TA_Bills].[VerifiedBy] END DESC,
     CASE @OrderBy WHEN 'ReportFileName' THEN [TA_Bills].[ReportFileName] END,
     CASE @OrderBy WHEN 'ReportFileName DESC' THEN [TA_Bills].[ReportFileName] END DESC,
     CASE @OrderBy WHEN 'ReportDiskFile' THEN [TA_Bills].[ReportDiskFile] END,
     CASE @OrderBy WHEN 'ReportDiskFile DESC' THEN [TA_Bills].[ReportDiskFile] END DESC,
     CASE @OrderBy WHEN 'ApprovalRemarks' THEN [TA_Bills].[ApprovalRemarks] END,
     CASE @OrderBy WHEN 'ApprovalRemarks DESC' THEN [TA_Bills].[ApprovalRemarks] END DESC,
     CASE @OrderBy WHEN 'ApprovedBy' THEN [TA_Bills].[ApprovedBy] END,
     CASE @OrderBy WHEN 'ApprovedBy DESC' THEN [TA_Bills].[ApprovedBy] END DESC,
     CASE @OrderBy WHEN 'VerificationRemarks' THEN [TA_Bills].[VerificationRemarks] END,
     CASE @OrderBy WHEN 'VerificationRemarks DESC' THEN [TA_Bills].[VerificationRemarks] END DESC,
     CASE @OrderBy WHEN 'SanctionAttached' THEN [TA_Bills].[SanctionAttached] END,
     CASE @OrderBy WHEN 'SanctionAttached DESC' THEN [TA_Bills].[SanctionAttached] END DESC,
     CASE @OrderBy WHEN 'OOEBySystem' THEN [TA_Bills].[OOEBySystem] END,
     CASE @OrderBy WHEN 'OOEBySystem DESC' THEN [TA_Bills].[OOEBySystem] END DESC,
     CASE @OrderBy WHEN 'SanctionFileName' THEN [TA_Bills].[SanctionFileName] END,
     CASE @OrderBy WHEN 'SanctionFileName DESC' THEN [TA_Bills].[SanctionFileName] END DESC,
     CASE @OrderBy WHEN 'BillCurrencyID' THEN [TA_Bills].[BillCurrencyID] END,
     CASE @OrderBy WHEN 'BillCurrencyID DESC' THEN [TA_Bills].[BillCurrencyID] END DESC,
     CASE @OrderBy WHEN 'CompanyID' THEN [TA_Bills].[CompanyID] END,
     CASE @OrderBy WHEN 'CompanyID DESC' THEN [TA_Bills].[CompanyID] END DESC,
     CASE @OrderBy WHEN 'ForwardedOn' THEN [TA_Bills].[ForwardedOn] END,
     CASE @OrderBy WHEN 'ForwardedOn DESC' THEN [TA_Bills].[ForwardedOn] END DESC,
     CASE @OrderBy WHEN 'VerifiedOn' THEN [TA_Bills].[VerifiedOn] END,
     CASE @OrderBy WHEN 'VerifiedOn DESC' THEN [TA_Bills].[VerifiedOn] END DESC,
     CASE @OrderBy WHEN 'ConversionFactorINR' THEN [TA_Bills].[ConversionFactorINR] END,
     CASE @OrderBy WHEN 'ConversionFactorINR DESC' THEN [TA_Bills].[ConversionFactorINR] END DESC,
     CASE @OrderBy WHEN 'HRM_Companies1_Description' THEN [HRM_Companies1].[Description] END,
     CASE @OrderBy WHEN 'HRM_Companies1_Description DESC' THEN [HRM_Companies1].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Departments2_Description' THEN [HRM_Departments2].[Description] END,
     CASE @OrderBy WHEN 'HRM_Departments2_Description DESC' THEN [HRM_Departments2].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Designations3_Description' THEN [HRM_Designations3].[Description] END,
     CASE @OrderBy WHEN 'HRM_Designations3_Description DESC' THEN [HRM_Designations3].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description' THEN [HRM_Divisions4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description DESC' THEN [HRM_Divisions4].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees5_EmployeeName' THEN [HRM_Employees5].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees5_EmployeeName DESC' THEN [HRM_Employees5].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees6_EmployeeName' THEN [HRM_Employees6].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees6_EmployeeName DESC' THEN [HRM_Employees6].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees7_EmployeeName' THEN [HRM_Employees7].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees7_EmployeeName DESC' THEN [HRM_Employees7].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees8_EmployeeName' THEN [HRM_Employees8].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees8_EmployeeName DESC' THEN [HRM_Employees8].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees9_EmployeeName' THEN [HRM_Employees9].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees9_EmployeeName DESC' THEN [HRM_Employees9].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees10_EmployeeName' THEN [HRM_Employees10].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees10_EmployeeName DESC' THEN [HRM_Employees10].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects11_Description' THEN [IDM_Projects11].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects11_Description DESC' THEN [IDM_Projects11].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_ApprovalWFTypes12_WFTypeDescription' THEN [TA_ApprovalWFTypes12].[WFTypeDescription] END,
     CASE @OrderBy WHEN 'TA_ApprovalWFTypes12_WFTypeDescription DESC' THEN [TA_ApprovalWFTypes12].[WFTypeDescription] END DESC,
     CASE @OrderBy WHEN 'TA_Cities14_CityName' THEN [TA_Cities14].[CityName] END,
     CASE @OrderBy WHEN 'TA_Cities14_CityName DESC' THEN [TA_Cities14].[CityName] END DESC,
     CASE @OrderBy WHEN 'TA_Currencies15_CurrencyName' THEN [TA_Currencies15].[CurrencyName] END,
     CASE @OrderBy WHEN 'TA_Currencies15_CurrencyName DESC' THEN [TA_Currencies15].[CurrencyName] END DESC,
     CASE @OrderBy WHEN 'TA_BillStates16_Description' THEN [TA_BillStates16].[Description] END,
     CASE @OrderBy WHEN 'TA_BillStates16_Description DESC' THEN [TA_BillStates16].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_TravelTypes17_TravelTypeDescription' THEN [TA_TravelTypes17].[TravelTypeDescription] END,
     CASE @OrderBy WHEN 'TA_TravelTypes17_TravelTypeDescription DESC' THEN [TA_TravelTypes17].[TravelTypeDescription] END DESC,
     CASE @OrderBy WHEN 'TA_OOEReasons18_Description' THEN [TA_OOEReasons18].[Description] END,
     CASE @OrderBy WHEN 'TA_OOEReasons18_Description DESC' THEN [TA_OOEReasons18].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Departments1_Description' THEN [HRM_Departments1].[Description] END,
     CASE @OrderBy WHEN 'HRM_Departments1_Description DESC' THEN [HRM_Departments1].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_Components2_Description' THEN [TA_Components2].[Description] END,
     CASE @OrderBy WHEN 'TA_Components2_Description DESC' THEN [TA_Components2].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_CalcMethod1_CalculationDescription' THEN [TA_CalcMethod1].[CalculationDescription] END,
     CASE @OrderBy WHEN 'TA_CalcMethod1_CalculationDescription DESC' THEN [TA_CalcMethod1].[CalculationDescription] END DESC,
     CASE @OrderBy WHEN 'TA_PrjCalcMethod1_Description' THEN [TA_PrjCalcMethod1].[Description] END,
     CASE @OrderBy WHEN 'TA_PrjCalcMethod1_Description DESC' THEN [TA_PrjCalcMethod1].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_Cities1_CityName' THEN [TA_Cities1].[CityName] END,
     CASE @OrderBy WHEN 'TA_Cities1_CityName DESC' THEN [TA_Cities1].[CityName] END DESC 
  SET @RecordCount = @@RowCount
GO
