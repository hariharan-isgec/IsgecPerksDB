USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPParentTasksSelectListSearch]
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
 ,TaskID Int NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID, TaskID)
  SELECT [TOSv_Parent].[ProjectID], [TOSv_Parent].[TaskID] FROM [TOSv_Parent]
 WHERE  
   ( 
         LOWER(ISNULL([TOSv_Parent].[ProjectID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOSv_Parent].[TaskID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOSv_Parent].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOSv_Parent].[ParentTaskID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [TOSv_Parent].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TOSv_Parent].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'TaskID' THEN [TOSv_Parent].[TaskID] END,
     CASE @OrderBy WHEN 'TaskID DESC' THEN [TOSv_Parent].[TaskID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TOSv_Parent].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TOSv_Parent].[Description] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TOSv_Parent].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TOSv_Parent].[Active] END DESC,
     CASE @OrderBy WHEN 'ParentTaskID' THEN [TOSv_Parent].[ParentTaskID] END,
     CASE @OrderBy WHEN 'ParentTaskID DESC' THEN [TOSv_Parent].[ParentTaskID] END DESC,
     CASE @OrderBy WHEN 'IsParent' THEN [TOSv_Parent].[IsParent] END,
     CASE @OrderBy WHEN 'IsParent DESC' THEN [TOSv_Parent].[IsParent] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TOSv_Parent].[ProjectID] ,
		[TOSv_Parent].[TaskID] ,
		[TOSv_Parent].[Description] ,
		[TOSv_Parent].[Active] ,
		[TOSv_Parent].[ParentTaskID] ,
		[TOSv_Parent].[IsParent]  
  FROM [TOSv_Parent] 
    	INNER JOIN #PageIndex
          ON [TOSv_Parent].[ProjectID] = #PageIndex.ProjectID
          AND [TOSv_Parent].[TaskID] = #PageIndex.TaskID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
