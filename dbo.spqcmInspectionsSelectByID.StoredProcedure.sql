USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionsSelectByID]
  @LoginID NVarChar(8),
  @RequestID Int,
  @InspectionID Int 
  AS
  SELECT
		[QCM_Inspections].* ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description,
		[IDM_Vendors3].[Description] AS IDM_Vendors3_Description,
		[QCM_InspectionStages4].[Description] AS QCM_InspectionStages4_Description,
		[QCM_InspectionStatus5].[Description] AS QCM_InspectionStatus5_Description,
		[QCM_RequestStates6].[Description] AS QCM_RequestStates6_Description,
		[HRM_Employees7].[EmployeeName] AS HRM_Employees7_EmployeeName,
		[QCM_Requests8].[Description] AS QCM_Requests8_Description 
  FROM [QCM_Inspections] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [QCM_Inspections].[InspectedBy] = [HRM_Employees1].[CardNo]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [QCM_Inspections].[ProjectID] = [IDM_Projects2].[ProjectID]
  INNER JOIN [IDM_Vendors] AS [IDM_Vendors3]
    ON [QCM_Inspections].[SupplierID] = [IDM_Vendors3].[VendorID]
  LEFT OUTER JOIN [QCM_InspectionStages] AS [QCM_InspectionStages4]
    ON [QCM_Inspections].[InspectionStageiD] = [QCM_InspectionStages4].[InspectionStageID]
  LEFT OUTER JOIN [QCM_InspectionStatus] AS [QCM_InspectionStatus5]
    ON [QCM_Inspections].[InspectionStatusID] = [QCM_InspectionStatus5].[InspectionStatusID]
  INNER JOIN [QCM_RequestStates] AS [QCM_RequestStates6]
    ON [QCM_Inspections].[RequestStateID] = [QCM_RequestStates6].[StateID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]
    ON [QCM_Inspections].[EnteredBy] = [HRM_Employees7].[CardNo]
  INNER JOIN [QCM_Requests] AS [QCM_Requests8]
    ON [QCM_Inspections].[RequestID] = [QCM_Requests8].[RequestID]
  WHERE
  [QCM_Inspections].[RequestID] = @RequestID
  AND [QCM_Inspections].[InspectionID] = @InspectionID
GO
