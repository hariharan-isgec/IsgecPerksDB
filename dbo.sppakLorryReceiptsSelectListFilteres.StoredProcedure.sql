USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakLorryReceiptsSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_MaterialStates] AS [VR_MaterialStates5]'
  SET @LGSQL = @LGSQL + '    ON [VR_LorryReceipts].[MaterialStateID] = [VR_MaterialStates5].[MaterialStateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_RequestExecution] AS [VR_RequestExecution6]'
  SET @LGSQL = @LGSQL + '    ON [VR_LorryReceipts].[RequestExecutionNo] = [VR_RequestExecution6].[SRNNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner7]'
  SET @LGSQL = @LGSQL + '    ON [VR_LorryReceipts].[TransporterID] = [VR_BusinessPartner7].[BPID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[VR_LorryReceipts].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[VR_LorryReceipts].[ProjectID] DESC'
                        WHEN 'MRNNo' THEN '[VR_LorryReceipts].[MRNNo]'
                        WHEN 'MRNNo DESC' THEN '[VR_LorryReceipts].[MRNNo] DESC'
                        WHEN 'MRNDate' THEN '[VR_LorryReceipts].[MRNDate]'
                        WHEN 'MRNDate DESC' THEN '[VR_LorryReceipts].[MRNDate] DESC'
                        WHEN 'RequestExecutionNo' THEN '[VR_LorryReceipts].[RequestExecutionNo]'
                        WHEN 'RequestExecutionNo DESC' THEN '[VR_LorryReceipts].[RequestExecutionNo] DESC'
                        WHEN 'CustomerID' THEN '[VR_LorryReceipts].[CustomerID]'
                        WHEN 'CustomerID DESC' THEN '[VR_LorryReceipts].[CustomerID] DESC'
                        WHEN 'VehicleInDate' THEN '[VR_LorryReceipts].[VehicleInDate]'
                        WHEN 'VehicleInDate DESC' THEN '[VR_LorryReceipts].[VehicleInDate] DESC'
                        WHEN 'VehicleOutDate' THEN '[VR_LorryReceipts].[VehicleOutDate]'
                        WHEN 'VehicleOutDate DESC' THEN '[VR_LorryReceipts].[VehicleOutDate] DESC'
                        WHEN 'TransporterID' THEN '[VR_LorryReceipts].[TransporterID]'
                        WHEN 'TransporterID DESC' THEN '[VR_LorryReceipts].[TransporterID] DESC'
                        WHEN 'TransporterName' THEN '[VR_LorryReceipts].[TransporterName]'
                        WHEN 'TransporterName DESC' THEN '[VR_LorryReceipts].[TransporterName] DESC'
                        WHEN 'VehicleRegistrationNo' THEN '[VR_LorryReceipts].[VehicleRegistrationNo]'
                        WHEN 'VehicleRegistrationNo DESC' THEN '[VR_LorryReceipts].[VehicleRegistrationNo] DESC'
                        WHEN 'WayBillFormNo' THEN '[VR_LorryReceipts].[WayBillFormNo]'
                        WHEN 'WayBillFormNo DESC' THEN '[VR_LorryReceipts].[WayBillFormNo] DESC'
                        WHEN 'PaymentMadeAtSite' THEN '[VR_LorryReceipts].[PaymentMadeAtSite]'
                        WHEN 'PaymentMadeAtSite DESC' THEN '[VR_LorryReceipts].[PaymentMadeAtSite] DESC'
                        WHEN 'AmountPaid' THEN '[VR_LorryReceipts].[AmountPaid]'
                        WHEN 'AmountPaid DESC' THEN '[VR_LorryReceipts].[AmountPaid] DESC'
                        WHEN 'CreatedBy' THEN '[VR_LorryReceipts].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[VR_LorryReceipts].[CreatedBy] DESC'
                        WHEN 'CreatedOn' THEN '[VR_LorryReceipts].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[VR_LorryReceipts].[CreatedOn] DESC'
                        WHEN 'OverDimensionConsignment' THEN '[VR_LorryReceipts].[OverDimensionConsignment]'
                        WHEN 'OverDimensionConsignment DESC' THEN '[VR_LorryReceipts].[OverDimensionConsignment] DESC'
                        WHEN 'DetentionAtSite' THEN '[VR_LorryReceipts].[DetentionAtSite]'
                        WHEN 'DetentionAtSite DESC' THEN '[VR_LorryReceipts].[DetentionAtSite] DESC'
                        WHEN 'ReasonForDetention' THEN '[VR_LorryReceipts].[ReasonForDetention]'
                        WHEN 'ReasonForDetention DESC' THEN '[VR_LorryReceipts].[ReasonForDetention] DESC'
                        WHEN 'OtherRemarks' THEN '[VR_LorryReceipts].[OtherRemarks]'
                        WHEN 'OtherRemarks DESC' THEN '[VR_LorryReceipts].[OtherRemarks] DESC'
                        WHEN 'MaterialStateID' THEN '[VR_LorryReceipts].[MaterialStateID]'
                        WHEN 'MaterialStateID DESC' THEN '[VR_LorryReceipts].[MaterialStateID] DESC'
                        WHEN 'RemarksForDamageOrShortage' THEN '[VR_LorryReceipts].[RemarksForDamageOrShortage]'
                        WHEN 'RemarksForDamageOrShortage DESC' THEN '[VR_LorryReceipts].[RemarksForDamageOrShortage] DESC'
                        WHEN 'DriverNameAndContactNo' THEN '[VR_LorryReceipts].[DriverNameAndContactNo]'
                        WHEN 'DriverNameAndContactNo DESC' THEN '[VR_LorryReceipts].[DriverNameAndContactNo] DESC'
                        WHEN 'TempMRNNo' THEN '[VR_LorryReceipts].[TempMRNNo]'
                        WHEN 'TempMRNNo DESC' THEN '[VR_LorryReceipts].[TempMRNNo] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'IDM_Projects2_Description' THEN '[IDM_Projects2].[Description]'
                        WHEN 'IDM_Projects2_Description DESC' THEN '[IDM_Projects2].[Description] DESC'
                        WHEN 'VR_BusinessPartner3_BPName' THEN '[VR_BusinessPartner3].[BPName]'
                        WHEN 'VR_BusinessPartner3_BPName DESC' THEN '[VR_BusinessPartner3].[BPName] DESC'
                        WHEN 'VR_MaterialStates5_Description' THEN '[VR_MaterialStates5].[Description]'
                        WHEN 'VR_MaterialStates5_Description DESC' THEN '[VR_MaterialStates5].[Description] DESC'
                        WHEN 'VR_RequestExecution6_ExecutionDescription' THEN '[VR_RequestExecution6].[ExecutionDescription]'
                        WHEN 'VR_RequestExecution6_ExecutionDescription DESC' THEN '[VR_RequestExecution6].[ExecutionDescription] DESC'
                        WHEN 'VR_BusinessPartner7_BPName' THEN '[VR_BusinessPartner7].[BPName]'
                        WHEN 'VR_BusinessPartner7_BPName DESC' THEN '[VR_BusinessPartner7].[BPName] DESC'
                        ELSE '[VR_LorryReceipts].[ProjectID],[VR_LorryReceipts].[MRNNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [VR_LorryReceipts].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [IDM_Projects2].[Description] AS IDM_Projects2_Description,
    [VR_BusinessPartner3].[BPName] AS VR_BusinessPartner3_BPName,
    [VR_MaterialStates5].[Description] AS VR_MaterialStates5_Description,
    [VR_RequestExecution6].[ExecutionDescription] AS VR_RequestExecution6_ExecutionDescription,
    [VR_BusinessPartner7].[BPName] AS VR_BusinessPartner7_BPName 
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
  LEFT OUTER JOIN [VR_MaterialStates] AS [VR_MaterialStates5]
    ON [VR_LorryReceipts].[MaterialStateID] = [VR_MaterialStates5].[MaterialStateID]
  LEFT OUTER JOIN [VR_RequestExecution] AS [VR_RequestExecution6]
    ON [VR_LorryReceipts].[RequestExecutionNo] = [VR_RequestExecution6].[SRNNo]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner7]
    ON [VR_LorryReceipts].[TransporterID] = [VR_BusinessPartner7].[BPID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
