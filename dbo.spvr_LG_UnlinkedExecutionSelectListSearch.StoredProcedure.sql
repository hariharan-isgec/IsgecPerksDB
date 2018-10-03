USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvr_LG_UnlinkedExecutionSelectListSearch]
  @Filter_TransporterID NVarChar(9),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SRNNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SRNNo)
  SELECT [VR_RequestExecution].[SRNNo] FROM [VR_RequestExecution]
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_RequestExecution].[ArrangedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [VR_RequestExecution].[ReceiptBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [VR_RequestExecution].[ApprovedBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [VR_RequestExecution].[TraficOfficerDivisionID] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [VR_MaterialStates] AS [VR_MaterialStates5]
    ON [VR_RequestExecution].[MaterialStateID] = [VR_MaterialStates5].[MaterialStateID]
  INNER JOIN [VR_RequestStates] AS [VR_RequestStates6]
    ON [VR_RequestExecution].[RequestStatusID] = [VR_RequestStates6].[StatusID]
  LEFT OUTER JOIN [VR_TransporterBill] AS [VR_TransporterBill7]
    ON [VR_RequestExecution].[IRNo] = [VR_TransporterBill7].[IRNo]
  LEFT OUTER JOIN [VR_Transporters] AS [VR_Transporters8]
    ON [VR_RequestExecution].[TransTransporterID] = [VR_Transporters8].[TransporterID]
  LEFT OUTER JOIN [VR_Transporters] AS [VR_Transporters9]
    ON [VR_RequestExecution].[SiteTransporterID] = [VR_Transporters9].[TransporterID]
  INNER JOIN [VR_Transporters] AS [VR_Transporters10]
    ON [VR_RequestExecution].[TransporterID] = [VR_Transporters10].[TransporterID]
  LEFT OUTER JOIN [VR_Units] AS [VR_Units11]
    ON [VR_RequestExecution].[ReceiptSizeUnit] = [VR_Units11].[UnitID]
  LEFT OUTER JOIN [VR_VehicleTypes] AS [VR_VehicleTypes12]
    ON [VR_RequestExecution].[SiteVehicleTypeID] = [VR_VehicleTypes12].[VehicleTypeID]
  INNER JOIN [VR_VehicleTypes] AS [VR_VehicleTypes13]
    ON [VR_RequestExecution].[VehicleTypeID] = [VR_VehicleTypes13].[VehicleTypeID]
  LEFT OUTER JOIN [VR_VehicleTypes] AS [VR_VehicleTypes14]
    ON [VR_RequestExecution].[TransVehicleTypeID] = [VR_VehicleTypes14].[VehicleTypeID]
  LEFT OUTER JOIN [VR_Units] AS [VR_Units1]
    ON [VR_RequestExecution].[SizeUnit] = [VR_Units1].[UnitID]
  LEFT OUTER JOIN [VR_Units] AS [VR_Units2]
    ON [VR_RequestExecution].[WeightUnit] = [VR_Units2].[UnitID]
  LEFT OUTER JOIN [VR_LinkExecutions] AS [VR_LinkExecutions15]
    ON [VR_RequestExecution].[LinkID] = [VR_LinkExecutions15].[LinkID]
    AND [VR_RequestExecution].[SRNNo] = [VR_LinkExecutions15].[SRNNo]
  LEFT OUTER JOIN [VR_ODCReasons] AS [VR_ODCReasons16]
    ON [VR_RequestExecution].[ODCReasonID] = [VR_ODCReasons16].[ReasonID]
--Request Sates 10-ODCApproved,13-Self Approved,22-Delayed Approved, 25-Detention Approved
  WHERE [VR_RequestExecution].[RequestStatusID] IN (10,13,22,25) 
    AND   [VR_RequestExecution].[IRNO] IS NULL 
--If Linked Then Only Main
    AND   ([VR_RequestExecution].[Linked] = 0 OR ([VR_RequestExecution].[Linked]=1 AND [VR_RequestExecution].[SRNNo]=[VR_RequestExecution].[LinkID] ) ) 
    AND [VR_RequestExecution].[TransporterID] = @Filter_TransporterID 
   AND ( 
         STR(ISNULL([VR_RequestExecution].[SRNNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[ExecutionDescription],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[TransporterID],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[VehicleTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[VehicleNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[ArrangedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[TraficOfficerDivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[RequestStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[ApprovalRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[ApprovedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[GRNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[TransGRNO],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[TransVehicleNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[TransVehicleTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[TransTransporterID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[ReceiptBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[MaterialStateID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[ReceiptMaterialSize],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[ReceiptMaterialWeight], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[ReceiptSizeUnit], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[ReceiptNoOfPackages], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[SiteReceiptNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[ReceiptRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[SiteGRNO],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[SiteVehicleNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[SiteVehicleTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[SiteTransporterID],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[IRNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[MaterialSize],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[SizeUnit], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[Height], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[Width], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[Length], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[MaterialWeight], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[WeightUnit], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[NoOfPackages], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[GRRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[TransRemarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[LinkID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[DebitAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[PayableAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[ISGECAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[SupplierAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_RequestExecution].[EmptyReturnRemarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_RequestExecution].[ODCReasonID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SRNNo' THEN [VR_RequestExecution].[SRNNo] END,
     CASE @OrderBy WHEN 'SRNNo DESC' THEN [VR_RequestExecution].[SRNNo] END DESC,
     CASE @OrderBy WHEN 'ExecutionDescription' THEN [VR_RequestExecution].[ExecutionDescription] END,
     CASE @OrderBy WHEN 'ExecutionDescription DESC' THEN [VR_RequestExecution].[ExecutionDescription] END DESC,
     CASE @OrderBy WHEN 'TransporterID' THEN [VR_RequestExecution].[TransporterID] END,
     CASE @OrderBy WHEN 'TransporterID DESC' THEN [VR_RequestExecution].[TransporterID] END DESC,
     CASE @OrderBy WHEN 'VehiclePlacedOn' THEN [VR_RequestExecution].[VehiclePlacedOn] END,
     CASE @OrderBy WHEN 'VehiclePlacedOn DESC' THEN [VR_RequestExecution].[VehiclePlacedOn] END DESC,
     CASE @OrderBy WHEN 'VehicleTypeID' THEN [VR_RequestExecution].[VehicleTypeID] END,
     CASE @OrderBy WHEN 'VehicleTypeID DESC' THEN [VR_RequestExecution].[VehicleTypeID] END DESC,
     CASE @OrderBy WHEN 'VehicleNo' THEN [VR_RequestExecution].[VehicleNo] END,
     CASE @OrderBy WHEN 'VehicleNo DESC' THEN [VR_RequestExecution].[VehicleNo] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [VR_RequestExecution].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [VR_RequestExecution].[Remarks] END DESC,
     CASE @OrderBy WHEN 'ArrangedBy' THEN [VR_RequestExecution].[ArrangedBy] END,
     CASE @OrderBy WHEN 'ArrangedBy DESC' THEN [VR_RequestExecution].[ArrangedBy] END DESC,
     CASE @OrderBy WHEN 'ArrangedOn' THEN [VR_RequestExecution].[ArrangedOn] END,
     CASE @OrderBy WHEN 'ArrangedOn DESC' THEN [VR_RequestExecution].[ArrangedOn] END DESC,
     CASE @OrderBy WHEN 'TraficOfficerDivisionID' THEN [VR_RequestExecution].[TraficOfficerDivisionID] END,
     CASE @OrderBy WHEN 'TraficOfficerDivisionID DESC' THEN [VR_RequestExecution].[TraficOfficerDivisionID] END DESC,
     CASE @OrderBy WHEN 'RequestStatusID' THEN [VR_RequestExecution].[RequestStatusID] END,
     CASE @OrderBy WHEN 'RequestStatusID DESC' THEN [VR_RequestExecution].[RequestStatusID] END DESC,
     CASE @OrderBy WHEN 'ApprovalRemarks' THEN [VR_RequestExecution].[ApprovalRemarks] END,
     CASE @OrderBy WHEN 'ApprovalRemarks DESC' THEN [VR_RequestExecution].[ApprovalRemarks] END DESC,
     CASE @OrderBy WHEN 'ApprovedBy' THEN [VR_RequestExecution].[ApprovedBy] END,
     CASE @OrderBy WHEN 'ApprovedBy DESC' THEN [VR_RequestExecution].[ApprovedBy] END DESC,
     CASE @OrderBy WHEN 'ApprovedOn' THEN [VR_RequestExecution].[ApprovedOn] END,
     CASE @OrderBy WHEN 'ApprovedOn DESC' THEN [VR_RequestExecution].[ApprovedOn] END DESC,
     CASE @OrderBy WHEN 'GRNo' THEN [VR_RequestExecution].[GRNo] END,
     CASE @OrderBy WHEN 'GRNo DESC' THEN [VR_RequestExecution].[GRNo] END DESC,
     CASE @OrderBy WHEN 'GRDate' THEN [VR_RequestExecution].[GRDate] END,
     CASE @OrderBy WHEN 'GRDate DESC' THEN [VR_RequestExecution].[GRDate] END DESC,
     CASE @OrderBy WHEN 'LoadedAtSupplier' THEN [VR_RequestExecution].[LoadedAtSupplier] END,
     CASE @OrderBy WHEN 'LoadedAtSupplier DESC' THEN [VR_RequestExecution].[LoadedAtSupplier] END DESC,
     CASE @OrderBy WHEN 'LoadedOn' THEN [VR_RequestExecution].[LoadedOn] END,
     CASE @OrderBy WHEN 'LoadedOn DESC' THEN [VR_RequestExecution].[LoadedOn] END DESC,
     CASE @OrderBy WHEN 'TransShipment' THEN [VR_RequestExecution].[TransShipment] END,
     CASE @OrderBy WHEN 'TransShipment DESC' THEN [VR_RequestExecution].[TransShipment] END DESC,
     CASE @OrderBy WHEN 'TransGRNO' THEN [VR_RequestExecution].[TransGRNO] END,
     CASE @OrderBy WHEN 'TransGRNO DESC' THEN [VR_RequestExecution].[TransGRNO] END DESC,
     CASE @OrderBy WHEN 'TransGRDate' THEN [VR_RequestExecution].[TransGRDate] END,
     CASE @OrderBy WHEN 'TransGRDate DESC' THEN [VR_RequestExecution].[TransGRDate] END DESC,
     CASE @OrderBy WHEN 'TransVehicleNo' THEN [VR_RequestExecution].[TransVehicleNo] END,
     CASE @OrderBy WHEN 'TransVehicleNo DESC' THEN [VR_RequestExecution].[TransVehicleNo] END DESC,
     CASE @OrderBy WHEN 'TransVehicleTypeID' THEN [VR_RequestExecution].[TransVehicleTypeID] END,
     CASE @OrderBy WHEN 'TransVehicleTypeID DESC' THEN [VR_RequestExecution].[TransVehicleTypeID] END DESC,
     CASE @OrderBy WHEN 'TransTransporterID' THEN [VR_RequestExecution].[TransTransporterID] END,
     CASE @OrderBy WHEN 'TransTransporterID DESC' THEN [VR_RequestExecution].[TransTransporterID] END DESC,
     CASE @OrderBy WHEN 'ReceiptAtSite' THEN [VR_RequestExecution].[ReceiptAtSite] END,
     CASE @OrderBy WHEN 'ReceiptAtSite DESC' THEN [VR_RequestExecution].[ReceiptAtSite] END DESC,
     CASE @OrderBy WHEN 'ReceiptBy' THEN [VR_RequestExecution].[ReceiptBy] END,
     CASE @OrderBy WHEN 'ReceiptBy DESC' THEN [VR_RequestExecution].[ReceiptBy] END DESC,
     CASE @OrderBy WHEN 'ReceiptOn' THEN [VR_RequestExecution].[ReceiptOn] END,
     CASE @OrderBy WHEN 'ReceiptOn DESC' THEN [VR_RequestExecution].[ReceiptOn] END DESC,
     CASE @OrderBy WHEN 'MaterialStateID' THEN [VR_RequestExecution].[MaterialStateID] END,
     CASE @OrderBy WHEN 'MaterialStateID DESC' THEN [VR_RequestExecution].[MaterialStateID] END DESC,
     CASE @OrderBy WHEN 'ReceiptMaterialSize' THEN [VR_RequestExecution].[ReceiptMaterialSize] END,
     CASE @OrderBy WHEN 'ReceiptMaterialSize DESC' THEN [VR_RequestExecution].[ReceiptMaterialSize] END DESC,
     CASE @OrderBy WHEN 'ReceiptMaterialWeight' THEN [VR_RequestExecution].[ReceiptMaterialWeight] END,
     CASE @OrderBy WHEN 'ReceiptMaterialWeight DESC' THEN [VR_RequestExecution].[ReceiptMaterialWeight] END DESC,
     CASE @OrderBy WHEN 'ReceiptSizeUnit' THEN [VR_RequestExecution].[ReceiptSizeUnit] END,
     CASE @OrderBy WHEN 'ReceiptSizeUnit DESC' THEN [VR_RequestExecution].[ReceiptSizeUnit] END DESC,
     CASE @OrderBy WHEN 'ReceiptNoOfPackages' THEN [VR_RequestExecution].[ReceiptNoOfPackages] END,
     CASE @OrderBy WHEN 'ReceiptNoOfPackages DESC' THEN [VR_RequestExecution].[ReceiptNoOfPackages] END DESC,
     CASE @OrderBy WHEN 'ReachedAtSite' THEN [VR_RequestExecution].[ReachedAtSite] END,
     CASE @OrderBy WHEN 'ReachedAtSite DESC' THEN [VR_RequestExecution].[ReachedAtSite] END DESC,
     CASE @OrderBy WHEN 'ReachedOn' THEN [VR_RequestExecution].[ReachedOn] END,
     CASE @OrderBy WHEN 'ReachedOn DESC' THEN [VR_RequestExecution].[ReachedOn] END DESC,
     CASE @OrderBy WHEN 'UnloadedAtSite' THEN [VR_RequestExecution].[UnloadedAtSite] END,
     CASE @OrderBy WHEN 'UnloadedAtSite DESC' THEN [VR_RequestExecution].[UnloadedAtSite] END DESC,
     CASE @OrderBy WHEN 'UnloadedOn' THEN [VR_RequestExecution].[UnloadedOn] END,
     CASE @OrderBy WHEN 'UnloadedOn DESC' THEN [VR_RequestExecution].[UnloadedOn] END DESC,
     CASE @OrderBy WHEN 'SiteReceiptNo' THEN [VR_RequestExecution].[SiteReceiptNo] END,
     CASE @OrderBy WHEN 'SiteReceiptNo DESC' THEN [VR_RequestExecution].[SiteReceiptNo] END DESC,
     CASE @OrderBy WHEN 'SiteReceiptDate' THEN [VR_RequestExecution].[SiteReceiptDate] END,
     CASE @OrderBy WHEN 'SiteReceiptDate DESC' THEN [VR_RequestExecution].[SiteReceiptDate] END DESC,
     CASE @OrderBy WHEN 'ReceiptRemarks' THEN [VR_RequestExecution].[ReceiptRemarks] END,
     CASE @OrderBy WHEN 'ReceiptRemarks DESC' THEN [VR_RequestExecution].[ReceiptRemarks] END DESC,
     CASE @OrderBy WHEN 'TransShipmentAtSite' THEN [VR_RequestExecution].[TransShipmentAtSite] END,
     CASE @OrderBy WHEN 'TransShipmentAtSite DESC' THEN [VR_RequestExecution].[TransShipmentAtSite] END DESC,
     CASE @OrderBy WHEN 'SiteGRNO' THEN [VR_RequestExecution].[SiteGRNO] END,
     CASE @OrderBy WHEN 'SiteGRNO DESC' THEN [VR_RequestExecution].[SiteGRNO] END DESC,
     CASE @OrderBy WHEN 'SiteGRDate' THEN [VR_RequestExecution].[SiteGRDate] END,
     CASE @OrderBy WHEN 'SiteGRDate DESC' THEN [VR_RequestExecution].[SiteGRDate] END DESC,
     CASE @OrderBy WHEN 'SiteVehicleNo' THEN [VR_RequestExecution].[SiteVehicleNo] END,
     CASE @OrderBy WHEN 'SiteVehicleNo DESC' THEN [VR_RequestExecution].[SiteVehicleNo] END DESC,
     CASE @OrderBy WHEN 'SiteVehicleTypeID' THEN [VR_RequestExecution].[SiteVehicleTypeID] END,
     CASE @OrderBy WHEN 'SiteVehicleTypeID DESC' THEN [VR_RequestExecution].[SiteVehicleTypeID] END DESC,
     CASE @OrderBy WHEN 'SiteTransporterID' THEN [VR_RequestExecution].[SiteTransporterID] END,
     CASE @OrderBy WHEN 'SiteTransporterID DESC' THEN [VR_RequestExecution].[SiteTransporterID] END DESC,
     CASE @OrderBy WHEN 'IRNo' THEN [VR_RequestExecution].[IRNo] END,
     CASE @OrderBy WHEN 'IRNo DESC' THEN [VR_RequestExecution].[IRNo] END DESC,
     CASE @OrderBy WHEN 'MaterialSize' THEN [VR_RequestExecution].[MaterialSize] END,
     CASE @OrderBy WHEN 'MaterialSize DESC' THEN [VR_RequestExecution].[MaterialSize] END DESC,
     CASE @OrderBy WHEN 'SizeUnit' THEN [VR_RequestExecution].[SizeUnit] END,
     CASE @OrderBy WHEN 'SizeUnit DESC' THEN [VR_RequestExecution].[SizeUnit] END DESC,
     CASE @OrderBy WHEN 'Height' THEN [VR_RequestExecution].[Height] END,
     CASE @OrderBy WHEN 'Height DESC' THEN [VR_RequestExecution].[Height] END DESC,
     CASE @OrderBy WHEN 'Width' THEN [VR_RequestExecution].[Width] END,
     CASE @OrderBy WHEN 'Width DESC' THEN [VR_RequestExecution].[Width] END DESC,
     CASE @OrderBy WHEN 'Length' THEN [VR_RequestExecution].[Length] END,
     CASE @OrderBy WHEN 'Length DESC' THEN [VR_RequestExecution].[Length] END DESC,
     CASE @OrderBy WHEN 'MaterialWeight' THEN [VR_RequestExecution].[MaterialWeight] END,
     CASE @OrderBy WHEN 'MaterialWeight DESC' THEN [VR_RequestExecution].[MaterialWeight] END DESC,
     CASE @OrderBy WHEN 'WeightUnit' THEN [VR_RequestExecution].[WeightUnit] END,
     CASE @OrderBy WHEN 'WeightUnit DESC' THEN [VR_RequestExecution].[WeightUnit] END DESC,
     CASE @OrderBy WHEN 'NoOfPackages' THEN [VR_RequestExecution].[NoOfPackages] END,
     CASE @OrderBy WHEN 'NoOfPackages DESC' THEN [VR_RequestExecution].[NoOfPackages] END DESC,
     CASE @OrderBy WHEN 'OverDimentionConsignement' THEN [VR_RequestExecution].[OverDimentionConsignement] END,
     CASE @OrderBy WHEN 'OverDimentionConsignement DESC' THEN [VR_RequestExecution].[OverDimentionConsignement] END DESC,
     CASE @OrderBy WHEN 'GRRemarks' THEN [VR_RequestExecution].[GRRemarks] END,
     CASE @OrderBy WHEN 'GRRemarks DESC' THEN [VR_RequestExecution].[GRRemarks] END DESC,
     CASE @OrderBy WHEN 'TransRemarks' THEN [VR_RequestExecution].[TransRemarks] END,
     CASE @OrderBy WHEN 'TransRemarks DESC' THEN [VR_RequestExecution].[TransRemarks] END DESC,
     CASE @OrderBy WHEN 'ReachedAtSupplierOn' THEN [VR_RequestExecution].[ReachedAtSupplierOn] END,
     CASE @OrderBy WHEN 'ReachedAtSupplierOn DESC' THEN [VR_RequestExecution].[ReachedAtSupplierOn] END DESC,
     CASE @OrderBy WHEN 'ODCByRequest' THEN [VR_RequestExecution].[ODCByRequest] END,
     CASE @OrderBy WHEN 'ODCByRequest DESC' THEN [VR_RequestExecution].[ODCByRequest] END DESC,
     CASE @OrderBy WHEN 'Linked' THEN [VR_RequestExecution].[Linked] END,
     CASE @OrderBy WHEN 'Linked DESC' THEN [VR_RequestExecution].[Linked] END DESC,
     CASE @OrderBy WHEN 'LinkID' THEN [VR_RequestExecution].[LinkID] END,
     CASE @OrderBy WHEN 'LinkID DESC' THEN [VR_RequestExecution].[LinkID] END DESC,
     CASE @OrderBy WHEN 'VehicleNotPlaced' THEN [VR_RequestExecution].[VehicleNotPlaced] END,
     CASE @OrderBy WHEN 'VehicleNotPlaced DESC' THEN [VR_RequestExecution].[VehicleNotPlaced] END DESC,
     CASE @OrderBy WHEN 'DelayedPlacement' THEN [VR_RequestExecution].[DelayedPlacement] END,
     CASE @OrderBy WHEN 'DelayedPlacement DESC' THEN [VR_RequestExecution].[DelayedPlacement] END DESC,
     CASE @OrderBy WHEN 'EmptyReturn' THEN [VR_RequestExecution].[EmptyReturn] END,
     CASE @OrderBy WHEN 'EmptyReturn DESC' THEN [VR_RequestExecution].[EmptyReturn] END DESC,
     CASE @OrderBy WHEN 'DetentionAtSupplier' THEN [VR_RequestExecution].[DetentionAtSupplier] END,
     CASE @OrderBy WHEN 'DetentionAtSupplier DESC' THEN [VR_RequestExecution].[DetentionAtSupplier] END DESC,
     CASE @OrderBy WHEN 'DebitToTransporter' THEN [VR_RequestExecution].[DebitToTransporter] END,
     CASE @OrderBy WHEN 'DebitToTransporter DESC' THEN [VR_RequestExecution].[DebitToTransporter] END DESC,
     CASE @OrderBy WHEN 'PayableToTransporter' THEN [VR_RequestExecution].[PayableToTransporter] END,
     CASE @OrderBy WHEN 'PayableToTransporter DESC' THEN [VR_RequestExecution].[PayableToTransporter] END DESC,
     CASE @OrderBy WHEN 'BorneByISGEC' THEN [VR_RequestExecution].[BorneByISGEC] END,
     CASE @OrderBy WHEN 'BorneByISGEC DESC' THEN [VR_RequestExecution].[BorneByISGEC] END DESC,
     CASE @OrderBy WHEN 'BorneBySupplier' THEN [VR_RequestExecution].[BorneBySupplier] END,
     CASE @OrderBy WHEN 'BorneBySupplier DESC' THEN [VR_RequestExecution].[BorneBySupplier] END DESC,
     CASE @OrderBy WHEN 'DebitAmount' THEN [VR_RequestExecution].[DebitAmount] END,
     CASE @OrderBy WHEN 'DebitAmount DESC' THEN [VR_RequestExecution].[DebitAmount] END DESC,
     CASE @OrderBy WHEN 'PayableAmount' THEN [VR_RequestExecution].[PayableAmount] END,
     CASE @OrderBy WHEN 'PayableAmount DESC' THEN [VR_RequestExecution].[PayableAmount] END DESC,
     CASE @OrderBy WHEN 'ISGECAmount' THEN [VR_RequestExecution].[ISGECAmount] END,
     CASE @OrderBy WHEN 'ISGECAmount DESC' THEN [VR_RequestExecution].[ISGECAmount] END DESC,
     CASE @OrderBy WHEN 'SupplierAmount' THEN [VR_RequestExecution].[SupplierAmount] END,
     CASE @OrderBy WHEN 'SupplierAmount DESC' THEN [VR_RequestExecution].[SupplierAmount] END DESC,
     CASE @OrderBy WHEN 'EmptyReturnRemarks' THEN [VR_RequestExecution].[EmptyReturnRemarks] END,
     CASE @OrderBy WHEN 'EmptyReturnRemarks DESC' THEN [VR_RequestExecution].[EmptyReturnRemarks] END DESC,
     CASE @OrderBy WHEN 'ODCReasonID' THEN [VR_RequestExecution].[ODCReasonID] END,
     CASE @OrderBy WHEN 'ODCReasonID DESC' THEN [VR_RequestExecution].[ODCReasonID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description' THEN [HRM_Divisions4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description DESC' THEN [HRM_Divisions4].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_MaterialStates5_Description' THEN [VR_MaterialStates5].[Description] END,
     CASE @OrderBy WHEN 'VR_MaterialStates5_Description DESC' THEN [VR_MaterialStates5].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_RequestStates6_Description' THEN [VR_RequestStates6].[Description] END,
     CASE @OrderBy WHEN 'VR_RequestStates6_Description DESC' THEN [VR_RequestStates6].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_TransporterBill7_IRDescription' THEN [VR_TransporterBill7].[IRDescription] END,
     CASE @OrderBy WHEN 'VR_TransporterBill7_IRDescription DESC' THEN [VR_TransporterBill7].[IRDescription] END DESC,
     CASE @OrderBy WHEN 'VR_Transporters8_TransporterName' THEN [VR_Transporters8].[TransporterName] END,
     CASE @OrderBy WHEN 'VR_Transporters8_TransporterName DESC' THEN [VR_Transporters8].[TransporterName] END DESC,
     CASE @OrderBy WHEN 'VR_Transporters9_TransporterName' THEN [VR_Transporters9].[TransporterName] END,
     CASE @OrderBy WHEN 'VR_Transporters9_TransporterName DESC' THEN [VR_Transporters9].[TransporterName] END DESC,
     CASE @OrderBy WHEN 'VR_Transporters10_TransporterName' THEN [VR_Transporters10].[TransporterName] END,
     CASE @OrderBy WHEN 'VR_Transporters10_TransporterName DESC' THEN [VR_Transporters10].[TransporterName] END DESC,
     CASE @OrderBy WHEN 'VR_Units11_Description' THEN [VR_Units11].[Description] END,
     CASE @OrderBy WHEN 'VR_Units11_Description DESC' THEN [VR_Units11].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_VehicleTypes12_cmba' THEN [VR_VehicleTypes12].[cmba] END,
     CASE @OrderBy WHEN 'VR_VehicleTypes12_cmba DESC' THEN [VR_VehicleTypes12].[cmba] END DESC,
     CASE @OrderBy WHEN 'VR_VehicleTypes13_cmba' THEN [VR_VehicleTypes13].[cmba] END,
     CASE @OrderBy WHEN 'VR_VehicleTypes13_cmba DESC' THEN [VR_VehicleTypes13].[cmba] END DESC,
     CASE @OrderBy WHEN 'VR_VehicleTypes14_cmba' THEN [VR_VehicleTypes14].[cmba] END,
     CASE @OrderBy WHEN 'VR_VehicleTypes14_cmba DESC' THEN [VR_VehicleTypes14].[cmba] END DESC,
     CASE @OrderBy WHEN 'VR_Units1_Description' THEN [VR_Units1].[Description] END,
     CASE @OrderBy WHEN 'VR_Units1_Description DESC' THEN [VR_Units1].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_Units2_Description' THEN [VR_Units2].[Description] END,
     CASE @OrderBy WHEN 'VR_Units2_Description DESC' THEN [VR_Units2].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_ODCReasons16_Description' THEN [VR_ODCReasons16].[Description] END,
     CASE @OrderBy WHEN 'VR_ODCReasons16_Description DESC' THEN [VR_ODCReasons16].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[VR_RequestExecution].* ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[VR_MaterialStates5].[Description] AS VR_MaterialStates5_Description,
		[VR_RequestStates6].[Description] AS VR_RequestStates6_Description,
		[VR_TransporterBill7].[IRDescription] AS VR_TransporterBill7_IRDescription,
		[VR_Transporters8].[TransporterName] AS VR_Transporters8_TransporterName,
		[VR_Transporters9].[TransporterName] AS VR_Transporters9_TransporterName,
		[VR_Transporters10].[TransporterName] AS VR_Transporters10_TransporterName,
		[VR_Units11].[Description] AS VR_Units11_Description,
		[VR_VehicleTypes12].[cmba] AS VR_VehicleTypes12_cmba,
		[VR_VehicleTypes13].[cmba] AS VR_VehicleTypes13_cmba,
		[VR_VehicleTypes14].[cmba] AS VR_VehicleTypes14_cmba,
		[VR_Units1].[Description] AS VR_Units1_Description,
		[VR_Units2].[Description] AS VR_Units2_Description,
		[VR_ODCReasons16].[Description] AS VR_ODCReasons16_Description 
  FROM [VR_RequestExecution] 
    	INNER JOIN #PageIndex
          ON [VR_RequestExecution].[SRNNo] = #PageIndex.SRNNo
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_RequestExecution].[ArrangedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [VR_RequestExecution].[ReceiptBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [VR_RequestExecution].[ApprovedBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [VR_RequestExecution].[TraficOfficerDivisionID] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [VR_MaterialStates] AS [VR_MaterialStates5]
    ON [VR_RequestExecution].[MaterialStateID] = [VR_MaterialStates5].[MaterialStateID]
  INNER JOIN [VR_RequestStates] AS [VR_RequestStates6]
    ON [VR_RequestExecution].[RequestStatusID] = [VR_RequestStates6].[StatusID]
  LEFT OUTER JOIN [VR_TransporterBill] AS [VR_TransporterBill7]
    ON [VR_RequestExecution].[IRNo] = [VR_TransporterBill7].[IRNo]
  LEFT OUTER JOIN [VR_Transporters] AS [VR_Transporters8]
    ON [VR_RequestExecution].[TransTransporterID] = [VR_Transporters8].[TransporterID]
  LEFT OUTER JOIN [VR_Transporters] AS [VR_Transporters9]
    ON [VR_RequestExecution].[SiteTransporterID] = [VR_Transporters9].[TransporterID]
  INNER JOIN [VR_Transporters] AS [VR_Transporters10]
    ON [VR_RequestExecution].[TransporterID] = [VR_Transporters10].[TransporterID]
  LEFT OUTER JOIN [VR_Units] AS [VR_Units11]
    ON [VR_RequestExecution].[ReceiptSizeUnit] = [VR_Units11].[UnitID]
  LEFT OUTER JOIN [VR_VehicleTypes] AS [VR_VehicleTypes12]
    ON [VR_RequestExecution].[SiteVehicleTypeID] = [VR_VehicleTypes12].[VehicleTypeID]
  INNER JOIN [VR_VehicleTypes] AS [VR_VehicleTypes13]
    ON [VR_RequestExecution].[VehicleTypeID] = [VR_VehicleTypes13].[VehicleTypeID]
  LEFT OUTER JOIN [VR_VehicleTypes] AS [VR_VehicleTypes14]
    ON [VR_RequestExecution].[TransVehicleTypeID] = [VR_VehicleTypes14].[VehicleTypeID]
  LEFT OUTER JOIN [VR_Units] AS [VR_Units1]
    ON [VR_RequestExecution].[SizeUnit] = [VR_Units1].[UnitID]
  LEFT OUTER JOIN [VR_Units] AS [VR_Units2]
    ON [VR_RequestExecution].[WeightUnit] = [VR_Units2].[UnitID]
  LEFT OUTER JOIN [VR_LinkExecutions] AS [VR_LinkExecutions15]
    ON [VR_RequestExecution].[LinkID] = [VR_LinkExecutions15].[LinkID]
    AND [VR_RequestExecution].[SRNNo] = [VR_LinkExecutions15].[SRNNo]
  LEFT OUTER JOIN [VR_ODCReasons] AS [VR_ODCReasons16]
    ON [VR_RequestExecution].[ODCReasonID] = [VR_ODCReasons16].[ReasonID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
