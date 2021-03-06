USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spqcm_LG_GetLastRequest]
  @LoginID NVarChar(8),
  @SupplierID NVarChar(9)  
  AS
  SELECT
	[QCM_Requests].* ,
	[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
	[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
	[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
	[HRM_Employees4].[EmployeeName] AS HRM_Employees4_EmployeeName,
	[HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName,
	[IDM_Projects6].[Description] AS IDM_Projects6_Description,
	[IDM_Vendors7].[Description] AS IDM_Vendors7_Description,
	[QCM_InspectionStages8].[Description] AS QCM_InspectionStages8_Description,
	[QCM_ReceivingMediums9].[Description] AS QCM_ReceivingMediums9_Description,
	[QCM_RequestStates10].[Description] AS QCM_RequestStates10_Description,
	[QCM_InspectionStatus11].[Description] AS QCM_InspectionStatus11_Description,
	[QCM_Regions12].[RegionName] AS QCM_Regions12_RegionName 
  FROM [QCM_Requests] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [QCM_Requests].[CreatedBy] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [QCM_Requests].[AllotedTo] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [QCM_Requests].[AllotedBy] = [HRM_Employees3].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]
    ON [QCM_Requests].[CancelledBy] = [HRM_Employees4].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [QCM_Requests].[ReceivedBy] = [HRM_Employees5].[CardNo]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects6]
    ON [QCM_Requests].[ProjectID] = [IDM_Projects6].[ProjectID]
  INNER JOIN [IDM_Vendors] AS [IDM_Vendors7]
    ON [QCM_Requests].[SupplierID] = [IDM_Vendors7].[VendorID]
  LEFT OUTER JOIN [QCM_InspectionStages] AS [QCM_InspectionStages8]
    ON [QCM_Requests].[InspectionStageiD] = [QCM_InspectionStages8].[InspectionStageID]
  LEFT OUTER JOIN [QCM_ReceivingMediums] AS [QCM_ReceivingMediums9]
    ON [QCM_Requests].[ReceivingMediumID] = [QCM_ReceivingMediums9].[ReceivingMediumID]
  INNER JOIN [QCM_RequestStates] AS [QCM_RequestStates10]
    ON [QCM_Requests].[RequestStateID] = [QCM_RequestStates10].[StateID]
  LEFT OUTER JOIN [QCM_InspectionStatus] AS [QCM_InspectionStatus11]
    ON [QCM_Requests].[InspectionStatusID] = [QCM_InspectionStatus11].[InspectionStatusID]
  LEFT OUTER JOIN [QCM_Regions] AS [QCM_Regions12]
    ON [QCM_Requests].[RegionID] = [QCM_Regions12].[RegionID]
  WHERE
  [QCM_Requests].[SupplierID] = @SupplierID 
  AND [QCM_Requests].[CreatedOn] = (select max(CreatedOn) from QCM_Requests where supplierID=@SupplierID)
GO
