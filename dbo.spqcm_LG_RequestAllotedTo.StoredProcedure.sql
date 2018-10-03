USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spqcm_LG_RequestAllotedTo]
  @AllotedTo NVarChar(8),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @KeyWord NVarChar(250),
  @SearchState Bit,
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'

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
  SET @LGSQL = @LGSQL + ' LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects6]'
  SET @LGSQL = @LGSQL + '   ON [QCM_Requests].[ProjectID] = [IDM_Projects6].[ProjectID]'
  SET @LGSQL = @LGSQL + ' INNER JOIN [IDM_Vendors] AS [IDM_Vendors7]'
  SET @LGSQL = @LGSQL + '   ON [QCM_Requests].[SupplierID] = [IDM_Vendors7].[VendorID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [QCM_Requests].[RequestStateID] IN (''INSPECTED'',''ALLOTED'',''REALLOTED'')'
  SET @LGSQL = @LGSQL + ' AND [QCM_Requests].[AllotedTo] = ''' + @AllotedTo + ''''
  IF (@SearchState = 1)
    BEGIN 
     SET @LGSQL = @LGSQL + ' AND ('
     SET @LGSQL = @LGSQL + '     LOWER(ISNULL([QCM_Requests].[SupplierID],'')) LIKE ''' + @KeyWord1 + ''''
     SET @LGSQL = @LGSQL + '  OR LOWER(ISNULL([QCM_Requests].[ProjectID],'')) LIKE ''' + @KeyWord1 + ''''
     SET @LGSQL = @LGSQL + '  OR LOWER(ISNULL([QCM_Requests].[Description],'')) LIKE ''' + @KeyWord1 + ''''
     SET @LGSQL = @LGSQL + '  OR LOWER(ISNULL([QCM_Requests].[AllotmentRemarks],'')) LIKE ''' + @KeyWord1 + ''''
     SET @LGSQL = @LGSQL + ' )'
	END
  SET @LGSQL = @LGSQL + '  ORDER BY [QCM_Requests].[RequestID] DESC'

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
		[QCM_Regions12].[RegionName] AS QCM_Regions12_RegionName 
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
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects6]
    ON [QCM_Requests].[ProjectID] = [IDM_Projects6].[ProjectID]
  INNER JOIN [IDM_Vendors] AS [IDM_Vendors7]
    ON [QCM_Requests].[SupplierID] = [IDM_Vendors7].[VendorID]
  LEFT OUTER JOIN [QCM_InspectionStages] AS [QCM_InspectionStages8]
    ON [QCM_Requests].[InspectionStageiD] = [QCM_InspectionStages8].[InspectionStageID]
  LEFT OUTER JOIN [QCM_ReceivingMediums] AS [QCM_ReceivingMediums9]
    ON [QCM_Requests].[ReceivingMediumID] = [QCM_ReceivingMediums9].[ReceivingMediumID]
  INNER JOIN [QCM_RequestStates] AS [QCM_RequestStates10]
    ON [QCM_Requests].[RequestStateID] = [QCM_RequestStates10].[StateID]
  LEFT OUTER JOIN [QCM_Regions] AS [QCM_Regions12]
    ON [QCM_Requests].[RegionID] = [QCM_Regions12].[RegionID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
