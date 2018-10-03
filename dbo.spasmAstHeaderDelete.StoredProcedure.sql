USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstHeaderDelete]
  @Original_MrnID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ASM_AstHeader]
  WHERE
  [ASM_AstHeader].[MrnID] = @Original_MrnID
  SET @RowCount = @@RowCount
GO
