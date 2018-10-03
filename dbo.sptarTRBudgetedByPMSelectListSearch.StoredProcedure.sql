USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptarTRBudgetedByPMSelectListSearch]
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
 ,RequestID Int NOT NULL
  )
  INSERT INTO #PageIndex (RequestID)
  SELECT [TA_TravelRequest].[RequestID] FROM [TA_TravelRequest]
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
 WHERE [TA_TravelRequest].[StatusID] >= 6 
    AND [TA_TravelRequest].[ProjectManagerID] = case when @LoginID <> '0340' then @LoginID else [TA_TravelRequest].[ProjectManagerID] end 
    AND ( 
         STR(ISNULL([TA_TravelRequest].[RequestID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[RequestedFor],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[RequestedForEmployees],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_TravelRequest].[TravelTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[ProjectManagerID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[CostCenterID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[TravelItinerary],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[Purpose],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_TravelRequest].[TotalRequestedAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[RequestedCurrencyID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_TravelRequest].[RequestedConversionFactor], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_TravelRequest].[TotalRequestedAmountINR], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_TravelRequest].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[CreatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[BudgetCheckedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[ProjectManagerRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[ApprovedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[ApproverRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[BHApprovalBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[BHRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[MDApprovalBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[MDRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[MDCurrencyID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_TravelRequest].[MDConversionFactor], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_TravelRequest].[MDDAAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_TravelRequest].[MDDAAmountINR], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_TravelRequest].[MDLodgingAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_TravelRequest].[MDLodgingAmountINR], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequest].[RequestKey],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_TravelRequest].[BalanceBudgetWhenSubmitted], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RequestID' THEN [TA_TravelRequest].[RequestID] END,
     CASE @OrderBy WHEN 'RequestID DESC' THEN [TA_TravelRequest].[RequestID] END DESC,
     CASE @OrderBy WHEN 'RequestedFor' THEN [TA_TravelRequest].[RequestedFor] END,
     CASE @OrderBy WHEN 'RequestedFor DESC' THEN [TA_TravelRequest].[RequestedFor] END DESC,
     CASE @OrderBy WHEN 'RequestedForEmployees' THEN [TA_TravelRequest].[RequestedForEmployees] END,
     CASE @OrderBy WHEN 'RequestedForEmployees DESC' THEN [TA_TravelRequest].[RequestedForEmployees] END DESC,
     CASE @OrderBy WHEN 'TravelTypeID' THEN [TA_TravelRequest].[TravelTypeID] END,
     CASE @OrderBy WHEN 'TravelTypeID DESC' THEN [TA_TravelRequest].[TravelTypeID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [TA_TravelRequest].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TA_TravelRequest].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'ProjectManagerID' THEN [TA_TravelRequest].[ProjectManagerID] END,
     CASE @OrderBy WHEN 'ProjectManagerID DESC' THEN [TA_TravelRequest].[ProjectManagerID] END DESC,
     CASE @OrderBy WHEN 'CostCenterID' THEN [TA_TravelRequest].[CostCenterID] END,
     CASE @OrderBy WHEN 'CostCenterID DESC' THEN [TA_TravelRequest].[CostCenterID] END DESC,
     CASE @OrderBy WHEN 'TravelItinerary' THEN [TA_TravelRequest].[TravelItinerary] END,
     CASE @OrderBy WHEN 'TravelItinerary DESC' THEN [TA_TravelRequest].[TravelItinerary] END DESC,
     CASE @OrderBy WHEN 'Purpose' THEN [TA_TravelRequest].[Purpose] END,
     CASE @OrderBy WHEN 'Purpose DESC' THEN [TA_TravelRequest].[Purpose] END DESC,
     CASE @OrderBy WHEN 'TotalRequestedAmount' THEN [TA_TravelRequest].[TotalRequestedAmount] END,
     CASE @OrderBy WHEN 'TotalRequestedAmount DESC' THEN [TA_TravelRequest].[TotalRequestedAmount] END DESC,
     CASE @OrderBy WHEN 'RequestedCurrencyID' THEN [TA_TravelRequest].[RequestedCurrencyID] END,
     CASE @OrderBy WHEN 'RequestedCurrencyID DESC' THEN [TA_TravelRequest].[RequestedCurrencyID] END DESC,
     CASE @OrderBy WHEN 'RequestedConversionFactor' THEN [TA_TravelRequest].[RequestedConversionFactor] END,
     CASE @OrderBy WHEN 'RequestedConversionFactor DESC' THEN [TA_TravelRequest].[RequestedConversionFactor] END DESC,
     CASE @OrderBy WHEN 'TotalRequestedAmountINR' THEN [TA_TravelRequest].[TotalRequestedAmountINR] END,
     CASE @OrderBy WHEN 'TotalRequestedAmountINR DESC' THEN [TA_TravelRequest].[TotalRequestedAmountINR] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [TA_TravelRequest].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [TA_TravelRequest].[StatusID] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [TA_TravelRequest].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [TA_TravelRequest].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [TA_TravelRequest].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [TA_TravelRequest].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'BudgetCheckedBy' THEN [TA_TravelRequest].[BudgetCheckedBy] END,
     CASE @OrderBy WHEN 'BudgetCheckedBy DESC' THEN [TA_TravelRequest].[BudgetCheckedBy] END DESC,
     CASE @OrderBy WHEN 'BudgetCheckedOn' THEN [TA_TravelRequest].[BudgetCheckedOn] END,
     CASE @OrderBy WHEN 'BudgetCheckedOn DESC' THEN [TA_TravelRequest].[BudgetCheckedOn] END DESC,
     CASE @OrderBy WHEN 'ProjectManagerRemarks' THEN [TA_TravelRequest].[ProjectManagerRemarks] END,
     CASE @OrderBy WHEN 'ProjectManagerRemarks DESC' THEN [TA_TravelRequest].[ProjectManagerRemarks] END DESC,
     CASE @OrderBy WHEN 'ApprovedBy' THEN [TA_TravelRequest].[ApprovedBy] END,
     CASE @OrderBy WHEN 'ApprovedBy DESC' THEN [TA_TravelRequest].[ApprovedBy] END DESC,
     CASE @OrderBy WHEN 'ApprovedOn' THEN [TA_TravelRequest].[ApprovedOn] END,
     CASE @OrderBy WHEN 'ApprovedOn DESC' THEN [TA_TravelRequest].[ApprovedOn] END DESC,
     CASE @OrderBy WHEN 'ApproverRemarks' THEN [TA_TravelRequest].[ApproverRemarks] END,
     CASE @OrderBy WHEN 'ApproverRemarks DESC' THEN [TA_TravelRequest].[ApproverRemarks] END DESC,
     CASE @OrderBy WHEN 'BHApprovalBy' THEN [TA_TravelRequest].[BHApprovalBy] END,
     CASE @OrderBy WHEN 'BHApprovalBy DESC' THEN [TA_TravelRequest].[BHApprovalBy] END DESC,
     CASE @OrderBy WHEN 'BHApprovalOn' THEN [TA_TravelRequest].[BHApprovalOn] END,
     CASE @OrderBy WHEN 'BHApprovalOn DESC' THEN [TA_TravelRequest].[BHApprovalOn] END DESC,
     CASE @OrderBy WHEN 'BHRemarks' THEN [TA_TravelRequest].[BHRemarks] END,
     CASE @OrderBy WHEN 'BHRemarks DESC' THEN [TA_TravelRequest].[BHRemarks] END DESC,
     CASE @OrderBy WHEN 'MDApprovalBy' THEN [TA_TravelRequest].[MDApprovalBy] END,
     CASE @OrderBy WHEN 'MDApprovalBy DESC' THEN [TA_TravelRequest].[MDApprovalBy] END DESC,
     CASE @OrderBy WHEN 'MDApprovalOn' THEN [TA_TravelRequest].[MDApprovalOn] END,
     CASE @OrderBy WHEN 'MDApprovalOn DESC' THEN [TA_TravelRequest].[MDApprovalOn] END DESC,
     CASE @OrderBy WHEN 'MDRemarks' THEN [TA_TravelRequest].[MDRemarks] END,
     CASE @OrderBy WHEN 'MDRemarks DESC' THEN [TA_TravelRequest].[MDRemarks] END DESC,
     CASE @OrderBy WHEN 'MDCurrencyID' THEN [TA_TravelRequest].[MDCurrencyID] END,
     CASE @OrderBy WHEN 'MDCurrencyID DESC' THEN [TA_TravelRequest].[MDCurrencyID] END DESC,
     CASE @OrderBy WHEN 'MDConversionFactor' THEN [TA_TravelRequest].[MDConversionFactor] END,
     CASE @OrderBy WHEN 'MDConversionFactor DESC' THEN [TA_TravelRequest].[MDConversionFactor] END DESC,
     CASE @OrderBy WHEN 'MDDAAmount' THEN [TA_TravelRequest].[MDDAAmount] END,
     CASE @OrderBy WHEN 'MDDAAmount DESC' THEN [TA_TravelRequest].[MDDAAmount] END DESC,
     CASE @OrderBy WHEN 'MDDAAmountINR' THEN [TA_TravelRequest].[MDDAAmountINR] END,
     CASE @OrderBy WHEN 'MDDAAmountINR DESC' THEN [TA_TravelRequest].[MDDAAmountINR] END DESC,
     CASE @OrderBy WHEN 'MDLodgingAmount' THEN [TA_TravelRequest].[MDLodgingAmount] END,
     CASE @OrderBy WHEN 'MDLodgingAmount DESC' THEN [TA_TravelRequest].[MDLodgingAmount] END DESC,
     CASE @OrderBy WHEN 'MDLodgingAmountINR' THEN [TA_TravelRequest].[MDLodgingAmountINR] END,
     CASE @OrderBy WHEN 'MDLodgingAmountINR DESC' THEN [TA_TravelRequest].[MDLodgingAmountINR] END DESC,
     CASE @OrderBy WHEN 'RequestKey' THEN [TA_TravelRequest].[RequestKey] END,
     CASE @OrderBy WHEN 'RequestKey DESC' THEN [TA_TravelRequest].[RequestKey] END DESC,
     CASE @OrderBy WHEN 'FileAttached' THEN [TA_TravelRequest].[FileAttached] END,
     CASE @OrderBy WHEN 'FileAttached DESC' THEN [TA_TravelRequest].[FileAttached] END DESC,
     CASE @OrderBy WHEN 'BalanceBudgetWhenSubmitted' THEN [TA_TravelRequest].[BalanceBudgetWhenSubmitted] END,
     CASE @OrderBy WHEN 'BalanceBudgetWhenSubmitted DESC' THEN [TA_TravelRequest].[BalanceBudgetWhenSubmitted] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users4_UserFullName' THEN [aspnet_Users4].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users4_UserFullName DESC' THEN [aspnet_Users4].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users5_UserFullName' THEN [aspnet_Users5].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users5_UserFullName DESC' THEN [aspnet_Users5].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users6_UserFullName' THEN [aspnet_Users6].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users6_UserFullName DESC' THEN [aspnet_Users6].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users7_UserFullName' THEN [aspnet_Users7].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users7_UserFullName DESC' THEN [aspnet_Users7].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Departments8_Description' THEN [HRM_Departments8].[Description] END,
     CASE @OrderBy WHEN 'HRM_Departments8_Description DESC' THEN [HRM_Departments8].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects9_Description' THEN [IDM_Projects9].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects9_Description DESC' THEN [IDM_Projects9].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_Currencies10_CurrencyName' THEN [TA_Currencies10].[CurrencyName] END,
     CASE @OrderBy WHEN 'TA_Currencies10_CurrencyName DESC' THEN [TA_Currencies10].[CurrencyName] END DESC,
     CASE @OrderBy WHEN 'TA_Currencies11_CurrencyName' THEN [TA_Currencies11].[CurrencyName] END,
     CASE @OrderBy WHEN 'TA_Currencies11_CurrencyName DESC' THEN [TA_Currencies11].[CurrencyName] END DESC,
     CASE @OrderBy WHEN 'TA_TravelRequestStatus12_Description' THEN [TA_TravelRequestStatus12].[Description] END,
     CASE @OrderBy WHEN 'TA_TravelRequestStatus12_Description DESC' THEN [TA_TravelRequestStatus12].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_TravelTypes13_TravelTypeDescription' THEN [TA_TravelTypes13].[TravelTypeDescription] END,
     CASE @OrderBy WHEN 'TA_TravelTypes13_TravelTypeDescription DESC' THEN [TA_TravelTypes13].[TravelTypeDescription] END DESC 

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
