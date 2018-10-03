USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLGroupsSelectListFilteres]
  @Filter_GLGroupID Int,
  @Filter_GLNatureID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,GLGroupID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'GLGroupID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_GLGroups].[GLGroupID]'
  SET @LGSQL = @LGSQL + ' FROM [COST_GLGroups] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_GLNatures] AS [COST_GLNatures1]'
  SET @LGSQL = @LGSQL + '    ON [COST_GLGroups].[GLNatureID] = [COST_GLNatures1].[GLNatureID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_vGLGroups] AS [COST_vGLGroups2]'
  SET @LGSQL = @LGSQL + '    ON [COST_GLGroups].[CostGLGroupID] = [COST_vGLGroups2].[GLGroupID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_GLGroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_GLGroups].[GLGroupID] = ' + STR(@Filter_GLGroupID)
  IF (@Filter_GLNatureID > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_GLGroups].[GLNatureID] = ' + STR(@Filter_GLNatureID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'GLGroupID' THEN '[COST_GLGroups].[GLGroupID]'
                        WHEN 'GLGroupID DESC' THEN '[COST_GLGroups].[GLGroupID] DESC'
                        WHEN 'GLNatureID' THEN '[COST_GLGroups].[GLNatureID]'
                        WHEN 'GLNatureID DESC' THEN '[COST_GLGroups].[GLNatureID] DESC'
                        WHEN 'GLGroupDescriptions' THEN '[COST_GLGroups].[GLGroupDescriptions]'
                        WHEN 'GLGroupDescriptions DESC' THEN '[COST_GLGroups].[GLGroupDescriptions] DESC'
                        WHEN 'CostGLGroupID' THEN '[COST_GLGroups].[CostGLGroupID]'
                        WHEN 'CostGLGroupID DESC' THEN '[COST_GLGroups].[CostGLGroupID] DESC'
                        WHEN 'Sequence' THEN '[COST_GLGroups].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[COST_GLGroups].[Sequence] DESC'
                        WHEN 'COST_GLNatures1_GLNatureDescription' THEN '[COST_GLNatures1].[GLNatureDescription]'
                        WHEN 'COST_GLNatures1_GLNatureDescription DESC' THEN '[COST_GLNatures1].[GLNatureDescription] DESC'
                        WHEN 'COST_vGLGroups2_GLGroupDescriptions' THEN '[COST_vGLGroups2].[GLGroupDescriptions]'
                        WHEN 'COST_vGLGroups2_GLGroupDescriptions DESC' THEN '[COST_vGLGroups2].[GLGroupDescriptions] DESC'
                        ELSE '[COST_GLGroups].[GLGroupID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_GLGroups].* ,
    [COST_GLNatures1].[GLNatureDescription] AS COST_GLNatures1_GLNatureDescription,
    [COST_vGLGroups2].[GLGroupDescriptions] AS COST_vGLGroups2_GLGroupDescriptions 
  FROM [COST_GLGroups] 
      INNER JOIN #PageIndex
          ON [COST_GLGroups].[GLGroupID] = #PageIndex.GLGroupID
  LEFT OUTER JOIN [COST_GLNatures] AS [COST_GLNatures1]
    ON [COST_GLGroups].[GLNatureID] = [COST_GLNatures1].[GLNatureID]
  LEFT OUTER JOIN [COST_vGLGroups] AS [COST_vGLGroups2]
    ON [COST_GLGroups].[CostGLGroupID] = [COST_vGLGroups2].[GLGroupID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
