USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfUserDBSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [WF_Dashboards].*  
  FROM [WF_Dashboards] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'DashboardID' THEN [WF_Dashboards].[DashboardID] END,
     CASE @OrderBy WHEN 'DashboardID DESC' THEN [WF_Dashboards].[DashboardID] END DESC,
     CASE @OrderBy WHEN 'DBDescription' THEN [WF_Dashboards].[DBDescription] END,
     CASE @OrderBy WHEN 'DBDescription DESC' THEN [WF_Dashboards].[DBDescription] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [WF_Dashboards].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [WF_Dashboards].[Active] END DESC 
  SET @RecordCount = @@RowCount
GO
