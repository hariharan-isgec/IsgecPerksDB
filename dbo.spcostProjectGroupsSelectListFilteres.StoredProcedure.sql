USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectGroupsSelectListFilteres]
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
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectGroupID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_ProjectGroups].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + ' FROM [COST_ProjectGroups] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_ProjectTypes] AS [COST_ProjectTypes1]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectGroups].[ProjectTypeID] = [COST_ProjectTypes1].[ProjectTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectGroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_ProjectGroups].[ProjectGroupID] = ' + STR(@Filter_ProjectGroupID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectGroupID' THEN '[COST_ProjectGroups].[ProjectGroupID]'
                        WHEN 'ProjectGroupID DESC' THEN '[COST_ProjectGroups].[ProjectGroupID] DESC'
                        WHEN 'ProjectGroupDescription' THEN '[COST_ProjectGroups].[ProjectGroupDescription]'
                        WHEN 'ProjectGroupDescription DESC' THEN '[COST_ProjectGroups].[ProjectGroupDescription] DESC'
                        WHEN 'ProjectTypeID' THEN '[COST_ProjectGroups].[ProjectTypeID]'
                        WHEN 'ProjectTypeID DESC' THEN '[COST_ProjectGroups].[ProjectTypeID] DESC'
                        WHEN 'COST_ProjectTypes1_ProjectTypeDescription' THEN '[COST_ProjectTypes1].[ProjectTypeDescription]'
                        WHEN 'COST_ProjectTypes1_ProjectTypeDescription DESC' THEN '[COST_ProjectTypes1].[ProjectTypeDescription] DESC'
                        ELSE '[COST_ProjectGroups].[ProjectGroupID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_ProjectGroups].* ,
    [COST_ProjectTypes1].[ProjectTypeDescription] AS COST_ProjectTypes1_ProjectTypeDescription 
  FROM [COST_ProjectGroups] 
      INNER JOIN #PageIndex
          ON [COST_ProjectGroups].[ProjectGroupID] = #PageIndex.ProjectGroupID
  LEFT OUTER JOIN [COST_ProjectTypes] AS [COST_ProjectTypes1]
    ON [COST_ProjectGroups].[ProjectTypeID] = [COST_ProjectTypes1].[ProjectTypeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
