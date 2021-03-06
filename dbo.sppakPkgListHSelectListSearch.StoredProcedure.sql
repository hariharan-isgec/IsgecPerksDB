USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPkgListHSelectListSearch]
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
 ,SerialNo Int NOT NULL
 ,PkgNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo, PkgNo)
  SELECT [PAK_PkgListH].[SerialNo], [PAK_PkgListH].[PkgNo] FROM [PAK_PkgListH]
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
   ( 
         STR(ISNULL([PAK_PkgListH].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PkgListH].[ReceivedAtPortBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListH].[PortID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PkgListH].[ProjectID],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListH].[PkgNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PkgListH].[SupplierRefNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PkgListH].[TransporterID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PkgListH].[TransporterName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PkgListH].[VehicleNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PkgListH].[GRNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListH].[VRExecutionNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PkgListH].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PkgListH].[Additional2Info],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListH].[TotalWeight], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListH].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PkgListH].[Additional1Info],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PkgListH].[CreatedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PkgListH].[UOMTotalWeight], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [PAK_PkgListH].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [PAK_PkgListH].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'ReceivedAtPortOn' THEN [PAK_PkgListH].[ReceivedAtPortOn] END,
     CASE @OrderBy WHEN 'ReceivedAtPortOn DESC' THEN [PAK_PkgListH].[ReceivedAtPortOn] END DESC,
     CASE @OrderBy WHEN 'ReceivedAtPortBy' THEN [PAK_PkgListH].[ReceivedAtPortBy] END,
     CASE @OrderBy WHEN 'ReceivedAtPortBy DESC' THEN [PAK_PkgListH].[ReceivedAtPortBy] END DESC,
     CASE @OrderBy WHEN 'PortID' THEN [PAK_PkgListH].[PortID] END,
     CASE @OrderBy WHEN 'PortID DESC' THEN [PAK_PkgListH].[PortID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [PAK_PkgListH].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [PAK_PkgListH].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'PkgNo' THEN [PAK_PkgListH].[PkgNo] END,
     CASE @OrderBy WHEN 'PkgNo DESC' THEN [PAK_PkgListH].[PkgNo] END DESC,
     CASE @OrderBy WHEN 'SupplierRefNo' THEN [PAK_PkgListH].[SupplierRefNo] END,
     CASE @OrderBy WHEN 'SupplierRefNo DESC' THEN [PAK_PkgListH].[SupplierRefNo] END DESC,
     CASE @OrderBy WHEN 'TransporterID' THEN [PAK_PkgListH].[TransporterID] END,
     CASE @OrderBy WHEN 'TransporterID DESC' THEN [PAK_PkgListH].[TransporterID] END DESC,
     CASE @OrderBy WHEN 'TransporterName' THEN [PAK_PkgListH].[TransporterName] END,
     CASE @OrderBy WHEN 'TransporterName DESC' THEN [PAK_PkgListH].[TransporterName] END DESC,
     CASE @OrderBy WHEN 'VehicleNo' THEN [PAK_PkgListH].[VehicleNo] END,
     CASE @OrderBy WHEN 'VehicleNo DESC' THEN [PAK_PkgListH].[VehicleNo] END DESC,
     CASE @OrderBy WHEN 'GRNo' THEN [PAK_PkgListH].[GRNo] END,
     CASE @OrderBy WHEN 'GRNo DESC' THEN [PAK_PkgListH].[GRNo] END DESC,
     CASE @OrderBy WHEN 'GRDate' THEN [PAK_PkgListH].[GRDate] END,
     CASE @OrderBy WHEN 'GRDate DESC' THEN [PAK_PkgListH].[GRDate] END DESC,
     CASE @OrderBy WHEN 'VRExecutionNo' THEN [PAK_PkgListH].[VRExecutionNo] END,
     CASE @OrderBy WHEN 'VRExecutionNo DESC' THEN [PAK_PkgListH].[VRExecutionNo] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [PAK_PkgListH].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [PAK_PkgListH].[Remarks] END DESC,
     CASE @OrderBy WHEN 'Additional2Info' THEN [PAK_PkgListH].[Additional2Info] END,
     CASE @OrderBy WHEN 'Additional2Info DESC' THEN [PAK_PkgListH].[Additional2Info] END DESC,
     CASE @OrderBy WHEN 'TotalWeight' THEN [PAK_PkgListH].[TotalWeight] END,
     CASE @OrderBy WHEN 'TotalWeight DESC' THEN [PAK_PkgListH].[TotalWeight] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [PAK_PkgListH].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [PAK_PkgListH].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Additional1Info' THEN [PAK_PkgListH].[Additional1Info] END,
     CASE @OrderBy WHEN 'Additional1Info DESC' THEN [PAK_PkgListH].[Additional1Info] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [PAK_PkgListH].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [PAK_PkgListH].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [PAK_PkgListH].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [PAK_PkgListH].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'UOMTotalWeight' THEN [PAK_PkgListH].[UOMTotalWeight] END,
     CASE @OrderBy WHEN 'UOMTotalWeight DESC' THEN [PAK_PkgListH].[UOMTotalWeight] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'PAK_PO2_PODescription' THEN [PAK_PO2].[PODescription] END,
     CASE @OrderBy WHEN 'PAK_PO2_PODescription DESC' THEN [PAK_PO2].[PODescription] END DESC,
     CASE @OrderBy WHEN 'PAK_Units3_Description' THEN [PAK_Units3].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units3_Description DESC' THEN [PAK_Units3].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner4_BPName' THEN [VR_BusinessPartner4].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner4_BPName DESC' THEN [VR_BusinessPartner4].[BPName] END DESC,
     CASE @OrderBy WHEN 'VR_RequestExecution5_ExecutionDescription' THEN [VR_RequestExecution5].[ExecutionDescription] END,
     CASE @OrderBy WHEN 'VR_RequestExecution5_ExecutionDescription DESC' THEN [VR_RequestExecution5].[ExecutionDescription] END DESC,
     CASE @OrderBy WHEN 'PAK_PkgStatus6_Description' THEN [PAK_PkgStatus6].[Description] END,
     CASE @OrderBy WHEN 'PAK_PkgStatus6_Description DESC' THEN [PAK_PkgStatus6].[Description] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users7_UserFullName' THEN [aspnet_Users7].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users7_UserFullName DESC' THEN [aspnet_Users7].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'ELOG_Ports8_Description' THEN [ELOG_Ports8].[Description] END,
     CASE @OrderBy WHEN 'ELOG_Ports8_Description DESC' THEN [ELOG_Ports8].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects9_Description' THEN [IDM_Projects9].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects9_Description DESC' THEN [IDM_Projects9].[Description] END DESC 

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
