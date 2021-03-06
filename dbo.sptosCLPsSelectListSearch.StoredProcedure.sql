USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPsSelectListSearch]
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
 ,CLPID Int NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID, CLPID)
  SELECT [TOS_CLPs].[ProjectID], [TOS_CLPs].[CLPID] FROM [TOS_CLPs]
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
   ( 
         LOWER(ISNULL([TOS_CLPs].[ProjectID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[CLPID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPs].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[Sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPs].[DisplayType],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[engTaskID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[ordTaskID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[desTaskID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [TOS_CLPs].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TOS_CLPs].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'CLPID' THEN [TOS_CLPs].[CLPID] END,
     CASE @OrderBy WHEN 'CLPID DESC' THEN [TOS_CLPs].[CLPID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TOS_CLPs].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TOS_CLPs].[Description] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [TOS_CLPs].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [TOS_CLPs].[Sequence] END DESC,
     CASE @OrderBy WHEN 'DisplayType' THEN [TOS_CLPs].[DisplayType] END,
     CASE @OrderBy WHEN 'DisplayType DESC' THEN [TOS_CLPs].[DisplayType] END DESC,
     CASE @OrderBy WHEN 'engTaskID' THEN [TOS_CLPs].[engTaskID] END,
     CASE @OrderBy WHEN 'engTaskID DESC' THEN [TOS_CLPs].[engTaskID] END DESC,
     CASE @OrderBy WHEN 'ordTaskID' THEN [TOS_CLPs].[ordTaskID] END,
     CASE @OrderBy WHEN 'ordTaskID DESC' THEN [TOS_CLPs].[ordTaskID] END DESC,
     CASE @OrderBy WHEN 'desTaskID' THEN [TOS_CLPs].[desTaskID] END,
     CASE @OrderBy WHEN 'desTaskID DESC' THEN [TOS_CLPs].[desTaskID] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects1_Description' THEN [IDM_Projects1].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects1_Description DESC' THEN [IDM_Projects1].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks2_Description' THEN [TOS_Tasks2].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks2_Description DESC' THEN [TOS_Tasks2].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks3_Description' THEN [TOS_Tasks3].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks3_Description DESC' THEN [TOS_Tasks3].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks4_Description' THEN [TOS_Tasks4].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks4_Description DESC' THEN [TOS_Tasks4].[Description] END DESC 

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
