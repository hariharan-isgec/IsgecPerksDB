USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spcostProjectGroupsSelectByGroupName]
  @LoginID NVarChar(8),
  @ProjectGroupName NVarChar(50) 
  AS
  SELECT
    [COST_ProjectGroups].* ,
    [COST_ProjectTypes1].[ProjectTypeDescription] AS COST_ProjectTypes1_ProjectTypeDescription 
  FROM [COST_ProjectGroups] 
  LEFT OUTER JOIN [COST_ProjectTypes] AS [COST_ProjectTypes1]
    ON [COST_ProjectGroups].[ProjectTypeID] = [COST_ProjectTypes1].[ProjectTypeID]
  WHERE
  [COST_ProjectGroups].[ProjectGroupDescription] = @ProjectGroupName
GO
