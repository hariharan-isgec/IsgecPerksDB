USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectsInputSelectByID]
  @LoginID NVarChar(8),
  @ProjectGroupID Int,
  @FinYear Int,
  @Quarter Int 
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
  WHERE
  [COST_ProjectsInput].[ProjectGroupID] = @ProjectGroupID
  AND [COST_ProjectsInput].[FinYear] = @FinYear
  AND [COST_ProjectsInput].[Quarter] = @Quarter
GO
