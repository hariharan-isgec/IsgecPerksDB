USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcm_LG_IEntryFieldSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @Filter_SupplierID NVarChar(9),
  @Filter_RequestStateID NVarChar(10),
  @Filter_InspectionStatusID Int,
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
 ,RequestID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QCM_Requests].[RequestID]'
  SET @LGSQL = @LGSQL + ' FROM [QCM_Requests] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Requests].[CreatedBy] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Requests].[AllotedTo] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Requests].[AllotedBy] = [HRM_Employees3].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Requests].[CancelledBy] = [HRM_Employees4].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Requests].[ReceivedBy] = [HRM_Employees5].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects6]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Requests].[ProjectID] = [IDM_Projects6].[ProjectID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Vendors] AS [IDM_Vendors7]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Requests].[SupplierID] = [IDM_Vendors7].[VendorID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [QCM_InspectionStages] AS [QCM_InspectionStages8]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Requests].[InspectionStageiD] = [QCM_InspectionStages8].[InspectionStageID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [QCM_ReceivingMediums] AS [QCM_ReceivingMediums9]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Requests].[ReceivingMediumID] = [QCM_ReceivingMediums9].[ReceivingMediumID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [QCM_RequestStates] AS [QCM_RequestStates10]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Requests].[RequestStateID] = [QCM_RequestStates10].[StateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [QCM_InspectionStatus] AS [QCM_InspectionStatus11]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Requests].[InspectionStatusID] = [QCM_InspectionStatus11].[InspectionStatusID]'
  SET @LGSQL = @LGSQL + '  WHERE [QCM_Requests].[RequestStateID] IN (''ALLOTED'',''INSPECTED'',''CLOSED'')'
  SET @LGSQL = @LGSQL + '   AND [QCM_Requests].[AllotedTo] = ''' + @LoginID + ''''
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [QCM_Requests].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_SupplierID > '') 
    SET @LGSQL = @LGSQL + ' AND [QCM_Requests].[SupplierID] = ''' + @Filter_SupplierID + ''''
  IF (@Filter_RequestStateID > '') 
    SET @LGSQL = @LGSQL + ' AND [QCM_Requests].[RequestStateID] = ''' + @Filter_RequestStateID + ''''
  IF (@Filter_InspectionStatusID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QCM_Requests].[InspectionStatusID] = ' + STR(@Filter_InspectionStatusID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestID' THEN '[QCM_Requests].[RequestID]'
                        WHEN 'RequestID DESC' THEN '[QCM_Requests].[RequestID] DESC'
                        WHEN 'ProjectID' THEN '[QCM_Requests].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[QCM_Requests].[ProjectID] DESC'
                        WHEN 'OrderNo' THEN '[QCM_Requests].[OrderNo]'
                        WHEN 'OrderNo DESC' THEN '[QCM_Requests].[OrderNo] DESC'
                        WHEN 'OrderDate' THEN '[QCM_Requests].[OrderDate]'
                        WHEN 'OrderDate DESC' THEN '[QCM_Requests].[OrderDate] DESC'
                        WHEN 'SupplierID' THEN '[QCM_Requests].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[QCM_Requests].[SupplierID] DESC'
                        WHEN 'Description' THEN '[QCM_Requests].[Description]'
                        WHEN 'Description DESC' THEN '[QCM_Requests].[Description] DESC'
                        WHEN 'TotalRequestedQuantity' THEN '[QCM_Requests].[TotalRequestedQuantity]'
                        WHEN 'TotalRequestedQuantity DESC' THEN '[QCM_Requests].[TotalRequestedQuantity] DESC'
                        WHEN 'RequestedInspectionStartDate' THEN '[QCM_Requests].[RequestedInspectionStartDate]'
                        WHEN 'RequestedInspectionStartDate DESC' THEN '[QCM_Requests].[RequestedInspectionStartDate] DESC'
                        WHEN 'RequestedInspectionFinishDate' THEN '[QCM_Requests].[RequestedInspectionFinishDate]'
                        WHEN 'RequestedInspectionFinishDate DESC' THEN '[QCM_Requests].[RequestedInspectionFinishDate] DESC'
                        WHEN 'ClientInspectionRequired' THEN '[QCM_Requests].[ClientInspectionRequired]'
                        WHEN 'ClientInspectionRequired DESC' THEN '[QCM_Requests].[ClientInspectionRequired] DESC'
                        WHEN 'ThirdPartyInspectionRequired' THEN '[QCM_Requests].[ThirdPartyInspectionRequired]'
                        WHEN 'ThirdPartyInspectionRequired DESC' THEN '[QCM_Requests].[ThirdPartyInspectionRequired] DESC'
                        WHEN 'ReceivedOn' THEN '[QCM_Requests].[ReceivedOn]'
                        WHEN 'ReceivedOn DESC' THEN '[QCM_Requests].[ReceivedOn] DESC'
                        WHEN 'ReceivedBy' THEN '[QCM_Requests].[ReceivedBy]'
                        WHEN 'ReceivedBy DESC' THEN '[QCM_Requests].[ReceivedBy] DESC'
                        WHEN 'ReceivingMediumID' THEN '[QCM_Requests].[ReceivingMediumID]'
                        WHEN 'ReceivingMediumID DESC' THEN '[QCM_Requests].[ReceivingMediumID] DESC'
                        WHEN 'CreationRemarks' THEN '[QCM_Requests].[CreationRemarks]'
                        WHEN 'CreationRemarks DESC' THEN '[QCM_Requests].[CreationRemarks] DESC'
                        WHEN 'CreatedBy' THEN '[QCM_Requests].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[QCM_Requests].[CreatedBy] DESC'
                        WHEN 'CreatedOn' THEN '[QCM_Requests].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[QCM_Requests].[CreatedOn] DESC'
                        WHEN 'RequestStateID' THEN '[QCM_Requests].[RequestStateID]'
                        WHEN 'RequestStateID DESC' THEN '[QCM_Requests].[RequestStateID] DESC'
                        WHEN 'FileAttached' THEN '[QCM_Requests].[FileAttached]'
                        WHEN 'FileAttached DESC' THEN '[QCM_Requests].[FileAttached] DESC'
                        WHEN 'InspectionStageiD' THEN '[QCM_Requests].[InspectionStageiD]'
                        WHEN 'InspectionStageiD DESC' THEN '[QCM_Requests].[InspectionStageiD] DESC'
                        WHEN 'AllotedTo' THEN '[QCM_Requests].[AllotedTo]'
                        WHEN 'AllotedTo DESC' THEN '[QCM_Requests].[AllotedTo] DESC'
                        WHEN 'AllotedStartDate' THEN '[QCM_Requests].[AllotedStartDate]'
                        WHEN 'AllotedStartDate DESC' THEN '[QCM_Requests].[AllotedStartDate] DESC'
                        WHEN 'AllotedFinishDate' THEN '[QCM_Requests].[AllotedFinishDate]'
                        WHEN 'AllotedFinishDate DESC' THEN '[QCM_Requests].[AllotedFinishDate] DESC'
                        WHEN 'AllotedOn' THEN '[QCM_Requests].[AllotedOn]'
                        WHEN 'AllotedOn DESC' THEN '[QCM_Requests].[AllotedOn] DESC'
                        WHEN 'AllotedBy' THEN '[QCM_Requests].[AllotedBy]'
                        WHEN 'AllotedBy DESC' THEN '[QCM_Requests].[AllotedBy] DESC'
                        WHEN 'AllotmentRemarks' THEN '[QCM_Requests].[AllotmentRemarks]'
                        WHEN 'AllotmentRemarks DESC' THEN '[QCM_Requests].[AllotmentRemarks] DESC'
                        WHEN 'InspectionStartDate' THEN '[QCM_Requests].[InspectionStartDate]'
                        WHEN 'InspectionStartDate DESC' THEN '[QCM_Requests].[InspectionStartDate] DESC'
                        WHEN 'InspectionFinishDate' THEN '[QCM_Requests].[InspectionFinishDate]'
                        WHEN 'InspectionFinishDate DESC' THEN '[QCM_Requests].[InspectionFinishDate] DESC'
                        WHEN 'InspectionStatusID' THEN '[QCM_Requests].[InspectionStatusID]'
                        WHEN 'InspectionStatusID DESC' THEN '[QCM_Requests].[InspectionStatusID] DESC'
                        WHEN 'CancelledOn' THEN '[QCM_Requests].[CancelledOn]'
                        WHEN 'CancelledOn DESC' THEN '[QCM_Requests].[CancelledOn] DESC'
                        WHEN 'CancelledBy' THEN '[QCM_Requests].[CancelledBy]'
                        WHEN 'CancelledBy DESC' THEN '[QCM_Requests].[CancelledBy] DESC'
                        WHEN 'CancellationRemarks' THEN '[QCM_Requests].[CancellationRemarks]'
                        WHEN 'CancellationRemarks DESC' THEN '[QCM_Requests].[CancellationRemarks] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        WHEN 'HRM_Employees3_EmployeeName' THEN '[HRM_Employees3].[EmployeeName]'
                        WHEN 'HRM_Employees3_EmployeeName DESC' THEN '[HRM_Employees3].[EmployeeName] DESC'
                        WHEN 'HRM_Employees4_EmployeeName' THEN '[HRM_Employees4].[EmployeeName]'
                        WHEN 'HRM_Employees4_EmployeeName DESC' THEN '[HRM_Employees4].[EmployeeName] DESC'
                        WHEN 'HRM_Employees5_EmployeeName' THEN '[HRM_Employees5].[EmployeeName]'
                        WHEN 'HRM_Employees5_EmployeeName DESC' THEN '[HRM_Employees5].[EmployeeName] DESC'
                        WHEN 'IDM_Projects6_Description' THEN '[IDM_Projects6].[Description]'
                        WHEN 'IDM_Projects6_Description DESC' THEN '[IDM_Projects6].[Description] DESC'
                        WHEN 'IDM_Vendors7_Description' THEN '[IDM_Vendors7].[Description]'
                        WHEN 'IDM_Vendors7_Description DESC' THEN '[IDM_Vendors7].[Description] DESC'
                        WHEN 'QCM_InspectionStages8_Description' THEN '[QCM_InspectionStages8].[Description]'
                        WHEN 'QCM_InspectionStages8_Description DESC' THEN '[QCM_InspectionStages8].[Description] DESC'
                        WHEN 'QCM_ReceivingMediums9_Description' THEN '[QCM_ReceivingMediums9].[Description]'
                        WHEN 'QCM_ReceivingMediums9_Description DESC' THEN '[QCM_ReceivingMediums9].[Description] DESC'
                        WHEN 'QCM_RequestStates10_Description' THEN '[QCM_RequestStates10].[Description]'
                        WHEN 'QCM_RequestStates10_Description DESC' THEN '[QCM_RequestStates10].[Description] DESC'
                        WHEN 'QCM_InspectionStatus11_Description' THEN '[QCM_InspectionStatus11].[Description]'
                        WHEN 'QCM_InspectionStatus11_Description DESC' THEN '[QCM_InspectionStatus11].[Description] DESC'
                        ELSE '[QCM_Requests].[RequestID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QCM_Requests].* ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
		[HRM_Employees4].[EmployeeName] AS HRM_Employees4_EmployeeName,
		[HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName,
		[IDM_Projects6].[Description] AS IDM_Projects6_Description,
		[IDM_Vendors7].[Description] AS IDM_Vendors7_Description,
		[QCM_InspectionStages8].[Description] AS QCM_InspectionStages8_Description,
		[QCM_ReceivingMediums9].[Description] AS QCM_ReceivingMediums9_Description,
		[QCM_RequestStates10].[Description] AS QCM_RequestStates10_Description,
		[QCM_InspectionStatus11].[Description] AS QCM_InspectionStatus11_Description 
  FROM [QCM_Requests] 
    	INNER JOIN #PageIndex
          ON [QCM_Requests].[RequestID] = #PageIndex.RequestID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [QCM_Requests].[CreatedBy] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [QCM_Requests].[AllotedTo] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [QCM_Requests].[AllotedBy] = [HRM_Employees3].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]
    ON [QCM_Requests].[CancelledBy] = [HRM_Employees4].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [QCM_Requests].[ReceivedBy] = [HRM_Employees5].[CardNo]
  INNER JOIN [IDM_Projects] AS [IDM_Projects6]
    ON [QCM_Requests].[ProjectID] = [IDM_Projects6].[ProjectID]
  INNER JOIN [IDM_Vendors] AS [IDM_Vendors7]
    ON [QCM_Requests].[SupplierID] = [IDM_Vendors7].[VendorID]
  LEFT OUTER JOIN [QCM_InspectionStages] AS [QCM_InspectionStages8]
    ON [QCM_Requests].[InspectionStageiD] = [QCM_InspectionStages8].[InspectionStageID]
  LEFT OUTER JOIN [QCM_ReceivingMediums] AS [QCM_ReceivingMediums9]
    ON [QCM_Requests].[ReceivingMediumID] = [QCM_ReceivingMediums9].[ReceivingMediumID]
  INNER JOIN [QCM_RequestStates] AS [QCM_RequestStates10]
    ON [QCM_Requests].[RequestStateID] = [QCM_RequestStates10].[StateID]
  LEFT OUTER JOIN [QCM_InspectionStatus] AS [QCM_InspectionStatus11]
    ON [QCM_Requests].[InspectionStatusID] = [QCM_InspectionStatus11].[InspectionStatusID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
