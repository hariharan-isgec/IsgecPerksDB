USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosParentSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TOSv_Parent].[TaskID] ,
		[TOSv_Parent].[Description] ,
		[TOSv_Parent].[ProjectID] ,
		[TOSv_Parent].[ElementID] ,
		[TOSv_Parent].[FunctionalAreaID] ,
		[TOSv_Parent].[TaskTypeID] ,
		[TOSv_Parent].[Active] ,
		[TOSv_Parent].[AssignedTo]  
  FROM [TOSv_Parent] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'TaskID' THEN [TOSv_Parent].[TaskID] END,
     CASE @OrderBy WHEN 'TaskID DESC' THEN [TOSv_Parent].[TaskID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TOSv_Parent].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TOSv_Parent].[Description] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [TOSv_Parent].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TOSv_Parent].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'ElementID' THEN [TOSv_Parent].[ElementID] END,
     CASE @OrderBy WHEN 'ElementID DESC' THEN [TOSv_Parent].[ElementID] END DESC,
     CASE @OrderBy WHEN 'FunctionalAreaID' THEN [TOSv_Parent].[FunctionalAreaID] END,
     CASE @OrderBy WHEN 'FunctionalAreaID DESC' THEN [TOSv_Parent].[FunctionalAreaID] END DESC,
     CASE @OrderBy WHEN 'TaskTypeID' THEN [TOSv_Parent].[TaskTypeID] END,
     CASE @OrderBy WHEN 'TaskTypeID DESC' THEN [TOSv_Parent].[TaskTypeID] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TOSv_Parent].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TOSv_Parent].[Active] END DESC,
     CASE @OrderBy WHEN 'AssignedTo' THEN [TOSv_Parent].[AssignedTo] END,
     CASE @OrderBy WHEN 'AssignedTo DESC' THEN [TOSv_Parent].[AssignedTo] END DESC 
  SET @RecordCount = @@RowCount
GO
