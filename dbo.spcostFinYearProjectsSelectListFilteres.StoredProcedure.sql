USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostFinYearProjectsSelectListFilteres]
  @Filter_FinYear Int,
  @Filter_Quarter Int,
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
 ,FinYear Int NOT NULL
 ,Quarter Int NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'FinYear'
  SET @LGSQL = @LGSQL + ', Quarter'
  SET @LGSQL = @LGSQL + ', ProjectID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_FinYearProjects].[FinYear]'
  SET @LGSQL = @LGSQL + ', [COST_FinYearProjects].[Quarter]'
  SET @LGSQL = @LGSQL + ', [COST_FinYearProjects].[ProjectID]'
  SET @LGSQL = @LGSQL + ' FROM [COST_FinYearProjects] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_FinYear] AS [COST_FinYear1]'
  SET @LGSQL = @LGSQL + '    ON [COST_FinYearProjects].[FinYear] = [COST_FinYear1].[FinYear]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_Quarters] AS [COST_Quarters2]'
  SET @LGSQL = @LGSQL + '    ON [COST_FinYearProjects].[Quarter] = [COST_Quarters2].[Quarter]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects3]'
  SET @LGSQL = @LGSQL + '    ON [COST_FinYearProjects].[ProjectID] = [IDM_Projects3].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_ProjectGroupProjects] AS [COST_ProjectGroupProjects4]'
  SET @LGSQL = @LGSQL + '    ON [COST_FinYearProjects].[IndividualGroupID] = [COST_ProjectGroupProjects4].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '    AND [COST_FinYearProjects].[ProjectID] = [COST_ProjectGroupProjects4].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_ProjectGroupProjects] AS [COST_ProjectGroupProjects5]'
  SET @LGSQL = @LGSQL + '    ON [COST_FinYearProjects].[CombinedGroupID] = [COST_ProjectGroupProjects5].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '    AND [COST_FinYearProjects].[ProjectID] = [COST_ProjectGroupProjects5].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups6]'
  SET @LGSQL = @LGSQL + '    ON [COST_FinYearProjects].[CombinedGroupID] = [COST_ProjectGroups6].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups7]'
  SET @LGSQL = @LGSQL + '    ON [COST_FinYearProjects].[IndividualGroupID] = [COST_ProjectGroups7].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_FinYear > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_FinYearProjects].[FinYear] = ' + STR(@Filter_FinYear)
  IF (@Filter_Quarter > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_FinYearProjects].[Quarter] = ' + STR(@Filter_Quarter)
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [COST_FinYearProjects].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FinYear' THEN '[COST_FinYearProjects].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[COST_FinYearProjects].[FinYear] DESC'
                        WHEN 'Quarter' THEN '[COST_FinYearProjects].[Quarter]'
                        WHEN 'Quarter DESC' THEN '[COST_FinYearProjects].[Quarter] DESC'
                        WHEN 'ProjectID' THEN '[COST_FinYearProjects].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[COST_FinYearProjects].[ProjectID] DESC'
                        WHEN 'Descpription' THEN '[COST_FinYearProjects].[Descpription]'
                        WHEN 'Descpription DESC' THEN '[COST_FinYearProjects].[Descpription] DESC'
                        WHEN 'IndividualGroup' THEN '[COST_FinYearProjects].[IndividualGroup]'
                        WHEN 'IndividualGroup DESC' THEN '[COST_FinYearProjects].[IndividualGroup] DESC'
                        WHEN 'CombinedGroup' THEN '[COST_FinYearProjects].[CombinedGroup]'
                        WHEN 'CombinedGroup DESC' THEN '[COST_FinYearProjects].[CombinedGroup] DESC'
                        WHEN 'IndividualGroupID' THEN '[COST_FinYearProjects].[IndividualGroupID]'
                        WHEN 'IndividualGroupID DESC' THEN '[COST_FinYearProjects].[IndividualGroupID] DESC'
                        WHEN 'CombinedGroupID' THEN '[COST_FinYearProjects].[CombinedGroupID]'
                        WHEN 'CombinedGroupID DESC' THEN '[COST_FinYearProjects].[CombinedGroupID] DESC'
                        WHEN 'Blocked' THEN '[COST_FinYearProjects].[Blocked]'
                        WHEN 'Blocked DESC' THEN '[COST_FinYearProjects].[Blocked] DESC'
                        WHEN 'BlockingRemarks' THEN '[COST_FinYearProjects].[BlockingRemarks]'
                        WHEN 'BlockingRemarks DESC' THEN '[COST_FinYearProjects].[BlockingRemarks] DESC'
                        WHEN 'EntryConfirmed' THEN '[COST_FinYearProjects].[EntryConfirmed]'
                        WHEN 'EntryConfirmed DESC' THEN '[COST_FinYearProjects].[EntryConfirmed] DESC'
                        WHEN 'COST_FinYear1_Descpription' THEN '[COST_FinYear1].[Descpription]'
                        WHEN 'COST_FinYear1_Descpription DESC' THEN '[COST_FinYear1].[Descpription] DESC'
                        WHEN 'COST_Quarters2_Description' THEN '[COST_Quarters2].[Description]'
                        WHEN 'COST_Quarters2_Description DESC' THEN '[COST_Quarters2].[Description] DESC'
                        WHEN 'IDM_Projects3_Description' THEN '[IDM_Projects3].[Description]'
                        WHEN 'IDM_Projects3_Description DESC' THEN '[IDM_Projects3].[Description] DESC'
                        WHEN 'COST_ProjectGroupProjects4_ProjectID' THEN '[COST_ProjectGroupProjects4].[ProjectID]'
                        WHEN 'COST_ProjectGroupProjects4_ProjectID DESC' THEN '[COST_ProjectGroupProjects4].[ProjectID] DESC'
                        WHEN 'COST_ProjectGroupProjects5_ProjectID' THEN '[COST_ProjectGroupProjects5].[ProjectID]'
                        WHEN 'COST_ProjectGroupProjects5_ProjectID DESC' THEN '[COST_ProjectGroupProjects5].[ProjectID] DESC'
                        WHEN 'COST_ProjectGroups6_ProjectGroupDescription' THEN '[COST_ProjectGroups6].[ProjectGroupDescription]'
                        WHEN 'COST_ProjectGroups6_ProjectGroupDescription DESC' THEN '[COST_ProjectGroups6].[ProjectGroupDescription] DESC'
                        WHEN 'COST_ProjectGroups7_ProjectGroupDescription' THEN '[COST_ProjectGroups7].[ProjectGroupDescription]'
                        WHEN 'COST_ProjectGroups7_ProjectGroupDescription DESC' THEN '[COST_ProjectGroups7].[ProjectGroupDescription] DESC'
                        ELSE '[COST_FinYearProjects].[FinYear],[COST_FinYearProjects].[Quarter],[COST_FinYearProjects].[ProjectID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_FinYearProjects].* ,
    [COST_FinYear1].[Descpription] AS COST_FinYear1_Descpription,
    [COST_Quarters2].[Description] AS COST_Quarters2_Description,
    [IDM_Projects3].[Description] AS IDM_Projects3_Description,
    [COST_ProjectGroupProjects4].[ProjectID] AS COST_ProjectGroupProjects4_ProjectID,
    [COST_ProjectGroupProjects5].[ProjectID] AS COST_ProjectGroupProjects5_ProjectID,
    [COST_ProjectGroups6].[ProjectGroupDescription] AS COST_ProjectGroups6_ProjectGroupDescription,
    [COST_ProjectGroups7].[ProjectGroupDescription] AS COST_ProjectGroups7_ProjectGroupDescription 
  FROM [COST_FinYearProjects] 
      INNER JOIN #PageIndex
          ON [COST_FinYearProjects].[FinYear] = #PageIndex.FinYear
          AND [COST_FinYearProjects].[Quarter] = #PageIndex.Quarter
          AND [COST_FinYearProjects].[ProjectID] = #PageIndex.ProjectID
  INNER JOIN [COST_FinYear] AS [COST_FinYear1]
    ON [COST_FinYearProjects].[FinYear] = [COST_FinYear1].[FinYear]
  INNER JOIN [COST_Quarters] AS [COST_Quarters2]
    ON [COST_FinYearProjects].[Quarter] = [COST_Quarters2].[Quarter]
  INNER JOIN [IDM_Projects] AS [IDM_Projects3]
    ON [COST_FinYearProjects].[ProjectID] = [IDM_Projects3].[ProjectID]
  LEFT OUTER JOIN [COST_ProjectGroupProjects] AS [COST_ProjectGroupProjects4]
    ON [COST_FinYearProjects].[IndividualGroupID] = [COST_ProjectGroupProjects4].[ProjectGroupID]
    AND [COST_FinYearProjects].[ProjectID] = [COST_ProjectGroupProjects4].[ProjectID]
  LEFT OUTER JOIN [COST_ProjectGroupProjects] AS [COST_ProjectGroupProjects5]
    ON [COST_FinYearProjects].[CombinedGroupID] = [COST_ProjectGroupProjects5].[ProjectGroupID]
    AND [COST_FinYearProjects].[ProjectID] = [COST_ProjectGroupProjects5].[ProjectID]
  LEFT OUTER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups6]
    ON [COST_FinYearProjects].[CombinedGroupID] = [COST_ProjectGroups6].[ProjectGroupID]
  LEFT OUTER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups7]
    ON [COST_FinYearProjects].[IndividualGroupID] = [COST_ProjectGroups7].[ProjectGroupID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
