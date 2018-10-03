USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostvGLGroupsSelectByID]
  @LoginID NVarChar(8),
  @GLGroupID Int 
  AS
  SELECT
    [COST_vGLGroups].*  
  FROM [COST_vGLGroups] 
  WHERE
  [COST_vGLGroups].[GLGroupID] = @GLGroupID
GO
