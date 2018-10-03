USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDashboardsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [WF_Dashboards].* ,
    [WF_DBRowTypes1].[Description] AS WF_DBRowTypes1_Description,
    [WF_GraphTypes2].[Description] AS WF_GraphTypes2_Description,
    [WF_DBIcons3].[IconName] AS WF_DBIcons3_IconName 
  FROM [WF_Dashboards] 
  LEFT OUTER JOIN [WF_DBRowTypes] AS [WF_DBRowTypes1]
    ON [WF_Dashboards].[DBRowTypeID] = [WF_DBRowTypes1].[RowTypeID]
  LEFT OUTER JOIN [WF_GraphTypes] AS [WF_GraphTypes2]
    ON [WF_Dashboards].[GraphTypeID] = [WF_GraphTypes2].[GraphTypeID]
  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons3]
    ON [WF_Dashboards].[DBIconID] = [WF_DBIcons3].[DBIconID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'DashboardID' THEN [WF_Dashboards].[DashboardID] END,
     CASE @OrderBy WHEN 'DashboardID DESC' THEN [WF_Dashboards].[DashboardID] END DESC,
     CASE @OrderBy WHEN 'DBDescription' THEN [WF_Dashboards].[DBDescription] END,
     CASE @OrderBy WHEN 'DBDescription DESC' THEN [WF_Dashboards].[DBDescription] END DESC,
     CASE @OrderBy WHEN 'DBTitle' THEN [WF_Dashboards].[DBTitle] END,
     CASE @OrderBy WHEN 'DBTitle DESC' THEN [WF_Dashboards].[DBTitle] END DESC,
     CASE @OrderBy WHEN 'TitleStyle' THEN [WF_Dashboards].[TitleStyle] END,
     CASE @OrderBy WHEN 'TitleStyle DESC' THEN [WF_Dashboards].[TitleStyle] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [WF_Dashboards].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [WF_Dashboards].[Active] END DESC,
     CASE @OrderBy WHEN 'InitializedByMe' THEN [WF_Dashboards].[InitializedByMe] END,
     CASE @OrderBy WHEN 'InitializedByMe DESC' THEN [WF_Dashboards].[InitializedByMe] END DESC,
     CASE @OrderBy WHEN 'DBIconID' THEN [WF_Dashboards].[DBIconID] END,
     CASE @OrderBy WHEN 'DBIconID DESC' THEN [WF_Dashboards].[DBIconID] END DESC,
     CASE @OrderBy WHEN 'NotToDraw' THEN [WF_Dashboards].[NotToDraw] END,
     CASE @OrderBy WHEN 'NotToDraw DESC' THEN [WF_Dashboards].[NotToDraw] END DESC,
     CASE @OrderBy WHEN 'DBRowTypeID' THEN [WF_Dashboards].[DBRowTypeID] END,
     CASE @OrderBy WHEN 'DBRowTypeID DESC' THEN [WF_Dashboards].[DBRowTypeID] END DESC,
     CASE @OrderBy WHEN 'GraphTypeID' THEN [WF_Dashboards].[GraphTypeID] END,
     CASE @OrderBy WHEN 'GraphTypeID DESC' THEN [WF_Dashboards].[GraphTypeID] END DESC,
     CASE @OrderBy WHEN 'ConvertForGraph' THEN [WF_Dashboards].[ConvertForGraph] END,
     CASE @OrderBy WHEN 'ConvertForGraph DESC' THEN [WF_Dashboards].[ConvertForGraph] END DESC,
     CASE @OrderBy WHEN 'WF_DBRowTypes1_Description' THEN [WF_DBRowTypes1].[Description] END,
     CASE @OrderBy WHEN 'WF_DBRowTypes1_Description DESC' THEN [WF_DBRowTypes1].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_GraphTypes2_Description' THEN [WF_GraphTypes2].[Description] END,
     CASE @OrderBy WHEN 'WF_GraphTypes2_Description DESC' THEN [WF_GraphTypes2].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBIcons3_IconName' THEN [WF_DBIcons3].[IconName] END,
     CASE @OrderBy WHEN 'WF_DBIcons3_IconName DESC' THEN [WF_DBIcons3].[IconName] END DESC 
  SET @RecordCount = @@RowCount
GO
