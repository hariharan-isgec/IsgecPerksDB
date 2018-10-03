USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostvGLGroupsSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[COST_vGLGroups].[GLGroupID]'
  SET @LGSQL = @LGSQL + ' FROM [COST_vGLGroups] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'GLGroupID' THEN '[COST_vGLGroups].[GLGroupID]'
                        WHEN 'GLGroupID DESC' THEN '[COST_vGLGroups].[GLGroupID] DESC'
                        WHEN 'GLGroupDescriptions' THEN '[COST_vGLGroups].[GLGroupDescriptions]'
                        WHEN 'GLGroupDescriptions DESC' THEN '[COST_vGLGroups].[GLGroupDescriptions] DESC'
                        WHEN 'Sequence' THEN '[COST_vGLGroups].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[COST_vGLGroups].[Sequence] DESC'
                        ELSE '[COST_vGLGroups].[GLGroupID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_vGLGroups].*  
  FROM [COST_vGLGroups] 
      INNER JOIN #PageIndex
          ON [COST_vGLGroups].[GLGroupID] = #PageIndex.GLGroupID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
