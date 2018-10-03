USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmEMailGroupsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_EMailGroups].[EMailGroup],
		[HRM_EMailGroups].[Description] 
  FROM [HRM_EMailGroups] 
  ORDER BY
     CASE @orderBy WHEN 'EMailGroup' THEN [HRM_EMailGroups].[EMailGroup] END,
     CASE @orderBy WHEN 'EMailGroup DESC' THEN [HRM_EMailGroups].[EMailGroup] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_EMailGroups].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_EMailGroups].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
