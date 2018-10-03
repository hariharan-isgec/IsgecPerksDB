USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetHistoryDelete]
  @Original_HistoryID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [AST_AssetHistory]
  WHERE
  [AST_AssetHistory].[HistoryID] = @Original_HistoryID
  SET @RowCount = @@RowCount
GO
