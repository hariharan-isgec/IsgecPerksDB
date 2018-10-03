USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwf_LG_DBRowsSelectListRoot]
  @Filter_DashboardID Int,
  @LoginID NVarChar(8),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN

  SELECT
    [WF_DBRows].* ,
    [WF_Dashboards1].[DBDescription] AS WF_Dashboards1_DBDescription,
    [WF_DBRows2].[Description] AS WF_DBRows2_Description,
    [WF_DBRowTypes3].[Description] AS WF_DBRowTypes3_Description,
    [WF_GraphTypes4].[Description] AS WF_GraphTypes4_Description,
    [WF_DetailViewTypes5].[DVTypeDescription] AS WF_DetailViewTypes5_DVTypeDescription 
  FROM [WF_DBRows] 
  INNER JOIN [WF_Dashboards] AS [WF_Dashboards1]
    ON [WF_DBRows].[DashboardID] = [WF_Dashboards1].[DashboardID]
  LEFT OUTER JOIN [WF_DBRows] AS [WF_DBRows2]
    ON [WF_DBRows].[DashboardID] = [WF_DBRows2].[DashboardID]
    AND [WF_DBRows].[ParentDBRows] = [WF_DBRows2].[DBRows]
  LEFT OUTER JOIN [WF_DBRowTypes] AS [WF_DBRowTypes3]
    ON [WF_DBRows].[DBRowTypeID] = [WF_DBRowTypes3].[RowTypeID]
  LEFT OUTER JOIN [WF_GraphTypes] AS [WF_GraphTypes4]
    ON [WF_DBRows].[GraphTypeID] = [WF_GraphTypes4].[GraphTypeID]
  LEFT OUTER JOIN [WF_DetailViewTypes] AS [WF_DetailViewTypes5]
    ON [WF_DBRows].[DVTypeID] = [WF_DetailViewTypes5].[DVTypeID]
  WHERE
        [WF_DBRows].[DashboardID] = @Filter_DashboardID
        AND [WF_DBRows].[ParentDBRows] IS NULL
  ORDER BY
    [WF_DBRows].[Sequence]

  SET @RecordCount = @@RowCount

  END
GO
