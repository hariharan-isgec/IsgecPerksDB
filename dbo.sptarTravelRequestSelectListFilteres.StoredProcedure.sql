USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptarTravelRequestSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[TA_TravelRequest].[RequestID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_TravelRequest] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [TA_TravelRequest].[RequestedFor] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]'
  SET @LGSQL = @LGSQL + '    ON [TA_TravelRequest].[CreatedBy] = [aspnet_users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]'
  SET @LGSQL = @LGSQL + '    ON [TA_TravelRequest].[BudgetCheckedBy] = [aspnet_users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users4]'
  SET @LGSQL = @LGSQL + '    ON [TA_TravelRequest].[ApprovedBy] = [aspnet_users4].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users5]'
  SET @LGSQL = @LGSQL + '    ON [TA_TravelRequest].[BHApprovalBy] = [aspnet_users5].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users6]'
  SET @LGSQL = @LGSQL + '    ON [TA_TravelRequest].[MDApprovalBy] = [aspnet_users6].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users7]'
  SET @LGSQL = @LGSQL + '    ON [TA_TravelRequest].[ProjectManagerID] = [aspnet_users7].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments8]'
  SET @LGSQL = @LGSQL + '    ON [TA_TravelRequest].[CostCenterID] = [HRM_Departments8].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects9]'
  SET @LGSQL = @LGSQL + '    ON [TA_TravelRequest].[ProjectID] = [IDM_Projects9].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies10]'
  SET @LGSQL = @LGSQL + '    ON [TA_TravelRequest].[RequestedCurrencyID] = [TA_Currencies10].[CurrencyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies11]'
  SET @LGSQL = @LGSQL + '    ON [TA_TravelRequest].[MDCurrencyID] = [TA_Currencies11].[CurrencyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_TravelRequestStatus] AS [TA_TravelRequestStatus12]'
  SET @LGSQL = @LGSQL + '    ON [TA_TravelRequest].[StatusID] = [TA_TravelRequestStatus12].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_TravelTypes] AS [TA_TravelTypes13]'
  SET @LGSQL = @LGSQL + '    ON [TA_TravelRequest].[TravelTypeID] = [TA_TravelTypes13].[TravelTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  if(@LoginID<>'0340')
    SET @LGSQL = @LGSQL + '  AND ([TA_TravelRequest].[CreatedBy] = ''' + @LoginID + ''' OR [TA_TravelRequest].[RequestedFor] =''' + @LoginID + ''')'
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestID' THEN '[TA_TravelRequest].[RequestID]'
                        WHEN 'RequestID DESC' THEN '[TA_TravelRequest].[RequestID] DESC'
                        WHEN 'RequestedFor' THEN '[TA_TravelRequest].[RequestedFor]'
                        WHEN 'RequestedFor DESC' THEN '[TA_TravelRequest].[RequestedFor] DESC'
                        WHEN 'RequestedForEmployees' THEN '[TA_TravelRequest].[RequestedForEmployees]'
                        WHEN 'RequestedForEmployees DESC' THEN '[TA_TravelRequest].[RequestedForEmployees] DESC'
                        WHEN 'TravelTypeID' THEN '[TA_TravelRequest].[TravelTypeID]'
                        WHEN 'TravelTypeID DESC' THEN '[TA_TravelRequest].[TravelTypeID] DESC'
                        WHEN 'ProjectID' THEN '[TA_TravelRequest].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[TA_TravelRequest].[ProjectID] DESC'
                        WHEN 'ProjectManagerID' THEN '[TA_TravelRequest].[ProjectManagerID]'
                        WHEN 'ProjectManagerID DESC' THEN '[TA_TravelRequest].[ProjectManagerID] DESC'
                        WHEN 'CostCenterID' THEN '[TA_TravelRequest].[CostCenterID]'
                        WHEN 'CostCenterID DESC' THEN '[TA_TravelRequest].[CostCenterID] DESC'
                        WHEN 'TravelItinerary' THEN '[TA_TravelRequest].[TravelItinerary]'
                        WHEN 'TravelItinerary DESC' THEN '[TA_TravelRequest].[TravelItinerary] DESC'
                        WHEN 'Purpose' THEN '[TA_TravelRequest].[Purpose]'
                        WHEN 'Purpose DESC' THEN '[TA_TravelRequest].[Purpose] DESC'
                        WHEN 'TotalRequestedAmount' THEN '[TA_TravelRequest].[TotalRequestedAmount]'
                        WHEN 'TotalRequestedAmount DESC' THEN '[TA_TravelRequest].[TotalRequestedAmount] DESC'
                        WHEN 'RequestedCurrencyID' THEN '[TA_TravelRequest].[RequestedCurrencyID]'
                        WHEN 'RequestedCurrencyID DESC' THEN '[TA_TravelRequest].[RequestedCurrencyID] DESC'
                        WHEN 'RequestedConversionFactor' THEN '[TA_TravelRequest].[RequestedConversionFactor]'
                        WHEN 'RequestedConversionFactor DESC' THEN '[TA_TravelRequest].[RequestedConversionFactor] DESC'
                        WHEN 'ApprovedOn' THEN '[TA_TravelRequest].[ApprovedOn]'
                        WHEN 'ApprovedOn DESC' THEN '[TA_TravelRequest].[ApprovedOn] DESC'
                        WHEN 'CreatedOn' THEN '[TA_TravelRequest].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[TA_TravelRequest].[CreatedOn] DESC'
                        WHEN 'BHApprovalBy' THEN '[TA_TravelRequest].[BHApprovalBy]'
                        WHEN 'BHApprovalBy DESC' THEN '[TA_TravelRequest].[BHApprovalBy] DESC'
                        WHEN 'ApprovedBy' THEN '[TA_TravelRequest].[ApprovedBy]'
                        WHEN 'ApprovedBy DESC' THEN '[TA_TravelRequest].[ApprovedBy] DESC'
                        WHEN 'BudgetCheckedBy' THEN '[TA_TravelRequest].[BudgetCheckedBy]'
                        WHEN 'BudgetCheckedBy DESC' THEN '[TA_TravelRequest].[BudgetCheckedBy] DESC'
                        WHEN 'BudgetCheckedOn' THEN '[TA_TravelRequest].[BudgetCheckedOn]'
                        WHEN 'BudgetCheckedOn DESC' THEN '[TA_TravelRequest].[BudgetCheckedOn] DESC'
                        WHEN 'ProjectManagerRemarks' THEN '[TA_TravelRequest].[ProjectManagerRemarks]'
                        WHEN 'ProjectManagerRemarks DESC' THEN '[TA_TravelRequest].[ProjectManagerRemarks] DESC'
                        WHEN 'ApproverRemarks' THEN '[TA_TravelRequest].[ApproverRemarks]'
                        WHEN 'ApproverRemarks DESC' THEN '[TA_TravelRequest].[ApproverRemarks] DESC'
                        WHEN 'MDLodgingAmount' THEN '[TA_TravelRequest].[MDLodgingAmount]'
                        WHEN 'MDLodgingAmount DESC' THEN '[TA_TravelRequest].[MDLodgingAmount] DESC'
                        WHEN 'CreatedBy' THEN '[TA_TravelRequest].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[TA_TravelRequest].[CreatedBy] DESC'
                        WHEN 'MDApprovalOn' THEN '[TA_TravelRequest].[MDApprovalOn]'
                        WHEN 'MDApprovalOn DESC' THEN '[TA_TravelRequest].[MDApprovalOn] DESC'
                        WHEN 'BHRemarks' THEN '[TA_TravelRequest].[BHRemarks]'
                        WHEN 'BHRemarks DESC' THEN '[TA_TravelRequest].[BHRemarks] DESC'
                        WHEN 'BHApprovalOn' THEN '[TA_TravelRequest].[BHApprovalOn]'
                        WHEN 'BHApprovalOn DESC' THEN '[TA_TravelRequest].[BHApprovalOn] DESC'
                        WHEN 'MDRemarks' THEN '[TA_TravelRequest].[MDRemarks]'
                        WHEN 'MDRemarks DESC' THEN '[TA_TravelRequest].[MDRemarks] DESC'
                        WHEN 'StatusID' THEN '[TA_TravelRequest].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[TA_TravelRequest].[StatusID] DESC'
                        WHEN 'MDCurrencyID' THEN '[TA_TravelRequest].[MDCurrencyID]'
                        WHEN 'MDCurrencyID DESC' THEN '[TA_TravelRequest].[MDCurrencyID] DESC'
                        WHEN 'TotalRequestedAmountINR' THEN '[TA_TravelRequest].[TotalRequestedAmountINR]'
                        WHEN 'TotalRequestedAmountINR DESC' THEN '[TA_TravelRequest].[TotalRequestedAmountINR] DESC'
                        WHEN 'MDLodgingAmountINR' THEN '[TA_TravelRequest].[MDLodgingAmountINR]'
                        WHEN 'MDLodgingAmountINR DESC' THEN '[TA_TravelRequest].[MDLodgingAmountINR] DESC'
                        WHEN 'RequestKey' THEN '[TA_TravelRequest].[RequestKey]'
                        WHEN 'RequestKey DESC' THEN '[TA_TravelRequest].[RequestKey] DESC'
                        WHEN 'MDDAAmountINR' THEN '[TA_TravelRequest].[MDDAAmountINR]'
                        WHEN 'MDDAAmountINR DESC' THEN '[TA_TravelRequest].[MDDAAmountINR] DESC'
                        WHEN 'MDDAAmount' THEN '[TA_TravelRequest].[MDDAAmount]'
                        WHEN 'MDDAAmount DESC' THEN '[TA_TravelRequest].[MDDAAmount] DESC'
                        WHEN 'MDApprovalBy' THEN '[TA_TravelRequest].[MDApprovalBy]'
                        WHEN 'MDApprovalBy DESC' THEN '[TA_TravelRequest].[MDApprovalBy] DESC'
                        WHEN 'MDConversionFactor' THEN '[TA_TravelRequest].[MDConversionFactor]'
                        WHEN 'MDConversionFactor DESC' THEN '[TA_TravelRequest].[MDConversionFactor] DESC'
                        WHEN 'BalanceBudgetWhenSubmitted' THEN '[TA_TravelRequest].[BalanceBudgetWhenSubmitted]'
                        WHEN 'BalanceBudgetWhenSubmitted DESC' THEN '[TA_TravelRequest].[BalanceBudgetWhenSubmitted] DESC'
                        WHEN 'FileAttached' THEN '[TA_TravelRequest].[FileAttached]'
                        WHEN 'FileAttached DESC' THEN '[TA_TravelRequest].[FileAttached] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'aspnet_Users4_UserFullName' THEN '[aspnet_Users4].[UserFullName]'
                        WHEN 'aspnet_Users4_UserFullName DESC' THEN '[aspnet_Users4].[UserFullName] DESC'
                        WHEN 'aspnet_Users5_UserFullName' THEN '[aspnet_Users5].[UserFullName]'
                        WHEN 'aspnet_Users5_UserFullName DESC' THEN '[aspnet_Users5].[UserFullName] DESC'
                        WHEN 'aspnet_Users6_UserFullName' THEN '[aspnet_Users6].[UserFullName]'
                        WHEN 'aspnet_Users6_UserFullName DESC' THEN '[aspnet_Users6].[UserFullName] DESC'
                        WHEN 'aspnet_Users7_UserFullName' THEN '[aspnet_Users7].[UserFullName]'
                        WHEN 'aspnet_Users7_UserFullName DESC' THEN '[aspnet_Users7].[UserFullName] DESC'
                        WHEN 'HRM_Departments8_Description' THEN '[HRM_Departments8].[Description]'
                        WHEN 'HRM_Departments8_Description DESC' THEN '[HRM_Departments8].[Description] DESC'
                        WHEN 'IDM_Projects9_Description' THEN '[IDM_Projects9].[Description]'
                        WHEN 'IDM_Projects9_Description DESC' THEN '[IDM_Projects9].[Description] DESC'
                        WHEN 'TA_Currencies10_CurrencyName' THEN '[TA_Currencies10].[CurrencyName]'
                        WHEN 'TA_Currencies10_CurrencyName DESC' THEN '[TA_Currencies10].[CurrencyName] DESC'
                        WHEN 'TA_Currencies11_CurrencyName' THEN '[TA_Currencies11].[CurrencyName]'
                        WHEN 'TA_Currencies11_CurrencyName DESC' THEN '[TA_Currencies11].[CurrencyName] DESC'
                        WHEN 'TA_TravelRequestStatus12_Description' THEN '[TA_TravelRequestStatus12].[Description]'
                        WHEN 'TA_TravelRequestStatus12_Description DESC' THEN '[TA_TravelRequestStatus12].[Description] DESC'
                        WHEN 'TA_TravelTypes13_TravelTypeDescription' THEN '[TA_TravelTypes13].[TravelTypeDescription]'
                        WHEN 'TA_TravelTypes13_TravelTypeDescription DESC' THEN '[TA_TravelTypes13].[TravelTypeDescription] DESC'
                        ELSE '[TA_TravelRequest].[RequestID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [TA_TravelRequest].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
    [aspnet_Users4].[UserFullName] AS aspnet_Users4_UserFullName,
    [aspnet_Users5].[UserFullName] AS aspnet_Users5_UserFullName,
    [aspnet_Users6].[UserFullName] AS aspnet_Users6_UserFullName,
    [aspnet_Users7].[UserFullName] AS aspnet_Users7_UserFullName,
    [HRM_Departments8].[Description] AS HRM_Departments8_Description,
    [IDM_Projects9].[Description] AS IDM_Projects9_Description,
    [TA_Currencies10].[CurrencyName] AS TA_Currencies10_CurrencyName,
    [TA_Currencies11].[CurrencyName] AS TA_Currencies11_CurrencyName,
    [TA_TravelRequestStatus12].[Description] AS TA_TravelRequestStatus12_Description,
    [TA_TravelTypes13].[TravelTypeDescription] AS TA_TravelTypes13_TravelTypeDescription 
  FROM [TA_TravelRequest] 
      INNER JOIN #PageIndex
          ON [TA_TravelRequest].[RequestID] = #PageIndex.RequestID
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [TA_TravelRequest].[RequestedFor] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [TA_TravelRequest].[CreatedBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [TA_TravelRequest].[BudgetCheckedBy] = [aspnet_users3].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users4]
    ON [TA_TravelRequest].[ApprovedBy] = [aspnet_users4].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users5]
    ON [TA_TravelRequest].[BHApprovalBy] = [aspnet_users5].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users6]
    ON [TA_TravelRequest].[MDApprovalBy] = [aspnet_users6].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users7]
    ON [TA_TravelRequest].[ProjectManagerID] = [aspnet_users7].[LoginID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments8]
    ON [TA_TravelRequest].[CostCenterID] = [HRM_Departments8].[DepartmentID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects9]
    ON [TA_TravelRequest].[ProjectID] = [IDM_Projects9].[ProjectID]
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies10]
    ON [TA_TravelRequest].[RequestedCurrencyID] = [TA_Currencies10].[CurrencyID]
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies11]
    ON [TA_TravelRequest].[MDCurrencyID] = [TA_Currencies11].[CurrencyID]
  LEFT OUTER JOIN [TA_TravelRequestStatus] AS [TA_TravelRequestStatus12]
    ON [TA_TravelRequest].[StatusID] = [TA_TravelRequestStatus12].[StatusID]
  LEFT OUTER JOIN [TA_TravelTypes] AS [TA_TravelTypes13]
    ON [TA_TravelRequest].[TravelTypeID] = [TA_TravelTypes13].[TravelTypeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
