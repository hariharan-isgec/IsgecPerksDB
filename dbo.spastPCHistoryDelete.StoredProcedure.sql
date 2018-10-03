USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCHistoryDelete]
  @Original_HistoryID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [AST_PCHistory]
  WHERE
  [AST_PCHistory].[HistoryID] = @Original_HistoryID
  SET @RowCount = @@RowCount
GO
