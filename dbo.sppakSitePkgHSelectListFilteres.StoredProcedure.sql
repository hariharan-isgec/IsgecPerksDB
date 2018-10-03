USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgHSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @Filter_SerialNo Int,
  @Filter_PkgNo Int,
  @Filter_SupplierID NVarChar(9),
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
 ,RecNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', RecNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_SitePkgH].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [PAK_SitePkgH].[RecNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_SitePkgH] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgH].[CreatedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgH].[ProjectID] = [IDM_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_PkgListH] AS [PAK_PkgListH3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgH].[SerialNo] = [PAK_PkgListH3].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SitePkgH].[PkgNo] = [PAK_PkgListH3].[PkgNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_PO] AS [PAK_PO4]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgH].[SerialNo] = [PAK_PO4].[SerialNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_ReceiveStatus] AS [PAK_ReceiveStatus5]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgH].[ReceiveStatusID] = [PAK_ReceiveStatus5].[ReceiveStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units6]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgH].[UOMTotalWeight] = [PAK_Units6].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner7]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgH].[TransporterID] = [VR_BusinessPartner7].[BPID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner8]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgH].[SupplierID] = [VR_BusinessPartner8].[BPID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_LorryReceipts] AS [VR_LorryReceipts9]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgH].[ProjectID] = [VR_LorryReceipts9].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SitePkgH].[MRNNo] = [VR_LorryReceipts9].[MRNNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_MaterialStates] AS [VR_MaterialStates10]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgH].[MaterialStatusID] = [VR_MaterialStates10].[MaterialStateID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_SitePkgH].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_SitePkgH].[SerialNo] = ' + STR(@Filter_SerialNo)
  IF (@Filter_PkgNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_SitePkgH].[PkgNo] = ' + STR(@Filter_PkgNo)
  IF (@Filter_SupplierID > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_SitePkgH].[SupplierID] = ''' + @Filter_SupplierID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[PAK_SitePkgH].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[PAK_SitePkgH].[ProjectID] DESC'
                        WHEN 'RecNo' THEN '[PAK_SitePkgH].[RecNo]'
                        WHEN 'RecNo DESC' THEN '[PAK_SitePkgH].[RecNo] DESC'
                        WHEN 'SerialNo' THEN '[PAK_SitePkgH].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PAK_SitePkgH].[SerialNo] DESC'
                        WHEN 'PkgNo' THEN '[PAK_SitePkgH].[PkgNo]'
                        WHEN 'PkgNo DESC' THEN '[PAK_SitePkgH].[PkgNo] DESC'
                        WHEN 'MRNNo' THEN '[PAK_SitePkgH].[MRNNo]'
                        WHEN 'MRNNo DESC' THEN '[PAK_SitePkgH].[MRNNo] DESC'
                        WHEN 'SupplierID' THEN '[PAK_SitePkgH].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[PAK_SitePkgH].[SupplierID] DESC'
                        WHEN 'SupplierName' THEN '[PAK_SitePkgH].[SupplierName]'
                        WHEN 'SupplierName DESC' THEN '[PAK_SitePkgH].[SupplierName] DESC'
                        WHEN 'SupplierRefNo' THEN '[PAK_SitePkgH].[SupplierRefNo]'
                        WHEN 'SupplierRefNo DESC' THEN '[PAK_SitePkgH].[SupplierRefNo] DESC'
                        WHEN 'TransporterID' THEN '[PAK_SitePkgH].[TransporterID]'
                        WHEN 'TransporterID DESC' THEN '[PAK_SitePkgH].[TransporterID] DESC'
                        WHEN 'TransporterName' THEN '[PAK_SitePkgH].[TransporterName]'
                        WHEN 'TransporterName DESC' THEN '[PAK_SitePkgH].[TransporterName] DESC'
                        WHEN 'VehicleNo' THEN '[PAK_SitePkgH].[VehicleNo]'
                        WHEN 'VehicleNo DESC' THEN '[PAK_SitePkgH].[VehicleNo] DESC'
                        WHEN 'GRNo' THEN '[PAK_SitePkgH].[GRNo]'
                        WHEN 'GRNo DESC' THEN '[PAK_SitePkgH].[GRNo] DESC'
                        WHEN 'GRDate' THEN '[PAK_SitePkgH].[GRDate]'
                        WHEN 'GRDate DESC' THEN '[PAK_SitePkgH].[GRDate] DESC'
                        WHEN 'UOMTotalWeight' THEN '[PAK_SitePkgH].[UOMTotalWeight]'
                        WHEN 'UOMTotalWeight DESC' THEN '[PAK_SitePkgH].[UOMTotalWeight] DESC'
                        WHEN 'TotalWeight' THEN '[PAK_SitePkgH].[TotalWeight]'
                        WHEN 'TotalWeight DESC' THEN '[PAK_SitePkgH].[TotalWeight] DESC'
                        WHEN 'ODC' THEN '[PAK_SitePkgH].[ODC]'
                        WHEN 'ODC DESC' THEN '[PAK_SitePkgH].[ODC] DESC'
                        WHEN 'MaterialStatusID' THEN '[PAK_SitePkgH].[MaterialStatusID]'
                        WHEN 'MaterialStatusID DESC' THEN '[PAK_SitePkgH].[MaterialStatusID] DESC'
                        WHEN 'Remarks' THEN '[PAK_SitePkgH].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[PAK_SitePkgH].[Remarks] DESC'
                        WHEN 'CreatedOn' THEN '[PAK_SitePkgH].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[PAK_SitePkgH].[CreatedOn] DESC'
                        WHEN 'CreatedBy' THEN '[PAK_SitePkgH].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[PAK_SitePkgH].[CreatedBy] DESC'
                        WHEN 'ReceiveStatusID' THEN '[PAK_SitePkgH].[ReceiveStatusID]'
                        WHEN 'ReceiveStatusID DESC' THEN '[PAK_SitePkgH].[ReceiveStatusID] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'IDM_Projects2_Description' THEN '[IDM_Projects2].[Description]'
                        WHEN 'IDM_Projects2_Description DESC' THEN '[IDM_Projects2].[Description] DESC'
                        WHEN 'PAK_PkgListH3_SupplierRefNo' THEN '[PAK_PkgListH3].[SupplierRefNo]'
                        WHEN 'PAK_PkgListH3_SupplierRefNo DESC' THEN '[PAK_PkgListH3].[SupplierRefNo] DESC'
                        WHEN 'PAK_PO4_PODescription' THEN '[PAK_PO4].[PODescription]'
                        WHEN 'PAK_PO4_PODescription DESC' THEN '[PAK_PO4].[PODescription] DESC'
                        WHEN 'PAK_ReceiveStatus5_Description' THEN '[PAK_ReceiveStatus5].[Description]'
                        WHEN 'PAK_ReceiveStatus5_Description DESC' THEN '[PAK_ReceiveStatus5].[Description] DESC'
                        WHEN 'PAK_Units6_Description' THEN '[PAK_Units6].[Description]'
                        WHEN 'PAK_Units6_Description DESC' THEN '[PAK_Units6].[Description] DESC'
                        WHEN 'VR_BusinessPartner7_BPName' THEN '[VR_BusinessPartner7].[BPName]'
                        WHEN 'VR_BusinessPartner7_BPName DESC' THEN '[VR_BusinessPartner7].[BPName] DESC'
                        WHEN 'VR_BusinessPartner8_BPName' THEN '[VR_BusinessPartner8].[BPName]'
                        WHEN 'VR_BusinessPartner8_BPName DESC' THEN '[VR_BusinessPartner8].[BPName] DESC'
                        WHEN 'VR_LorryReceipts9_TransporterName' THEN '[VR_LorryReceipts9].[TransporterName]'
                        WHEN 'VR_LorryReceipts9_TransporterName DESC' THEN '[VR_LorryReceipts9].[TransporterName] DESC'
                        WHEN 'VR_MaterialStates10_Description' THEN '[VR_MaterialStates10].[Description]'
                        WHEN 'VR_MaterialStates10_Description DESC' THEN '[VR_MaterialStates10].[Description] DESC'
                        ELSE '[PAK_SitePkgH].[ProjectID],[PAK_SitePkgH].[RecNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_SitePkgH].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [IDM_Projects2].[Description] AS IDM_Projects2_Description,
    [PAK_PkgListH3].[SupplierRefNo] AS PAK_PkgListH3_SupplierRefNo,
    [PAK_PO4].[PODescription] AS PAK_PO4_PODescription,
    [PAK_ReceiveStatus5].[Description] AS PAK_ReceiveStatus5_Description,
    [PAK_Units6].[Description] AS PAK_Units6_Description,
    [VR_BusinessPartner7].[BPName] AS VR_BusinessPartner7_BPName,
    [VR_BusinessPartner8].[BPName] AS VR_BusinessPartner8_BPName,
    [VR_LorryReceipts9].[TransporterName] AS VR_LorryReceipts9_TransporterName,
    [VR_MaterialStates10].[Description] AS VR_MaterialStates10_Description 
  FROM [PAK_SitePkgH] 
      INNER JOIN #PageIndex
          ON [PAK_SitePkgH].[ProjectID] = #PageIndex.ProjectID
          AND [PAK_SitePkgH].[RecNo] = #PageIndex.RecNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_SitePkgH].[CreatedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [PAK_SitePkgH].[ProjectID] = [IDM_Projects2].[ProjectID]
  LEFT OUTER JOIN [PAK_PkgListH] AS [PAK_PkgListH3]
    ON [PAK_SitePkgH].[SerialNo] = [PAK_PkgListH3].[SerialNo]
    AND [PAK_SitePkgH].[PkgNo] = [PAK_PkgListH3].[PkgNo]
  LEFT OUTER JOIN [PAK_PO] AS [PAK_PO4]
    ON [PAK_SitePkgH].[SerialNo] = [PAK_PO4].[SerialNo]
  LEFT OUTER JOIN [PAK_ReceiveStatus] AS [PAK_ReceiveStatus5]
    ON [PAK_SitePkgH].[ReceiveStatusID] = [PAK_ReceiveStatus5].[ReceiveStatusID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units6]
    ON [PAK_SitePkgH].[UOMTotalWeight] = [PAK_Units6].[UnitID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner7]
    ON [PAK_SitePkgH].[TransporterID] = [VR_BusinessPartner7].[BPID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner8]
    ON [PAK_SitePkgH].[SupplierID] = [VR_BusinessPartner8].[BPID]
  LEFT OUTER JOIN [VR_LorryReceipts] AS [VR_LorryReceipts9]
    ON [PAK_SitePkgH].[ProjectID] = [VR_LorryReceipts9].[ProjectID]
    AND [PAK_SitePkgH].[MRNNo] = [VR_LorryReceipts9].[MRNNo]
  LEFT OUTER JOIN [VR_MaterialStates] AS [VR_MaterialStates10]
    ON [PAK_SitePkgH].[MaterialStatusID] = [VR_MaterialStates10].[MaterialStateID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
