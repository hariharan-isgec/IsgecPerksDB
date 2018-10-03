USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectGroupProjectsSelectListSearch]
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
 ,ProjectGroupID Int NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (ProjectGroupID, ProjectID)
  SELECT [COST_ProjectGroupProjects].[ProjectGroupID], [COST_ProjectGroupProjects].[ProjectID] FROM [COST_ProjectGroupProjects]
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups1]
    ON [COST_ProjectGroupProjects].[ProjectGroupID] = [COST_ProjectGroups1].[ProjectGroupID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [COST_ProjectGroupProjects].[ProjectID] = [IDM_Projects2].[ProjectID]
 WHERE  
   ( 
         STR(ISNULL([COST_ProjectGroupProjects].[ProjectGroupID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_ProjectGroupProjects].[ProjectID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectGroupID' THEN [COST_ProjectGroupProjects].[ProjectGroupID] END,
     CASE @OrderBy WHEN 'ProjectGroupID DESC' THEN [COST_ProjectGroupProjects].[ProjectGroupID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [COST_ProjectGroupProjects].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [COST_ProjectGroupProjects].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectGroups1_ProjectGroupDescription' THEN [COST_ProjectGroups1].[ProjectGroupDescription] END,
     CASE @OrderBy WHEN 'COST_ProjectGroups1_ProjectGroupDescription DESC' THEN [COST_ProjectGroups1].[ProjectGroupDescription] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC 

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
