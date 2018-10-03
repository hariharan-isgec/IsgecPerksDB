USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostFinYearProjectsSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FinYear Int NOT NULL
 ,Quarter Int NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (FinYear, Quarter, ProjectID)
  SELECT [COST_FinYearProjects].[FinYear], [COST_FinYearProjects].[Quarter], [COST_FinYearProjects].[ProjectID] FROM [COST_FinYearProjects]
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
   ( 
         STR(ISNULL([COST_FinYearProjects].[FinYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_FinYearProjects].[Quarter], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_FinYearProjects].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_FinYearProjects].[Descpription],'')) LIKE @KeyWord1
     OR STR(ISNULL([COST_FinYearProjects].[IndividualGroupID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_FinYearProjects].[CombinedGroupID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_FinYearProjects].[BlockingRemarks],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'FinYear' THEN [COST_FinYearProjects].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [COST_FinYearProjects].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Quarter' THEN [COST_FinYearProjects].[Quarter] END,
     CASE @OrderBy WHEN 'Quarter DESC' THEN [COST_FinYearProjects].[Quarter] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [COST_FinYearProjects].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [COST_FinYearProjects].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'Descpription' THEN [COST_FinYearProjects].[Descpription] END,
     CASE @OrderBy WHEN 'Descpription DESC' THEN [COST_FinYearProjects].[Descpription] END DESC,
     CASE @OrderBy WHEN 'IndividualGroup' THEN [COST_FinYearProjects].[IndividualGroup] END,
     CASE @OrderBy WHEN 'IndividualGroup DESC' THEN [COST_FinYearProjects].[IndividualGroup] END DESC,
     CASE @OrderBy WHEN 'CombinedGroup' THEN [COST_FinYearProjects].[CombinedGroup] END,
     CASE @OrderBy WHEN 'CombinedGroup DESC' THEN [COST_FinYearProjects].[CombinedGroup] END DESC,
     CASE @OrderBy WHEN 'IndividualGroupID' THEN [COST_FinYearProjects].[IndividualGroupID] END,
     CASE @OrderBy WHEN 'IndividualGroupID DESC' THEN [COST_FinYearProjects].[IndividualGroupID] END DESC,
     CASE @OrderBy WHEN 'CombinedGroupID' THEN [COST_FinYearProjects].[CombinedGroupID] END,
     CASE @OrderBy WHEN 'CombinedGroupID DESC' THEN [COST_FinYearProjects].[CombinedGroupID] END DESC,
     CASE @OrderBy WHEN 'Blocked' THEN [COST_FinYearProjects].[Blocked] END,
     CASE @OrderBy WHEN 'Blocked DESC' THEN [COST_FinYearProjects].[Blocked] END DESC,
     CASE @OrderBy WHEN 'BlockingRemarks' THEN [COST_FinYearProjects].[BlockingRemarks] END,
     CASE @OrderBy WHEN 'BlockingRemarks DESC' THEN [COST_FinYearProjects].[BlockingRemarks] END DESC,
     CASE @OrderBy WHEN 'EntryConfirmed' THEN [COST_FinYearProjects].[EntryConfirmed] END,
     CASE @OrderBy WHEN 'EntryConfirmed DESC' THEN [COST_FinYearProjects].[EntryConfirmed] END DESC,
     CASE @OrderBy WHEN 'COST_FinYear1_Descpription' THEN [COST_FinYear1].[Descpription] END,
     CASE @OrderBy WHEN 'COST_FinYear1_Descpription DESC' THEN [COST_FinYear1].[Descpription] END DESC,
     CASE @OrderBy WHEN 'COST_Quarters2_Description' THEN [COST_Quarters2].[Description] END,
     CASE @OrderBy WHEN 'COST_Quarters2_Description DESC' THEN [COST_Quarters2].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects3_Description' THEN [IDM_Projects3].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects3_Description DESC' THEN [IDM_Projects3].[Description] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectGroupProjects4_ProjectID' THEN [COST_ProjectGroupProjects4].[ProjectID] END,
     CASE @OrderBy WHEN 'COST_ProjectGroupProjects4_ProjectID DESC' THEN [COST_ProjectGroupProjects4].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectGroupProjects5_ProjectID' THEN [COST_ProjectGroupProjects5].[ProjectID] END,
     CASE @OrderBy WHEN 'COST_ProjectGroupProjects5_ProjectID DESC' THEN [COST_ProjectGroupProjects5].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectGroups6_ProjectGroupDescription' THEN [COST_ProjectGroups6].[ProjectGroupDescription] END,
     CASE @OrderBy WHEN 'COST_ProjectGroups6_ProjectGroupDescription DESC' THEN [COST_ProjectGroups6].[ProjectGroupDescription] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectGroups7_ProjectGroupDescription' THEN [COST_ProjectGroups7].[ProjectGroupDescription] END,
     CASE @OrderBy WHEN 'COST_ProjectGroups7_ProjectGroupDescription DESC' THEN [COST_ProjectGroups7].[ProjectGroupDescription] END DESC 

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
