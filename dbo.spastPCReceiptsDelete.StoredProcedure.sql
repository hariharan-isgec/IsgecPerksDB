USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCReceiptsDelete]
  @Original_MrnID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [AST_MrnPC]
  WHERE
  [AST_MrnPC].[MrnID] = @Original_MrnID
  SET @RowCount = @@RowCount
GO
