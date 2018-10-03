USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfUserDBRowsDelete]
  @Original_UserID NVarChar(8),
  @Original_DashboardID Int,
  @Original_DBRows Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [WF_UserDBRows]
  WHERE
  [WF_UserDBRows].[UserID] = @Original_UserID
  AND [WF_UserDBRows].[DashboardID] = @Original_DashboardID
  AND [WF_UserDBRows].[DBRows] = @Original_DBRows
  SET @RowCount = @@RowCount
GO
