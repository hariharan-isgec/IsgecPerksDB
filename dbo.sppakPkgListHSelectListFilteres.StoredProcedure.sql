USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPkgListHSelectListFilteres]
  @Filter_SerialNo Int,
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
 ,SerialNo Int NOT NULL
 ,PkgNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ', PkgNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_PkgListH].[SerialNo]'
  SET @LGSQL = @LGSQL + ', [PAK_PkgListH].[PkgNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_PkgListH] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListH].[CreatedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_PO] AS [PAK_PO2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListH].[SerialNo] = [PAK_PO2].[SerialNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListH].[UOMTotalWeight] = [PAK_Units3].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner4]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListH].[TransporterID] = [VR_BusinessPartner4].[BPID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_RequestExecution] AS [VR_RequestExecution5]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListH].[VRExecutionNo] = [VR_RequestExecution5].[SRNNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_PkgStatus] AS [PAK_PkgStatus6]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListH].[StatusID] = [PAK_PkgStatus6].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users7]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListH].[ReceivedAtPortBy] = [aspnet_users7].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_Ports] AS [ELOG_Ports8]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListH].[PortID] = [ELOG_Ports8].[PortID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects9]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListH].[ProjectID] = [IDM_Projects9].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users10]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PkgListH].[VRConvertedBy] = [aspnet_users10].[LoginID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_PkgListH].[SerialNo] = ' + STR(@Filter_SerialNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[PAK_PkgListH].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PAK_PkgListH].[SerialNo] DESC'
                        WHEN 'ReceivedAtPortOn' THEN '[PAK_PkgListH].[ReceivedAtPortOn]'
                        WHEN 'ReceivedAtPortOn DESC' THEN '[PAK_PkgListH].[ReceivedAtPortOn] DESC'
                        WHEN 'ReceivedAtPortBy' THEN '[PAK_PkgListH].[ReceivedAtPortBy]'
                        WHEN 'ReceivedAtPortBy DESC' THEN '[PAK_PkgListH].[ReceivedAtPortBy] DESC'
                        WHEN 'PortID' THEN '[PAK_PkgListH].[PortID]'
                        WHEN 'PortID DESC' THEN '[PAK_PkgListH].[PortID] DESC'
                        WHEN 'ProjectID' THEN '[PAK_PkgListH].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[PAK_PkgListH].[ProjectID] DESC'
                        WHEN 'VRRaised' THEN '[PAK_PkgListH].[VRRaised]'
                        WHEN 'VRRaised DESC' THEN '[PAK_PkgListH].[VRRaised] DESC'
                        WHEN 'VRRaisedOn' THEN '[PAK_PkgListH].[VRRaisedOn]'
                        WHEN 'VRRaisedOn DESC' THEN '[PAK_PkgListH].[VRRaisedOn] DESC'
                        WHEN 'VRConverted' THEN '[PAK_PkgListH].[VRConverted]'
                        WHEN 'VRConverted DESC' THEN '[PAK_PkgListH].[VRConverted] DESC'
                        WHEN 'VRConvertedOn' THEN '[PAK_PkgListH].[VRConvertedOn]'
                        WHEN 'VRConvertedOn DESC' THEN '[PAK_PkgListH].[VRConvertedOn] DESC'
                        WHEN 'VRConvertedBy' THEN '[PAK_PkgListH].[VRConvertedBy]'
                        WHEN 'VRConvertedBy DESC' THEN '[PAK_PkgListH].[VRConvertedBy] DESC'
                        WHEN 'VRRequestNo' THEN '[PAK_PkgListH].[VRRequestNo]'
                        WHEN 'VRRequestNo DESC' THEN '[PAK_PkgListH].[VRRequestNo] DESC'
                        WHEN 'VRExecuted' THEN '[PAK_PkgListH].[VRExecuted]'
                        WHEN 'VRExecuted DESC' THEN '[PAK_PkgListH].[VRExecuted] DESC'
                        WHEN 'PkgNo' THEN '[PAK_PkgListH].[PkgNo]'
                        WHEN 'PkgNo DESC' THEN '[PAK_PkgListH].[PkgNo] DESC'
                        WHEN 'SupplierRefNo' THEN '[PAK_PkgListH].[SupplierRefNo]'
                        WHEN 'SupplierRefNo DESC' THEN '[PAK_PkgListH].[SupplierRefNo] DESC'
                        WHEN 'TransporterID' THEN '[PAK_PkgListH].[TransporterID]'
                        WHEN 'TransporterID DESC' THEN '[PAK_PkgListH].[TransporterID] DESC'
                        WHEN 'TransporterName' THEN '[PAK_PkgListH].[TransporterName]'
                        WHEN 'TransporterName DESC' THEN '[PAK_PkgListH].[TransporterName] DESC'
                        WHEN 'VehicleNo' THEN '[PAK_PkgListH].[VehicleNo]'
                        WHEN 'VehicleNo DESC' THEN '[PAK_PkgListH].[VehicleNo] DESC'
                        WHEN 'GRNo' THEN '[PAK_PkgListH].[GRNo]'
                        WHEN 'GRNo DESC' THEN '[PAK_PkgListH].[GRNo] DESC'
                        WHEN 'GRDate' THEN '[PAK_PkgListH].[GRDate]'
                        WHEN 'GRDate DESC' THEN '[PAK_PkgListH].[GRDate] DESC'
                        WHEN 'VRExecutionNo' THEN '[PAK_PkgListH].[VRExecutionNo]'
                        WHEN 'VRExecutionNo DESC' THEN '[PAK_PkgListH].[VRExecutionNo] DESC'
                        WHEN 'Remarks' THEN '[PAK_PkgListH].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[PAK_PkgListH].[Remarks] DESC'
                        WHEN 'Additional2Info' THEN '[PAK_PkgListH].[Additional2Info]'
                        WHEN 'Additional2Info DESC' THEN '[PAK_PkgListH].[Additional2Info] DESC'
                        WHEN 'TotalWeight' THEN '[PAK_PkgListH].[TotalWeight]'
                        WHEN 'TotalWeight DESC' THEN '[PAK_PkgListH].[TotalWeight] DESC'
                        WHEN 'StatusID' THEN '[PAK_PkgListH].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[PAK_PkgListH].[StatusID] DESC'
                        WHEN 'Additional1Info' THEN '[PAK_PkgListH].[Additional1Info]'
                        WHEN 'Additional1Info DESC' THEN '[PAK_PkgListH].[Additional1Info] DESC'
                        WHEN 'CreatedOn' THEN '[PAK_PkgListH].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[PAK_PkgListH].[CreatedOn] DESC'
                        WHEN 'CreatedBy' THEN '[PAK_PkgListH].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[PAK_PkgListH].[CreatedBy] DESC'
                        WHEN 'UOMTotalWeight' THEN '[PAK_PkgListH].[UOMTotalWeight]'
                        WHEN 'UOMTotalWeight DESC' THEN '[PAK_PkgListH].[UOMTotalWeight] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'PAK_PO2_PODescription' THEN '[PAK_PO2].[PODescription]'
                        WHEN 'PAK_PO2_PODescription DESC' THEN '[PAK_PO2].[PODescription] DESC'
                        WHEN 'PAK_Units3_Description' THEN '[PAK_Units3].[Description]'
                        WHEN 'PAK_Units3_Description DESC' THEN '[PAK_Units3].[Description] DESC'
                        WHEN 'VR_BusinessPartner4_BPName' THEN '[VR_BusinessPartner4].[BPName]'
                        WHEN 'VR_BusinessPartner4_BPName DESC' THEN '[VR_BusinessPartner4].[BPName] DESC'
                        WHEN 'VR_RequestExecution5_ExecutionDescription' THEN '[VR_RequestExecution5].[ExecutionDescription]'
                        WHEN 'VR_RequestExecution5_ExecutionDescription DESC' THEN '[VR_RequestExecution5].[ExecutionDescription] DESC'
                        WHEN 'PAK_PkgStatus6_Description' THEN '[PAK_PkgStatus6].[Description]'
                        WHEN 'PAK_PkgStatus6_Description DESC' THEN '[PAK_PkgStatus6].[Description] DESC'
                        WHEN 'aspnet_Users7_UserFullName' THEN '[aspnet_Users7].[UserFullName]'
                        WHEN 'aspnet_Users7_UserFullName DESC' THEN '[aspnet_Users7].[UserFullName] DESC'
                        WHEN 'ELOG_Ports8_Description' THEN '[ELOG_Ports8].[Description]'
                        WHEN 'ELOG_Ports8_Description DESC' THEN '[ELOG_Ports8].[Description] DESC'
                        WHEN 'IDM_Projects9_Description' THEN '[IDM_Projects9].[Description]'
                        WHEN 'IDM_Projects9_Description DESC' THEN '[IDM_Projects9].[Description] DESC'
                        ELSE '[PAK_PkgListH].[SerialNo],[PAK_PkgListH].[PkgNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_PkgListH].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [PAK_PO2].[PODescription] AS PAK_PO2_PODescription,
    [PAK_Units3].[Description] AS PAK_Units3_Description,
    [VR_BusinessPartner4].[BPName] AS VR_BusinessPartner4_BPName,
    [VR_RequestExecution5].[ExecutionDescription] AS VR_RequestExecution5_ExecutionDescription,
    [PAK_PkgStatus6].[Description] AS PAK_PkgStatus6_Description,
    [aspnet_Users7].[UserFullName] AS aspnet_Users7_UserFullName,
    [ELOG_Ports8].[Description] AS ELOG_Ports8_Description,
    [IDM_Projects9].[Description] AS IDM_Projects9_Description,
    [aspnet_Users10].[UserFullName] AS aspnet_Users10_UserFullName 
  FROM [PAK_PkgListH] 
      INNER JOIN #PageIndex
          ON [PAK_PkgListH].[SerialNo] = #PageIndex.SerialNo
          AND [PAK_PkgListH].[PkgNo] = #PageIndex.PkgNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_PkgListH].[CreatedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [PAK_PO] AS [PAK_PO2]
    ON [PAK_PkgListH].[SerialNo] = [PAK_PO2].[SerialNo]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units3]
    ON [PAK_PkgListH].[UOMTotalWeight] = [PAK_Units3].[UnitID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner4]
    ON [PAK_PkgListH].[TransporterID] = [VR_BusinessPartner4].[BPID]
  LEFT OUTER JOIN [VR_RequestExecution] AS [VR_RequestExecution5]
    ON [PAK_PkgListH].[VRExecutionNo] = [VR_RequestExecution5].[SRNNo]
  LEFT OUTER JOIN [PAK_PkgStatus] AS [PAK_PkgStatus6]
    ON [PAK_PkgListH].[StatusID] = [PAK_PkgStatus6].[StatusID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users7]
    ON [PAK_PkgListH].[ReceivedAtPortBy] = [aspnet_users7].[LoginID]
  LEFT OUTER JOIN [ELOG_Ports] AS [ELOG_Ports8]
    ON [PAK_PkgListH].[PortID] = [ELOG_Ports8].[PortID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects9]
    ON [PAK_PkgListH].[ProjectID] = [IDM_Projects9].[ProjectID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users10]
    ON [PAK_PkgListH].[VRConvertedBy] = [aspnet_users10].[LoginID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
