USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrPendingVehicleRequestSelectList]
  @RequestStatus Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[VR_VehicleRequest].[RequestNo] ,
		[VR_VehicleRequest].[SupplierID] ,
		[VR_VehicleRequest].[RequestDescription] ,
		[VR_VehicleRequest].[SupplierLocation] ,
		[VR_VehicleRequest].[ProjectID] ,
		[VR_VehicleRequest].[ProjectType] ,
		[VR_VehicleRequest].[DeliveryLocation] ,
		[VR_VehicleRequest].[ItemDescription] ,
		[VR_VehicleRequest].[MaterialSize] ,
		[VR_VehicleRequest].[SizeUnit] ,
		[VR_VehicleRequest].[MaterialWeight] ,
		[VR_VehicleRequest].[NoOfPackages] ,
		[VR_VehicleRequest].[VehicleTypeID] ,
		[VR_VehicleRequest].[VehicleRequiredOn] ,
		[VR_VehicleRequest].[MICN] ,
		[VR_VehicleRequest].[CustomInvoiceNo] ,
		[VR_VehicleRequest].[Remarks] ,
		[VR_VehicleRequest].[RequestedBy] ,
		[VR_VehicleRequest].[RequestedOn] ,
		[VR_VehicleRequest].[RequesterDivisionID] ,
		[VR_VehicleRequest].[RequestStatus] ,
		[VR_VehicleRequest].[ReturnedOn] ,
		[VR_VehicleRequest].[ReturnedBy] ,
		[VR_VehicleRequest].[ReturnRemarks] ,
		[VR_VehicleRequest].[SRNNo] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[HRM_Divisions3].[Description] AS HRM_Divisions3_Description,
		[IDM_Projects4].[Description] AS IDM_Projects4_Description,
		[IDM_Vendors5].[Description] AS IDM_Vendors5_Description,
		[VR_RequestExecution6].[ExecutionDescription] AS VR_RequestExecution6_ExecutionDescription,
		[VR_RequestStates7].[Description] AS VR_RequestStates7_Description,
		[VR_Units8].[Description] AS VR_Units8_Description,
		[VR_VehicleTypes9].[Description] AS VR_VehicleTypes9_Description 
  FROM [VR_VehicleRequest] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_VehicleRequest].[RequestedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [VR_VehicleRequest].[ReturnedBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions3]
    ON [VR_VehicleRequest].[RequesterDivisionID] = [HRM_Divisions3].[DivisionID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects4]
    ON [VR_VehicleRequest].[ProjectID] = [IDM_Projects4].[ProjectID]
  INNER JOIN [IDM_Vendors] AS [IDM_Vendors5]
    ON [VR_VehicleRequest].[SupplierID] = [IDM_Vendors5].[VendorID]
  LEFT OUTER JOIN [VR_RequestExecution] AS [VR_RequestExecution6]
    ON [VR_VehicleRequest].[SRNNo] = [VR_RequestExecution6].[SRNNo]
  INNER JOIN [VR_RequestStates] AS [VR_RequestStates7]
    ON [VR_VehicleRequest].[RequestStatus] = [VR_RequestStates7].[StatusID]
  LEFT OUTER JOIN [VR_Units] AS [VR_Units8]
    ON [VR_VehicleRequest].[SizeUnit] = [VR_Units8].[UnitID]
  INNER JOIN [VR_VehicleTypes] AS [VR_VehicleTypes9]
    ON [VR_VehicleRequest].[VehicleTypeID] = [VR_VehicleTypes9].[VehicleTypeID]
  WHERE 1 = 1  
  AND [VR_VehicleRequest].[RequestStatus] = (@RequestStatus)  
  ORDER BY
     CASE @OrderBy WHEN 'RequestNo' THEN [VR_VehicleRequest].[RequestNo] END,
     CASE @OrderBy WHEN 'RequestNo DESC' THEN [VR_VehicleRequest].[RequestNo] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [VR_VehicleRequest].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [VR_VehicleRequest].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'RequestDescription' THEN [VR_VehicleRequest].[RequestDescription] END,
     CASE @OrderBy WHEN 'RequestDescription DESC' THEN [VR_VehicleRequest].[RequestDescription] END DESC,
     CASE @OrderBy WHEN 'SupplierLocation' THEN [VR_VehicleRequest].[SupplierLocation] END,
     CASE @OrderBy WHEN 'SupplierLocation DESC' THEN [VR_VehicleRequest].[SupplierLocation] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [VR_VehicleRequest].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [VR_VehicleRequest].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'ProjectType' THEN [VR_VehicleRequest].[ProjectType] END,
     CASE @OrderBy WHEN 'ProjectType DESC' THEN [VR_VehicleRequest].[ProjectType] END DESC,
     CASE @OrderBy WHEN 'DeliveryLocation' THEN [VR_VehicleRequest].[DeliveryLocation] END,
     CASE @OrderBy WHEN 'DeliveryLocation DESC' THEN [VR_VehicleRequest].[DeliveryLocation] END DESC,
     CASE @OrderBy WHEN 'ItemDescription' THEN [VR_VehicleRequest].[ItemDescription] END,
     CASE @OrderBy WHEN 'ItemDescription DESC' THEN [VR_VehicleRequest].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'MaterialSize' THEN [VR_VehicleRequest].[MaterialSize] END,
     CASE @OrderBy WHEN 'MaterialSize DESC' THEN [VR_VehicleRequest].[MaterialSize] END DESC,
     CASE @OrderBy WHEN 'SizeUnit' THEN [VR_VehicleRequest].[SizeUnit] END,
     CASE @OrderBy WHEN 'SizeUnit DESC' THEN [VR_VehicleRequest].[SizeUnit] END DESC,
     CASE @OrderBy WHEN 'MaterialWeight' THEN [VR_VehicleRequest].[MaterialWeight] END,
     CASE @OrderBy WHEN 'MaterialWeight DESC' THEN [VR_VehicleRequest].[MaterialWeight] END DESC,
     CASE @OrderBy WHEN 'NoOfPackages' THEN [VR_VehicleRequest].[NoOfPackages] END,
     CASE @OrderBy WHEN 'NoOfPackages DESC' THEN [VR_VehicleRequest].[NoOfPackages] END DESC,
     CASE @OrderBy WHEN 'VehicleTypeID' THEN [VR_VehicleRequest].[VehicleTypeID] END,
     CASE @OrderBy WHEN 'VehicleTypeID DESC' THEN [VR_VehicleRequest].[VehicleTypeID] END DESC,
     CASE @OrderBy WHEN 'VehicleRequiredOn' THEN [VR_VehicleRequest].[VehicleRequiredOn] END,
     CASE @OrderBy WHEN 'VehicleRequiredOn DESC' THEN [VR_VehicleRequest].[VehicleRequiredOn] END DESC,
     CASE @OrderBy WHEN 'MICN' THEN [VR_VehicleRequest].[MICN] END,
     CASE @OrderBy WHEN 'MICN DESC' THEN [VR_VehicleRequest].[MICN] END DESC,
     CASE @OrderBy WHEN 'CustomInvoiceNo' THEN [VR_VehicleRequest].[CustomInvoiceNo] END,
     CASE @OrderBy WHEN 'CustomInvoiceNo DESC' THEN [VR_VehicleRequest].[CustomInvoiceNo] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [VR_VehicleRequest].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [VR_VehicleRequest].[Remarks] END DESC,
     CASE @OrderBy WHEN 'RequestedBy' THEN [VR_VehicleRequest].[RequestedBy] END,
     CASE @OrderBy WHEN 'RequestedBy DESC' THEN [VR_VehicleRequest].[RequestedBy] END DESC,
     CASE @OrderBy WHEN 'RequestedOn' THEN [VR_VehicleRequest].[RequestedOn] END,
     CASE @OrderBy WHEN 'RequestedOn DESC' THEN [VR_VehicleRequest].[RequestedOn] END DESC,
     CASE @OrderBy WHEN 'RequesterDivisionID' THEN [VR_VehicleRequest].[RequesterDivisionID] END,
     CASE @OrderBy WHEN 'RequesterDivisionID DESC' THEN [VR_VehicleRequest].[RequesterDivisionID] END DESC,
     CASE @OrderBy WHEN 'RequestStatus' THEN [VR_VehicleRequest].[RequestStatus] END,
     CASE @OrderBy WHEN 'RequestStatus DESC' THEN [VR_VehicleRequest].[RequestStatus] END DESC,
     CASE @OrderBy WHEN 'ReturnedOn' THEN [VR_VehicleRequest].[ReturnedOn] END,
     CASE @OrderBy WHEN 'ReturnedOn DESC' THEN [VR_VehicleRequest].[ReturnedOn] END DESC,
     CASE @OrderBy WHEN 'ReturnedBy' THEN [VR_VehicleRequest].[ReturnedBy] END,
     CASE @OrderBy WHEN 'ReturnedBy DESC' THEN [VR_VehicleRequest].[ReturnedBy] END DESC,
     CASE @OrderBy WHEN 'ReturnRemarks' THEN [VR_VehicleRequest].[ReturnRemarks] END,
     CASE @OrderBy WHEN 'ReturnRemarks DESC' THEN [VR_VehicleRequest].[ReturnRemarks] END DESC,
     CASE @OrderBy WHEN 'SRNNo' THEN [VR_VehicleRequest].[SRNNo] END,
     CASE @OrderBy WHEN 'SRNNo DESC' THEN [VR_VehicleRequest].[SRNNo] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions3_Description' THEN [HRM_Divisions3].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions3_Description DESC' THEN [HRM_Divisions3].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects4_Description' THEN [IDM_Projects4].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects4_Description DESC' THEN [IDM_Projects4].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Vendors5_Description' THEN [IDM_Vendors5].[Description] END,
     CASE @OrderBy WHEN 'IDM_Vendors5_Description DESC' THEN [IDM_Vendors5].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_RequestExecution6_ExecutionDescription' THEN [VR_RequestExecution6].[ExecutionDescription] END,
     CASE @OrderBy WHEN 'VR_RequestExecution6_ExecutionDescription DESC' THEN [VR_RequestExecution6].[ExecutionDescription] END DESC,
     CASE @OrderBy WHEN 'VR_RequestStates7_Description' THEN [VR_RequestStates7].[Description] END,
     CASE @OrderBy WHEN 'VR_RequestStates7_Description DESC' THEN [VR_RequestStates7].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_Units8_Description' THEN [VR_Units8].[Description] END,
     CASE @OrderBy WHEN 'VR_Units8_Description DESC' THEN [VR_Units8].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_VehicleTypes9_Description' THEN [VR_VehicleTypes9].[Description] END,
     CASE @OrderBy WHEN 'VR_VehicleTypes9_Description DESC' THEN [VR_VehicleTypes9].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
