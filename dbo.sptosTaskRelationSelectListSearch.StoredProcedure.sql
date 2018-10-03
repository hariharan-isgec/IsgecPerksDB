USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTaskRelationSelectListSearch]
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
 ,TaskID Int NOT NULL
 ,ChildID Int NOT NULL
  )
  INSERT INTO #PageIndex (TaskID, ChildID)
  SELECT [TOS_TaskRelation].[TaskID], [TOS_TaskRelation].[ChildID] FROM [TOS_TaskRelation]
  INNER JOIN [TOS_Tasks] AS [TOS_Tasks1]
    ON [TOS_TaskRelation].[TaskID] = [TOS_Tasks1].[TaskID]
  INNER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_TaskRelation].[ChildID] = [TOS_Tasks2].[TaskID]
 WHERE  
   ( 
         STR(ISNULL([TOS_TaskRelation].[TaskID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_TaskRelation].[ChildID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_TaskRelation].[Sequence], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'TaskID' THEN [TOS_TaskRelation].[TaskID] END,
     CASE @OrderBy WHEN 'TaskID DESC' THEN [TOS_TaskRelation].[TaskID] END DESC,
     CASE @OrderBy WHEN 'ChildID' THEN [TOS_TaskRelation].[ChildID] END,
     CASE @OrderBy WHEN 'ChildID DESC' THEN [TOS_TaskRelation].[ChildID] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [TOS_TaskRelation].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [TOS_TaskRelation].[Sequence] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TOS_TaskRelation].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TOS_TaskRelation].[Active] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks1_Description' THEN [TOS_Tasks1].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks1_Description DESC' THEN [TOS_Tasks1].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks2_Description' THEN [TOS_Tasks2].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks2_Description DESC' THEN [TOS_Tasks2].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TOS_TaskRelation].[TaskID] ,
		[TOS_TaskRelation].[ChildID] ,
		[TOS_TaskRelation].[Sequence] ,
		[TOS_TaskRelation].[Active] ,
		[TOS_Tasks1].[Description] AS TOS_Tasks1_Description,
		[TOS_Tasks2].[Description] AS TOS_Tasks2_Description 
  FROM [TOS_TaskRelation] 
    	INNER JOIN #PageIndex
          ON [TOS_TaskRelation].[TaskID] = #PageIndex.TaskID
          AND [TOS_TaskRelation].[ChildID] = #PageIndex.ChildID
  INNER JOIN [TOS_Tasks] AS [TOS_Tasks1]
    ON [TOS_TaskRelation].[TaskID] = [TOS_Tasks1].[TaskID]
  INNER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_TaskRelation].[ChildID] = [TOS_Tasks2].[TaskID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
