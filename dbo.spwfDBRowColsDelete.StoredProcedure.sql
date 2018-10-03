USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowColsDelete]
  @Original_DashboardID Int,
  @Original_DBRows Int,
  @Original_DBCols Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [WF_DBRowCols]
  WHERE
  [WF_DBRowCols].[DashboardID] = @Original_DashboardID
  AND [WF_DBRowCols].[DBRows] = @Original_DBRows
  AND [WF_DBRowCols].[DBCols] = @Original_DBCols
  SET @RowCount = @@RowCount
GO
