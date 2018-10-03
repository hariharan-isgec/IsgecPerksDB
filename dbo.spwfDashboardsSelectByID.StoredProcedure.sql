USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDashboardsSelectByID]
  @LoginID NVarChar(8),
  @DashboardID Int 
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
  WHERE
  [WF_Dashboards].[DashboardID] = @DashboardID
GO
