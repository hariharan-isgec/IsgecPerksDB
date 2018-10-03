USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectInputFilesSelectByID]
  @LoginID NVarChar(8),
  @ProjectGroupID Int,
  @FinYear Int,
  @Quarter Int,
  @SerialNo Int 
  AS
  SELECT
    [COST_ProjectInputFiles].* ,
    [COST_FinYear1].[Descpription] AS COST_FinYear1_Descpription,
    [COST_ProjectGroups2].[ProjectGroupDescription] AS COST_ProjectGroups2_ProjectGroupDescription,
    [COST_ProjectsInput3].[GroupOrderValueINR] AS COST_ProjectsInput3_GroupOrderValueINR,
    [COST_Quarters4].[Description] AS COST_Quarters4_Description 
  FROM [COST_ProjectInputFiles] 
  INNER JOIN [COST_FinYear] AS [COST_FinYear1]
    ON [COST_ProjectInputFiles].[FinYear] = [COST_FinYear1].[FinYear]
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups2]
    ON [COST_ProjectInputFiles].[ProjectGroupID] = [COST_ProjectGroups2].[ProjectGroupID]
  INNER JOIN [COST_ProjectsInput] AS [COST_ProjectsInput3]
    ON [COST_ProjectInputFiles].[ProjectGroupID] = [COST_ProjectsInput3].[ProjectGroupID]
    AND [COST_ProjectInputFiles].[FinYear] = [COST_ProjectsInput3].[FinYear]
    AND [COST_ProjectInputFiles].[Quarter] = [COST_ProjectsInput3].[Quarter]
  INNER JOIN [COST_Quarters] AS [COST_Quarters4]
    ON [COST_ProjectInputFiles].[Quarter] = [COST_Quarters4].[Quarter]
  WHERE
  [COST_ProjectInputFiles].[ProjectGroupID] = @ProjectGroupID
  AND [COST_ProjectInputFiles].[FinYear] = @FinYear
  AND [COST_ProjectInputFiles].[Quarter] = @Quarter
  AND [COST_ProjectInputFiles].[SerialNo] = @SerialNo
GO
