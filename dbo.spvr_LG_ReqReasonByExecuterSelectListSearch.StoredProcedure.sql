USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvr_LG_ReqReasonByExecuterSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @RequestStatus Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RequestNo Int NOT NULL
  )
  INSERT INTO #PageIndex (RequestNo)
  SELECT [VR_VehicleRequest].[RequestNo] FROM [VR_VehicleRequest]
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
      ([VR_VehicleRequest].[RequestStatus] >= 4 AND [VR_VehicleRequest].[RequestStatus] <= 7) 
   AND ( 
         STR(ISNULL([VR_VehicleRequest].[RequestNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[SupplierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[RequestDescription],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[SupplierLocation],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[ProjectType],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[DeliveryLocation],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[ItemDescription],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[MaterialSize],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_VehicleRequest].[SizeUnit], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_VehicleRequest].[Height], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_VehicleRequest].[Width], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_VehicleRequest].[Length], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_VehicleRequest].[MaterialWeight], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_VehicleRequest].[WeightUnit], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_VehicleRequest].[NoOfPackages], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_VehicleRequest].[VehicleTypeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_VehicleRequest].[ODCReasonID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[CustomInvoiceNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[RequestedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[RequesterDivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_VehicleRequest].[RequestStatus], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[ReturnedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[ReturnRemarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_VehicleRequest].[SRNNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[FromLocation],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[ToLocation],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_VehicleRequest].[InvoiceValue], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[ERPPONumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[BuyerInERP],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_VehicleRequest].[ExecuterReasonID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_VehicleRequest].[ExecuterID],'')) LIKE @KeyWord1
   ) 
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
     CASE @OrderBy WHEN 'Height' THEN [VR_VehicleRequest].[Height] END,
     CASE @OrderBy WHEN 'Height DESC' THEN [VR_VehicleRequest].[Height] END DESC,
     CASE @OrderBy WHEN 'Width' THEN [VR_VehicleRequest].[Width] END,
     CASE @OrderBy WHEN 'Width DESC' THEN [VR_VehicleRequest].[Width] END DESC,
     CASE @OrderBy WHEN 'Length' THEN [VR_VehicleRequest].[Length] END,
     CASE @OrderBy WHEN 'Length DESC' THEN [VR_VehicleRequest].[Length] END DESC,
     CASE @OrderBy WHEN 'MaterialWeight' THEN [VR_VehicleRequest].[MaterialWeight] END,
     CASE @OrderBy WHEN 'MaterialWeight DESC' THEN [VR_VehicleRequest].[MaterialWeight] END DESC,
     CASE @OrderBy WHEN 'WeightUnit' THEN [VR_VehicleRequest].[WeightUnit] END,
     CASE @OrderBy WHEN 'WeightUnit DESC' THEN [VR_VehicleRequest].[WeightUnit] END DESC,
     CASE @OrderBy WHEN 'NoOfPackages' THEN [VR_VehicleRequest].[NoOfPackages] END,
     CASE @OrderBy WHEN 'NoOfPackages DESC' THEN [VR_VehicleRequest].[NoOfPackages] END DESC,
     CASE @OrderBy WHEN 'VehicleTypeID' THEN [VR_VehicleRequest].[VehicleTypeID] END,
     CASE @OrderBy WHEN 'VehicleTypeID DESC' THEN [VR_VehicleRequest].[VehicleTypeID] END DESC,
     CASE @OrderBy WHEN 'VehicleRequiredOn' THEN [VR_VehicleRequest].[VehicleRequiredOn] END,
     CASE @OrderBy WHEN 'VehicleRequiredOn DESC' THEN [VR_VehicleRequest].[VehicleRequiredOn] END DESC,
     CASE @OrderBy WHEN 'OverDimentionConsignement' THEN [VR_VehicleRequest].[OverDimentionConsignement] END,
     CASE @OrderBy WHEN 'OverDimentionConsignement DESC' THEN [VR_VehicleRequest].[OverDimentionConsignement] END DESC,
     CASE @OrderBy WHEN 'ODCReasonID' THEN [VR_VehicleRequest].[ODCReasonID] END,
     CASE @OrderBy WHEN 'ODCReasonID DESC' THEN [VR_VehicleRequest].[ODCReasonID] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [VR_VehicleRequest].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [VR_VehicleRequest].[Remarks] END DESC,
     CASE @OrderBy WHEN 'MICN' THEN [VR_VehicleRequest].[MICN] END,
     CASE @OrderBy WHEN 'MICN DESC' THEN [VR_VehicleRequest].[MICN] END DESC,
     CASE @OrderBy WHEN 'CustomInvoiceNo' THEN [VR_VehicleRequest].[CustomInvoiceNo] END,
     CASE @OrderBy WHEN 'CustomInvoiceNo DESC' THEN [VR_VehicleRequest].[CustomInvoiceNo] END DESC,
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
     CASE @OrderBy WHEN 'ValidRequest' THEN [VR_VehicleRequest].[ValidRequest] END,
     CASE @OrderBy WHEN 'ValidRequest DESC' THEN [VR_VehicleRequest].[ValidRequest] END DESC,
     CASE @OrderBy WHEN 'ODCAtSupplierLoading' THEN [VR_VehicleRequest].[ODCAtSupplierLoading] END,
     CASE @OrderBy WHEN 'ODCAtSupplierLoading DESC' THEN [VR_VehicleRequest].[ODCAtSupplierLoading] END DESC,
     CASE @OrderBy WHEN 'FromLocation' THEN [VR_VehicleRequest].[FromLocation] END,
     CASE @OrderBy WHEN 'FromLocation DESC' THEN [VR_VehicleRequest].[FromLocation] END DESC,
     CASE @OrderBy WHEN 'ToLocation' THEN [VR_VehicleRequest].[ToLocation] END,
     CASE @OrderBy WHEN 'ToLocation DESC' THEN [VR_VehicleRequest].[ToLocation] END DESC,
     CASE @OrderBy WHEN 'CustomInvoiceIssued' THEN [VR_VehicleRequest].[CustomInvoiceIssued] END,
     CASE @OrderBy WHEN 'CustomInvoiceIssued DESC' THEN [VR_VehicleRequest].[CustomInvoiceIssued] END DESC,
     CASE @OrderBy WHEN 'CT1Issued' THEN [VR_VehicleRequest].[CT1Issued] END,
     CASE @OrderBy WHEN 'CT1Issued DESC' THEN [VR_VehicleRequest].[CT1Issued] END DESC,
     CASE @OrderBy WHEN 'ARE1Issued' THEN [VR_VehicleRequest].[ARE1Issued] END,
     CASE @OrderBy WHEN 'ARE1Issued DESC' THEN [VR_VehicleRequest].[ARE1Issued] END DESC,
     CASE @OrderBy WHEN 'DIIssued' THEN [VR_VehicleRequest].[DIIssued] END,
     CASE @OrderBy WHEN 'DIIssued DESC' THEN [VR_VehicleRequest].[DIIssued] END DESC,
     CASE @OrderBy WHEN 'PaymentChecked' THEN [VR_VehicleRequest].[PaymentChecked] END,
     CASE @OrderBy WHEN 'PaymentChecked DESC' THEN [VR_VehicleRequest].[PaymentChecked] END DESC,
     CASE @OrderBy WHEN 'GoodsPacked' THEN [VR_VehicleRequest].[GoodsPacked] END,
     CASE @OrderBy WHEN 'GoodsPacked DESC' THEN [VR_VehicleRequest].[GoodsPacked] END DESC,
     CASE @OrderBy WHEN 'POApproved' THEN [VR_VehicleRequest].[POApproved] END,
     CASE @OrderBy WHEN 'POApproved DESC' THEN [VR_VehicleRequest].[POApproved] END DESC,
     CASE @OrderBy WHEN 'WayBill' THEN [VR_VehicleRequest].[WayBill] END,
     CASE @OrderBy WHEN 'WayBill DESC' THEN [VR_VehicleRequest].[WayBill] END DESC,
     CASE @OrderBy WHEN 'MarkingDetails' THEN [VR_VehicleRequest].[MarkingDetails] END,
     CASE @OrderBy WHEN 'MarkingDetails DESC' THEN [VR_VehicleRequest].[MarkingDetails] END DESC,
     CASE @OrderBy WHEN 'TarpaulineRequired' THEN [VR_VehicleRequest].[TarpaulineRequired] END,
     CASE @OrderBy WHEN 'TarpaulineRequired DESC' THEN [VR_VehicleRequest].[TarpaulineRequired] END DESC,
     CASE @OrderBy WHEN 'PackageStckable' THEN [VR_VehicleRequest].[PackageStckable] END,
     CASE @OrderBy WHEN 'PackageStckable DESC' THEN [VR_VehicleRequest].[PackageStckable] END DESC,
     CASE @OrderBy WHEN 'InvoiceValue' THEN [VR_VehicleRequest].[InvoiceValue] END,
     CASE @OrderBy WHEN 'InvoiceValue DESC' THEN [VR_VehicleRequest].[InvoiceValue] END DESC,
     CASE @OrderBy WHEN 'OutOfContract' THEN [VR_VehicleRequest].[OutOfContract] END,
     CASE @OrderBy WHEN 'OutOfContract DESC' THEN [VR_VehicleRequest].[OutOfContract] END DESC,
     CASE @OrderBy WHEN 'ERPPONumber' THEN [VR_VehicleRequest].[ERPPONumber] END,
     CASE @OrderBy WHEN 'ERPPONumber DESC' THEN [VR_VehicleRequest].[ERPPONumber] END DESC,
     CASE @OrderBy WHEN 'BuyerInERP' THEN [VR_VehicleRequest].[BuyerInERP] END,
     CASE @OrderBy WHEN 'BuyerInERP DESC' THEN [VR_VehicleRequest].[BuyerInERP] END DESC,
     CASE @OrderBy WHEN 'ExecuterReasonID' THEN [VR_VehicleRequest].[ExecuterReasonID] END,
     CASE @OrderBy WHEN 'ExecuterReasonID DESC' THEN [VR_VehicleRequest].[ExecuterReasonID] END DESC,
     CASE @OrderBy WHEN 'ExecuterID' THEN [VR_VehicleRequest].[ExecuterID] END,
     CASE @OrderBy WHEN 'ExecuterID DESC' THEN [VR_VehicleRequest].[ExecuterID] END DESC,
     CASE @OrderBy WHEN 'ReasonEneteredOn' THEN [VR_VehicleRequest].[ReasonEneteredOn] END,
     CASE @OrderBy WHEN 'ReasonEneteredOn DESC' THEN [VR_VehicleRequest].[ReasonEneteredOn] END DESC,
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
     CASE @OrderBy WHEN 'VR_VehicleTypes9_cmba' THEN [VR_VehicleTypes9].[cmba] END,
     CASE @OrderBy WHEN 'VR_VehicleTypes9_cmba DESC' THEN [VR_VehicleTypes9].[cmba] END DESC,
     CASE @OrderBy WHEN 'VR_ODCReasons1_Description' THEN [VR_ODCReasons1].[Description] END,
     CASE @OrderBy WHEN 'VR_ODCReasons1_Description DESC' THEN [VR_ODCReasons1].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_Units2_Description' THEN [VR_Units2].[Description] END,
     CASE @OrderBy WHEN 'VR_Units2_Description DESC' THEN [VR_Units2].[Description] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users10_UserFullName' THEN [aspnet_Users10].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users10_UserFullName DESC' THEN [aspnet_Users10].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users11_UserFullName' THEN [aspnet_Users11].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users11_UserFullName DESC' THEN [aspnet_Users11].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'VR_RequestReasons12_Description' THEN [VR_RequestReasons12].[Description] END,
     CASE @OrderBy WHEN 'VR_RequestReasons12_Description DESC' THEN [VR_RequestReasons12].[Description] END DESC 

    SET @RecordCount = @@RowCount

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
		[VR_VehicleRequest].[MICN] ,
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
    	INNER JOIN #PageIndex
          ON [VR_VehicleRequest].[RequestNo] = #PageIndex.RequestNo
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO