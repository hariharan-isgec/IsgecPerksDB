USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWHistoryDelete]
  @Original_MrnID Int,
  @Original_AssetID Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ASM_AstHistory]
  WHERE
  [ASM_AstHistory].[MrnID] = @Original_MrnID
  AND [ASM_AstHistory].[AssetID] = @Original_AssetID
  AND [ASM_AstHistory].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
