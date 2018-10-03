USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosProjectCLPsSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
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
  SET @LGSQL = @LGSQL + '  INNER JOIN [TOS_Projects] AS [TOS_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPs].[ProjectID] = [TOS_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks2]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks2].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPs].[ereTaskID] = [TOS_Tasks2].[TaskID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks3]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks3].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPs].[desTaskID] = [TOS_Tasks3].[TaskID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks4]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks4].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPs].[engTaskID] = [TOS_Tasks4].[TaskID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks5]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks5].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPs].[ordTaskID] = [TOS_Tasks5].[TaskID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks8]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks8].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPs].[ad1TaskID] = [TOS_Tasks8].[TaskID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks9]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks9].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPs].[ad2TaskID] = [TOS_Tasks9].[TaskID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks10]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks10].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPs].[ad3TaskID] = [TOS_Tasks10].[TaskID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks11]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks11].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPs].[ad4TaskID] = [TOS_Tasks11].[TaskID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks6]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks6].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPs].[ioTaskID] = [TOS_Tasks6].[TaskID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks7]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks7].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPs].[recTaskID] = [TOS_Tasks7].[TaskID]'
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
                        WHEN 'Quantity' THEN '[TOS_CLPs].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[TOS_CLPs].[Quantity] DESC'
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
                        WHEN 'ereTaskID' THEN '[TOS_CLPs].[ereTaskID]'
                        WHEN 'ereTaskID DESC' THEN '[TOS_CLPs].[ereTaskID] DESC'
                        WHEN 'ioTaskID' THEN '[TOS_CLPs].[ioTaskID]'
                        WHEN 'ioTaskID DESC' THEN '[TOS_CLPs].[ioTaskID] DESC'
                        WHEN 'recTaskID' THEN '[TOS_CLPs].[recTaskID]'
                        WHEN 'recTaskID DESC' THEN '[TOS_CLPs].[recTaskID] DESC'
                        WHEN 'ad1TaskID' THEN '[TOS_CLPs].[ad1TaskID]'
                        WHEN 'ad1TaskID DESC' THEN '[TOS_CLPs].[ad1TaskID] DESC'
                        WHEN 'ad2TaskID' THEN '[TOS_CLPs].[ad2TaskID]'
                        WHEN 'ad2TaskID DESC' THEN '[TOS_CLPs].[ad2TaskID] DESC'
                        WHEN 'ad3TaskID' THEN '[TOS_CLPs].[ad3TaskID]'
                        WHEN 'ad3TaskID DESC' THEN '[TOS_CLPs].[ad3TaskID] DESC'
                        WHEN 'ad4TaskID' THEN '[TOS_CLPs].[ad4TaskID]'
                        WHEN 'ad4TaskID DESC' THEN '[TOS_CLPs].[ad4TaskID] DESC'
                        WHEN 'Active' THEN '[TOS_CLPs].[Active]'
                        WHEN 'Active DESC' THEN '[TOS_CLPs].[Active] DESC'
                        WHEN 'TOS_Projects1_Description' THEN '[TOS_Projects1].[Description]'
                        WHEN 'TOS_Projects1_Description DESC' THEN '[TOS_Projects1].[Description] DESC'
                        WHEN 'TOS_Tasks2_Description' THEN '[TOS_Tasks2].[Description]'
                        WHEN 'TOS_Tasks2_Description DESC' THEN '[TOS_Tasks2].[Description] DESC'
                        WHEN 'TOS_Tasks3_Description' THEN '[TOS_Tasks3].[Description]'
                        WHEN 'TOS_Tasks3_Description DESC' THEN '[TOS_Tasks3].[Description] DESC'
                        WHEN 'TOS_Tasks4_Description' THEN '[TOS_Tasks4].[Description]'
                        WHEN 'TOS_Tasks4_Description DESC' THEN '[TOS_Tasks4].[Description] DESC'
                        WHEN 'TOS_Tasks5_Description' THEN '[TOS_Tasks5].[Description]'
                        WHEN 'TOS_Tasks5_Description DESC' THEN '[TOS_Tasks5].[Description] DESC'
                        WHEN 'TOS_Tasks8_Description' THEN '[TOS_Tasks8].[Description]'
                        WHEN 'TOS_Tasks8_Description DESC' THEN '[TOS_Tasks8].[Description] DESC'
                        WHEN 'TOS_Tasks9_Description' THEN '[TOS_Tasks9].[Description]'
                        WHEN 'TOS_Tasks9_Description DESC' THEN '[TOS_Tasks9].[Description] DESC'
                        WHEN 'TOS_Tasks10_Description' THEN '[TOS_Tasks10].[Description]'
                        WHEN 'TOS_Tasks10_Description DESC' THEN '[TOS_Tasks10].[Description] DESC'
                        WHEN 'TOS_Tasks11_Description' THEN '[TOS_Tasks11].[Description]'
                        WHEN 'TOS_Tasks11_Description DESC' THEN '[TOS_Tasks11].[Description] DESC'
                        WHEN 'TOS_Tasks6_Description' THEN '[TOS_Tasks6].[Description]'
                        WHEN 'TOS_Tasks6_Description DESC' THEN '[TOS_Tasks6].[Description] DESC'
                        WHEN 'TOS_Tasks7_Description' THEN '[TOS_Tasks7].[Description]'
                        WHEN 'TOS_Tasks7_Description DESC' THEN '[TOS_Tasks7].[Description] DESC'
                        ELSE '[TOS_CLPs].[ProjectID],[TOS_CLPs].[CLPID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TOS_CLPs].[ProjectID] ,
		[TOS_CLPs].[CLPID] ,
		[TOS_CLPs].[Description] ,
		[TOS_CLPs].[Quantity] ,
		[TOS_CLPs].[Sequence] ,
		[TOS_CLPs].[DisplayType] ,
		[TOS_CLPs].[engTaskID] ,
		[TOS_CLPs].[ordTaskID] ,
		[TOS_CLPs].[desTaskID] ,
		[TOS_CLPs].[ereTaskID] ,
		[TOS_CLPs].[ioTaskID] ,
		[TOS_CLPs].[recTaskID] ,
		[TOS_CLPs].[ad1TaskID] ,
		[TOS_CLPs].[ad2TaskID] ,
		[TOS_CLPs].[ad3TaskID] ,
		[TOS_CLPs].[ad4TaskID] ,
		[TOS_CLPs].[Active] ,
		[TOS_Projects1].[Description] AS TOS_Projects1_Description,
		[TOS_Tasks2].[Description] AS TOS_Tasks2_Description,
		[TOS_Tasks3].[Description] AS TOS_Tasks3_Description,
		[TOS_Tasks4].[Description] AS TOS_Tasks4_Description,
		[TOS_Tasks5].[Description] AS TOS_Tasks5_Description,
		[TOS_Tasks8].[Description] AS TOS_Tasks8_Description,
		[TOS_Tasks9].[Description] AS TOS_Tasks9_Description,
		[TOS_Tasks10].[Description] AS TOS_Tasks10_Description,
		[TOS_Tasks11].[Description] AS TOS_Tasks11_Description,
		[TOS_Tasks6].[Description] AS TOS_Tasks6_Description,
		[TOS_Tasks7].[Description] AS TOS_Tasks7_Description 
  FROM [TOS_CLPs] 
    	INNER JOIN #PageIndex
          ON [TOS_CLPs].[ProjectID] = #PageIndex.ProjectID
          AND [TOS_CLPs].[CLPID] = #PageIndex.CLPID
  INNER JOIN [TOS_Projects] AS [TOS_Projects1]
    ON [TOS_CLPs].[ProjectID] = [TOS_Projects1].[ProjectID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks2].[ProjectID]
    AND [TOS_CLPs].[ereTaskID] = [TOS_Tasks2].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks3]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks3].[ProjectID]
    AND [TOS_CLPs].[desTaskID] = [TOS_Tasks3].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks4]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks4].[ProjectID]
    AND [TOS_CLPs].[engTaskID] = [TOS_Tasks4].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks5]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks5].[ProjectID]
    AND [TOS_CLPs].[ordTaskID] = [TOS_Tasks5].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks8]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks8].[ProjectID]
    AND [TOS_CLPs].[ad1TaskID] = [TOS_Tasks8].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks9]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks9].[ProjectID]
    AND [TOS_CLPs].[ad2TaskID] = [TOS_Tasks9].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks10]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks10].[ProjectID]
    AND [TOS_CLPs].[ad3TaskID] = [TOS_Tasks10].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks11]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks11].[ProjectID]
    AND [TOS_CLPs].[ad4TaskID] = [TOS_Tasks11].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks6]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks6].[ProjectID]
    AND [TOS_CLPs].[ioTaskID] = [TOS_Tasks6].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks7]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks7].[ProjectID]
    AND [TOS_CLPs].[recTaskID] = [TOS_Tasks7].[TaskID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
