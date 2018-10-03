USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPParentTasksSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TOSv_Parent].[ProjectID] ,
		[TOSv_Parent].[TaskID] ,
		[TOSv_Parent].[Description] ,
		[TOSv_Parent].[Active] ,
		[TOSv_Parent].[ParentTaskID] ,
		[TOSv_Parent].[IsParent]  
  FROM [TOSv_Parent] 
  WHERE 1 = 1  
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
GO
