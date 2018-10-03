USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfUserDashboardsDelete]
  @Original_UserID NVarChar(8),
  @Original_DashboardID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [WF_UserDashboards]
  WHERE
  [WF_UserDashboards].[UserID] = @Original_UserID
  AND [WF_UserDashboards].[DashboardID] = @Original_DashboardID
  SET @RowCount = @@RowCount
GO
