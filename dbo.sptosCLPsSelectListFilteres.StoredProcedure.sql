USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPsSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,CLPID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', CLPID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TOS_CLPs].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [TOS_CLPs].[CLPID]'
  SET @LGSQL = @LGSQL + ' FROM [TOS_CLPs] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPs].[ProjectID] = [IDM_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks2]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks2].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPs].[engTaskID] = [TOS_Tasks2].[TaskID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks3]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks3].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPs].[ordTaskID] = [TOS_Tasks3].[TaskID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks4]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks4].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPs].[desTaskID] = [TOS_Tasks4].[TaskID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [TOS_CLPs].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[TOS_CLPs].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[TOS_CLPs].[ProjectID] DESC'
                        WHEN 'CLPID' THEN '[TOS_CLPs].[CLPID]'
                        WHEN 'CLPID DESC' THEN '[TOS_CLPs].[CLPID] DESC'
                        WHEN 'Description' THEN '[TOS_CLPs].[Description]'
                        WHEN 'Description DESC' THEN '[TOS_CLPs].[Description] DESC'
                        WHEN 'Sequence' THEN '[TOS_CLPs].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[TOS_CLPs].[Sequence] DESC'
                        WHEN 'DisplayType' THEN '[TOS_CLPs].[DisplayType]'
                        WHEN 'DisplayType DESC' THEN '[TOS_CLPs].[DisplayType] DESC'
                        WHEN 'engTaskID' THEN '[TOS_CLPs].[engTaskID]'
                        WHEN 'engTaskID DESC' THEN '[TOS_CLPs].[engTaskID] DESC'
                        WHEN 'ordTaskID' THEN '[TOS_CLPs].[ordTaskID]'
                        WHEN 'ordTaskID DESC' THEN '[TOS_CLPs].[ordTaskID] DESC'
                        WHEN 'desTaskID' THEN '[TOS_CLPs].[desTaskID]'
                        WHEN 'desTaskID DESC' THEN '[TOS_CLPs].[desTaskID] DESC'
                        WHEN 'IDM_Projects1_Description' THEN '[IDM_Projects].[Description]'
                        WHEN 'IDM_Projects1_Description DESC' THEN '[IDM_Projects1].[Description] DESC'
                        WHEN 'TOS_Tasks2_Description' THEN '[TOS_Tasks].[Description]'
                        WHEN 'TOS_Tasks2_Description DESC' THEN '[TOS_Tasks2].[Description] DESC'
                        WHEN 'TOS_Tasks3_Description' THEN '[TOS_Tasks].[Description]'
                        WHEN 'TOS_Tasks3_Description DESC' THEN '[TOS_Tasks3].[Description] DESC'
                        WHEN 'TOS_Tasks4_Description' THEN '[TOS_Tasks].[Description]'
                        WHEN 'TOS_Tasks4_Description DESC' THEN '[TOS_Tasks4].[Description] DESC'
                        ELSE '[TOS_CLPs].[ProjectID],[TOS_CLPs].[CLPID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TOS_CLPs].[ProjectID] ,
		[TOS_CLPs].[CLPID] ,
		[TOS_CLPs].[Description] ,
		[TOS_CLPs].[Sequence] ,
		[TOS_CLPs].[DisplayType] ,
		[TOS_CLPs].[engTaskID] ,
		[TOS_CLPs].[ordTaskID] ,
		[TOS_CLPs].[desTaskID] ,
		[IDM_Projects1].[Description] AS IDM_Projects1_Description,
		[TOS_Tasks2].[Description] AS TOS_Tasks2_Description,
		[TOS_Tasks3].[Description] AS TOS_Tasks3_Description,
		[TOS_Tasks4].[Description] AS TOS_Tasks4_Description 
  FROM [TOS_CLPs] 
    	INNER JOIN #PageIndex
          ON [TOS_CLPs].[ProjectID] = #PageIndex.ProjectID
          AND [TOS_CLPs].[CLPID] = #PageIndex.CLPID
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [TOS_CLPs].[ProjectID] = [IDM_Projects1].[ProjectID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks2].[ProjectID]
    AND [TOS_CLPs].[engTaskID] = [TOS_Tasks2].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks3]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks3].[ProjectID]
    AND [TOS_CLPs].[ordTaskID] = [TOS_Tasks3].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks4]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks4].[ProjectID]
    AND [TOS_CLPs].[desTaskID] = [TOS_Tasks4].[TaskID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
