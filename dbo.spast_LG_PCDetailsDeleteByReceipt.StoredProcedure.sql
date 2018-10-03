USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spast_LG_PCDetailsDeleteByReceipt]
  @MrnID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [AST_PCDetails]
  WHERE
  [AST_PCDetails].[MrnID] = @MrnID
  SET @RowCount = @@RowCount
GO
