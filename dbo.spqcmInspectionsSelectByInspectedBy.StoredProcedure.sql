USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionsSelectByInspectedBy]
  @InspectedBy NVarChar(8),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  [QCM_Inspections].[InspectedBy] = @InspectedBy
  ORDER BY
     CASE @OrderBy WHEN 'RequestID' THEN [QCM_Inspections].[RequestID] END,
     CASE @OrderBy WHEN 'RequestID DESC' THEN [QCM_Inspections].[RequestID] END DESC,
     CASE @OrderBy WHEN 'InspectionID' THEN [QCM_Inspections].[InspectionID] END,
     CASE @OrderBy WHEN 'InspectionID DESC' THEN [QCM_Inspections].[InspectionID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [QCM_Inspections].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [QCM_Inspections].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'OrderNo' THEN [QCM_Inspections].[OrderNo] END,
     CASE @OrderBy WHEN 'OrderNo DESC' THEN [QCM_Inspections].[OrderNo] END DESC,
     CASE @OrderBy WHEN 'OrderDate' THEN [QCM_Inspections].[OrderDate] END,
     CASE @OrderBy WHEN 'OrderDate DESC' THEN [QCM_Inspections].[OrderDate] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [QCM_Inspections].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [QCM_Inspections].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'InspectionRemarks' THEN [QCM_Inspections].[InspectionRemarks] END,
     CASE @OrderBy WHEN 'InspectionRemarks DESC' THEN [QCM_Inspections].[InspectionRemarks] END DESC,
     CASE @OrderBy WHEN 'InspectedBy' THEN [QCM_Inspections].[InspectedBy] END,
     CASE @OrderBy WHEN 'InspectedBy DESC' THEN [QCM_Inspections].[InspectedBy] END DESC,
     CASE @OrderBy WHEN 'InspectedOn' THEN [QCM_Inspections].[InspectedOn] END,
     CASE @OrderBy WHEN 'InspectedOn DESC' THEN [QCM_Inspections].[InspectedOn] END DESC,
     CASE @OrderBy WHEN 'RequestStateID' THEN [QCM_Inspections].[RequestStateID] END,
     CASE @OrderBy WHEN 'RequestStateID DESC' THEN [QCM_Inspections].[RequestStateID] END DESC,
     CASE @OrderBy WHEN 'FileAttached' THEN [QCM_Inspections].[FileAttached] END,
     CASE @OrderBy WHEN 'FileAttached DESC' THEN [QCM_Inspections].[FileAttached] END DESC,
     CASE @OrderBy WHEN 'InspectionStatusID' THEN [QCM_Inspections].[InspectionStatusID] END,
     CASE @OrderBy WHEN 'InspectionStatusID DESC' THEN [QCM_Inspections].[InspectionStatusID] END DESC,
     CASE @OrderBy WHEN 'InspectedQuantity' THEN [QCM_Inspections].[InspectedQuantity] END,
     CASE @OrderBy WHEN 'InspectedQuantity DESC' THEN [QCM_Inspections].[InspectedQuantity] END DESC,
     CASE @OrderBy WHEN 'InspectionStageiD' THEN [QCM_Inspections].[InspectionStageiD] END,
     CASE @OrderBy WHEN 'InspectionStageiD DESC' THEN [QCM_Inspections].[InspectionStageiD] END DESC,
     CASE @OrderBy WHEN 'EnteredBy' THEN [QCM_Inspections].[EnteredBy] END,
     CASE @OrderBy WHEN 'EnteredBy DESC' THEN [QCM_Inspections].[EnteredBy] END DESC,
     CASE @OrderBy WHEN 'EnteredOn' THEN [QCM_Inspections].[EnteredOn] END,
     CASE @OrderBy WHEN 'EnteredOn DESC' THEN [QCM_Inspections].[EnteredOn] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Vendors3_Description' THEN [IDM_Vendors3].[Description] END,
     CASE @OrderBy WHEN 'IDM_Vendors3_Description DESC' THEN [IDM_Vendors3].[Description] END DESC,
     CASE @OrderBy WHEN 'QCM_InspectionStages4_Description' THEN [QCM_InspectionStages4].[Description] END,
     CASE @OrderBy WHEN 'QCM_InspectionStages4_Description DESC' THEN [QCM_InspectionStages4].[Description] END DESC,
     CASE @OrderBy WHEN 'QCM_InspectionStatus5_Description' THEN [QCM_InspectionStatus5].[Description] END,
     CASE @OrderBy WHEN 'QCM_InspectionStatus5_Description DESC' THEN [QCM_InspectionStatus5].[Description] END DESC,
     CASE @OrderBy WHEN 'QCM_RequestStates6_Description' THEN [QCM_RequestStates6].[Description] END,
     CASE @OrderBy WHEN 'QCM_RequestStates6_Description DESC' THEN [QCM_RequestStates6].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees7_EmployeeName' THEN [HRM_Employees7].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees7_EmployeeName DESC' THEN [HRM_Employees7].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'QCM_Requests8_Description' THEN [QCM_Requests8].[Description] END,
     CASE @OrderBy WHEN 'QCM_Requests8_Description DESC' THEN [QCM_Requests8].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
