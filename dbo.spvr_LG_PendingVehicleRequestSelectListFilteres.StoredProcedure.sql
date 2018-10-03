USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvr_LG_PendingVehicleRequestSelectListFilteres]
  @Filter_SupplierID NVarChar(9),
  @Filter_ProjectID NVarChar(6),
  @Filter_RequestedBy NVarChar(8),
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_Units] AS [VR_Units2]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequest].[WeightUnit] = [VR_Units2].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_ODCReasons] AS [VR_ODCReasons1]'
  SET @LGSQL = @LGSQL + '    ON [VR_VehicleRequest].[ODCReasonID] = [VR_ODCReasons1].[ReasonID]'
  SET @LGSQL = @LGSQL + '  WHERE (([VR_VehicleRequest].[OutOfContract]=0 AND [VR_VehicleRequest].[RequestedBy] IN (SELECT aa.UserID from VR_UserGroup aa WHERE aa.OutOfContractApprover=0 AND aa.GroupID IN (Select bb.GroupID from VR_UserGroup bb WHERE bb.OutOfContractApprover=0 AND bb.UserID = ''' + @LoginID + '''))) OR (OutOfContract=1 AND OutOfContract=(select top 1 cc.OutOfContractApprover from VR_UserGroup cc where cc.UserID='''+@LoginID+''') )  )' 
  SET @LGSQL = @LGSQL + ' AND [VR_VehicleRequest].[RequestStatus] = ''' + STR(@RequestStatus) + '''' 
  IF (@Filter_SupplierID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_VehicleRequest].[SupplierID] = ''' + @Filter_SupplierID + ''''
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_VehicleRequest].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_RequestedBy > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_VehicleRequest].[RequestedBy] = ''' + @Filter_RequestedBy + ''''
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
                        WHEN 'Width' THEN '[VR_VehicleRequest].[Width]'
                        WHEN 'Width DESC' THEN '[VR_VehicleRequest].[Width] DESC'
                        WHEN 'Length' THEN '[VR_VehicleRequest].[Length]'
                        WHEN 'Length DESC' THEN '[VR_VehicleRequest].[Length] DESC'
                        WHEN 'SizeUnit' THEN '[VR_VehicleRequest].[SizeUnit]'
                        WHEN 'SizeUnit DESC' THEN '[VR_VehicleRequest].[SizeUnit] DESC'
                        WHEN 'Height' THEN '[VR_VehicleRequest].[Height]'
                        WHEN 'Height DESC' THEN '[VR_VehicleRequest].[Height] DESC'
                        WHEN 'WeightUnit' THEN '[VR_VehicleRequest].[WeightUnit]'
                        WHEN 'WeightUnit DESC' THEN '[VR_VehicleRequest].[WeightUnit] DESC'
                        WHEN 'MaterialWeight' THEN '[VR_VehicleRequest].[MaterialWeight]'
                        WHEN 'MaterialWeight DESC' THEN '[VR_VehicleRequest].[MaterialWeight] DESC'
                        WHEN 'NoOfPackages' THEN '[VR_VehicleRequest].[NoOfPackages]'
                        WHEN 'NoOfPackages DESC' THEN '[VR_VehicleRequest].[NoOfPackages] DESC'
                        WHEN 'VehicleTypeID' THEN '[VR_VehicleRequest].[VehicleTypeID]'
                        WHEN 'VehicleTypeID DESC' THEN '[VR_VehicleRequest].[VehicleTypeID] DESC'
                        WHEN 'VehicleRequiredOn' THEN '[VR_VehicleRequest].[VehicleRequiredOn]'
                        WHEN 'VehicleRequiredOn DESC' THEN '[VR_VehicleRequest].[VehicleRequiredOn] DESC'
                        WHEN 'MICN' THEN '[VR_VehicleRequest].[MICN]'
                        WHEN 'MICN DESC' THEN '[VR_VehicleRequest].[MICN] DESC'
                        WHEN 'CustomInvoiceNo' THEN '[VR_VehicleRequest].[CustomInvoiceNo]'
                        WHEN 'CustomInvoiceNo DESC' THEN '[VR_VehicleRequest].[CustomInvoiceNo] DESC'
                        WHEN 'Remarks' THEN '[VR_VehicleRequest].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[VR_VehicleRequest].[Remarks] DESC'
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
                        WHEN 'OverDimentionConsignement' THEN '[VR_VehicleRequest].[OverDimentionConsignement]'
                        WHEN 'OverDimentionConsignement DESC' THEN '[VR_VehicleRequest].[OverDimentionConsignement] DESC'
                        WHEN 'ODCReasonID' THEN '[VR_VehicleRequest].[ODCReasonID]'
                        WHEN 'ODCReasonID DESC' THEN '[VR_VehicleRequest].[ODCReasonID] DESC'
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
                        WHEN 'VR_Units2_Description' THEN '[VR_Units2].[Description]'
                        WHEN 'VR_Units2_Description DESC' THEN '[VR_Units2].[Description] DESC'
                        WHEN 'VR_ODCReasons1_Description' THEN '[VR_ODCReasons1].[Description]'
                        WHEN 'VR_ODCReasons1_Description DESC' THEN '[VR_ODCReasons1].[Description] DESC'
                        ELSE '[VR_VehicleRequest].[RequestNo] DESC'
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
		[VR_VehicleRequest].[Width] ,
		[VR_VehicleRequest].[Length] ,
		[VR_VehicleRequest].[SizeUnit] ,
		[VR_VehicleRequest].[Height] ,
		[VR_VehicleRequest].[WeightUnit] ,
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
		[VR_VehicleRequest].[OverDimentionConsignement] ,
		[VR_VehicleRequest].[ODCReasonID] ,
		[VR_VehicleRequest].[OutOfContract] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[HRM_Divisions3].[Description] AS HRM_Divisions3_Description,
		[IDM_Projects4].[Description] AS IDM_Projects4_Description,
		[IDM_Vendors5].[Description] AS IDM_Vendors5_Description,
		[VR_RequestExecution6].[ExecutionDescription] AS VR_RequestExecution6_ExecutionDescription,
		[VR_RequestStates7].[Description] AS VR_RequestStates7_Description,
		[VR_Units8].[Description] AS VR_Units8_Description,
		[VR_VehicleTypes9].[cmba] AS VR_VehicleTypes9_cmba,
		[VR_Units2].[Description] AS VR_Units2_Description,
		[VR_ODCReasons1].[Description] AS VR_ODCReasons1_Description 
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
  LEFT OUTER JOIN [VR_Units] AS [VR_Units2]
    ON [VR_VehicleRequest].[WeightUnit] = [VR_Units2].[UnitID]
  LEFT OUTER JOIN [VR_ODCReasons] AS [VR_ODCReasons1]
    ON [VR_VehicleRequest].[ODCReasonID] = [VR_ODCReasons1].[ReasonID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
