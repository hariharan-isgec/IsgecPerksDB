USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLDelete]
  @Original_IRNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_IRBL]
  WHERE
  [ELOG_IRBL].[IRNo] = @Original_IRNo
  SET @RowCount = @@RowCount
GO
