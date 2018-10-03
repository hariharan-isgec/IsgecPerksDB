USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakLorryReceiptsSelectListSearch]
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
 ,ProjectID NVarChar(6) NOT NULL
 ,MRNNo Int NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID, MRNNo)
  SELECT [VR_LorryReceipts].[ProjectID], [VR_LorryReceipts].[MRNNo] FROM [VR_LorryReceipts]
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
   ( 
         LOWER(ISNULL([VR_LorryReceipts].[ProjectID],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_LorryReceipts].[MRNNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_LorryReceipts].[RequestExecutionNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceipts].[CustomerID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceipts].[TransporterID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceipts].[TransporterName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceipts].[VehicleRegistrationNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceipts].[WayBillFormNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_LorryReceipts].[AmountPaid], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceipts].[CreatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceipts].[OverDimensionConsignment],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceipts].[DetentionAtSite],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceipts].[ReasonForDetention],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceipts].[OtherRemarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_LorryReceipts].[MaterialStateID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceipts].[RemarksForDamageOrShortage],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceipts].[DriverNameAndContactNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_LorryReceipts].[TempMRNNo], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [VR_LorryReceipts].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [VR_LorryReceipts].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'MRNNo' THEN [VR_LorryReceipts].[MRNNo] END,
     CASE @OrderBy WHEN 'MRNNo DESC' THEN [VR_LorryReceipts].[MRNNo] END DESC,
     CASE @OrderBy WHEN 'MRNDate' THEN [VR_LorryReceipts].[MRNDate] END,
     CASE @OrderBy WHEN 'MRNDate DESC' THEN [VR_LorryReceipts].[MRNDate] END DESC,
     CASE @OrderBy WHEN 'RequestExecutionNo' THEN [VR_LorryReceipts].[RequestExecutionNo] END,
     CASE @OrderBy WHEN 'RequestExecutionNo DESC' THEN [VR_LorryReceipts].[RequestExecutionNo] END DESC,
     CASE @OrderBy WHEN 'CustomerID' THEN [VR_LorryReceipts].[CustomerID] END,
     CASE @OrderBy WHEN 'CustomerID DESC' THEN [VR_LorryReceipts].[CustomerID] END DESC,
     CASE @OrderBy WHEN 'VehicleInDate' THEN [VR_LorryReceipts].[VehicleInDate] END,
     CASE @OrderBy WHEN 'VehicleInDate DESC' THEN [VR_LorryReceipts].[VehicleInDate] END DESC,
     CASE @OrderBy WHEN 'VehicleOutDate' THEN [VR_LorryReceipts].[VehicleOutDate] END,
     CASE @OrderBy WHEN 'VehicleOutDate DESC' THEN [VR_LorryReceipts].[VehicleOutDate] END DESC,
     CASE @OrderBy WHEN 'TransporterID' THEN [VR_LorryReceipts].[TransporterID] END,
     CASE @OrderBy WHEN 'TransporterID DESC' THEN [VR_LorryReceipts].[TransporterID] END DESC,
     CASE @OrderBy WHEN 'TransporterName' THEN [VR_LorryReceipts].[TransporterName] END,
     CASE @OrderBy WHEN 'TransporterName DESC' THEN [VR_LorryReceipts].[TransporterName] END DESC,
     CASE @OrderBy WHEN 'VehicleRegistrationNo' THEN [VR_LorryReceipts].[VehicleRegistrationNo] END,
     CASE @OrderBy WHEN 'VehicleRegistrationNo DESC' THEN [VR_LorryReceipts].[VehicleRegistrationNo] END DESC,
     CASE @OrderBy WHEN 'WayBillFormNo' THEN [VR_LorryReceipts].[WayBillFormNo] END,
     CASE @OrderBy WHEN 'WayBillFormNo DESC' THEN [VR_LorryReceipts].[WayBillFormNo] END DESC,
     CASE @OrderBy WHEN 'PaymentMadeAtSite' THEN [VR_LorryReceipts].[PaymentMadeAtSite] END,
     CASE @OrderBy WHEN 'PaymentMadeAtSite DESC' THEN [VR_LorryReceipts].[PaymentMadeAtSite] END DESC,
     CASE @OrderBy WHEN 'AmountPaid' THEN [VR_LorryReceipts].[AmountPaid] END,
     CASE @OrderBy WHEN 'AmountPaid DESC' THEN [VR_LorryReceipts].[AmountPaid] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [VR_LorryReceipts].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [VR_LorryReceipts].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [VR_LorryReceipts].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [VR_LorryReceipts].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'OverDimensionConsignment' THEN [VR_LorryReceipts].[OverDimensionConsignment] END,
     CASE @OrderBy WHEN 'OverDimensionConsignment DESC' THEN [VR_LorryReceipts].[OverDimensionConsignment] END DESC,
     CASE @OrderBy WHEN 'DetentionAtSite' THEN [VR_LorryReceipts].[DetentionAtSite] END,
     CASE @OrderBy WHEN 'DetentionAtSite DESC' THEN [VR_LorryReceipts].[DetentionAtSite] END DESC,
     CASE @OrderBy WHEN 'ReasonForDetention' THEN [VR_LorryReceipts].[ReasonForDetention] END,
     CASE @OrderBy WHEN 'ReasonForDetention DESC' THEN [VR_LorryReceipts].[ReasonForDetention] END DESC,
     CASE @OrderBy WHEN 'OtherRemarks' THEN [VR_LorryReceipts].[OtherRemarks] END,
     CASE @OrderBy WHEN 'OtherRemarks DESC' THEN [VR_LorryReceipts].[OtherRemarks] END DESC,
     CASE @OrderBy WHEN 'MaterialStateID' THEN [VR_LorryReceipts].[MaterialStateID] END,
     CASE @OrderBy WHEN 'MaterialStateID DESC' THEN [VR_LorryReceipts].[MaterialStateID] END DESC,
     CASE @OrderBy WHEN 'RemarksForDamageOrShortage' THEN [VR_LorryReceipts].[RemarksForDamageOrShortage] END,
     CASE @OrderBy WHEN 'RemarksForDamageOrShortage DESC' THEN [VR_LorryReceipts].[RemarksForDamageOrShortage] END DESC,
     CASE @OrderBy WHEN 'DriverNameAndContactNo' THEN [VR_LorryReceipts].[DriverNameAndContactNo] END,
     CASE @OrderBy WHEN 'DriverNameAndContactNo DESC' THEN [VR_LorryReceipts].[DriverNameAndContactNo] END DESC,
     CASE @OrderBy WHEN 'TempMRNNo' THEN [VR_LorryReceipts].[TempMRNNo] END,
     CASE @OrderBy WHEN 'TempMRNNo DESC' THEN [VR_LorryReceipts].[TempMRNNo] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner3_BPName' THEN [VR_BusinessPartner3].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner3_BPName DESC' THEN [VR_BusinessPartner3].[BPName] END DESC,
     CASE @OrderBy WHEN 'VR_MaterialStates5_Description' THEN [VR_MaterialStates5].[Description] END,
     CASE @OrderBy WHEN 'VR_MaterialStates5_Description DESC' THEN [VR_MaterialStates5].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_RequestExecution6_ExecutionDescription' THEN [VR_RequestExecution6].[ExecutionDescription] END,
     CASE @OrderBy WHEN 'VR_RequestExecution6_ExecutionDescription DESC' THEN [VR_RequestExecution6].[ExecutionDescription] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner7_BPName' THEN [VR_BusinessPartner7].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner7_BPName DESC' THEN [VR_BusinessPartner7].[BPName] END DESC 

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
