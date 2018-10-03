USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDashboardsDelete]
  @Original_DashboardID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [WF_Dashboards]
  WHERE
  [WF_Dashboards].[DashboardID] = @Original_DashboardID
  SET @RowCount = @@RowCount
GO
