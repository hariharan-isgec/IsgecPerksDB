USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrExecutionApprovalSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @RequestStatusID Int,
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
 WHERE  
      [VR_RequestExecution].[RequestStatusID] = (@RequestStatusID)
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
     CASE @OrderBy WHEN 'VR_VehicleTypes12_Description' THEN [VR_VehicleTypes12].[Description] END,
     CASE @OrderBy WHEN 'VR_VehicleTypes12_Description DESC' THEN [VR_VehicleTypes12].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_VehicleTypes13_Description' THEN [VR_VehicleTypes13].[Description] END,
     CASE @OrderBy WHEN 'VR_VehicleTypes13_Description DESC' THEN [VR_VehicleTypes13].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_VehicleTypes14_Description' THEN [VR_VehicleTypes14].[Description] END,
     CASE @OrderBy WHEN 'VR_VehicleTypes14_Description DESC' THEN [VR_VehicleTypes14].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[VR_RequestExecution].[SRNNo] ,
		[VR_RequestExecution].[ExecutionDescription] ,
		[VR_RequestExecution].[TransporterID] ,
		[VR_RequestExecution].[VehiclePlacedOn] ,
		[VR_RequestExecution].[VehicleTypeID] ,
		[VR_RequestExecution].[VehicleNo] ,
		[VR_RequestExecution].[Remarks] ,
		[VR_RequestExecution].[ArrangedBy] ,
		[VR_RequestExecution].[ArrangedOn] ,
		[VR_RequestExecution].[TraficOfficerDivisionID] ,
		[VR_RequestExecution].[RequestStatusID] ,
		[VR_RequestExecution].[ApprovalRemarks] ,
		[VR_RequestExecution].[ApprovedBy] ,
		[VR_RequestExecution].[ApprovedOn] ,
		[VR_RequestExecution].[GRNo] ,
		[VR_RequestExecution].[GRDate] ,
		[VR_RequestExecution].[LoadedAtSupplier] ,
		[VR_RequestExecution].[LoadedOn] ,
		[VR_RequestExecution].[TransShipment] ,
		[VR_RequestExecution].[TransGRNO] ,
		[VR_RequestExecution].[TransGRDate] ,
		[VR_RequestExecution].[TransVehicleNo] ,
		[VR_RequestExecution].[TransVehicleTypeID] ,
		[VR_RequestExecution].[TransTransporterID] ,
		[VR_RequestExecution].[ReceiptAtSite] ,
		[VR_RequestExecution].[ReceiptBy] ,
		[VR_RequestExecution].[ReceiptOn] ,
		[VR_RequestExecution].[MaterialStateID] ,
		[VR_RequestExecution].[ReceiptMaterialSize] ,
		[VR_RequestExecution].[ReceiptMaterialWeight] ,
		[VR_RequestExecution].[ReceiptSizeUnit] ,
		[VR_RequestExecution].[ReceiptNoOfPackages] ,
		[VR_RequestExecution].[ReachedAtSite] ,
		[VR_RequestExecution].[ReachedOn] ,
		[VR_RequestExecution].[UnloadedAtSite] ,
		[VR_RequestExecution].[UnloadedOn] ,
		[VR_RequestExecution].[SiteReceiptNo] ,
		[VR_RequestExecution].[SiteReceiptDate] ,
		[VR_RequestExecution].[ReceiptRemarks] ,
		[VR_RequestExecution].[TransShipmentAtSite] ,
		[VR_RequestExecution].[SiteGRNO] ,
		[VR_RequestExecution].[SiteGRDate] ,
		[VR_RequestExecution].[SiteVehicleNo] ,
		[VR_RequestExecution].[SiteVehicleTypeID] ,
		[VR_RequestExecution].[SiteTransporterID] ,
		[VR_RequestExecution].[IRNo] ,
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
		[VR_VehicleTypes12].[Description] AS VR_VehicleTypes12_Description,
		[VR_VehicleTypes13].[Description] AS VR_VehicleTypes13_Description,
		[VR_VehicleTypes14].[Description] AS VR_VehicleTypes14_Description 
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
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
