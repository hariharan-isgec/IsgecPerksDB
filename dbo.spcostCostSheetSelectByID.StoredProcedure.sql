USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetSelectByID]
  @LoginID NVarChar(8),
  @ProjectGroupID Int,
  @FinYear Int,
  @Quarter Int,
  @Revision Int 
  AS
  SELECT
    [COST_CostSheet].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [COST_CostSheetStates3].[Description] AS COST_CostSheetStates3_Description,
    [COST_FinYear4].[Descpription] AS COST_FinYear4_Descpription,
    [COST_ProjectGroups5].[ProjectGroupDescription] AS COST_ProjectGroups5_ProjectGroupDescription,
    [COST_Quarters6].[Description] AS COST_Quarters6_Description 
  FROM [COST_CostSheet] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [COST_CostSheet].[CreatedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [COST_CostSheet].[ApprovedBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [COST_CostSheetStates] AS [COST_CostSheetStates3]
    ON [COST_CostSheet].[StatusID] = [COST_CostSheetStates3].[StatusID]
  INNER JOIN [COST_FinYear] AS [COST_FinYear4]
    ON [COST_CostSheet].[FinYear] = [COST_FinYear4].[FinYear]
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups5]
    ON [COST_CostSheet].[ProjectGroupID] = [COST_ProjectGroups5].[ProjectGroupID]
  INNER JOIN [COST_Quarters] AS [COST_Quarters6]
    ON [COST_CostSheet].[Quarter] = [COST_Quarters6].[Quarter]
  WHERE
  [COST_CostSheet].[ProjectGroupID] = @ProjectGroupID
  AND [COST_CostSheet].[FinYear] = @FinYear
  AND [COST_CostSheet].[Quarter] = @Quarter
  AND [COST_CostSheet].[Revision] = @Revision
GO
