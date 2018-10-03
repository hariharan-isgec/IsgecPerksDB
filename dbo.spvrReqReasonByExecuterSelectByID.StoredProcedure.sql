USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrReqReasonByExecuterSelectByID]
  @LoginID NVarChar(8),
  @RequestNo Int 
  AS
  SELECT
		[VR_VehicleRequest].[RequestNo] ,
		[VR_VehicleRequest].[RequestDescription] ,
		[VR_VehicleRequest].[SupplierID] ,
		[VR_VehicleRequest].[SupplierLocation] ,
		[VR_VehicleRequest].[ProjectID] ,
		[VR_VehicleRequest].[ProjectType] ,
		[VR_VehicleRequest].[DeliveryLocation] ,
		[VR_VehicleRequest].[ItemDescription] ,
		[VR_VehicleRequest].[MaterialSize] ,
		[VR_VehicleRequest].[SizeUnit] ,
		[VR_VehicleRequest].[Height] ,
		[VR_VehicleRequest].[Width] ,
		[VR_VehicleRequest].[Length] ,
		[VR_VehicleRequest].[MaterialWeight] ,
		[VR_VehicleRequest].[WeightUnit] ,
		[VR_VehicleRequest].[NoOfPackages] ,
		[VR_VehicleRequest].[VehicleTypeID] ,
		[VR_VehicleRequest].[VehicleRequiredOn] ,
		[VR_VehicleRequest].[OverDimentionConsignement] ,
		[VR_VehicleRequest].[ODCReasonID] ,
		[VR_VehicleRequest].[Remarks] ,
		[VR_VehicleRequest].[CustomInvoiceNo] ,
		[VR_VehicleRequest].[RequestedBy] ,
		[VR_VehicleRequest].[RequestedOn] ,
		[VR_VehicleRequest].[RequesterDivisionID] ,
		[VR_VehicleRequest].[RequestStatus] ,
		[VR_VehicleRequest].[ReturnedOn] ,
		[VR_VehicleRequest].[ReturnedBy] ,
		[VR_VehicleRequest].[ReturnRemarks] ,
		[VR_VehicleRequest].[SRNNo] ,
		[VR_VehicleRequest].[ValidRequest] ,
		[VR_VehicleRequest].[ODCAtSupplierLoading] ,
		[VR_VehicleRequest].[FromLocation] ,
		[VR_VehicleRequest].[ToLocation] ,
		[VR_VehicleRequest].[MICN] ,
		[VR_VehicleRequest].[CustomInvoiceIssued] ,
		[VR_VehicleRequest].[CT1Issued] ,
		[VR_VehicleRequest].[ARE1Issued] ,
		[VR_VehicleRequest].[DIIssued] ,
		[VR_VehicleRequest].[PaymentChecked] ,
		[VR_VehicleRequest].[GoodsPacked] ,
		[VR_VehicleRequest].[POApproved] ,
		[VR_VehicleRequest].[WayBill] ,
		[VR_VehicleRequest].[MarkingDetails] ,
		[VR_VehicleRequest].[TarpaulineRequired] ,
		[VR_VehicleRequest].[PackageStckable] ,
		[VR_VehicleRequest].[InvoiceValue] ,
		[VR_VehicleRequest].[OutOfContract] ,
		[VR_VehicleRequest].[ERPPONumber] ,
		[VR_VehicleRequest].[BuyerInERP] ,
		[VR_VehicleRequest].[ExecuterReasonID] ,
		[VR_VehicleRequest].[ExecuterID] ,
		[VR_VehicleRequest].[ReasonEneteredOn] ,
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
		[aspnet_Users10].[UserFullName] AS aspnet_Users10_UserFullName,
		[aspnet_Users11].[UserFullName] AS aspnet_Users11_UserFullName,
		[VR_RequestReasons12].[Description] AS VR_RequestReasons12_Description 
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
  LEFT OUTER JOIN [VR_ODCReasons] AS [VR_ODCReasons1]
    ON [VR_VehicleRequest].[ODCReasonID] = [VR_ODCReasons1].[ReasonID]
  LEFT OUTER JOIN [VR_Units] AS [VR_Units2]
    ON [VR_VehicleRequest].[WeightUnit] = [VR_Units2].[UnitID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users10]
    ON [VR_VehicleRequest].[BuyerInERP] = [aspnet_Users10].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users11]
    ON [VR_VehicleRequest].[ExecuterID] = [aspnet_Users11].[LoginID]
  LEFT OUTER JOIN [VR_RequestReasons] AS [VR_RequestReasons12]
    ON [VR_VehicleRequest].[ExecuterReasonID] = [VR_RequestReasons12].[ReasonID]
  WHERE
  [VR_VehicleRequest].[RequestNo] = @RequestNo
GO
