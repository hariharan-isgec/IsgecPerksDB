USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRequestAllotmentSelectList]
  @RequestStateID NVarChar(10),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
		[QCM_RequestStates10].[Description] AS QCM_RequestStates10_Description 
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
  INNER JOIN [IDM_Projects] AS [IDM_Projects6]
    ON [QCM_Requests].[ProjectID] = [IDM_Projects6].[ProjectID]
  INNER JOIN [IDM_Vendors] AS [IDM_Vendors7]
    ON [QCM_Requests].[SupplierID] = [IDM_Vendors7].[VendorID]
  LEFT OUTER JOIN [QCM_InspectionStages] AS [QCM_InspectionStages8]
    ON [QCM_Requests].[InspectionStageiD] = [QCM_InspectionStages8].[InspectionStageID]
  LEFT OUTER JOIN [QCM_ReceivingMediums] AS [QCM_ReceivingMediums9]
    ON [QCM_Requests].[ReceivingMediumID] = [QCM_ReceivingMediums9].[ReceivingMediumID]
  INNER JOIN [QCM_RequestStates] AS [QCM_RequestStates10]
    ON [QCM_Requests].[RequestStateID] = [QCM_RequestStates10].[StateID]
  WHERE 1 = 1  
  AND [QCM_Requests].[RequestStateID] = (@RequestStateID)  
  ORDER BY
     CASE @OrderBy WHEN 'RequestID' THEN [QCM_Requests].[RequestID] END,
     CASE @OrderBy WHEN 'RequestID DESC' THEN [QCM_Requests].[RequestID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [QCM_Requests].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [QCM_Requests].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'OrderNo' THEN [QCM_Requests].[OrderNo] END,
     CASE @OrderBy WHEN 'OrderNo DESC' THEN [QCM_Requests].[OrderNo] END DESC,
     CASE @OrderBy WHEN 'OrderDate' THEN [QCM_Requests].[OrderDate] END,
     CASE @OrderBy WHEN 'OrderDate DESC' THEN [QCM_Requests].[OrderDate] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [QCM_Requests].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [QCM_Requests].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [QCM_Requests].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [QCM_Requests].[Description] END DESC,
     CASE @OrderBy WHEN 'TotalRequestedQuantity' THEN [QCM_Requests].[TotalRequestedQuantity] END,
     CASE @OrderBy WHEN 'TotalRequestedQuantity DESC' THEN [QCM_Requests].[TotalRequestedQuantity] END DESC,
     CASE @OrderBy WHEN 'RequestedInspectionStartDate' THEN [QCM_Requests].[RequestedInspectionStartDate] END,
     CASE @OrderBy WHEN 'RequestedInspectionStartDate DESC' THEN [QCM_Requests].[RequestedInspectionStartDate] END DESC,
     CASE @OrderBy WHEN 'RequestedInspectionFinishDate' THEN [QCM_Requests].[RequestedInspectionFinishDate] END,
     CASE @OrderBy WHEN 'RequestedInspectionFinishDate DESC' THEN [QCM_Requests].[RequestedInspectionFinishDate] END DESC,
     CASE @OrderBy WHEN 'ClientInspectionRequired' THEN [QCM_Requests].[ClientInspectionRequired] END,
     CASE @OrderBy WHEN 'ClientInspectionRequired DESC' THEN [QCM_Requests].[ClientInspectionRequired] END DESC,
     CASE @OrderBy WHEN 'ThirdPartyInspectionRequired' THEN [QCM_Requests].[ThirdPartyInspectionRequired] END,
     CASE @OrderBy WHEN 'ThirdPartyInspectionRequired DESC' THEN [QCM_Requests].[ThirdPartyInspectionRequired] END DESC,
     CASE @OrderBy WHEN 'ReceivedOn' THEN [QCM_Requests].[ReceivedOn] END,
     CASE @OrderBy WHEN 'ReceivedOn DESC' THEN [QCM_Requests].[ReceivedOn] END DESC,
     CASE @OrderBy WHEN 'ReceivedBy' THEN [QCM_Requests].[ReceivedBy] END,
     CASE @OrderBy WHEN 'ReceivedBy DESC' THEN [QCM_Requests].[ReceivedBy] END DESC,
     CASE @OrderBy WHEN 'ReceivingMediumID' THEN [QCM_Requests].[ReceivingMediumID] END,
     CASE @OrderBy WHEN 'ReceivingMediumID DESC' THEN [QCM_Requests].[ReceivingMediumID] END DESC,
     CASE @OrderBy WHEN 'CreationRemarks' THEN [QCM_Requests].[CreationRemarks] END,
     CASE @OrderBy WHEN 'CreationRemarks DESC' THEN [QCM_Requests].[CreationRemarks] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [QCM_Requests].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [QCM_Requests].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [QCM_Requests].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [QCM_Requests].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'RequestStateID' THEN [QCM_Requests].[RequestStateID] END,
     CASE @OrderBy WHEN 'RequestStateID DESC' THEN [QCM_Requests].[RequestStateID] END DESC,
     CASE @OrderBy WHEN 'FileAttached' THEN [QCM_Requests].[FileAttached] END,
     CASE @OrderBy WHEN 'FileAttached DESC' THEN [QCM_Requests].[FileAttached] END DESC,
     CASE @OrderBy WHEN 'InspectionStageiD' THEN [QCM_Requests].[InspectionStageiD] END,
     CASE @OrderBy WHEN 'InspectionStageiD DESC' THEN [QCM_Requests].[InspectionStageiD] END DESC,
     CASE @OrderBy WHEN 'AllotedTo' THEN [QCM_Requests].[AllotedTo] END,
     CASE @OrderBy WHEN 'AllotedTo DESC' THEN [QCM_Requests].[AllotedTo] END DESC,
     CASE @OrderBy WHEN 'AllotedStartDate' THEN [QCM_Requests].[AllotedStartDate] END,
     CASE @OrderBy WHEN 'AllotedStartDate DESC' THEN [QCM_Requests].[AllotedStartDate] END DESC,
     CASE @OrderBy WHEN 'AllotedFinishDate' THEN [QCM_Requests].[AllotedFinishDate] END,
     CASE @OrderBy WHEN 'AllotedFinishDate DESC' THEN [QCM_Requests].[AllotedFinishDate] END DESC,
     CASE @OrderBy WHEN 'AllotedOn' THEN [QCM_Requests].[AllotedOn] END,
     CASE @OrderBy WHEN 'AllotedOn DESC' THEN [QCM_Requests].[AllotedOn] END DESC,
     CASE @OrderBy WHEN 'AllotedBy' THEN [QCM_Requests].[AllotedBy] END,
     CASE @OrderBy WHEN 'AllotedBy DESC' THEN [QCM_Requests].[AllotedBy] END DESC,
     CASE @OrderBy WHEN 'AllotmentRemarks' THEN [QCM_Requests].[AllotmentRemarks] END,
     CASE @OrderBy WHEN 'AllotmentRemarks DESC' THEN [QCM_Requests].[AllotmentRemarks] END DESC,
     CASE @OrderBy WHEN 'InspectionStartDate' THEN [QCM_Requests].[InspectionStartDate] END,
     CASE @OrderBy WHEN 'InspectionStartDate DESC' THEN [QCM_Requests].[InspectionStartDate] END DESC,
     CASE @OrderBy WHEN 'InspectionFinishDate' THEN [QCM_Requests].[InspectionFinishDate] END,
     CASE @OrderBy WHEN 'InspectionFinishDate DESC' THEN [QCM_Requests].[InspectionFinishDate] END DESC,
     CASE @OrderBy WHEN 'CancelledOn' THEN [QCM_Requests].[CancelledOn] END,
     CASE @OrderBy WHEN 'CancelledOn DESC' THEN [QCM_Requests].[CancelledOn] END DESC,
     CASE @OrderBy WHEN 'CancelledBy' THEN [QCM_Requests].[CancelledBy] END,
     CASE @OrderBy WHEN 'CancelledBy DESC' THEN [QCM_Requests].[CancelledBy] END DESC,
     CASE @OrderBy WHEN 'CancellationRemarks' THEN [QCM_Requests].[CancellationRemarks] END,
     CASE @OrderBy WHEN 'CancellationRemarks DESC' THEN [QCM_Requests].[CancellationRemarks] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees3_EmployeeName' THEN [HRM_Employees3].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees3_EmployeeName DESC' THEN [HRM_Employees3].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees4_EmployeeName' THEN [HRM_Employees4].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees4_EmployeeName DESC' THEN [HRM_Employees4].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees5_EmployeeName' THEN [HRM_Employees5].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees5_EmployeeName DESC' THEN [HRM_Employees5].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects6_Description' THEN [IDM_Projects6].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects6_Description DESC' THEN [IDM_Projects6].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Vendors7_Description' THEN [IDM_Vendors7].[Description] END,
     CASE @OrderBy WHEN 'IDM_Vendors7_Description DESC' THEN [IDM_Vendors7].[Description] END DESC,
     CASE @OrderBy WHEN 'QCM_InspectionStages8_Description' THEN [QCM_InspectionStages8].[Description] END,
     CASE @OrderBy WHEN 'QCM_InspectionStages8_Description DESC' THEN [QCM_InspectionStages8].[Description] END DESC,
     CASE @OrderBy WHEN 'QCM_ReceivingMediums9_Description' THEN [QCM_ReceivingMediums9].[Description] END,
     CASE @OrderBy WHEN 'QCM_ReceivingMediums9_Description DESC' THEN [QCM_ReceivingMediums9].[Description] END DESC,
     CASE @OrderBy WHEN 'QCM_RequestStates10_Description' THEN [QCM_RequestStates10].[Description] END,
     CASE @OrderBy WHEN 'QCM_RequestStates10_Description DESC' THEN [QCM_RequestStates10].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
