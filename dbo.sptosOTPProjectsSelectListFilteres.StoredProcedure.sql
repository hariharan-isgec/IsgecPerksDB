USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPProjectsSelectListFilteres]
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
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TOS_Projects].[ProjectID]'
  SET @LGSQL = @LGSQL + ' FROM [TOS_Projects] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [TOS_Projects].[ProjectID] = [IDM_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks2]'
  SET @LGSQL = @LGSQL + '    ON [TOS_Projects].[ProjectID] = [TOS_Tasks2].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_Projects].[RootTaskID] = [TOS_Tasks2].[TaskID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks1]'
  SET @LGSQL = @LGSQL + '    ON [TOS_Projects].[ProjectID] = [TOS_Tasks1].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_Projects].[RootTaskID] = [TOS_Tasks1].[TaskID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [TOS_Projects].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[TOS_Projects].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[TOS_Projects].[ProjectID] DESC'
                        WHEN 'Description' THEN '[TOS_Projects].[Description]'
                        WHEN 'Description DESC' THEN '[TOS_Projects].[Description] DESC'
                        WHEN 'RootTaskID' THEN '[TOS_Projects].[RootTaskID]'
                        WHEN 'RootTaskID DESC' THEN '[TOS_Projects].[RootTaskID] DESC'
                        WHEN 'Active' THEN '[TOS_Projects].[Active]'
                        WHEN 'Active DESC' THEN '[TOS_Projects].[Active] DESC'
                        WHEN 'engEnabled' THEN '[TOS_Projects].[engEnabled]'
                        WHEN 'engEnabled DESC' THEN '[TOS_Projects].[engEnabled] DESC'
                        WHEN 'engTitle' THEN '[TOS_Projects].[engTitle]'
                        WHEN 'engTitle DESC' THEN '[TOS_Projects].[engTitle] DESC'
                        WHEN 'ordEnabled' THEN '[TOS_Projects].[ordEnabled]'
                        WHEN 'ordEnabled DESC' THEN '[TOS_Projects].[ordEnabled] DESC'
                        WHEN 'ordTitle' THEN '[TOS_Projects].[ordTitle]'
                        WHEN 'ordTitle DESC' THEN '[TOS_Projects].[ordTitle] DESC'
                        WHEN 'desEnabled' THEN '[TOS_Projects].[desEnabled]'
                        WHEN 'desEnabled DESC' THEN '[TOS_Projects].[desEnabled] DESC'
                        WHEN 'desTitle' THEN '[TOS_Projects].[desTitle]'
                        WHEN 'desTitle DESC' THEN '[TOS_Projects].[desTitle] DESC'
                        WHEN 'ereEnabled' THEN '[TOS_Projects].[ereEnabled]'
                        WHEN 'ereEnabled DESC' THEN '[TOS_Projects].[ereEnabled] DESC'
                        WHEN 'ereTitle' THEN '[TOS_Projects].[ereTitle]'
                        WHEN 'ereTitle DESC' THEN '[TOS_Projects].[ereTitle] DESC'
                        WHEN 'ioEnabled' THEN '[TOS_Projects].[ioEnabled]'
                        WHEN 'ioEnabled DESC' THEN '[TOS_Projects].[ioEnabled] DESC'
                        WHEN 'ioTitle' THEN '[TOS_Projects].[ioTitle]'
                        WHEN 'ioTitle DESC' THEN '[TOS_Projects].[ioTitle] DESC'
                        WHEN 'recEnabled' THEN '[TOS_Projects].[recEnabled]'
                        WHEN 'recEnabled DESC' THEN '[TOS_Projects].[recEnabled] DESC'
                        WHEN 'recTitle' THEN '[TOS_Projects].[recTitle]'
                        WHEN 'recTitle DESC' THEN '[TOS_Projects].[recTitle] DESC'
                        WHEN 'ad1Enabled' THEN '[TOS_Projects].[ad1Enabled]'
                        WHEN 'ad1Enabled DESC' THEN '[TOS_Projects].[ad1Enabled] DESC'
                        WHEN 'ad1Title' THEN '[TOS_Projects].[ad1Title]'
                        WHEN 'ad1Title DESC' THEN '[TOS_Projects].[ad1Title] DESC'
                        WHEN 'ad2Enabled' THEN '[TOS_Projects].[ad2Enabled]'
                        WHEN 'ad2Enabled DESC' THEN '[TOS_Projects].[ad2Enabled] DESC'
                        WHEN 'ad2Title' THEN '[TOS_Projects].[ad2Title]'
                        WHEN 'ad2Title DESC' THEN '[TOS_Projects].[ad2Title] DESC'
                        WHEN 'ad3Enabled' THEN '[TOS_Projects].[ad3Enabled]'
                        WHEN 'ad3Enabled DESC' THEN '[TOS_Projects].[ad3Enabled] DESC'
                        WHEN 'ad3Title' THEN '[TOS_Projects].[ad3Title]'
                        WHEN 'ad3Title DESC' THEN '[TOS_Projects].[ad3Title] DESC'
                        WHEN 'ad4Enabled' THEN '[TOS_Projects].[ad4Enabled]'
                        WHEN 'ad4Enabled DESC' THEN '[TOS_Projects].[ad4Enabled] DESC'
                        WHEN 'ad4Title' THEN '[TOS_Projects].[ad4Title]'
                        WHEN 'ad4Title DESC' THEN '[TOS_Projects].[ad4Title] DESC'
                        WHEN 'IDM_Projects1_Description' THEN '[IDM_Projects1].[Description]'
                        WHEN 'IDM_Projects1_Description DESC' THEN '[IDM_Projects1].[Description] DESC'
                        WHEN 'TOS_Tasks2_Description' THEN '[TOS_Tasks2].[Description]'
                        WHEN 'TOS_Tasks2_Description DESC' THEN '[TOS_Tasks2].[Description] DESC'
                        WHEN 'TOS_Tasks1_Description' THEN '[TOS_Tasks1].[Description]'
                        WHEN 'TOS_Tasks1_Description DESC' THEN '[TOS_Tasks1].[Description] DESC'
                        ELSE '[TOS_Projects].[ProjectID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TOS_Projects].[ProjectID] ,
		[TOS_Projects].[Description] ,
		[TOS_Projects].[RootTaskID] ,
		[TOS_Projects].[Active] ,
		[TOS_Projects].[engEnabled] ,
		[TOS_Projects].[engTitle] ,
		[TOS_Projects].[ordEnabled] ,
		[TOS_Projects].[ordTitle] ,
		[TOS_Projects].[desEnabled] ,
		[TOS_Projects].[desTitle] ,
		[TOS_Projects].[ereEnabled] ,
		[TOS_Projects].[ereTitle] ,
		[TOS_Projects].[ioEnabled] ,
		[TOS_Projects].[ioTitle] ,
		[TOS_Projects].[recEnabled] ,
		[TOS_Projects].[recTitle] ,
		[TOS_Projects].[ad1Enabled] ,
		[TOS_Projects].[ad1Title] ,
		[TOS_Projects].[ad2Enabled] ,
		[TOS_Projects].[ad2Title] ,
		[TOS_Projects].[ad3Enabled] ,
		[TOS_Projects].[ad3Title] ,
		[TOS_Projects].[ad4Enabled] ,
		[TOS_Projects].[ad4Title] ,
		[IDM_Projects1].[Description] AS IDM_Projects1_Description,
		[TOS_Tasks2].[Description] AS TOS_Tasks2_Description,
		[TOS_Tasks1].[Description] AS TOS_Tasks1_Description 
  FROM [TOS_Projects] 
    	INNER JOIN #PageIndex
          ON [TOS_Projects].[ProjectID] = #PageIndex.ProjectID
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [TOS_Projects].[ProjectID] = [IDM_Projects1].[ProjectID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_Projects].[ProjectID] = [TOS_Tasks2].[ProjectID]
    AND [TOS_Projects].[RootTaskID] = [TOS_Tasks2].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks1]
    ON [TOS_Projects].[ProjectID] = [TOS_Tasks1].[ProjectID]
    AND [TOS_Projects].[RootTaskID] = [TOS_Tasks1].[TaskID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
