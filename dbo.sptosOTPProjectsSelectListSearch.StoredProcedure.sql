USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPProjectsSelectListSearch]
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
 ,ProjectID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID)
  SELECT [TOS_Projects].[ProjectID] FROM [TOS_Projects]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [TOS_Projects].[ProjectID] = [IDM_Projects1].[ProjectID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_Projects].[ProjectID] = [TOS_Tasks2].[ProjectID]
    AND [TOS_Projects].[RootTaskID] = [TOS_Tasks2].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks1]
    ON [TOS_Projects].[ProjectID] = [TOS_Tasks1].[ProjectID]
    AND [TOS_Projects].[RootTaskID] = [TOS_Tasks1].[TaskID]
 WHERE  
   ( 
         LOWER(ISNULL([TOS_Projects].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_Projects].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_Projects].[RootTaskID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_Projects].[engTitle],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_Projects].[ordTitle],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_Projects].[desTitle],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_Projects].[ereTitle],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_Projects].[ioTitle],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_Projects].[recTitle],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_Projects].[ad1Title],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_Projects].[ad2Title],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_Projects].[ad3Title],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_Projects].[ad4Title],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [TOS_Projects].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TOS_Projects].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TOS_Projects].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TOS_Projects].[Description] END DESC,
     CASE @OrderBy WHEN 'RootTaskID' THEN [TOS_Projects].[RootTaskID] END,
     CASE @OrderBy WHEN 'RootTaskID DESC' THEN [TOS_Projects].[RootTaskID] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TOS_Projects].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TOS_Projects].[Active] END DESC,
     CASE @OrderBy WHEN 'engEnabled' THEN [TOS_Projects].[engEnabled] END,
     CASE @OrderBy WHEN 'engEnabled DESC' THEN [TOS_Projects].[engEnabled] END DESC,
     CASE @OrderBy WHEN 'engTitle' THEN [TOS_Projects].[engTitle] END,
     CASE @OrderBy WHEN 'engTitle DESC' THEN [TOS_Projects].[engTitle] END DESC,
     CASE @OrderBy WHEN 'ordEnabled' THEN [TOS_Projects].[ordEnabled] END,
     CASE @OrderBy WHEN 'ordEnabled DESC' THEN [TOS_Projects].[ordEnabled] END DESC,
     CASE @OrderBy WHEN 'ordTitle' THEN [TOS_Projects].[ordTitle] END,
     CASE @OrderBy WHEN 'ordTitle DESC' THEN [TOS_Projects].[ordTitle] END DESC,
     CASE @OrderBy WHEN 'desEnabled' THEN [TOS_Projects].[desEnabled] END,
     CASE @OrderBy WHEN 'desEnabled DESC' THEN [TOS_Projects].[desEnabled] END DESC,
     CASE @OrderBy WHEN 'desTitle' THEN [TOS_Projects].[desTitle] END,
     CASE @OrderBy WHEN 'desTitle DESC' THEN [TOS_Projects].[desTitle] END DESC,
     CASE @OrderBy WHEN 'ereEnabled' THEN [TOS_Projects].[ereEnabled] END,
     CASE @OrderBy WHEN 'ereEnabled DESC' THEN [TOS_Projects].[ereEnabled] END DESC,
     CASE @OrderBy WHEN 'ereTitle' THEN [TOS_Projects].[ereTitle] END,
     CASE @OrderBy WHEN 'ereTitle DESC' THEN [TOS_Projects].[ereTitle] END DESC,
     CASE @OrderBy WHEN 'ioEnabled' THEN [TOS_Projects].[ioEnabled] END,
     CASE @OrderBy WHEN 'ioEnabled DESC' THEN [TOS_Projects].[ioEnabled] END DESC,
     CASE @OrderBy WHEN 'ioTitle' THEN [TOS_Projects].[ioTitle] END,
     CASE @OrderBy WHEN 'ioTitle DESC' THEN [TOS_Projects].[ioTitle] END DESC,
     CASE @OrderBy WHEN 'recEnabled' THEN [TOS_Projects].[recEnabled] END,
     CASE @OrderBy WHEN 'recEnabled DESC' THEN [TOS_Projects].[recEnabled] END DESC,
     CASE @OrderBy WHEN 'recTitle' THEN [TOS_Projects].[recTitle] END,
     CASE @OrderBy WHEN 'recTitle DESC' THEN [TOS_Projects].[recTitle] END DESC,
     CASE @OrderBy WHEN 'ad1Enabled' THEN [TOS_Projects].[ad1Enabled] END,
     CASE @OrderBy WHEN 'ad1Enabled DESC' THEN [TOS_Projects].[ad1Enabled] END DESC,
     CASE @OrderBy WHEN 'ad1Title' THEN [TOS_Projects].[ad1Title] END,
     CASE @OrderBy WHEN 'ad1Title DESC' THEN [TOS_Projects].[ad1Title] END DESC,
     CASE @OrderBy WHEN 'ad2Enabled' THEN [TOS_Projects].[ad2Enabled] END,
     CASE @OrderBy WHEN 'ad2Enabled DESC' THEN [TOS_Projects].[ad2Enabled] END DESC,
     CASE @OrderBy WHEN 'ad2Title' THEN [TOS_Projects].[ad2Title] END,
     CASE @OrderBy WHEN 'ad2Title DESC' THEN [TOS_Projects].[ad2Title] END DESC,
     CASE @OrderBy WHEN 'ad3Enabled' THEN [TOS_Projects].[ad3Enabled] END,
     CASE @OrderBy WHEN 'ad3Enabled DESC' THEN [TOS_Projects].[ad3Enabled] END DESC,
     CASE @OrderBy WHEN 'ad3Title' THEN [TOS_Projects].[ad3Title] END,
     CASE @OrderBy WHEN 'ad3Title DESC' THEN [TOS_Projects].[ad3Title] END DESC,
     CASE @OrderBy WHEN 'ad4Enabled' THEN [TOS_Projects].[ad4Enabled] END,
     CASE @OrderBy WHEN 'ad4Enabled DESC' THEN [TOS_Projects].[ad4Enabled] END DESC,
     CASE @OrderBy WHEN 'ad4Title' THEN [TOS_Projects].[ad4Title] END,
     CASE @OrderBy WHEN 'ad4Title DESC' THEN [TOS_Projects].[ad4Title] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects1_Description' THEN [IDM_Projects1].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects1_Description DESC' THEN [IDM_Projects1].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks2_Description' THEN [TOS_Tasks2].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks2_Description DESC' THEN [TOS_Tasks2].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks1_Description' THEN [TOS_Tasks1].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks1_Description DESC' THEN [TOS_Tasks1].[Description] END DESC 

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
