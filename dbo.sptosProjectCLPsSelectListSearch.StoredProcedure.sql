USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosProjectCLPsSelectListSearch]
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
 ,CLPID Int NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID, CLPID)
  SELECT [TOS_CLPs].[ProjectID], [TOS_CLPs].[CLPID] FROM [TOS_CLPs]
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
   ( 
         LOWER(ISNULL([TOS_CLPs].[ProjectID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[CLPID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPs].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPs].[Quantity],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[Sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPs].[DisplayType],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[engTaskID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[ordTaskID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[desTaskID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[ereTaskID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[ioTaskID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[recTaskID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[ad1TaskID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[ad2TaskID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[ad3TaskID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPs].[ad4TaskID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [TOS_CLPs].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TOS_CLPs].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'CLPID' THEN [TOS_CLPs].[CLPID] END,
     CASE @OrderBy WHEN 'CLPID DESC' THEN [TOS_CLPs].[CLPID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TOS_CLPs].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TOS_CLPs].[Description] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [TOS_CLPs].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [TOS_CLPs].[Quantity] END DESC,
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
     CASE @OrderBy WHEN 'ereTaskID' THEN [TOS_CLPs].[ereTaskID] END,
     CASE @OrderBy WHEN 'ereTaskID DESC' THEN [TOS_CLPs].[ereTaskID] END DESC,
     CASE @OrderBy WHEN 'ioTaskID' THEN [TOS_CLPs].[ioTaskID] END,
     CASE @OrderBy WHEN 'ioTaskID DESC' THEN [TOS_CLPs].[ioTaskID] END DESC,
     CASE @OrderBy WHEN 'recTaskID' THEN [TOS_CLPs].[recTaskID] END,
     CASE @OrderBy WHEN 'recTaskID DESC' THEN [TOS_CLPs].[recTaskID] END DESC,
     CASE @OrderBy WHEN 'ad1TaskID' THEN [TOS_CLPs].[ad1TaskID] END,
     CASE @OrderBy WHEN 'ad1TaskID DESC' THEN [TOS_CLPs].[ad1TaskID] END DESC,
     CASE @OrderBy WHEN 'ad2TaskID' THEN [TOS_CLPs].[ad2TaskID] END,
     CASE @OrderBy WHEN 'ad2TaskID DESC' THEN [TOS_CLPs].[ad2TaskID] END DESC,
     CASE @OrderBy WHEN 'ad3TaskID' THEN [TOS_CLPs].[ad3TaskID] END,
     CASE @OrderBy WHEN 'ad3TaskID DESC' THEN [TOS_CLPs].[ad3TaskID] END DESC,
     CASE @OrderBy WHEN 'ad4TaskID' THEN [TOS_CLPs].[ad4TaskID] END,
     CASE @OrderBy WHEN 'ad4TaskID DESC' THEN [TOS_CLPs].[ad4TaskID] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TOS_CLPs].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TOS_CLPs].[Active] END DESC,
     CASE @OrderBy WHEN 'TOS_Projects1_Description' THEN [TOS_Projects1].[Description] END,
     CASE @OrderBy WHEN 'TOS_Projects1_Description DESC' THEN [TOS_Projects1].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks2_Description' THEN [TOS_Tasks2].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks2_Description DESC' THEN [TOS_Tasks2].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks3_Description' THEN [TOS_Tasks3].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks3_Description DESC' THEN [TOS_Tasks3].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks4_Description' THEN [TOS_Tasks4].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks4_Description DESC' THEN [TOS_Tasks4].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks5_Description' THEN [TOS_Tasks5].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks5_Description DESC' THEN [TOS_Tasks5].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks8_Description' THEN [TOS_Tasks8].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks8_Description DESC' THEN [TOS_Tasks8].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks9_Description' THEN [TOS_Tasks9].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks9_Description DESC' THEN [TOS_Tasks9].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks10_Description' THEN [TOS_Tasks10].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks10_Description DESC' THEN [TOS_Tasks10].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks11_Description' THEN [TOS_Tasks11].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks11_Description DESC' THEN [TOS_Tasks11].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks6_Description' THEN [TOS_Tasks6].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks6_Description DESC' THEN [TOS_Tasks6].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks7_Description' THEN [TOS_Tasks7].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks7_Description DESC' THEN [TOS_Tasks7].[Description] END DESC 

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
