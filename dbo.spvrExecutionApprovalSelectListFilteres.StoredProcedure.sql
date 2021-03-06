USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrExecutionApprovalSelectListFilteres]
  @Filter_TransporterID NVarChar(9),
  @Filter_VehicleTypeID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @RequestStatusID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SRNNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SRNNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_RequestExecution].[SRNNo]'
  SET @LGSQL = @LGSQL + ' FROM [VR_RequestExecution] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [VR_RequestExecution].[ArrangedBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [VR_RequestExecution].[ReceiptBy] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]'
  SET @LGSQL = @LGSQL + '    ON [VR_RequestExecution].[ApprovedBy] = [aspnet_Users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]'
  SET @LGSQL = @LGSQL + '    ON [VR_RequestExecution].[TraficOfficerDivisionID] = [HRM_Divisions4].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_MaterialStates] AS [VR_MaterialStates5]'
  SET @LGSQL = @LGSQL + '    ON [VR_RequestExecution].[MaterialStateID] = [VR_MaterialStates5].[MaterialStateID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [VR_RequestStates] AS [VR_RequestStates6]'
  SET @LGSQL = @LGSQL + '    ON [VR_RequestExecution].[RequestStatusID] = [VR_RequestStates6].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_TransporterBill] AS [VR_TransporterBill7]'
  SET @LGSQL = @LGSQL + '    ON [VR_RequestExecution].[IRNo] = [VR_TransporterBill7].[IRNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_Transporters] AS [VR_Transporters8]'
  SET @LGSQL = @LGSQL + '    ON [VR_RequestExecution].[TransTransporterID] = [VR_Transporters8].[TransporterID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_Transporters] AS [VR_Transporters9]'
  SET @LGSQL = @LGSQL + '    ON [VR_RequestExecution].[SiteTransporterID] = [VR_Transporters9].[TransporterID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [VR_Transporters] AS [VR_Transporters10]'
  SET @LGSQL = @LGSQL + '    ON [VR_RequestExecution].[TransporterID] = [VR_Transporters10].[TransporterID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_Units] AS [VR_Units11]'
  SET @LGSQL = @LGSQL + '    ON [VR_RequestExecution].[ReceiptSizeUnit] = [VR_Units11].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_VehicleTypes] AS [VR_VehicleTypes12]'
  SET @LGSQL = @LGSQL + '    ON [VR_RequestExecution].[SiteVehicleTypeID] = [VR_VehicleTypes12].[VehicleTypeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [VR_VehicleTypes] AS [VR_VehicleTypes13]'
  SET @LGSQL = @LGSQL + '    ON [VR_RequestExecution].[VehicleTypeID] = [VR_VehicleTypes13].[VehicleTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_VehicleTypes] AS [VR_VehicleTypes14]'
  SET @LGSQL = @LGSQL + '    ON [VR_RequestExecution].[TransVehicleTypeID] = [VR_VehicleTypes14].[VehicleTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [VR_RequestExecution].[RequestStatusID] = ''' + STR(@RequestStatusID) + '''' 
  IF (@Filter_TransporterID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_RequestExecution].[TransporterID] = ''' + @Filter_TransporterID + ''''
  IF (@Filter_VehicleTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [VR_RequestExecution].[VehicleTypeID] = ' + STR(@Filter_VehicleTypeID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SRNNo' THEN '[VR_RequestExecution].[SRNNo]'
                        WHEN 'SRNNo DESC' THEN '[VR_RequestExecution].[SRNNo] DESC'
                        WHEN 'ExecutionDescription' THEN '[VR_RequestExecution].[ExecutionDescription]'
                        WHEN 'ExecutionDescription DESC' THEN '[VR_RequestExecution].[ExecutionDescription] DESC'
                        WHEN 'TransporterID' THEN '[VR_RequestExecution].[TransporterID]'
                        WHEN 'TransporterID DESC' THEN '[VR_RequestExecution].[TransporterID] DESC'
                        WHEN 'VehiclePlacedOn' THEN '[VR_RequestExecution].[VehiclePlacedOn]'
                        WHEN 'VehiclePlacedOn DESC' THEN '[VR_RequestExecution].[VehiclePlacedOn] DESC'
                        WHEN 'VehicleTypeID' THEN '[VR_RequestExecution].[VehicleTypeID]'
                        WHEN 'VehicleTypeID DESC' THEN '[VR_RequestExecution].[VehicleTypeID] DESC'
                        WHEN 'VehicleNo' THEN '[VR_RequestExecution].[VehicleNo]'
                        WHEN 'VehicleNo DESC' THEN '[VR_RequestExecution].[VehicleNo] DESC'
                        WHEN 'Remarks' THEN '[VR_RequestExecution].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[VR_RequestExecution].[Remarks] DESC'
                        WHEN 'ArrangedBy' THEN '[VR_RequestExecution].[ArrangedBy]'
                        WHEN 'ArrangedBy DESC' THEN '[VR_RequestExecution].[ArrangedBy] DESC'
                        WHEN 'ArrangedOn' THEN '[VR_RequestExecution].[ArrangedOn]'
                        WHEN 'ArrangedOn DESC' THEN '[VR_RequestExecution].[ArrangedOn] DESC'
                        WHEN 'TraficOfficerDivisionID' THEN '[VR_RequestExecution].[TraficOfficerDivisionID]'
                        WHEN 'TraficOfficerDivisionID DESC' THEN '[VR_RequestExecution].[TraficOfficerDivisionID] DESC'
                        WHEN 'RequestStatusID' THEN '[VR_RequestExecution].[RequestStatusID]'
                        WHEN 'RequestStatusID DESC' THEN '[VR_RequestExecution].[RequestStatusID] DESC'
                        WHEN 'ApprovalRemarks' THEN '[VR_RequestExecution].[ApprovalRemarks]'
                        WHEN 'ApprovalRemarks DESC' THEN '[VR_RequestExecution].[ApprovalRemarks] DESC'
                        WHEN 'ApprovedBy' THEN '[VR_RequestExecution].[ApprovedBy]'
                        WHEN 'ApprovedBy DESC' THEN '[VR_RequestExecution].[ApprovedBy] DESC'
                        WHEN 'ApprovedOn' THEN '[VR_RequestExecution].[ApprovedOn]'
                        WHEN 'ApprovedOn DESC' THEN '[VR_RequestExecution].[ApprovedOn] DESC'
                        WHEN 'GRNo' THEN '[VR_RequestExecution].[GRNo]'
                        WHEN 'GRNo DESC' THEN '[VR_RequestExecution].[GRNo] DESC'
                        WHEN 'GRDate' THEN '[VR_RequestExecution].[GRDate]'
                        WHEN 'GRDate DESC' THEN '[VR_RequestExecution].[GRDate] DESC'
                        WHEN 'LoadedAtSupplier' THEN '[VR_RequestExecution].[LoadedAtSupplier]'
                        WHEN 'LoadedAtSupplier DESC' THEN '[VR_RequestExecution].[LoadedAtSupplier] DESC'
                        WHEN 'LoadedOn' THEN '[VR_RequestExecution].[LoadedOn]'
                        WHEN 'LoadedOn DESC' THEN '[VR_RequestExecution].[LoadedOn] DESC'
                        WHEN 'TransShipment' THEN '[VR_RequestExecution].[TransShipment]'
                        WHEN 'TransShipment DESC' THEN '[VR_RequestExecution].[TransShipment] DESC'
                        WHEN 'TransGRNO' THEN '[VR_RequestExecution].[TransGRNO]'
                        WHEN 'TransGRNO DESC' THEN '[VR_RequestExecution].[TransGRNO] DESC'
                        WHEN 'TransGRDate' THEN '[VR_RequestExecution].[TransGRDate]'
                        WHEN 'TransGRDate DESC' THEN '[VR_RequestExecution].[TransGRDate] DESC'
                        WHEN 'TransVehicleNo' THEN '[VR_RequestExecution].[TransVehicleNo]'
                        WHEN 'TransVehicleNo DESC' THEN '[VR_RequestExecution].[TransVehicleNo] DESC'
                        WHEN 'TransVehicleTypeID' THEN '[VR_RequestExecution].[TransVehicleTypeID]'
                        WHEN 'TransVehicleTypeID DESC' THEN '[VR_RequestExecution].[TransVehicleTypeID] DESC'
                        WHEN 'TransTransporterID' THEN '[VR_RequestExecution].[TransTransporterID]'
                        WHEN 'TransTransporterID DESC' THEN '[VR_RequestExecution].[TransTransporterID] DESC'
                        WHEN 'ReceiptAtSite' THEN '[VR_RequestExecution].[ReceiptAtSite]'
                        WHEN 'ReceiptAtSite DESC' THEN '[VR_RequestExecution].[ReceiptAtSite] DESC'
                        WHEN 'ReceiptBy' THEN '[VR_RequestExecution].[ReceiptBy]'
                        WHEN 'ReceiptBy DESC' THEN '[VR_RequestExecution].[ReceiptBy] DESC'
                        WHEN 'ReceiptOn' THEN '[VR_RequestExecution].[ReceiptOn]'
                        WHEN 'ReceiptOn DESC' THEN '[VR_RequestExecution].[ReceiptOn] DESC'
                        WHEN 'MaterialStateID' THEN '[VR_RequestExecution].[MaterialStateID]'
                        WHEN 'MaterialStateID DESC' THEN '[VR_RequestExecution].[MaterialStateID] DESC'
                        WHEN 'ReceiptMaterialSize' THEN '[VR_RequestExecution].[ReceiptMaterialSize]'
                        WHEN 'ReceiptMaterialSize DESC' THEN '[VR_RequestExecution].[ReceiptMaterialSize] DESC'
                        WHEN 'ReceiptMaterialWeight' THEN '[VR_RequestExecution].[ReceiptMaterialWeight]'
                        WHEN 'ReceiptMaterialWeight DESC' THEN '[VR_RequestExecution].[ReceiptMaterialWeight] DESC'
                        WHEN 'ReceiptSizeUnit' THEN '[VR_RequestExecution].[ReceiptSizeUnit]'
                        WHEN 'ReceiptSizeUnit DESC' THEN '[VR_RequestExecution].[ReceiptSizeUnit] DESC'
                        WHEN 'ReceiptNoOfPackages' THEN '[VR_RequestExecution].[ReceiptNoOfPackages]'
                        WHEN 'ReceiptNoOfPackages DESC' THEN '[VR_RequestExecution].[ReceiptNoOfPackages] DESC'
                        WHEN 'ReachedAtSite' THEN '[VR_RequestExecution].[ReachedAtSite]'
                        WHEN 'ReachedAtSite DESC' THEN '[VR_RequestExecution].[ReachedAtSite] DESC'
                        WHEN 'ReachedOn' THEN '[VR_RequestExecution].[ReachedOn]'
                        WHEN 'ReachedOn DESC' THEN '[VR_RequestExecution].[ReachedOn] DESC'
                        WHEN 'UnloadedAtSite' THEN '[VR_RequestExecution].[UnloadedAtSite]'
                        WHEN 'UnloadedAtSite DESC' THEN '[VR_RequestExecution].[UnloadedAtSite] DESC'
                        WHEN 'UnloadedOn' THEN '[VR_RequestExecution].[UnloadedOn]'
                        WHEN 'UnloadedOn DESC' THEN '[VR_RequestExecution].[UnloadedOn] DESC'
                        WHEN 'SiteReceiptNo' THEN '[VR_RequestExecution].[SiteReceiptNo]'
                        WHEN 'SiteReceiptNo DESC' THEN '[VR_RequestExecution].[SiteReceiptNo] DESC'
                        WHEN 'SiteReceiptDate' THEN '[VR_RequestExecution].[SiteReceiptDate]'
                        WHEN 'SiteReceiptDate DESC' THEN '[VR_RequestExecution].[SiteReceiptDate] DESC'
                        WHEN 'ReceiptRemarks' THEN '[VR_RequestExecution].[ReceiptRemarks]'
                        WHEN 'ReceiptRemarks DESC' THEN '[VR_RequestExecution].[ReceiptRemarks] DESC'
                        WHEN 'TransShipmentAtSite' THEN '[VR_RequestExecution].[TransShipmentAtSite]'
                        WHEN 'TransShipmentAtSite DESC' THEN '[VR_RequestExecution].[TransShipmentAtSite] DESC'
                        WHEN 'SiteGRNO' THEN '[VR_RequestExecution].[SiteGRNO]'
                        WHEN 'SiteGRNO DESC' THEN '[VR_RequestExecution].[SiteGRNO] DESC'
                        WHEN 'SiteGRDate' THEN '[VR_RequestExecution].[SiteGRDate]'
                        WHEN 'SiteGRDate DESC' THEN '[VR_RequestExecution].[SiteGRDate] DESC'
                        WHEN 'SiteVehicleNo' THEN '[VR_RequestExecution].[SiteVehicleNo]'
                        WHEN 'SiteVehicleNo DESC' THEN '[VR_RequestExecution].[SiteVehicleNo] DESC'
                        WHEN 'SiteVehicleTypeID' THEN '[VR_RequestExecution].[SiteVehicleTypeID]'
                        WHEN 'SiteVehicleTypeID DESC' THEN '[VR_RequestExecution].[SiteVehicleTypeID] DESC'
                        WHEN 'SiteTransporterID' THEN '[VR_RequestExecution].[SiteTransporterID]'
                        WHEN 'SiteTransporterID DESC' THEN '[VR_RequestExecution].[SiteTransporterID] DESC'
                        WHEN 'IRNo' THEN '[VR_RequestExecution].[IRNo]'
                        WHEN 'IRNo DESC' THEN '[VR_RequestExecution].[IRNo] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'HRM_Divisions4_Description' THEN '[HRM_Divisions4].[Description]'
                        WHEN 'HRM_Divisions4_Description DESC' THEN '[HRM_Divisions4].[Description] DESC'
                        WHEN 'VR_MaterialStates5_Description' THEN '[VR_MaterialStates5].[Description]'
                        WHEN 'VR_MaterialStates5_Description DESC' THEN '[VR_MaterialStates5].[Description] DESC'
                        WHEN 'VR_RequestStates6_Description' THEN '[VR_RequestStates6].[Description]'
                        WHEN 'VR_RequestStates6_Description DESC' THEN '[VR_RequestStates6].[Description] DESC'
                        WHEN 'VR_TransporterBill7_IRDescription' THEN '[VR_TransporterBill7].[IRDescription]'
                        WHEN 'VR_TransporterBill7_IRDescription DESC' THEN '[VR_TransporterBill7].[IRDescription] DESC'
                        WHEN 'VR_Transporters8_TransporterName' THEN '[VR_Transporters8].[TransporterName]'
                        WHEN 'VR_Transporters8_TransporterName DESC' THEN '[VR_Transporters8].[TransporterName] DESC'
                        WHEN 'VR_Transporters9_TransporterName' THEN '[VR_Transporters9].[TransporterName]'
                        WHEN 'VR_Transporters9_TransporterName DESC' THEN '[VR_Transporters9].[TransporterName] DESC'
                        WHEN 'VR_Transporters10_TransporterName' THEN '[VR_Transporters10].[TransporterName]'
                        WHEN 'VR_Transporters10_TransporterName DESC' THEN '[VR_Transporters10].[TransporterName] DESC'
                        WHEN 'VR_Units11_Description' THEN '[VR_Units11].[Description]'
                        WHEN 'VR_Units11_Description DESC' THEN '[VR_Units11].[Description] DESC'
                        WHEN 'VR_VehicleTypes12_Description' THEN '[VR_VehicleTypes12].[Description]'
                        WHEN 'VR_VehicleTypes12_Description DESC' THEN '[VR_VehicleTypes12].[Description] DESC'
                        WHEN 'VR_VehicleTypes13_Description' THEN '[VR_VehicleTypes13].[Description]'
                        WHEN 'VR_VehicleTypes13_Description DESC' THEN '[VR_VehicleTypes13].[Description] DESC'
                        WHEN 'VR_VehicleTypes14_Description' THEN '[VR_VehicleTypes14].[Description]'
                        WHEN 'VR_VehicleTypes14_Description DESC' THEN '[VR_VehicleTypes14].[Description] DESC'
                        ELSE '[VR_RequestExecution].[SRNNo]'
                    END
  EXEC (@LGSQL)

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
