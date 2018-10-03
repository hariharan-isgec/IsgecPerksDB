USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastRAMsDelete]
  @Original_RamID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [AST_Rams]
  WHERE
  [AST_Rams].[RamID] = @Original_RamID
  SET @RowCount = @@RowCount
GO
