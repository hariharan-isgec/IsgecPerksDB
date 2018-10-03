USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowColsSelectByID]
  @LoginID NVarChar(8),
  @DashboardID Int,
  @DBRows Int,
  @DBCols Int 
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
  WHERE
  [WF_DBRowCols].[DashboardID] = @DashboardID
  AND [WF_DBRowCols].[DBRows] = @DBRows
  AND [WF_DBRowCols].[DBCols] = @DBCols
GO
