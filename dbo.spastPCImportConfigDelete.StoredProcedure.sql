USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCImportConfigDelete]
  @Original_pcID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [AST_PCDetails]
  WHERE
  [AST_PCDetails].[pcID] = @Original_pcID
  SET @RowCount = @@RowCount
GO
