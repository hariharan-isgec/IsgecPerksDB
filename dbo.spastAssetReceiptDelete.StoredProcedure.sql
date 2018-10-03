USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetReceiptDelete]
  @Original_MrnID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [AST_MRNAsset]
  WHERE
  [AST_MRNAsset].[MrnID] = @Original_MrnID
  SET @RowCount = @@RowCount
GO
