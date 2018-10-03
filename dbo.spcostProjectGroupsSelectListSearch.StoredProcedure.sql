USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectGroupsSelectListSearch]
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
  )
  INSERT INTO #PageIndex (ProjectGroupID)
  SELECT [COST_ProjectGroups].[ProjectGroupID] FROM [COST_ProjectGroups]
  LEFT OUTER JOIN [COST_ProjectTypes] AS [COST_ProjectTypes1]
    ON [COST_ProjectGroups].[ProjectTypeID] = [COST_ProjectTypes1].[ProjectTypeID]
 WHERE  
   ( 
         STR(ISNULL([COST_ProjectGroups].[ProjectGroupID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_ProjectGroups].[ProjectGroupDescription],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_ProjectGroups].[ProjectTypeID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectGroupID' THEN [COST_ProjectGroups].[ProjectGroupID] END,
     CASE @OrderBy WHEN 'ProjectGroupID DESC' THEN [COST_ProjectGroups].[ProjectGroupID] END DESC,
     CASE @OrderBy WHEN 'ProjectGroupDescription' THEN [COST_ProjectGroups].[ProjectGroupDescription] END,
     CASE @OrderBy WHEN 'ProjectGroupDescription DESC' THEN [COST_ProjectGroups].[ProjectGroupDescription] END DESC,
     CASE @OrderBy WHEN 'ProjectTypeID' THEN [COST_ProjectGroups].[ProjectTypeID] END,
     CASE @OrderBy WHEN 'ProjectTypeID DESC' THEN [COST_ProjectGroups].[ProjectTypeID] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectTypes1_ProjectTypeDescription' THEN [COST_ProjectTypes1].[ProjectTypeDescription] END,
     CASE @OrderBy WHEN 'COST_ProjectTypes1_ProjectTypeDescription DESC' THEN [COST_ProjectTypes1].[ProjectTypeDescription] END DESC 

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
