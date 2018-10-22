USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleRequestSelectByID]
  @LoginID NVarChar(8),
  @RequestNo Int 
  AS
  SELECT
		[VR_VehicleRequest].*, 
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[HRM_Divisions3].[Description] AS HRM_Divisions3_Description,
		[IDM_Projects4].[Description] AS IDM_Projects4_Description,
		[IDM_Vendors5].[Description] AS IDM_Vendors5_Description,
		[VR_RequestExecution6].[ExecutionDescription] AS VR_RequestExecution6_ExecutionDescription,
		[VR_RequestStates7].[Description] AS VR_RequestStates7_Description,
		[VR_Units8].[Description] AS VR_Units8_Description,
		[VR_VehicleTypes9].[cmba] AS VR_VehicleTypes9_cmba,
		[VR_ODCReasons1].[Description] AS VR_ODCReasons1_Description,
		[VR_Units2].[Description] AS VR_Units2_Description,
		[aspnet_Users10].[UserFullName] AS aspnet_Users10_UserFullName 
  FROM [VR_VehicleRequest] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_VehicleRequest].[RequestedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [VR_VehicleRequest].[ReturnedBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions3]
    ON [VR_VehicleRequest].[RequesterDivisionID] = [HRM_Divisions3].[DivisionID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]
    ON [VR_VehicleRequest].[ProjectID] = [IDM_Projects4].[ProjectID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors5]
    ON [VR_VehicleRequest].[SupplierID] = [IDM_Vendors5].[VendorID]
  LEFT OUTER JOIN [VR_RequestExecution] AS [VR_RequestExecution6]
    ON [VR_VehicleRequest].[SRNNo] = [VR_RequestExecution6].[SRNNo]
  INNER JOIN [VR_RequestStates] AS [VR_RequestStates7]
    ON [VR_VehicleRequest].[RequestStatus] = [VR_RequestStates7].[StatusID]
  LEFT OUTER JOIN [VR_Units] AS [VR_Units8]
    ON [VR_VehicleRequest].[SizeUnit] = [VR_Units8].[UnitID]
  LEFT OUTER JOIN [VR_VehicleTypes] AS [VR_VehicleTypes9]
    ON [VR_VehicleRequest].[VehicleTypeID] = [VR_VehicleTypes9].[VehicleTypeID]
  LEFT OUTER JOIN [VR_ODCReasons] AS [VR_ODCReasons1]
    ON [VR_VehicleRequest].[ODCReasonID] = [VR_ODCReasons1].[ReasonID]
  LEFT OUTER JOIN [VR_Units] AS [VR_Units2]
    ON [VR_VehicleRequest].[WeightUnit] = [VR_Units2].[UnitID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users10]
    ON [VR_VehicleRequest].[BuyerInERP] = [aspnet_Users10].[LoginID]
  WHERE
  [VR_VehicleRequest].[RequestNo] = @RequestNo
GO
