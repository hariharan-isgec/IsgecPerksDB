USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillApprovalByMDSelectListFilteres]
  @Filter_TABillNo Int,
  @Filter_TravelTypeID Int,
  @Filter_DestinationCity NVarChar(30),
  @Filter_ProjectID NVarChar(6),
  @Filter_EmployeeID NVarChar(8),
  @Filter_BillStatusID Int,
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
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TABillNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_Bills].[TABillNo]'
  SET @LGSQL = @LGSQL + ' FROM [TA_Bills] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies1]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[CompanyID] = [HRM_Companies1].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments2]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[DepartmentID] = [HRM_Departments2].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations3]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[DesignationID] = [HRM_Designations3].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[DivisionID] = [HRM_Divisions4].[DivisionID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees5]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[EmployeeID] = [HRM_Employees5].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[PostedBy] = [HRM_Employees6].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[ApprovedBy] = [HRM_Employees7].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees8]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[ApprovedByCC] = [HRM_Employees8].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees9]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[ApprovedBySA] = [HRM_Employees9].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees10]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[VerifiedBy] = [HRM_Employees10].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects11]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[ProjectID] = [IDM_Projects11].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_ApprovalWFTypes] AS [TA_ApprovalWFTypes12]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[ApprovalWFTypeID] = [TA_ApprovalWFTypes12].[WFTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Categories] AS [TA_Categories13]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[TACategoryID] = [TA_Categories13].[CategoryID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities14]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[DestinationCity] = [TA_Cities14].[CityID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies15]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[BillCurrencyID] = [TA_Currencies15].[CurrencyID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_BillStates] AS [TA_BillStates16]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[BillStatusID] = [TA_BillStates16].[BillStatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_TravelTypes] AS [TA_TravelTypes17]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[TravelTypeID] = [TA_TravelTypes17].[TravelTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_OOEReasons] AS [TA_OOEReasons18]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[OOEReasonID] = [TA_OOEReasons18].[ReasonID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments1]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[CostCenterID] = [HRM_Departments1].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Components] AS [TA_Components2]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[ComponentID] = [TA_Components2].[ComponentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_CalcMethod] AS [TA_CalcMethod1]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[CalculationTypeID] = [TA_CalcMethod1].[CalculationTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_PrjCalcMethod] AS [TA_PrjCalcMethod1]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[PrjCalcType] = [TA_PrjCalcMethod1].[ProjectCalcID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities1]'
  SET @LGSQL = @LGSQL + '    ON [TA_Bills].[CityOfOrigin] = [TA_Cities1].[CityID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_TABillNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [TA_Bills].[TABillNo] = ' + STR(@Filter_TABillNo)
  IF (@Filter_TravelTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TA_Bills].[TravelTypeID] = ' + STR(@Filter_TravelTypeID)
  IF (@Filter_DestinationCity > '') 
    SET @LGSQL = @LGSQL + ' AND [TA_Bills].[DestinationCity] = ''' + @Filter_DestinationCity + ''''
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [TA_Bills].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_EmployeeID > '') 
    SET @LGSQL = @LGSQL + ' AND [TA_Bills].[EmployeeID] = ''' + @Filter_EmployeeID + ''''
  IF (@Filter_BillStatusID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TA_Bills].[BillStatusID] = ' + STR(@Filter_BillStatusID)
  ELSE
    SET @LGSQL = @LGSQL + ' AND [TA_Bills].[ApprovedBySA] = ''' + @LoginID + ''''   
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TABillNo' THEN '[TA_Bills].[TABillNo]'
                        WHEN 'TABillNo DESC' THEN '[TA_Bills].[TABillNo] DESC'
                        WHEN 'TravelTypeID' THEN '[TA_Bills].[TravelTypeID]'
                        WHEN 'TravelTypeID DESC' THEN '[TA_Bills].[TravelTypeID] DESC'
                        WHEN 'CityOfOrigin' THEN '[TA_Bills].[CityOfOrigin]'
                        WHEN 'CityOfOrigin DESC' THEN '[TA_Bills].[CityOfOrigin] DESC'
                        WHEN 'DestinationCity' THEN '[TA_Bills].[DestinationCity]'
                        WHEN 'DestinationCity DESC' THEN '[TA_Bills].[DestinationCity] DESC'
                        WHEN 'ProjectID' THEN '[TA_Bills].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[TA_Bills].[ProjectID] DESC'
                        WHEN 'TrainingProgram' THEN '[TA_Bills].[TrainingProgram]'
                        WHEN 'TrainingProgram DESC' THEN '[TA_Bills].[TrainingProgram] DESC'
                        WHEN 'SameDayVisit' THEN '[TA_Bills].[SameDayVisit]'
                        WHEN 'SameDayVisit DESC' THEN '[TA_Bills].[SameDayVisit] DESC'
                        WHEN 'Within25KM' THEN '[TA_Bills].[Within25KM]'
                        WHEN 'Within25KM DESC' THEN '[TA_Bills].[Within25KM] DESC'
                        WHEN 'SiteToAnotherSite' THEN '[TA_Bills].[SiteToAnotherSite]'
                        WHEN 'SiteToAnotherSite DESC' THEN '[TA_Bills].[SiteToAnotherSite] DESC'
                        WHEN 'TaxiHired' THEN '[TA_Bills].[TaxiHired]'
                        WHEN 'TaxiHired DESC' THEN '[TA_Bills].[TaxiHired] DESC'
                        WHEN 'OwnVehicleUsed' THEN '[TA_Bills].[OwnVehicleUsed]'
                        WHEN 'OwnVehicleUsed DESC' THEN '[TA_Bills].[OwnVehicleUsed] DESC'
                        WHEN 'PurposeOfJourney' THEN '[TA_Bills].[PurposeOfJourney]'
                        WHEN 'PurposeOfJourney DESC' THEN '[TA_Bills].[PurposeOfJourney] DESC'
                        WHEN 'BriefTourReport' THEN '[TA_Bills].[BriefTourReport]'
                        WHEN 'BriefTourReport DESC' THEN '[TA_Bills].[BriefTourReport] DESC'
                        WHEN 'ApprovedBySA' THEN '[TA_Bills].[ApprovedBySA]'
                        WHEN 'ApprovedBySA DESC' THEN '[TA_Bills].[ApprovedBySA] DESC'
                        WHEN 'ApprovedBySAOn' THEN '[TA_Bills].[ApprovedBySAOn]'
                        WHEN 'ApprovedBySAOn DESC' THEN '[TA_Bills].[ApprovedBySAOn] DESC'
                        WHEN 'TotalFinancedAmount' THEN '[TA_Bills].[TotalFinancedAmount]'
                        WHEN 'TotalFinancedAmount DESC' THEN '[TA_Bills].[TotalFinancedAmount] DESC'
                        WHEN 'SanctionDiskFile' THEN '[TA_Bills].[SanctionDiskFile]'
                        WHEN 'SanctionDiskFile DESC' THEN '[TA_Bills].[SanctionDiskFile] DESC'
                        WHEN 'BillCurrencyID' THEN '[TA_Bills].[BillCurrencyID]'
                        WHEN 'BillCurrencyID DESC' THEN '[TA_Bills].[BillCurrencyID] DESC'
                        WHEN 'ApprovalWFTypeID' THEN '[TA_Bills].[ApprovalWFTypeID]'
                        WHEN 'ApprovalWFTypeID DESC' THEN '[TA_Bills].[ApprovalWFTypeID] DESC'
                        WHEN 'SanctionAttached' THEN '[TA_Bills].[SanctionAttached]'
                        WHEN 'SanctionAttached DESC' THEN '[TA_Bills].[SanctionAttached] DESC'
                        WHEN 'OOEByAccounts' THEN '[TA_Bills].[OOEByAccounts]'
                        WHEN 'OOEByAccounts DESC' THEN '[TA_Bills].[OOEByAccounts] DESC'
                        WHEN 'DivisionID' THEN '[TA_Bills].[DivisionID]'
                        WHEN 'DivisionID DESC' THEN '[TA_Bills].[DivisionID] DESC'
                        WHEN 'PostedOn' THEN '[TA_Bills].[PostedOn]'
                        WHEN 'PostedOn DESC' THEN '[TA_Bills].[PostedOn] DESC'
                        WHEN 'ApprovalDiskFile' THEN '[TA_Bills].[ApprovalDiskFile]'
                        WHEN 'ApprovalDiskFile DESC' THEN '[TA_Bills].[ApprovalDiskFile] DESC'
                        WHEN 'DesignationID' THEN '[TA_Bills].[DesignationID]'
                        WHEN 'DesignationID DESC' THEN '[TA_Bills].[DesignationID] DESC'
                        WHEN 'SanctionedDA' THEN '[TA_Bills].[SanctionedDA]'
                        WHEN 'SanctionedDA DESC' THEN '[TA_Bills].[SanctionedDA] DESC'
                        WHEN 'ReportAttached' THEN '[TA_Bills].[ReportAttached]'
                        WHEN 'ReportAttached DESC' THEN '[TA_Bills].[ReportAttached] DESC'
                        WHEN 'ERPBatchNo' THEN '[TA_Bills].[ERPBatchNo]'
                        WHEN 'ERPBatchNo DESC' THEN '[TA_Bills].[ERPBatchNo] DESC'
                        WHEN 'Setteled' THEN '[TA_Bills].[Setteled]'
                        WHEN 'Setteled DESC' THEN '[TA_Bills].[Setteled] DESC'
                        WHEN 'SanctionFileName' THEN '[TA_Bills].[SanctionFileName]'
                        WHEN 'SanctionFileName DESC' THEN '[TA_Bills].[SanctionFileName] DESC'
                        WHEN 'CostCenterID' THEN '[TA_Bills].[CostCenterID]'
                        WHEN 'CostCenterID DESC' THEN '[TA_Bills].[CostCenterID] DESC'
                        WHEN 'CalculationTypeID' THEN '[TA_Bills].[CalculationTypeID]'
                        WHEN 'CalculationTypeID DESC' THEN '[TA_Bills].[CalculationTypeID] DESC'
                        WHEN 'ApprovalAttached' THEN '[TA_Bills].[ApprovalAttached]'
                        WHEN 'ApprovalAttached DESC' THEN '[TA_Bills].[ApprovalAttached] DESC'
                        WHEN 'TotalPassedAmount' THEN '[TA_Bills].[TotalPassedAmount]'
                        WHEN 'TotalPassedAmount DESC' THEN '[TA_Bills].[TotalPassedAmount] DESC'
                        WHEN 'ERPDocumentNo' THEN '[TA_Bills].[ERPDocumentNo]'
                        WHEN 'ERPDocumentNo DESC' THEN '[TA_Bills].[ERPDocumentNo] DESC'
                        WHEN 'ReportDiskFile' THEN '[TA_Bills].[ReportDiskFile]'
                        WHEN 'ReportDiskFile DESC' THEN '[TA_Bills].[ReportDiskFile] DESC'
                        WHEN 'SanctionedLodging' THEN '[TA_Bills].[SanctionedLodging]'
                        WHEN 'SanctionedLodging DESC' THEN '[TA_Bills].[SanctionedLodging] DESC'
                        WHEN 'VerifiedOn' THEN '[TA_Bills].[VerifiedOn]'
                        WHEN 'VerifiedOn DESC' THEN '[TA_Bills].[VerifiedOn] DESC'
                        WHEN 'ComponentID' THEN '[TA_Bills].[ComponentID]'
                        WHEN 'ComponentID DESC' THEN '[TA_Bills].[ComponentID] DESC'
                        WHEN 'CompanyID' THEN '[TA_Bills].[CompanyID]'
                        WHEN 'CompanyID DESC' THEN '[TA_Bills].[CompanyID] DESC'
                        WHEN 'ApprovedByCC' THEN '[TA_Bills].[ApprovedByCC]'
                        WHEN 'ApprovedByCC DESC' THEN '[TA_Bills].[ApprovedByCC] DESC'
                        WHEN 'ApprovalRemarks' THEN '[TA_Bills].[ApprovalRemarks]'
                        WHEN 'ApprovalRemarks DESC' THEN '[TA_Bills].[ApprovalRemarks] DESC'
                        WHEN 'ApprovedOn' THEN '[TA_Bills].[ApprovedOn]'
                        WHEN 'ApprovedOn DESC' THEN '[TA_Bills].[ApprovedOn] DESC'
                        WHEN 'ApprovedByCCOn' THEN '[TA_Bills].[ApprovedByCCOn]'
                        WHEN 'ApprovedByCCOn DESC' THEN '[TA_Bills].[ApprovedByCCOn] DESC'
                        WHEN 'VerifiedBy' THEN '[TA_Bills].[VerifiedBy]'
                        WHEN 'VerifiedBy DESC' THEN '[TA_Bills].[VerifiedBy] DESC'
                        WHEN 'PostedBy' THEN '[TA_Bills].[PostedBy]'
                        WHEN 'PostedBy DESC' THEN '[TA_Bills].[PostedBy] DESC'
                        WHEN 'CCRemarks' THEN '[TA_Bills].[CCRemarks]'
                        WHEN 'CCRemarks DESC' THEN '[TA_Bills].[CCRemarks] DESC'
                        WHEN 'TotalPayableAmount' THEN '[TA_Bills].[TotalPayableAmount]'
                        WHEN 'TotalPayableAmount DESC' THEN '[TA_Bills].[TotalPayableAmount] DESC'
                        WHEN 'TotalClaimedAmount' THEN '[TA_Bills].[TotalClaimedAmount]'
                        WHEN 'TotalClaimedAmount DESC' THEN '[TA_Bills].[TotalClaimedAmount] DESC'
                        WHEN 'EmployeeID' THEN '[TA_Bills].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[TA_Bills].[EmployeeID] DESC'
                        WHEN 'BillStatusID' THEN '[TA_Bills].[BillStatusID]'
                        WHEN 'BillStatusID DESC' THEN '[TA_Bills].[BillStatusID] DESC'
                        WHEN 'ApprovedBy' THEN '[TA_Bills].[ApprovedBy]'
                        WHEN 'ApprovedBy DESC' THEN '[TA_Bills].[ApprovedBy] DESC'
                        WHEN 'SARemarks' THEN '[TA_Bills].[SARemarks]'
                        WHEN 'SARemarks DESC' THEN '[TA_Bills].[SARemarks] DESC'
                        WHEN 'OOERemarks' THEN '[TA_Bills].[OOERemarks]'
                        WHEN 'OOERemarks DESC' THEN '[TA_Bills].[OOERemarks] DESC'
                        WHEN 'NonTechnical' THEN '[TA_Bills].[NonTechnical]'
                        WHEN 'NonTechnical DESC' THEN '[TA_Bills].[NonTechnical] DESC'
                        WHEN 'OOEReasonID' THEN '[TA_Bills].[OOEReasonID]'
                        WHEN 'OOEReasonID DESC' THEN '[TA_Bills].[OOEReasonID] DESC'
                        WHEN 'TACategoryID' THEN '[TA_Bills].[TACategoryID]'
                        WHEN 'TACategoryID DESC' THEN '[TA_Bills].[TACategoryID] DESC'
                        WHEN 'ApprovalFileName' THEN '[TA_Bills].[ApprovalFileName]'
                        WHEN 'ApprovalFileName DESC' THEN '[TA_Bills].[ApprovalFileName] DESC'
                        WHEN 'VerificationRemarks' THEN '[TA_Bills].[VerificationRemarks]'
                        WHEN 'VerificationRemarks DESC' THEN '[TA_Bills].[VerificationRemarks] DESC'
                        WHEN 'PrjCalcType' THEN '[TA_Bills].[PrjCalcType]'
                        WHEN 'PrjCalcType DESC' THEN '[TA_Bills].[PrjCalcType] DESC'
                        WHEN 'StartDateTime' THEN '[TA_Bills].[StartDateTime]'
                        WHEN 'StartDateTime DESC' THEN '[TA_Bills].[StartDateTime] DESC'
                        WHEN 'ReceivedOn' THEN '[TA_Bills].[ReceivedOn]'
                        WHEN 'ReceivedOn DESC' THEN '[TA_Bills].[ReceivedOn] DESC'
                        WHEN 'DepartmentID' THEN '[TA_Bills].[DepartmentID]'
                        WHEN 'DepartmentID DESC' THEN '[TA_Bills].[DepartmentID] DESC'
                        WHEN 'OOEBySystem' THEN '[TA_Bills].[OOEBySystem]'
                        WHEN 'OOEBySystem DESC' THEN '[TA_Bills].[OOEBySystem] DESC'
                        WHEN 'ForwardedOn' THEN '[TA_Bills].[ForwardedOn]'
                        WHEN 'ForwardedOn DESC' THEN '[TA_Bills].[ForwardedOn] DESC'
                        WHEN 'ReportFileName' THEN '[TA_Bills].[ReportFileName]'
                        WHEN 'ReportFileName DESC' THEN '[TA_Bills].[ReportFileName] DESC'
                        WHEN 'EndDateTime' THEN '[TA_Bills].[EndDateTime]'
                        WHEN 'EndDateTime DESC' THEN '[TA_Bills].[EndDateTime] DESC'
                        WHEN 'ConversionFactorINR' THEN '[TA_Bills].[ConversionFactorINR]'
                        WHEN 'ConversionFactorINR DESC' THEN '[TA_Bills].[ConversionFactorINR] DESC'
                        WHEN 'Contractual' THEN '[TA_Bills].[Contractual]'
                        WHEN 'Contractual DESC' THEN '[TA_Bills].[Contractual] DESC'
                        WHEN 'HRM_Companies1_Description' THEN '[HRM_Companies1].[Description]'
                        WHEN 'HRM_Companies1_Description DESC' THEN '[HRM_Companies1].[Description] DESC'
                        WHEN 'HRM_Departments2_Description' THEN '[HRM_Departments2].[Description]'
                        WHEN 'HRM_Departments2_Description DESC' THEN '[HRM_Departments2].[Description] DESC'
                        WHEN 'HRM_Designations3_Description' THEN '[HRM_Designations3].[Description]'
                        WHEN 'HRM_Designations3_Description DESC' THEN '[HRM_Designations3].[Description] DESC'
                        WHEN 'HRM_Divisions4_Description' THEN '[HRM_Divisions4].[Description]'
                        WHEN 'HRM_Divisions4_Description DESC' THEN '[HRM_Divisions4].[Description] DESC'
                        WHEN 'HRM_Employees5_EmployeeName' THEN '[HRM_Employees5].[EmployeeName]'
                        WHEN 'HRM_Employees5_EmployeeName DESC' THEN '[HRM_Employees5].[EmployeeName] DESC'
                        WHEN 'HRM_Employees6_EmployeeName' THEN '[HRM_Employees6].[EmployeeName]'
                        WHEN 'HRM_Employees6_EmployeeName DESC' THEN '[HRM_Employees6].[EmployeeName] DESC'
                        WHEN 'HRM_Employees7_EmployeeName' THEN '[HRM_Employees7].[EmployeeName]'
                        WHEN 'HRM_Employees7_EmployeeName DESC' THEN '[HRM_Employees7].[EmployeeName] DESC'
                        WHEN 'HRM_Employees8_EmployeeName' THEN '[HRM_Employees8].[EmployeeName]'
                        WHEN 'HRM_Employees8_EmployeeName DESC' THEN '[HRM_Employees8].[EmployeeName] DESC'
                        WHEN 'HRM_Employees9_EmployeeName' THEN '[HRM_Employees9].[EmployeeName]'
                        WHEN 'HRM_Employees9_EmployeeName DESC' THEN '[HRM_Employees9].[EmployeeName] DESC'
                        WHEN 'HRM_Employees10_EmployeeName' THEN '[HRM_Employees10].[EmployeeName]'
                        WHEN 'HRM_Employees10_EmployeeName DESC' THEN '[HRM_Employees10].[EmployeeName] DESC'
                        WHEN 'IDM_Projects11_Description' THEN '[IDM_Projects11].[Description]'
                        WHEN 'IDM_Projects11_Description DESC' THEN '[IDM_Projects11].[Description] DESC'
                        WHEN 'TA_ApprovalWFTypes12_WFTypeDescription' THEN '[TA_ApprovalWFTypes12].[WFTypeDescription]'
                        WHEN 'TA_ApprovalWFTypes12_WFTypeDescription DESC' THEN '[TA_ApprovalWFTypes12].[WFTypeDescription] DESC'
                        WHEN 'TA_Cities14_CityName' THEN '[TA_Cities14].[CityName]'
                        WHEN 'TA_Cities14_CityName DESC' THEN '[TA_Cities14].[CityName] DESC'
                        WHEN 'TA_Currencies15_CurrencyName' THEN '[TA_Currencies15].[CurrencyName]'
                        WHEN 'TA_Currencies15_CurrencyName DESC' THEN '[TA_Currencies15].[CurrencyName] DESC'
                        WHEN 'TA_BillStates16_Description' THEN '[TA_BillStates16].[Description]'
                        WHEN 'TA_BillStates16_Description DESC' THEN '[TA_BillStates16].[Description] DESC'
                        WHEN 'TA_TravelTypes17_TravelTypeDescription' THEN '[TA_TravelTypes17].[TravelTypeDescription]'
                        WHEN 'TA_TravelTypes17_TravelTypeDescription DESC' THEN '[TA_TravelTypes17].[TravelTypeDescription] DESC'
                        WHEN 'TA_OOEReasons18_Description' THEN '[TA_OOEReasons18].[Description]'
                        WHEN 'TA_OOEReasons18_Description DESC' THEN '[TA_OOEReasons18].[Description] DESC'
                        WHEN 'HRM_Departments1_Description' THEN '[HRM_Departments1].[Description]'
                        WHEN 'HRM_Departments1_Description DESC' THEN '[HRM_Departments1].[Description] DESC'
                        WHEN 'TA_Components2_Description' THEN '[TA_Components2].[Description]'
                        WHEN 'TA_Components2_Description DESC' THEN '[TA_Components2].[Description] DESC'
                        WHEN 'TA_CalcMethod1_CalculationDescription' THEN '[TA_CalcMethod1].[CalculationDescription]'
                        WHEN 'TA_CalcMethod1_CalculationDescription DESC' THEN '[TA_CalcMethod1].[CalculationDescription] DESC'
                        WHEN 'TA_PrjCalcMethod1_Description' THEN '[TA_PrjCalcMethod1].[Description]'
                        WHEN 'TA_PrjCalcMethod1_Description DESC' THEN '[TA_PrjCalcMethod1].[Description] DESC'
                        WHEN 'TA_Cities1_CityName' THEN '[TA_Cities1].[CityName]'
                        WHEN 'TA_Cities1_CityName DESC' THEN '[TA_Cities1].[CityName] DESC'
                        ELSE '[TA_Bills].[TABillNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_Bills].[TABillNo] ,
		[TA_Bills].[TravelTypeID] ,
		[TA_Bills].[CityOfOrigin] ,
		[TA_Bills].[DestinationCity] ,
		[TA_Bills].[ProjectID] ,
		[TA_Bills].[TrainingProgram] ,
		[TA_Bills].[SameDayVisit] ,
		[TA_Bills].[Within25KM] ,
		[TA_Bills].[SiteToAnotherSite] ,
		[TA_Bills].[TaxiHired] ,
		[TA_Bills].[OwnVehicleUsed] ,
		[TA_Bills].[PurposeOfJourney] ,
		[TA_Bills].[BriefTourReport] ,
		[TA_Bills].[ApprovedBySA] ,
		[TA_Bills].[ApprovedBySAOn] ,
		[TA_Bills].[TotalFinancedAmount] ,
		[TA_Bills].[SanctionDiskFile] ,
		[TA_Bills].[BillCurrencyID] ,
		[TA_Bills].[ApprovalWFTypeID] ,
		[TA_Bills].[SanctionAttached] ,
		[TA_Bills].[OOEByAccounts] ,
		[TA_Bills].[DivisionID] ,
		[TA_Bills].[PostedOn] ,
		[TA_Bills].[ApprovalDiskFile] ,
		[TA_Bills].[DesignationID] ,
		[TA_Bills].[SanctionedDA] ,
		[TA_Bills].[ReportAttached] ,
		[TA_Bills].[ERPBatchNo] ,
		[TA_Bills].[Setteled] ,
		[TA_Bills].[SanctionFileName] ,
		[TA_Bills].[CostCenterID] ,
		[TA_Bills].[CalculationTypeID] ,
		[TA_Bills].[ApprovalAttached] ,
		[TA_Bills].[TotalPassedAmount] ,
		[TA_Bills].[ERPDocumentNo] ,
		[TA_Bills].[ReportDiskFile] ,
		[TA_Bills].[SanctionedLodging] ,
		[TA_Bills].[VerifiedOn] ,
		[TA_Bills].[ComponentID] ,
		[TA_Bills].[CompanyID] ,
		[TA_Bills].[ApprovedByCC] ,
		[TA_Bills].[ApprovalRemarks] ,
		[TA_Bills].[ApprovedOn] ,
		[TA_Bills].[ApprovedByCCOn] ,
		[TA_Bills].[VerifiedBy] ,
		[TA_Bills].[PostedBy] ,
		[TA_Bills].[CCRemarks] ,
		[TA_Bills].[TotalPayableAmount] ,
		[TA_Bills].[TotalClaimedAmount] ,
		[TA_Bills].[EmployeeID] ,
		[TA_Bills].[BillStatusID] ,
		[TA_Bills].[ApprovedBy] ,
		[TA_Bills].[SARemarks] ,
		[TA_Bills].[OOERemarks] ,
		[TA_Bills].[NonTechnical] ,
		[TA_Bills].[OOEReasonID] ,
		[TA_Bills].[TACategoryID] ,
		[TA_Bills].[ApprovalFileName] ,
		[TA_Bills].[VerificationRemarks] ,
		[TA_Bills].[PrjCalcType] ,
		[TA_Bills].[StartDateTime] ,
		[TA_Bills].[ReceivedOn] ,
		[TA_Bills].[DepartmentID] ,
		[TA_Bills].[OOEBySystem] ,
		[TA_Bills].[ForwardedOn] ,
		[TA_Bills].[ReportFileName] ,
		[TA_Bills].[EndDateTime] ,
		[TA_Bills].[ConversionFactorINR] ,
		[TA_Bills].[Contractual] ,
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
      INNER JOIN #PageIndex
          ON [TA_Bills].[TABillNo] = #PageIndex.TABillNo
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
