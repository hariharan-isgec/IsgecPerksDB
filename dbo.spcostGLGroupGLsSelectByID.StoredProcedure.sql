USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLGroupGLsSelectByID]
  @LoginID NVarChar(8),
  @GLGroupID Int,
  @GLCode NVarChar(10) 
  AS
  SELECT
    [COST_GLGroupGLs].* ,
    [COST_GLGroups1].[GLGroupDescriptions] AS COST_GLGroups1_GLGroupDescriptions,
    [COST_ERPGLCodes2].[GLDescription] AS COST_ERPGLCodes2_GLDescription 
  FROM [COST_GLGroupGLs] 
  INNER JOIN [COST_GLGroups] AS [COST_GLGroups1]
    ON [COST_GLGroupGLs].[GLGroupID] = [COST_GLGroups1].[GLGroupID]
  INNER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes2]
    ON [COST_GLGroupGLs].[GLCode] = [COST_ERPGLCodes2].[GLCode]
  WHERE
  [COST_GLGroupGLs].[GLGroupID] = @GLGroupID
  AND [COST_GLGroupGLs].[GLCode] = @GLCode
GO
