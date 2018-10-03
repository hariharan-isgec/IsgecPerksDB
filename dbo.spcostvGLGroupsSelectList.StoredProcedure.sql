USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostvGLGroupsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [COST_vGLGroups].*  
  FROM [COST_vGLGroups] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'GLGroupID' THEN [COST_vGLGroups].[GLGroupID] END,
     CASE @OrderBy WHEN 'GLGroupID DESC' THEN [COST_vGLGroups].[GLGroupID] END DESC,
     CASE @OrderBy WHEN 'GLGroupDescriptions' THEN [COST_vGLGroups].[GLGroupDescriptions] END,
     CASE @OrderBy WHEN 'GLGroupDescriptions DESC' THEN [COST_vGLGroups].[GLGroupDescriptions] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [COST_vGLGroups].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [COST_vGLGroups].[Sequence] END DESC 
  SET @RecordCount = @@RowCount
GO
