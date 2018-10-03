USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectorGroupsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QCM_InspectorGroups].[GroupID] ,
		[QCM_InspectorGroups].[Description]  
  FROM [QCM_InspectorGroups] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'GroupID' THEN [QCM_InspectorGroups].[GroupID] END,
     CASE @OrderBy WHEN 'GroupID DESC' THEN [QCM_InspectorGroups].[GroupID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [QCM_InspectorGroups].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [QCM_InspectorGroups].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
