USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrReqReasonByExecuterSelectListFilteres]
  @Filter_SupplierID NVarChar(9),
  @Filter_ProjectID NVarChar(6),
  @Filter_VehicleTypeID Int,
  @Filter_RequestedBy NVarChar(8),
  @Filter_RequestStatus Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @RequestStatus Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RequestNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_VehicleRequest].[RequestNo]'
  SET @LGSQL = @LGSQL + ' FROM [VR_VehicleRequest] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequest].[RequestedBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequest].[ReturnedBy] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions3]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequest].[RequesterDivisionID] = [HRM_Divisions3].[DivisionID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects4]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequest].[ProjectID] = [IDM_Projects4].[ProjectID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Vendors] AS [IDM_Vendors5]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequest].[SupplierID] = [IDM_Vendors5].[VendorID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_RequestExecution] AS [VR_RequestExecution6]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequest].[SRNNo] = [VR_RequestExecution6].[SRNNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [VR_RequestStates] AS [VR_RequestStates7]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequest].[RequestStatus] = [VR_RequestStates7].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_Units] AS [VR_Units8]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequest].[SizeUnit] = [VR_Units8].[UnitID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [VR_VehicleTypes] AS [VR_VehicleTypes9]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequest].[VehicleTypeID] = [VR_VehicleTypes9].[VehicleTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_ODCReasons] AS [VR_ODCReasons1]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequest].[ODCReasonID] = [VR_ODCReasons1].[ReasonID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_Units] AS [VR_Units2]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequest].[WeightUnit] = [VR_Units2].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users10]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequest].[BuyerInERP] = [aspnet_Users10].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users11]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequest].[ExecuterID] = [aspnet_Users11].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_RequestReasons] AS [VR_RequestReasons12]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequest].[ExecuterReasonID] = [VR_RequestReasons12].[ReasonID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [VR_VehicleRequest].[RequestStatus] = ''' + STR(@RequestStatus) + '''' 
  IF (@Filter_SupplierID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_VehicleRequest].[SupplierID] = ''' + @Filter_SupplierID + ''''
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_VehicleRequest].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_VehicleTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [VR_VehicleRequest].[VehicleTypeID] = ' + STR(@Filter_VehicleTypeID)
  IF (@Filter_RequestedBy > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_VehicleRequest].[RequestedBy] = ''' + @Filter_RequestedBy + ''''
  IF (@Filter_RequestStatus > 0) 
    SET @LGSQL = @LGSQL + ' AND [VR_VehicleRequest].[RequestStatus] = ' + STR(@Filter_RequestStatus)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestNo' THEN '[VR_VehicleRequest].[RequestNo]'
                        WHEN 'RequestNo DESC' THEN '[VR_VehicleRequest].[RequestNo] DESC'
                        WHEN 'RequestDescription' THEN '[VR_VehicleRequest].[RequestDescription]'
                        WHEN 'RequestDescription DESC' THEN '[VR_VehicleRequest].[RequestDescription] DESC'
                        WHEN 'SupplierID' THEN '[VR_VehicleRequest].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[VR_VehicleRequest].[SupplierID] DESC'
                        WHEN 'SupplierLocation' THEN '[VR_VehicleRequest].[SupplierLocation]'
                        WHEN 'SupplierLocation DESC' THEN '[VR_VehicleRequest].[SupplierLocation] DESC'
                        WHEN 'ProjectID' THEN '[VR_VehicleRequest].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[VR_VehicleRequest].[ProjectID] DESC'
                        WHEN 'ProjectType' THEN '[VR_VehicleRequest].[ProjectType]'
                        WHEN 'ProjectType DESC' THEN '[VR_VehicleRequest].[ProjectType] DESC'
                        WHEN 'DeliveryLocation' THEN '[VR_VehicleRequest].[DeliveryLocation]'
                        WHEN 'DeliveryLocation DESC' THEN '[VR_VehicleRequest].[DeliveryLocation] DESC'
                        WHEN 'ItemDescription' THEN '[VR_VehicleRequest].[ItemDescription]'
                        WHEN 'ItemDescription DESC' THEN '[VR_VehicleRequest].[ItemDescription] DESC'
                        WHEN 'MaterialSize' THEN '[VR_VehicleRequest].[MaterialSize]'
                        WHEN 'MaterialSize DESC' THEN '[VR_VehicleRequest].[MaterialSize] DESC'
                        WHEN 'SizeUnit' THEN '[VR_VehicleRequest].[SizeUnit]'
                        WHEN 'SizeUnit DESC' THEN '[VR_VehicleRequest].[SizeUnit] DESC'
                        WHEN 'Height' THEN '[VR_VehicleRequest].[Height]'
                        WHEN 'Height DESC' THEN '[VR_VehicleRequest].[Height] DESC'
                        WHEN 'Width' THEN '[VR_VehicleRequest].[Width]'
                        WHEN 'Width DESC' THEN '[VR_VehicleRequest].[Width] DESC'
                        WHEN 'Length' THEN '[VR_VehicleRequest].[Length]'
                        WHEN 'Length DESC' THEN '[VR_VehicleRequest].[Length] DESC'
                        WHEN 'MaterialWeight' THEN '[VR_VehicleRequest].[MaterialWeight]'
                        WHEN 'MaterialWeight DESC' THEN '[VR_VehicleRequest].[MaterialWeight] DESC'
                        WHEN 'WeightUnit' THEN '[VR_VehicleRequest].[WeightUnit]'
                        WHEN 'WeightUnit DESC' THEN '[VR_VehicleRequest].[WeightUnit] DESC'
                        WHEN 'NoOfPackages' THEN '[VR_VehicleRequest].[NoOfPackages]'
                        WHEN 'NoOfPackages DESC' THEN '[VR_VehicleRequest].[NoOfPackages] DESC'
                        WHEN 'VehicleTypeID' THEN '[VR_VehicleRequest].[VehicleTypeID]'
                        WHEN 'VehicleTypeID DESC' THEN '[VR_VehicleRequest].[VehicleTypeID] DESC'
                        WHEN 'VehicleRequiredOn' THEN '[VR_VehicleRequest].[VehicleRequiredOn]'
                        WHEN 'VehicleRequiredOn DESC' THEN '[VR_VehicleRequest].[VehicleRequiredOn] DESC'
                        WHEN 'OverDimentionConsignement' THEN '[VR_VehicleRequest].[OverDimentionConsignement]'
                        WHEN 'OverDimentionConsignement DESC' THEN '[VR_VehicleRequest].[OverDimentionConsignement] DESC'
                        WHEN 'ODCReasonID' THEN '[VR_VehicleRequest].[ODCReasonID]'
                        WHEN 'ODCReasonID DESC' THEN '[VR_VehicleRequest].[ODCReasonID] DESC'
                        WHEN 'Remarks' THEN '[VR_VehicleRequest].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[VR_VehicleRequest].[Remarks] DESC'
                        WHEN 'CustomInvoiceNo' THEN '[VR_VehicleRequest].[CustomInvoiceNo]'
                        WHEN 'CustomInvoiceNo DESC' THEN '[VR_VehicleRequest].[CustomInvoiceNo] DESC'
                        WHEN 'RequestedBy' THEN '[VR_VehicleRequest].[RequestedBy]'
                        WHEN 'RequestedBy DESC' THEN '[VR_VehicleRequest].[RequestedBy] DESC'
                        WHEN 'RequestedOn' THEN '[VR_VehicleRequest].[RequestedOn]'
                        WHEN 'RequestedOn DESC' THEN '[VR_VehicleRequest].[RequestedOn] DESC'
                        WHEN 'RequesterDivisionID' THEN '[VR_VehicleRequest].[RequesterDivisionID]'
                        WHEN 'RequesterDivisionID DESC' THEN '[VR_VehicleRequest].[RequesterDivisionID] DESC'
                        WHEN 'RequestStatus' THEN '[VR_VehicleRequest].[RequestStatus]'
                        WHEN 'RequestStatus DESC' THEN '[VR_VehicleRequest].[RequestStatus] DESC'
                        WHEN 'ReturnedOn' THEN '[VR_VehicleRequest].[ReturnedOn]'
                        WHEN 'ReturnedOn DESC' THEN '[VR_VehicleRequest].[ReturnedOn] DESC'
                        WHEN 'ReturnedBy' THEN '[VR_VehicleRequest].[ReturnedBy]'
                        WHEN 'ReturnedBy DESC' THEN '[VR_VehicleRequest].[ReturnedBy] DESC'
                        WHEN 'ReturnRemarks' THEN '[VR_VehicleRequest].[ReturnRemarks]'
                        WHEN 'ReturnRemarks DESC' THEN '[VR_VehicleRequest].[ReturnRemarks] DESC'
                        WHEN 'SRNNo' THEN '[VR_VehicleRequest].[SRNNo]'
                        WHEN 'SRNNo DESC' THEN '[VR_VehicleRequest].[SRNNo] DESC'
                        WHEN 'ValidRequest' THEN '[VR_VehicleRequest].[ValidRequest]'
                        WHEN 'ValidRequest DESC' THEN '[VR_VehicleRequest].[ValidRequest] DESC'
                        WHEN 'ODCAtSupplierLoading' THEN '[VR_VehicleRequest].[ODCAtSupplierLoading]'
                        WHEN 'ODCAtSupplierLoading DESC' THEN '[VR_VehicleRequest].[ODCAtSupplierLoading] DESC'
                        WHEN 'FromLocation' THEN '[VR_VehicleRequest].[FromLocation]'
                        WHEN 'FromLocation DESC' THEN '[VR_VehicleRequest].[FromLocation] DESC'
                        WHEN 'ToLocation' THEN '[VR_VehicleRequest].[ToLocation]'
                        WHEN 'ToLocation DESC' THEN '[VR_VehicleRequest].[ToLocation] DESC'
                        WHEN 'MICN' THEN '[VR_VehicleRequest].[MICN]'
                        WHEN 'MICN DESC' THEN '[VR_VehicleRequest].[MICN] DESC'
                        WHEN 'CustomInvoiceIssued' THEN '[VR_VehicleRequest].[CustomInvoiceIssued]'
                        WHEN 'CustomInvoiceIssued DESC' THEN '[VR_VehicleRequest].[CustomInvoiceIssued] DESC'
                        WHEN 'CT1Issued' THEN '[VR_VehicleRequest].[CT1Issued]'
                        WHEN 'CT1Issued DESC' THEN '[VR_VehicleRequest].[CT1Issued] DESC'
                        WHEN 'ARE1Issued' THEN '[VR_VehicleRequest].[ARE1Issued]'
                        WHEN 'ARE1Issued DESC' THEN '[VR_VehicleRequest].[ARE1Issued] DESC'
                        WHEN 'DIIssued' THEN '[VR_VehicleRequest].[DIIssued]'
                        WHEN 'DIIssued DESC' THEN '[VR_VehicleRequest].[DIIssued] DESC'
                        WHEN 'PaymentChecked' THEN '[VR_VehicleRequest].[PaymentChecked]'
                        WHEN 'PaymentChecked DESC' THEN '[VR_VehicleRequest].[PaymentChecked] DESC'
                        WHEN 'GoodsPacked' THEN '[VR_VehicleRequest].[GoodsPacked]'
                        WHEN 'GoodsPacked DESC' THEN '[VR_VehicleRequest].[GoodsPacked] DESC'
                        WHEN 'POApproved' THEN '[VR_VehicleRequest].[POApproved]'
                        WHEN 'POApproved DESC' THEN '[VR_VehicleRequest].[POApproved] DESC'
                        WHEN 'WayBill' THEN '[VR_VehicleRequest].[WayBill]'
                        WHEN 'WayBill DESC' THEN '[VR_VehicleRequest].[WayBill] DESC'
                        WHEN 'MarkingDetails' THEN '[VR_VehicleRequest].[MarkingDetails]'
                        WHEN 'MarkingDetails DESC' THEN '[VR_VehicleRequest].[MarkingDetails] DESC'
                        WHEN 'TarpaulineRequired' THEN '[VR_VehicleRequest].[TarpaulineRequired]'
                        WHEN 'TarpaulineRequired DESC' THEN '[VR_VehicleRequest].[TarpaulineRequired] DESC'
                        WHEN 'PackageStckable' THEN '[VR_VehicleRequest].[PackageStckable]'
                        WHEN 'PackageStckable DESC' THEN '[VR_VehicleRequest].[PackageStckable] DESC'
                        WHEN 'InvoiceValue' THEN '[VR_VehicleRequest].[InvoiceValue]'
                        WHEN 'InvoiceValue DESC' THEN '[VR_VehicleRequest].[InvoiceValue] DESC'
                        WHEN 'OutOfContract' THEN '[VR_VehicleRequest].[OutOfContract]'
                        WHEN 'OutOfContract DESC' THEN '[VR_VehicleRequest].[OutOfContract] DESC'
                        WHEN 'ERPPONumber' THEN '[VR_VehicleRequest].[ERPPONumber]'
                        WHEN 'ERPPONumber DESC' THEN '[VR_VehicleRequest].[ERPPONumber] DESC'
                        WHEN 'BuyerInERP' THEN '[VR_VehicleRequest].[BuyerInERP]'
                        WHEN 'BuyerInERP DESC' THEN '[VR_VehicleRequest].[BuyerInERP] DESC'
                        WHEN 'ExecuterReasonID' THEN '[VR_VehicleRequest].[ExecuterReasonID]'
                        WHEN 'ExecuterReasonID DESC' THEN '[VR_VehicleRequest].[ExecuterReasonID] DESC'
                        WHEN 'ExecuterID' THEN '[VR_VehicleRequest].[ExecuterID]'
                        WHEN 'ExecuterID DESC' THEN '[VR_VehicleRequest].[ExecuterID] DESC'
                        WHEN 'ReasonEneteredOn' THEN '[VR_VehicleRequest].[ReasonEneteredOn]'
                        WHEN 'ReasonEneteredOn DESC' THEN '[VR_VehicleRequest].[ReasonEneteredOn] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'HRM_Divisions3_Description' THEN '[HRM_Divisions3].[Description]'
                        WHEN 'HRM_Divisions3_Description DESC' THEN '[HRM_Divisions3].[Description] DESC'
                        WHEN 'IDM_Projects4_Description' THEN '[IDM_Projects4].[Description]'
                        WHEN 'IDM_Projects4_Description DESC' THEN '[IDM_Projects4].[Description] DESC'
                        WHEN 'IDM_Vendors5_Description' THEN '[IDM_Vendors5].[Description]'
                        WHEN 'IDM_Vendors5_Description DESC' THEN '[IDM_Vendors5].[Description] DESC'
                        WHEN 'VR_RequestExecution6_ExecutionDescription' THEN '[VR_RequestExecution6].[ExecutionDescription]'
                        WHEN 'VR_RequestExecution6_ExecutionDescription DESC' THEN '[VR_RequestExecution6].[ExecutionDescription] DESC'
                        WHEN 'VR_RequestStates7_Description' THEN '[VR_RequestStates7].[Description]'
                        WHEN 'VR_RequestStates7_Description DESC' THEN '[VR_RequestStates7].[Description] DESC'
                        WHEN 'VR_Units8_Description' THEN '[VR_Units8].[Description]'
                        WHEN 'VR_Units8_Description DESC' THEN '[VR_Units8].[Description] DESC'
                        WHEN 'VR_VehicleTypes9_cmba' THEN '[VR_VehicleTypes9].[cmba]'
                        WHEN 'VR_VehicleTypes9_cmba DESC' THEN '[VR_VehicleTypes9].[cmba] DESC'
                        WHEN 'VR_ODCReasons1_Description' THEN '[VR_ODCReasons1].[Description]'
                        WHEN 'VR_ODCReasons1_Description DESC' THEN '[VR_ODCReasons1].[Description] DESC'
                        WHEN 'VR_Units2_Description' THEN '[VR_Units2].[Description]'
                        WHEN 'VR_Units2_Description DESC' THEN '[VR_Units2].[Description] DESC'
                        WHEN 'aspnet_Users10_UserFullName' THEN '[aspnet_Users10].[UserFullName]'
                        WHEN 'aspnet_Users10_UserFullName DESC' THEN '[aspnet_Users10].[UserFullName] DESC'
                        WHEN 'aspnet_Users11_UserFullName' THEN '[aspnet_Users11].[UserFullName]'
                        WHEN 'aspnet_Users11_UserFullName DESC' THEN '[aspnet_Users11].[UserFullName] DESC'
                        WHEN 'VR_RequestReasons12_Description' THEN '[VR_RequestReasons12].[Description]'
                        WHEN 'VR_RequestReasons12_Description DESC' THEN '[VR_RequestReasons12].[Description] DESC'
                        ELSE '[VR_VehicleRequest].[RequestNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
