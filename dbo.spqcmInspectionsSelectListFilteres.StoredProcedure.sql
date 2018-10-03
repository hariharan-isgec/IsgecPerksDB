USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionsSelectListFilteres]
  @Filter_RequestID Int,
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
 ,InspectionID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestID'
  SET @LGSQL = @LGSQL + ', InspectionID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QCM_Inspections].[RequestID]'
  SET @LGSQL = @LGSQL + ', [QCM_Inspections].[InspectionID]'
  SET @LGSQL = @LGSQL + ' FROM [QCM_Inspections] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Inspections].[InspectedBy] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Inspections].[ProjectID] = [IDM_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Vendors] AS [IDM_Vendors3]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Inspections].[SupplierID] = [IDM_Vendors3].[VendorID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [QCM_InspectionStages] AS [QCM_InspectionStages4]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Inspections].[InspectionStageiD] = [QCM_InspectionStages4].[InspectionStageID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [QCM_InspectionStatus] AS [QCM_InspectionStatus5]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Inspections].[InspectionStatusID] = [QCM_InspectionStatus5].[InspectionStatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [QCM_RequestStates] AS [QCM_RequestStates6]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Inspections].[RequestStateID] = [QCM_RequestStates6].[StateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Inspections].[EnteredBy] = [HRM_Employees7].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [QCM_Requests] AS [QCM_Requests8]'
  SET @LGSQL = @LGSQL + '    ON [QCM_Inspections].[RequestID] = [QCM_Requests8].[RequestID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_RequestID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QCM_Inspections].[RequestID] = ' + STR(@Filter_RequestID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestID' THEN '[QCM_Inspections].[RequestID]'
                        WHEN 'RequestID DESC' THEN '[QCM_Inspections].[RequestID] DESC'
                        WHEN 'InspectionID' THEN '[QCM_Inspections].[InspectionID]'
                        WHEN 'InspectionID DESC' THEN '[QCM_Inspections].[InspectionID] DESC'
                        WHEN 'ProjectID' THEN '[QCM_Inspections].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[QCM_Inspections].[ProjectID] DESC'
                        WHEN 'OrderNo' THEN '[QCM_Inspections].[OrderNo]'
                        WHEN 'OrderNo DESC' THEN '[QCM_Inspections].[OrderNo] DESC'
                        WHEN 'OrderDate' THEN '[QCM_Inspections].[OrderDate]'
                        WHEN 'OrderDate DESC' THEN '[QCM_Inspections].[OrderDate] DESC'
                        WHEN 'SupplierID' THEN '[QCM_Inspections].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[QCM_Inspections].[SupplierID] DESC'
                        WHEN 'InspectionRemarks' THEN '[QCM_Inspections].[InspectionRemarks]'
                        WHEN 'InspectionRemarks DESC' THEN '[QCM_Inspections].[InspectionRemarks] DESC'
                        WHEN 'InspectedBy' THEN '[QCM_Inspections].[InspectedBy]'
                        WHEN 'InspectedBy DESC' THEN '[QCM_Inspections].[InspectedBy] DESC'
                        WHEN 'InspectedOn' THEN '[QCM_Inspections].[InspectedOn]'
                        WHEN 'InspectedOn DESC' THEN '[QCM_Inspections].[InspectedOn] DESC'
                        WHEN 'RequestStateID' THEN '[QCM_Inspections].[RequestStateID]'
                        WHEN 'RequestStateID DESC' THEN '[QCM_Inspections].[RequestStateID] DESC'
                        WHEN 'FileAttached' THEN '[QCM_Inspections].[FileAttached]'
                        WHEN 'FileAttached DESC' THEN '[QCM_Inspections].[FileAttached] DESC'
                        WHEN 'InspectionStatusID' THEN '[QCM_Inspections].[InspectionStatusID]'
                        WHEN 'InspectionStatusID DESC' THEN '[QCM_Inspections].[InspectionStatusID] DESC'
                        WHEN 'InspectedQuantity' THEN '[QCM_Inspections].[InspectedQuantity]'
                        WHEN 'InspectedQuantity DESC' THEN '[QCM_Inspections].[InspectedQuantity] DESC'
                        WHEN 'InspectionStageiD' THEN '[QCM_Inspections].[InspectionStageiD]'
                        WHEN 'InspectionStageiD DESC' THEN '[QCM_Inspections].[InspectionStageiD] DESC'
                        WHEN 'EnteredBy' THEN '[QCM_Inspections].[EnteredBy]'
                        WHEN 'EnteredBy DESC' THEN '[QCM_Inspections].[EnteredBy] DESC'
                        WHEN 'EnteredOn' THEN '[QCM_Inspections].[EnteredOn]'
                        WHEN 'EnteredOn DESC' THEN '[QCM_Inspections].[EnteredOn] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'IDM_Projects2_Description' THEN '[IDM_Projects2].[Description]'
                        WHEN 'IDM_Projects2_Description DESC' THEN '[IDM_Projects2].[Description] DESC'
                        WHEN 'IDM_Vendors3_Description' THEN '[IDM_Vendors3].[Description]'
                        WHEN 'IDM_Vendors3_Description DESC' THEN '[IDM_Vendors3].[Description] DESC'
                        WHEN 'QCM_InspectionStages4_Description' THEN '[QCM_InspectionStages4].[Description]'
                        WHEN 'QCM_InspectionStages4_Description DESC' THEN '[QCM_InspectionStages4].[Description] DESC'
                        WHEN 'QCM_InspectionStatus5_Description' THEN '[QCM_InspectionStatus5].[Description]'
                        WHEN 'QCM_InspectionStatus5_Description DESC' THEN '[QCM_InspectionStatus5].[Description] DESC'
                        WHEN 'QCM_RequestStates6_Description' THEN '[QCM_RequestStates6].[Description]'
                        WHEN 'QCM_RequestStates6_Description DESC' THEN '[QCM_RequestStates6].[Description] DESC'
                        WHEN 'HRM_Employees7_EmployeeName' THEN '[HRM_Employees7].[EmployeeName]'
                        WHEN 'HRM_Employees7_EmployeeName DESC' THEN '[HRM_Employees7].[EmployeeName] DESC'
                        WHEN 'QCM_Requests8_Description' THEN '[QCM_Requests8].[Description]'
                        WHEN 'QCM_Requests8_Description DESC' THEN '[QCM_Requests8].[Description] DESC'
                        ELSE '[QCM_Inspections].[RequestID],[QCM_Inspections].[InspectionID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QCM_Inspections].* ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description,
		[IDM_Vendors3].[Description] AS IDM_Vendors3_Description,
		[QCM_InspectionStages4].[Description] AS QCM_InspectionStages4_Description,
		[QCM_InspectionStatus5].[Description] AS QCM_InspectionStatus5_Description,
		[QCM_RequestStates6].[Description] AS QCM_RequestStates6_Description,
		[HRM_Employees7].[EmployeeName] AS HRM_Employees7_EmployeeName,
		[QCM_Requests8].[Description] AS QCM_Requests8_Description 
  FROM [QCM_Inspections] 
    	INNER JOIN #PageIndex
          ON [QCM_Inspections].[RequestID] = #PageIndex.RequestID
          AND [QCM_Inspections].[InspectionID] = #PageIndex.InspectionID
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [QCM_Inspections].[InspectedBy] = [HRM_Employees1].[CardNo]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [QCM_Inspections].[ProjectID] = [IDM_Projects2].[ProjectID]
  INNER JOIN [IDM_Vendors] AS [IDM_Vendors3]
    ON [QCM_Inspections].[SupplierID] = [IDM_Vendors3].[VendorID]
  LEFT OUTER JOIN [QCM_InspectionStages] AS [QCM_InspectionStages4]
    ON [QCM_Inspections].[InspectionStageiD] = [QCM_InspectionStages4].[InspectionStageID]
  LEFT OUTER JOIN [QCM_InspectionStatus] AS [QCM_InspectionStatus5]
    ON [QCM_Inspections].[InspectionStatusID] = [QCM_InspectionStatus5].[InspectionStatusID]
  INNER JOIN [QCM_RequestStates] AS [QCM_RequestStates6]
    ON [QCM_Inspections].[RequestStateID] = [QCM_RequestStates6].[StateID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]
    ON [QCM_Inspections].[EnteredBy] = [HRM_Employees7].[CardNo]
  INNER JOIN [QCM_Requests] AS [QCM_Requests8]
    ON [QCM_Inspections].[RequestID] = [QCM_Requests8].[RequestID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
