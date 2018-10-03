USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptarTravelRequestSelectByID]
  @LoginID NVarChar(8),
  @RequestID Int 
  AS
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
  [TA_TravelRequest].[RequestID] = @RequestID
GO
