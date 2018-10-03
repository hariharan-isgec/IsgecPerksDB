USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowsDelete]
  @Original_DashboardID Int,
  @Original_DBRows Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [WF_DBRows]
  WHERE
  [WF_DBRows].[DashboardID] = @Original_DashboardID
  AND [WF_DBRows].[DBRows] = @Original_DBRows
  SET @RowCount = @@RowCount
GO
