USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectGroupProjectsSelectListFilteres]
  @Filter_ProjectGroupID Int,
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
 ,ProjectGroupID Int NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectGroupID'
  SET @LGSQL = @LGSQL + ', ProjectID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_ProjectGroupProjects].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + ', [COST_ProjectGroupProjects].[ProjectID]'
  SET @LGSQL = @LGSQL + ' FROM [COST_ProjectGroupProjects] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups1]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectGroupProjects].[ProjectGroupID] = [COST_ProjectGroups1].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectGroupProjects].[ProjectID] = [IDM_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectGroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_ProjectGroupProjects].[ProjectGroupID] = ' + STR(@Filter_ProjectGroupID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectGroupID' THEN '[COST_ProjectGroupProjects].[ProjectGroupID]'
                        WHEN 'ProjectGroupID DESC' THEN '[COST_ProjectGroupProjects].[ProjectGroupID] DESC'
                        WHEN 'ProjectID' THEN '[COST_ProjectGroupProjects].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[COST_ProjectGroupProjects].[ProjectID] DESC'
                        WHEN 'COST_ProjectGroups1_ProjectGroupDescription' THEN '[COST_ProjectGroups1].[ProjectGroupDescription]'
                        WHEN 'COST_ProjectGroups1_ProjectGroupDescription DESC' THEN '[COST_ProjectGroups1].[ProjectGroupDescription] DESC'
                        WHEN 'IDM_Projects2_Description' THEN '[IDM_Projects2].[Description]'
                        WHEN 'IDM_Projects2_Description DESC' THEN '[IDM_Projects2].[Description] DESC'
                        ELSE '[COST_ProjectGroupProjects].[ProjectGroupID],[COST_ProjectGroupProjects].[ProjectID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_ProjectGroupProjects].* ,
    [COST_ProjectGroups1].[ProjectGroupDescription] AS COST_ProjectGroups1_ProjectGroupDescription,
    [IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [COST_ProjectGroupProjects] 
      INNER JOIN #PageIndex
          ON [COST_ProjectGroupProjects].[ProjectGroupID] = #PageIndex.ProjectGroupID
          AND [COST_ProjectGroupProjects].[ProjectID] = #PageIndex.ProjectID
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups1]
    ON [COST_ProjectGroupProjects].[ProjectGroupID] = [COST_ProjectGroups1].[ProjectGroupID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [COST_ProjectGroupProjects].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
