USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowColsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [WF_DBRowCols].* ,
    [WF_Dashboards1].[DBDescription] AS WF_Dashboards1_DBDescription,
    [WF_DBRows2].[Description] AS WF_DBRows2_Description 
  FROM [WF_DBRowCols] 
  LEFT OUTER JOIN [WF_Dashboards] AS [WF_Dashboards1]
    ON [WF_DBRowCols].[DashboardID] = [WF_Dashboards1].[DashboardID]
  LEFT OUTER JOIN [WF_DBRows] AS [WF_DBRows2]
    ON [WF_DBRowCols].[DashboardID] = [WF_DBRows2].[DashboardID]
    AND [WF_DBRowCols].[DBRows] = [WF_DBRows2].[DBRows]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'DashboardID' THEN [WF_DBRowCols].[DashboardID] END,
     CASE @OrderBy WHEN 'DashboardID DESC' THEN [WF_DBRowCols].[DashboardID] END DESC,
     CASE @OrderBy WHEN 'DBRows' THEN [WF_DBRowCols].[DBRows] END,
     CASE @OrderBy WHEN 'DBRows DESC' THEN [WF_DBRowCols].[DBRows] END DESC,
     CASE @OrderBy WHEN 'DBCols' THEN [WF_DBRowCols].[DBCols] END,
     CASE @OrderBy WHEN 'DBCols DESC' THEN [WF_DBRowCols].[DBCols] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [WF_DBRowCols].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [WF_DBRowCols].[Description] END DESC,
     CASE @OrderBy WHEN 'DBFieldName' THEN [WF_DBRowCols].[DBFieldName] END,
     CASE @OrderBy WHEN 'DBFieldName DESC' THEN [WF_DBRowCols].[DBFieldName] END DESC,
     CASE @OrderBy WHEN 'LinkURL' THEN [WF_DBRowCols].[LinkURL] END,
     CASE @OrderBy WHEN 'LinkURL DESC' THEN [WF_DBRowCols].[LinkURL] END DESC,
     CASE @OrderBy WHEN 'cssHeader' THEN [WF_DBRowCols].[cssHeader] END,
     CASE @OrderBy WHEN 'cssHeader DESC' THEN [WF_DBRowCols].[cssHeader] END DESC,
     CASE @OrderBy WHEN 'cssCell' THEN [WF_DBRowCols].[cssCell] END,
     CASE @OrderBy WHEN 'cssCell DESC' THEN [WF_DBRowCols].[cssCell] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [WF_DBRowCols].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [WF_DBRowCols].[Sequence] END DESC,
     CASE @OrderBy WHEN 'WF_Dashboards1_DBDescription' THEN [WF_Dashboards1].[DBDescription] END,
     CASE @OrderBy WHEN 'WF_Dashboards1_DBDescription DESC' THEN [WF_Dashboards1].[DBDescription] END DESC,
     CASE @OrderBy WHEN 'WF_DBRows2_Description' THEN [WF_DBRows2].[Description] END,
     CASE @OrderBy WHEN 'WF_DBRows2_Description DESC' THEN [WF_DBRows2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
