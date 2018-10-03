USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spast_LG_AssetDetailsDeleteByReceipt]
  @MrnID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [AST_AssetDetails]
  WHERE
  [AST_AssetDetails].[MrnID] = @MrnID
  SET @RowCount = @@RowCount
GO
