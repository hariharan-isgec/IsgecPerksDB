USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstDetailsDelete]
  @Original_MrnID Int,
  @Original_AssetID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ASM_AstDetails]
  WHERE
  [ASM_AstDetails].[MrnID] = @Original_MrnID
  AND [ASM_AstDetails].[AssetID] = @Original_AssetID
  SET @RowCount = @@RowCount
GO
