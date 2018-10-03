USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvr_LG_SanctionExecutionApprovalSelectListFilteres]
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
    INSERT INTO #PageIndex ( 
    SRNNo
    )
   SELECT 
   [VR_RequestExecution].[SRNNo]
   FROM [VR_RequestExecution] 
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
    WHERE [VR_RequestExecution].[RequestStatusID] = 28 
    ORDER BY [VR_RequestExecution].[SRNNo] DESC
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT  
		[VR_RequestExecution].*,
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
		[VR_ODCReasons16].[Description] AS VR_ODCReasons16_Description, 
		[aspnet_Users17].[UserFullName] AS aspnet_Users17_UserFullName 
  FROM [VR_RequestExecution] 
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
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users17]
    ON [VR_RequestExecution].[SanctionApprovedBy] = [aspnet_Users17].[LoginID]
    	INNER JOIN #PageIndex
          ON [VR_RequestExecution].[SRNNo] = #PageIndex.SRNNo
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID   
  END
GO
