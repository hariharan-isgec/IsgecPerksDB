USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvr_LG_ExecutionApprovalSelectListFilteres]
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
          -- Loaded At Supplier => Out Of Contract 
    WHERE (([VR_RequestExecution].[RequestStatusID] = 8 and (
								([VR_RequestExecution].[OverDimentionConsignement] = 1)
                 AND 
                 [VR_RequestExecution].[ArrangedBy] IN   
                 (SELECT UserID from VR_UserGroup WHERE GroupID IN 
                 (Select GroupID from VR_UserGroup WHERE UserID = @LoginID AND RoleID = 'Approver'))
                 )
       ) or
         (
           [VR_RequestExecution].[RequestStatusID] = 11 and (
								 ([VR_RequestExecution].[OverDimentionConsignement] = 0)
                 AND 
                 ([VR_RequestExecution].[ArrangedBy] = @LoginID )    
                 )
         ) 
       )
--          AND (  
--          ( [VR_RequestExecution].[LoadedAtSupplier] = 1
--            AND [VR_RequestExecution].[ArrangedBy] IN
--                (SELECT UserID from VR_UserGroup WHERE GroupID IN 
--                (Select GroupID from VR_UserGroup WHERE UserID = @LoginID AND RoleID = 'Approver' AND OutOfContractApprover = 1 ))
--          ) OR
--          ( ([VR_RequestExecution].[LoadedAtSupplier] = 0 AND [VR_RequestExecution].[OverDimentionConsignement] = 1) 
--             AND [VR_RequestExecution].[ArrangedBy] IN
--                (SELECT UserID from VR_UserGroup WHERE GroupID IN 
--                (Select GroupID from VR_UserGroup WHERE UserID = @LoginID AND RoleID = 'Approver' AND OutOfContractApprover = 0 ))
--          ) OR 
--          ( ([VR_RequestExecution].[LoadedAtSupplier] = 0 AND [VR_RequestExecution].[OverDimentionConsignement] = 0) 
--             AND [VR_RequestExecution].[ArrangedBy] = @LoginID  
--          )
--       )
      AND CASE WHEN @Filter_TransporterID > '' 
               THEN [VR_RequestExecution].[TransporterID]
               ELSE 1
               END
          = CASE WHEN @Filter_TransporterID > '' 
               THEN @Filter_TransporterID 
               ELSE 1 
               END
      AND CASE WHEN @Filter_VehicleTypeID > 0 
               THEN [VR_RequestExecution].[VehicleTypeID] 
               ELSE 1
               END
          = CASE WHEN @Filter_VehicleTypeID > 0
               THEN STR(@Filter_VehicleTypeID) 
               ELSE 1 
               END
    ORDER BY [VR_RequestExecution].[SRNNo] DESC
--            CASE @OrderBy  
--						WHEN 'SRNNo' THEN '[VR_RequestExecution].[SRNNo]'
--						WHEN 'SRNNo DESC' THEN '[VR_RequestExecution].[SRNNo] DESC'
--						WHEN 'ExecutionDescription' THEN '[VR_RequestExecution].[ExecutionDescription]'
--						WHEN 'ExecutionDescription DESC' THEN '[VR_RequestExecution].[ExecutionDescription] DESC'
--						WHEN 'TransporterID' THEN '[VR_RequestExecution].[TransporterID]'
--						WHEN 'TransporterID DESC' THEN '[VR_RequestExecution].[TransporterID] DESC'
--						WHEN 'VehiclePlacedOn' THEN '[VR_RequestExecution].[VehiclePlacedOn]'
--						WHEN 'VehiclePlacedOn DESC' THEN '[VR_RequestExecution].[VehiclePlacedOn] DESC'
--						WHEN 'VehicleTypeID' THEN '[VR_RequestExecution].[VehicleTypeID]'
--						WHEN 'VehicleTypeID DESC' THEN '[VR_RequestExecution].[VehicleTypeID] DESC'
--						WHEN 'VehicleNo' THEN '[VR_RequestExecution].[VehicleNo]'
--						WHEN 'VehicleNo DESC' THEN '[VR_RequestExecution].[VehicleNo] DESC'
--						WHEN 'Remarks' THEN '[VR_RequestExecution].[Remarks]'
--						WHEN 'Remarks DESC' THEN '[VR_RequestExecution].[Remarks] DESC'
--						WHEN 'ArrangedBy' THEN '[VR_RequestExecution].[ArrangedBy]'
--						WHEN 'ArrangedBy DESC' THEN '[VR_RequestExecution].[ArrangedBy] DESC'
--						WHEN 'ArrangedOn' THEN '[VR_RequestExecution].[ArrangedOn]'
--						WHEN 'ArrangedOn DESC' THEN '[VR_RequestExecution].[ArrangedOn] DESC'
--            WHEN 'TraficOfficerDivisionID' THEN '[VR_RequestExecution].[TraficOfficerDivisionID]'
--            WHEN 'TraficOfficerDivisionID DESC' THEN '[VR_RequestExecution].[TraficOfficerDivisionID] DESC'
--            WHEN 'RequestStatusID' THEN '[VR_RequestExecution].[RequestStatusID]'
--            WHEN 'RequestStatusID DESC' THEN '[VR_RequestExecution].[RequestStatusID] DESC'
--            WHEN 'ApprovalRemarks' THEN '[VR_RequestExecution].[ApprovalRemarks]'
--            WHEN 'ApprovalRemarks DESC' THEN '[VR_RequestExecution].[ApprovalRemarks] DESC'
--            WHEN 'ApprovedBy' THEN '[VR_RequestExecution].[ApprovedBy]'
--            WHEN 'ApprovedBy DESC' THEN '[VR_RequestExecution].[ApprovedBy] DESC'
--            WHEN 'ApprovedOn' THEN '[VR_RequestExecution].[ApprovedOn]'
--            WHEN 'ApprovedOn DESC' THEN '[VR_RequestExecution].[ApprovedOn] DESC'
--            WHEN 'GRNo' THEN '[VR_RequestExecution].[GRNo]'
--            WHEN 'GRNo DESC' THEN '[VR_RequestExecution].[GRNo] DESC'
--            WHEN 'GRDate' THEN '[VR_RequestExecution].[GRDate]'
--            WHEN 'GRDate DESC' THEN '[VR_RequestExecution].[GRDate] DESC'
--            WHEN 'LoadedAtSupplier' THEN '[VR_RequestExecution].[LoadedAtSupplier]'
--            WHEN 'LoadedAtSupplier DESC' THEN '[VR_RequestExecution].[LoadedAtSupplier] DESC'
--            WHEN 'LoadedOn' THEN '[VR_RequestExecution].[LoadedOn]'
--            WHEN 'LoadedOn DESC' THEN '[VR_RequestExecution].[LoadedOn] DESC'
--            WHEN 'TransShipment' THEN '[VR_RequestExecution].[TransShipment]'
--            WHEN 'TransShipment DESC' THEN '[VR_RequestExecution].[TransShipment] DESC'
--            WHEN 'TransGRNO' THEN '[VR_RequestExecution].[TransGRNO]'
--            WHEN 'TransGRNO DESC' THEN '[VR_RequestExecution].[TransGRNO] DESC'
--            WHEN 'TransGRDate' THEN '[VR_RequestExecution].[TransGRDate]'
--            WHEN 'TransGRDate DESC' THEN '[VR_RequestExecution].[TransGRDate] DESC'
--            WHEN 'TransVehicleNo' THEN '[VR_RequestExecution].[TransVehicleNo]'
--            WHEN 'TransVehicleNo DESC' THEN '[VR_RequestExecution].[TransVehicleNo] DESC'
--            WHEN 'TransVehicleTypeID' THEN '[VR_RequestExecution].[TransVehicleTypeID]'
--            WHEN 'TransVehicleTypeID DESC' THEN '[VR_RequestExecution].[TransVehicleTypeID] DESC'
--            WHEN 'TransTransporterID' THEN '[VR_RequestExecution].[TransTransporterID]'
--            WHEN 'TransTransporterID DESC' THEN '[VR_RequestExecution].[TransTransporterID] DESC'
--            WHEN 'ReceiptAtSite' THEN '[VR_RequestExecution].[ReceiptAtSite]'
--            WHEN 'ReceiptAtSite DESC' THEN '[VR_RequestExecution].[ReceiptAtSite] DESC'
--            WHEN 'ReceiptBy' THEN '[VR_RequestExecution].[ReceiptBy]'
--            WHEN 'ReceiptBy DESC' THEN '[VR_RequestExecution].[ReceiptBy] DESC'
--            WHEN 'ReceiptOn' THEN '[VR_RequestExecution].[ReceiptOn]'
--            WHEN 'ReceiptOn DESC' THEN '[VR_RequestExecution].[ReceiptOn] DESC'
--            WHEN 'MaterialStateID' THEN '[VR_RequestExecution].[MaterialStateID]'
--            WHEN 'MaterialStateID DESC' THEN '[VR_RequestExecution].[MaterialStateID] DESC'
--            WHEN 'ReceiptMaterialSize' THEN '[VR_RequestExecution].[ReceiptMaterialSize]'
--            WHEN 'ReceiptMaterialSize DESC' THEN '[VR_RequestExecution].[ReceiptMaterialSize] DESC'
--            WHEN 'ReceiptMaterialWeight' THEN '[VR_RequestExecution].[ReceiptMaterialWeight]'
--            WHEN 'ReceiptMaterialWeight DESC' THEN '[VR_RequestExecution].[ReceiptMaterialWeight] DESC'
--            WHEN 'ReceiptSizeUnit' THEN '[VR_RequestExecution].[ReceiptSizeUnit]'
--            WHEN 'ReceiptSizeUnit DESC' THEN '[VR_RequestExecution].[ReceiptSizeUnit] DESC'
--            WHEN 'ReceiptNoOfPackages' THEN '[VR_RequestExecution].[ReceiptNoOfPackages]'
--            WHEN 'ReceiptNoOfPackages DESC' THEN '[VR_RequestExecution].[ReceiptNoOfPackages] DESC'
--            WHEN 'ReachedAtSite' THEN '[VR_RequestExecution].[ReachedAtSite]'
--            WHEN 'ReachedAtSite DESC' THEN '[VR_RequestExecution].[ReachedAtSite] DESC'
--            WHEN 'ReachedOn' THEN '[VR_RequestExecution].[ReachedOn]'
--            WHEN 'ReachedOn DESC' THEN '[VR_RequestExecution].[ReachedOn] DESC'
--            WHEN 'UnloadedAtSite' THEN '[VR_RequestExecution].[UnloadedAtSite]'
--            WHEN 'UnloadedAtSite DESC' THEN '[VR_RequestExecution].[UnloadedAtSite] DESC'
--            WHEN 'UnloadedOn' THEN '[VR_RequestExecution].[UnloadedOn]'
--            WHEN 'UnloadedOn DESC' THEN '[VR_RequestExecution].[UnloadedOn] DESC'
--            WHEN 'SiteReceiptNo' THEN '[VR_RequestExecution].[SiteReceiptNo]'
--            WHEN 'SiteReceiptNo DESC' THEN '[VR_RequestExecution].[SiteReceiptNo] DESC'
--            WHEN 'SiteReceiptDate' THEN '[VR_RequestExecution].[SiteReceiptDate]'
--            WHEN 'SiteReceiptDate DESC' THEN '[VR_RequestExecution].[SiteReceiptDate] DESC'
--            WHEN 'ReceiptRemarks' THEN '[VR_RequestExecution].[ReceiptRemarks]'
--            WHEN 'ReceiptRemarks DESC' THEN '[VR_RequestExecution].[ReceiptRemarks] DESC'
--            WHEN 'TransShipmentAtSite' THEN '[VR_RequestExecution].[TransShipmentAtSite]'
--            WHEN 'TransShipmentAtSite DESC' THEN '[VR_RequestExecution].[TransShipmentAtSite] DESC'
--            WHEN 'SiteGRNO' THEN '[VR_RequestExecution].[SiteGRNO]'
--            WHEN 'SiteGRNO DESC' THEN '[VR_RequestExecution].[SiteGRNO] DESC'
--            WHEN 'SiteGRDate' THEN '[VR_RequestExecution].[SiteGRDate]'
--            WHEN 'SiteGRDate DESC' THEN '[VR_RequestExecution].[SiteGRDate] DESC'
--            WHEN 'SiteVehicleNo' THEN '[VR_RequestExecution].[SiteVehicleNo]'
--            WHEN 'SiteVehicleNo DESC' THEN '[VR_RequestExecution].[SiteVehicleNo] DESC'
--            WHEN 'SiteVehicleTypeID' THEN '[VR_RequestExecution].[SiteVehicleTypeID]'
--            WHEN 'SiteVehicleTypeID DESC' THEN '[VR_RequestExecution].[SiteVehicleTypeID] DESC'
--            WHEN 'SiteTransporterID' THEN '[VR_RequestExecution].[SiteTransporterID]'
--            WHEN 'SiteTransporterID DESC' THEN '[VR_RequestExecution].[SiteTransporterID] DESC'
--            WHEN 'IRNo' THEN '[VR_RequestExecution].[IRNo]'
--            WHEN 'IRNo DESC' THEN '[VR_RequestExecution].[IRNo] DESC'
--            WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
--            WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
--            WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
--            WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
--            WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
--            WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
--            WHEN 'HRM_Divisions4_Description' THEN '[HRM_Divisions4].[Description]'
--            WHEN 'HRM_Divisions4_Description DESC' THEN '[HRM_Divisions4].[Description] DESC'
--            WHEN 'VR_MaterialStates5_Description' THEN '[VR_MaterialStates5].[Description]'
--            WHEN 'VR_MaterialStates5_Description DESC' THEN '[VR_MaterialStates5].[Description] DESC'
--            WHEN 'VR_RequestStates6_Description' THEN '[VR_RequestStates6].[Description]'
--            WHEN 'VR_RequestStates6_Description DESC' THEN '[VR_RequestStates6].[Description] DESC'
--            WHEN 'VR_TransporterBill7_IRDescription' THEN '[VR_TransporterBill7].[IRDescription]'
--            WHEN 'VR_TransporterBill7_IRDescription DESC' THEN '[VR_TransporterBill7].[IRDescription] DESC'
--            WHEN 'VR_Transporters8_TransporterName' THEN '[VR_Transporters8].[TransporterName]'
--            WHEN 'VR_Transporters8_TransporterName DESC' THEN '[VR_Transporters8].[TransporterName] DESC'
--            WHEN 'VR_Transporters9_TransporterName' THEN '[VR_Transporters9].[TransporterName]'
--            WHEN 'VR_Transporters9_TransporterName DESC' THEN '[VR_Transporters9].[TransporterName] DESC'
--            WHEN 'VR_Transporters10_TransporterName' THEN '[VR_Transporters10].[TransporterName]'
--            WHEN 'VR_Transporters10_TransporterName DESC' THEN '[VR_Transporters10].[TransporterName] DESC'
--            WHEN 'VR_Units11_Description' THEN '[VR_Units11].[Description]'
--            WHEN 'VR_Units11_Description DESC' THEN '[VR_Units11].[Description] DESC'
--            WHEN 'VR_VehicleTypes12_Description' THEN '[VR_VehicleTypes12].[Description]'
--            WHEN 'VR_VehicleTypes12_Description DESC' THEN '[VR_VehicleTypes12].[Description] DESC'
--            WHEN 'VR_VehicleTypes13_Description' THEN '[VR_VehicleTypes13].[Description]'
--            WHEN 'VR_VehicleTypes13_Description DESC' THEN '[VR_VehicleTypes13].[Description] DESC'
--            WHEN 'VR_VehicleTypes14_Description' THEN '[VR_VehicleTypes14].[Description]'
--            WHEN 'VR_VehicleTypes14_Description DESC' THEN '[VR_VehicleTypes14].[Description] DESC'
--            ELSE '[VR_RequestExecution].[SRNNo] DESC'
--        END
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
