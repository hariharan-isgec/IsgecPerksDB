USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvr_LG_LorryReceiptsDSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @Filter_TransporterID NVarChar(9),
  @Filter_CustomerID NVarChar(9),
  @Filter_Supplier NVarChar(50),
  @Filter_GRNo NVarChar(50),
  @Filter_VehicleTypeID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @LRStatusID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,MRNNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', MRNNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_LorryReceipts].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [VR_LorryReceipts].[MRNNo]'
  SET @LGSQL = @LGSQL + ' FROM [VR_LorryReceipts] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [VR_LorryReceipts].[CreatedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [VR_LorryReceipts].[ProjectID] = [IDM_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner3]'
  SET @LGSQL = @LGSQL + '    ON [VR_LorryReceipts].[CustomerID] = [VR_BusinessPartner3].[BPID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [VR_LorryReceiptStatus] AS [VR_LorryReceiptStatus4]'
  SET @LGSQL = @LGSQL + '    ON [VR_LorryReceipts].[LRStatusID] = [VR_LorryReceiptStatus4].[LRStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_MaterialStates] AS [VR_MaterialStates5]'
  SET @LGSQL = @LGSQL + '    ON [VR_LorryReceipts].[MaterialStateID] = [VR_MaterialStates5].[MaterialStateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_RequestExecution] AS [VR_RequestExecution6]'
  SET @LGSQL = @LGSQL + '    ON [VR_LorryReceipts].[RequestExecutionNo] = [VR_RequestExecution6].[SRNNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_Transporters] AS [VR_Transporters7]'
  SET @LGSQL = @LGSQL + '    ON [VR_LorryReceipts].[TransporterID] = [VR_Transporters7].[TransporterID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_VehicleTypes] AS [VR_VehicleTypes8]'
  SET @LGSQL = @LGSQL + '    ON [VR_LorryReceipts].[VehicleTypeID] = [VR_VehicleTypes8].[VehicleTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_LorryReceiptDetails] AS [VR_LorryReceiptDetails]'
  SET @LGSQL = @LGSQL + '    ON  [VR_LorryReceipts].[ProjectID] =[VR_LorryReceiptDetails].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [VR_LorryReceipts].[MRNNo] =[VR_LorryReceiptDetails].[MRNNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner2]'
  SET @LGSQL = @LGSQL + '    ON [VR_LorryReceiptDetails].[SupplierID] = [VR_BusinessPartner2].[BPID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [VR_LorryReceipts].[LRStatusID] = ''' + STR(@LRStatusID) + '''' 
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_LorryReceipts].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_TransporterID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_LorryReceipts].[TransporterID] = ''' + @Filter_TransporterID + ''''
  IF (@Filter_CustomerID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_LorryReceipts].[CustomerID] = ''' + @Filter_CustomerID + ''''
  IF (@Filter_VehicleTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [VR_LorryReceipts].[VehicleTypeID] = ' + STR(@Filter_VehicleTypeID)
  IF (@Filter_GRNo > '') 
    SET @LGSQL = @LGSQL + ' AND LOWER(ISNULL([VR_LorryReceiptDetails].[GRorLRNo],'''')) LIKE ''%' + LOWER(@Filter_GRNo) + '%'''
  IF (@Filter_Supplier > '') 
   BEGIN
    SET @LGSQL = @LGSQL + ' AND (LOWER(ISNULL([VR_LorryReceiptDetails].[SupplierID],'''')) LIKE ''%' + LOWER(@Filter_Supplier) + '%'''
    SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([VR_LorryReceiptDetails].[SupplierName],'''')) LIKE ''%' + LOWER(@Filter_Supplier) + '%'''
    SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([VR_BusinessPartner2].[BPName],'''')) LIKE ''%' + LOWER(@Filter_Supplier) + '%'' ) '    
   END
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[VR_LorryReceipts].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[VR_LorryReceipts].[ProjectID] DESC'
                        WHEN 'RequestExecutionNo' THEN '[VR_LorryReceipts].[RequestExecutionNo]'
                        WHEN 'RequestExecutionNo DESC' THEN '[VR_LorryReceipts].[RequestExecutionNo] DESC'
                        WHEN 'MRNNo' THEN '[VR_LorryReceipts].[MRNNo]'
                        WHEN 'MRNNo DESC' THEN '[VR_LorryReceipts].[MRNNo] DESC'
                        WHEN 'MRNDate' THEN '[VR_LorryReceipts].[MRNDate]'
                        WHEN 'MRNDate DESC' THEN '[VR_LorryReceipts].[MRNDate] DESC'
                        WHEN 'TransporterID' THEN '[VR_LorryReceipts].[TransporterID]'
                        WHEN 'TransporterID DESC' THEN '[VR_LorryReceipts].[TransporterID] DESC'
                        WHEN 'TransporterName' THEN '[VR_LorryReceipts].[TransporterName]'
                        WHEN 'TransporterName DESC' THEN '[VR_LorryReceipts].[TransporterName] DESC'
                        WHEN 'CustomerID' THEN '[VR_LorryReceipts].[CustomerID]'
                        WHEN 'CustomerID DESC' THEN '[VR_LorryReceipts].[CustomerID] DESC'
                        WHEN 'VehicleRegistrationNo' THEN '[VR_LorryReceipts].[VehicleRegistrationNo]'
                        WHEN 'VehicleRegistrationNo DESC' THEN '[VR_LorryReceipts].[VehicleRegistrationNo] DESC'
                        WHEN 'WayBillFormNo' THEN '[VR_LorryReceipts].[WayBillFormNo]'
                        WHEN 'WayBillFormNo DESC' THEN '[VR_LorryReceipts].[WayBillFormNo] DESC'
                        WHEN 'PaymentMadeAtSite' THEN '[VR_LorryReceipts].[PaymentMadeAtSite]'
                        WHEN 'PaymentMadeAtSite DESC' THEN '[VR_LorryReceipts].[PaymentMadeAtSite] DESC'
                        WHEN 'AmountPaid' THEN '[VR_LorryReceipts].[AmountPaid]'
                        WHEN 'AmountPaid DESC' THEN '[VR_LorryReceipts].[AmountPaid] DESC'
                        WHEN 'VehicleInDate' THEN '[VR_LorryReceipts].[VehicleInDate]'
                        WHEN 'VehicleInDate DESC' THEN '[VR_LorryReceipts].[VehicleInDate] DESC'
                        WHEN 'VehicleOutDate' THEN '[VR_LorryReceipts].[VehicleOutDate]'
                        WHEN 'VehicleOutDate DESC' THEN '[VR_LorryReceipts].[VehicleOutDate] DESC'
                        WHEN 'DetentionAtSite' THEN '[VR_LorryReceipts].[DetentionAtSite]'
                        WHEN 'DetentionAtSite DESC' THEN '[VR_LorryReceipts].[DetentionAtSite] DESC'
                        WHEN 'ReasonForDetention' THEN '[VR_LorryReceipts].[ReasonForDetention]'
                        WHEN 'ReasonForDetention DESC' THEN '[VR_LorryReceipts].[ReasonForDetention] DESC'
                        WHEN 'OverDimensionConsignment' THEN '[VR_LorryReceipts].[OverDimensionConsignment]'
                        WHEN 'OverDimensionConsignment DESC' THEN '[VR_LorryReceipts].[OverDimensionConsignment] DESC'
                        WHEN 'VehicleTypeID' THEN '[VR_LorryReceipts].[VehicleTypeID]'
                        WHEN 'VehicleTypeID DESC' THEN '[VR_LorryReceipts].[VehicleTypeID] DESC'
                        WHEN 'VehicleType' THEN '[VR_LorryReceipts].[VehicleType]'
                        WHEN 'VehicleType DESC' THEN '[VR_LorryReceipts].[VehicleType] DESC'
                        WHEN 'VehicleLengthInFt' THEN '[VR_LorryReceipts].[VehicleLengthInFt]'
                        WHEN 'VehicleLengthInFt DESC' THEN '[VR_LorryReceipts].[VehicleLengthInFt] DESC'
                        WHEN 'VechicleWidthInFt' THEN '[VR_LorryReceipts].[VechicleWidthInFt]'
                        WHEN 'VechicleWidthInFt DESC' THEN '[VR_LorryReceipts].[VechicleWidthInFt] DESC'
                        WHEN 'VehicleHeightInFt' THEN '[VR_LorryReceipts].[VehicleHeightInFt]'
                        WHEN 'VehicleHeightInFt DESC' THEN '[VR_LorryReceipts].[VehicleHeightInFt] DESC'
                        WHEN 'MaterialStateID' THEN '[VR_LorryReceipts].[MaterialStateID]'
                        WHEN 'MaterialStateID DESC' THEN '[VR_LorryReceipts].[MaterialStateID] DESC'
                        WHEN 'RemarksForDamageOrShortage' THEN '[VR_LorryReceipts].[RemarksForDamageOrShortage]'
                        WHEN 'RemarksForDamageOrShortage DESC' THEN '[VR_LorryReceipts].[RemarksForDamageOrShortage] DESC'
                        WHEN 'OtherRemarks' THEN '[VR_LorryReceipts].[OtherRemarks]'
                        WHEN 'OtherRemarks DESC' THEN '[VR_LorryReceipts].[OtherRemarks] DESC'
                        WHEN 'DriverNameAndContactNo' THEN '[VR_LorryReceipts].[DriverNameAndContactNo]'
                        WHEN 'DriverNameAndContactNo DESC' THEN '[VR_LorryReceipts].[DriverNameAndContactNo] DESC'
                        WHEN 'CreatedBy' THEN '[VR_LorryReceipts].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[VR_LorryReceipts].[CreatedBy] DESC'
                        WHEN 'CreatedOn' THEN '[VR_LorryReceipts].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[VR_LorryReceipts].[CreatedOn] DESC'
                        WHEN 'LRStatusID' THEN '[VR_LorryReceipts].[LRStatusID]'
                        WHEN 'LRStatusID DESC' THEN '[VR_LorryReceipts].[LRStatusID] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'IDM_Projects2_Description' THEN '[IDM_Projects2].[Description]'
                        WHEN 'IDM_Projects2_Description DESC' THEN '[IDM_Projects2].[Description] DESC'
                        WHEN 'VR_BusinessPartner3_BPName' THEN '[VR_BusinessPartner3].[BPName]'
                        WHEN 'VR_BusinessPartner3_BPName DESC' THEN '[VR_BusinessPartner3].[BPName] DESC'
                        WHEN 'VR_LorryReceiptStatus4_Description' THEN '[VR_LorryReceiptStatus4].[Description]'
                        WHEN 'VR_LorryReceiptStatus4_Description DESC' THEN '[VR_LorryReceiptStatus4].[Description] DESC'
                        WHEN 'VR_MaterialStates5_Description' THEN '[VR_MaterialStates5].[Description]'
                        WHEN 'VR_MaterialStates5_Description DESC' THEN '[VR_MaterialStates5].[Description] DESC'
                        WHEN 'VR_RequestExecution6_ExecutionDescription' THEN '[VR_RequestExecution6].[ExecutionDescription]'
                        WHEN 'VR_RequestExecution6_ExecutionDescription DESC' THEN '[VR_RequestExecution6].[ExecutionDescription] DESC'
                        WHEN 'VR_Transporters7_TransporterName' THEN '[VR_Transporters7].[TransporterName]'
                        WHEN 'VR_Transporters7_TransporterName DESC' THEN '[VR_Transporters7].[TransporterName] DESC'
                        WHEN 'VR_VehicleTypes8_cmba' THEN '[VR_VehicleTypes8].[cmba]'
                        WHEN 'VR_VehicleTypes8_cmba DESC' THEN '[VR_VehicleTypes8].[cmba] DESC'
                        ELSE '[VR_LorryReceipts].[ProjectID],[VR_LorryReceipts].[MRNNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [VR_LorryReceipts].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [IDM_Projects2].[Description] AS IDM_Projects2_Description,
    [VR_BusinessPartner3].[BPName] AS VR_BusinessPartner3_BPName,
    [VR_LorryReceiptStatus4].[Description] AS VR_LorryReceiptStatus4_Description,
    [VR_MaterialStates5].[Description] AS VR_MaterialStates5_Description,
    [VR_RequestExecution6].[ExecutionDescription] AS VR_RequestExecution6_ExecutionDescription,
    [VR_Transporters7].[TransporterName] AS VR_Transporters7_TransporterName,
    [VR_VehicleTypes8].[cmba] AS VR_VehicleTypes8_cmba 
  FROM [VR_LorryReceipts] 
      INNER JOIN #PageIndex
          ON [VR_LorryReceipts].[ProjectID] = #PageIndex.ProjectID
          AND [VR_LorryReceipts].[MRNNo] = #PageIndex.MRNNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [VR_LorryReceipts].[CreatedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [VR_LorryReceipts].[ProjectID] = [IDM_Projects2].[ProjectID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner3]
    ON [VR_LorryReceipts].[CustomerID] = [VR_BusinessPartner3].[BPID]
  INNER JOIN [VR_LorryReceiptStatus] AS [VR_LorryReceiptStatus4]
    ON [VR_LorryReceipts].[LRStatusID] = [VR_LorryReceiptStatus4].[LRStatusID]
  LEFT OUTER JOIN [VR_MaterialStates] AS [VR_MaterialStates5]
    ON [VR_LorryReceipts].[MaterialStateID] = [VR_MaterialStates5].[MaterialStateID]
  LEFT OUTER JOIN [VR_RequestExecution] AS [VR_RequestExecution6]
    ON [VR_LorryReceipts].[RequestExecutionNo] = [VR_RequestExecution6].[SRNNo]
  LEFT OUTER JOIN [VR_Transporters] AS [VR_Transporters7]
    ON [VR_LorryReceipts].[TransporterID] = [VR_Transporters7].[TransporterID]
  LEFT OUTER JOIN [VR_VehicleTypes] AS [VR_VehicleTypes8]
    ON [VR_LorryReceipts].[VehicleTypeID] = [VR_VehicleTypes8].[VehicleTypeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
