USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectsInputSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [COST_ProjectsInput].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [COST_FinYear3].[Descpription] AS COST_FinYear3_Descpription,
    [COST_ProjectGroups4].[ProjectGroupDescription] AS COST_ProjectGroups4_ProjectGroupDescription,
    [COST_ProjectInputStatus5].[Description] AS COST_ProjectInputStatus5_Description,
    [COST_Quarters6].[Description] AS COST_Quarters6_Description,
    [aspnet_Users7].[UserFullName] AS aspnet_Users7_UserFullName,
    [TA_Currencies8].[CurrencyName] AS TA_Currencies8_CurrencyName,
    [TA_Currencies9].[CurrencyName] AS TA_Currencies9_CurrencyName,
    [TA_Currencies10].[CurrencyName] AS TA_Currencies10_CurrencyName 
  FROM [COST_ProjectsInput] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [COST_ProjectsInput].[CreatedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [COST_ProjectsInput].[ApprovedBy] = [aspnet_users2].[LoginID]
  INNER JOIN [COST_FinYear] AS [COST_FinYear3]
    ON [COST_ProjectsInput].[FinYear] = [COST_FinYear3].[FinYear]
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups4]
    ON [COST_ProjectsInput].[ProjectGroupID] = [COST_ProjectGroups4].[ProjectGroupID]
  LEFT OUTER JOIN [COST_ProjectInputStatus] AS [COST_ProjectInputStatus5]
    ON [COST_ProjectsInput].[StatusID] = [COST_ProjectInputStatus5].[StatusID]
  INNER JOIN [COST_Quarters] AS [COST_Quarters6]
    ON [COST_ProjectsInput].[Quarter] = [COST_Quarters6].[Quarter]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users7]
    ON [COST_ProjectsInput].[ReceivedBy] = [aspnet_users7].[LoginID]
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies8]
    ON [COST_ProjectsInput].[CurrencyGOV] = [TA_Currencies8].[CurrencyID]
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies9]
    ON [COST_ProjectsInput].[CurrencyPR] = [TA_Currencies9].[CurrencyID]
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies10]
    ON [COST_ProjectsInput].[CurrencyPRByAC] = [TA_Currencies10].[CurrencyID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ProjectGroupID' THEN [COST_ProjectsInput].[ProjectGroupID] END,
     CASE @OrderBy WHEN 'ProjectGroupID DESC' THEN [COST_ProjectsInput].[ProjectGroupID] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [COST_ProjectsInput].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [COST_ProjectsInput].[StatusID] END DESC,
     CASE @OrderBy WHEN 'FinYear' THEN [COST_ProjectsInput].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [COST_ProjectsInput].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Quarter' THEN [COST_ProjectsInput].[Quarter] END,
     CASE @OrderBy WHEN 'Quarter DESC' THEN [COST_ProjectsInput].[Quarter] END DESC,
     CASE @OrderBy WHEN 'CurrencyGOV' THEN [COST_ProjectsInput].[CurrencyGOV] END,
     CASE @OrderBy WHEN 'CurrencyGOV DESC' THEN [COST_ProjectsInput].[CurrencyGOV] END DESC,
     CASE @OrderBy WHEN 'GroupOrderValue' THEN [COST_ProjectsInput].[GroupOrderValue] END,
     CASE @OrderBy WHEN 'GroupOrderValue DESC' THEN [COST_ProjectsInput].[GroupOrderValue] END DESC,
     CASE @OrderBy WHEN 'CFforGOV' THEN [COST_ProjectsInput].[CFforGOV] END,
     CASE @OrderBy WHEN 'CFforGOV DESC' THEN [COST_ProjectsInput].[CFforGOV] END DESC,
     CASE @OrderBy WHEN 'GroupOrderValueINR' THEN [COST_ProjectsInput].[GroupOrderValueINR] END,
     CASE @OrderBy WHEN 'GroupOrderValueINR DESC' THEN [COST_ProjectsInput].[GroupOrderValueINR] END DESC,
     CASE @OrderBy WHEN 'CurrencyPR' THEN [COST_ProjectsInput].[CurrencyPR] END,
     CASE @OrderBy WHEN 'CurrencyPR DESC' THEN [COST_ProjectsInput].[CurrencyPR] END DESC,
     CASE @OrderBy WHEN 'CFforPR' THEN [COST_ProjectsInput].[CFforPR] END,
     CASE @OrderBy WHEN 'CFforPR DESC' THEN [COST_ProjectsInput].[CFforPR] END DESC,
     CASE @OrderBy WHEN 'ProjectRevenue' THEN [COST_ProjectsInput].[ProjectRevenue] END,
     CASE @OrderBy WHEN 'ProjectRevenue DESC' THEN [COST_ProjectsInput].[ProjectRevenue] END DESC,
     CASE @OrderBy WHEN 'ProjectMargin' THEN [COST_ProjectsInput].[ProjectMargin] END,
     CASE @OrderBy WHEN 'ProjectMargin DESC' THEN [COST_ProjectsInput].[ProjectMargin] END DESC,
     CASE @OrderBy WHEN 'ExportIncentive' THEN [COST_ProjectsInput].[ExportIncentive] END,
     CASE @OrderBy WHEN 'ExportIncentive DESC' THEN [COST_ProjectsInput].[ExportIncentive] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [COST_ProjectsInput].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [COST_ProjectsInput].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [COST_ProjectsInput].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [COST_ProjectsInput].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'ApproverRemarks' THEN [COST_ProjectsInput].[ApproverRemarks] END,
     CASE @OrderBy WHEN 'ApproverRemarks DESC' THEN [COST_ProjectsInput].[ApproverRemarks] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [COST_ProjectsInput].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [COST_ProjectsInput].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CFforBalanceCalculationByAC' THEN [COST_ProjectsInput].[CFforBalanceCalculationByAC] END,
     CASE @OrderBy WHEN 'CFforBalanceCalculationByAC DESC' THEN [COST_ProjectsInput].[CFforBalanceCalculationByAC] END DESC,
     CASE @OrderBy WHEN 'ReceivedBy' THEN [COST_ProjectsInput].[ReceivedBy] END,
     CASE @OrderBy WHEN 'ReceivedBy DESC' THEN [COST_ProjectsInput].[ReceivedBy] END DESC,
     CASE @OrderBy WHEN 'ReceivedOn' THEN [COST_ProjectsInput].[ReceivedOn] END,
     CASE @OrderBy WHEN 'ReceivedOn DESC' THEN [COST_ProjectsInput].[ReceivedOn] END DESC,
     CASE @OrderBy WHEN 'ReceiverRemarks' THEN [COST_ProjectsInput].[ReceiverRemarks] END,
     CASE @OrderBy WHEN 'ReceiverRemarks DESC' THEN [COST_ProjectsInput].[ReceiverRemarks] END DESC,
     CASE @OrderBy WHEN 'ApprovedBy' THEN [COST_ProjectsInput].[ApprovedBy] END,
     CASE @OrderBy WHEN 'ApprovedBy DESC' THEN [COST_ProjectsInput].[ApprovedBy] END DESC,
     CASE @OrderBy WHEN 'ApprovedOn' THEN [COST_ProjectsInput].[ApprovedOn] END,
     CASE @OrderBy WHEN 'ApprovedOn DESC' THEN [COST_ProjectsInput].[ApprovedOn] END DESC,
     CASE @OrderBy WHEN 'CurrencyPRByAC' THEN [COST_ProjectsInput].[CurrencyPRByAC] END,
     CASE @OrderBy WHEN 'CurrencyPRByAC DESC' THEN [COST_ProjectsInput].[CurrencyPRByAC] END DESC,
     CASE @OrderBy WHEN 'ProjectRevenueByAC' THEN [COST_ProjectsInput].[ProjectRevenueByAC] END,
     CASE @OrderBy WHEN 'ProjectRevenueByAC DESC' THEN [COST_ProjectsInput].[ProjectRevenueByAC] END DESC,
     CASE @OrderBy WHEN 'ExportIncentiveINR' THEN [COST_ProjectsInput].[ExportIncentiveINR] END,
     CASE @OrderBy WHEN 'ExportIncentiveINR DESC' THEN [COST_ProjectsInput].[ExportIncentiveINR] END DESC,
     CASE @OrderBy WHEN 'ProjectRevenueINR' THEN [COST_ProjectsInput].[ProjectRevenueINR] END,
     CASE @OrderBy WHEN 'ProjectRevenueINR DESC' THEN [COST_ProjectsInput].[ProjectRevenueINR] END DESC,
     CASE @OrderBy WHEN 'ProjectMarginINR' THEN [COST_ProjectsInput].[ProjectMarginINR] END,
     CASE @OrderBy WHEN 'ProjectMarginINR DESC' THEN [COST_ProjectsInput].[ProjectMarginINR] END DESC,
     CASE @OrderBy WHEN 'ProjectMarginByAC' THEN [COST_ProjectsInput].[ProjectMarginByAC] END,
     CASE @OrderBy WHEN 'ProjectMarginByAC DESC' THEN [COST_ProjectsInput].[ProjectMarginByAC] END DESC,
     CASE @OrderBy WHEN 'ProjectMarginByACINR' THEN [COST_ProjectsInput].[ProjectMarginByACINR] END,
     CASE @OrderBy WHEN 'ProjectMarginByACINR DESC' THEN [COST_ProjectsInput].[ProjectMarginByACINR] END DESC,
     CASE @OrderBy WHEN 'ExportIncentiveByACINR' THEN [COST_ProjectsInput].[ExportIncentiveByACINR] END,
     CASE @OrderBy WHEN 'ExportIncentiveByACINR DESC' THEN [COST_ProjectsInput].[ExportIncentiveByACINR] END DESC,
     CASE @OrderBy WHEN 'ProjectRevenueByACINR' THEN [COST_ProjectsInput].[ProjectRevenueByACINR] END,
     CASE @OrderBy WHEN 'ProjectRevenueByACINR DESC' THEN [COST_ProjectsInput].[ProjectRevenueByACINR] END DESC,
     CASE @OrderBy WHEN 'ExportIncentiveByAC' THEN [COST_ProjectsInput].[ExportIncentiveByAC] END,
     CASE @OrderBy WHEN 'ExportIncentiveByAC DESC' THEN [COST_ProjectsInput].[ExportIncentiveByAC] END DESC,
     CASE @OrderBy WHEN 'CFforPRByAC' THEN [COST_ProjectsInput].[CFforPRByAC] END,
     CASE @OrderBy WHEN 'CFforPRByAC DESC' THEN [COST_ProjectsInput].[CFforPRByAC] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'COST_FinYear3_Descpription' THEN [COST_FinYear3].[Descpription] END,
     CASE @OrderBy WHEN 'COST_FinYear3_Descpription DESC' THEN [COST_FinYear3].[Descpription] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectGroups4_ProjectGroupDescription' THEN [COST_ProjectGroups4].[ProjectGroupDescription] END,
     CASE @OrderBy WHEN 'COST_ProjectGroups4_ProjectGroupDescription DESC' THEN [COST_ProjectGroups4].[ProjectGroupDescription] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectInputStatus5_Description' THEN [COST_ProjectInputStatus5].[Description] END,
     CASE @OrderBy WHEN 'COST_ProjectInputStatus5_Description DESC' THEN [COST_ProjectInputStatus5].[Description] END DESC,
     CASE @OrderBy WHEN 'COST_Quarters6_Description' THEN [COST_Quarters6].[Description] END,
     CASE @OrderBy WHEN 'COST_Quarters6_Description DESC' THEN [COST_Quarters6].[Description] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users7_UserFullName' THEN [aspnet_Users7].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users7_UserFullName DESC' THEN [aspnet_Users7].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'TA_Currencies8_CurrencyName' THEN [TA_Currencies8].[CurrencyName] END,
     CASE @OrderBy WHEN 'TA_Currencies8_CurrencyName DESC' THEN [TA_Currencies8].[CurrencyName] END DESC,
     CASE @OrderBy WHEN 'TA_Currencies9_CurrencyName' THEN [TA_Currencies9].[CurrencyName] END,
     CASE @OrderBy WHEN 'TA_Currencies9_CurrencyName DESC' THEN [TA_Currencies9].[CurrencyName] END DESC,
     CASE @OrderBy WHEN 'TA_Currencies10_CurrencyName' THEN [TA_Currencies10].[CurrencyName] END,
     CASE @OrderBy WHEN 'TA_Currencies10_CurrencyName DESC' THEN [TA_Currencies10].[CurrencyName] END DESC 
  SET @RecordCount = @@RowCount
GO
