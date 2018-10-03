USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBreakbulkTypesDelete]
  @Original_BreakbulkTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_BreakbulkTypes]
  WHERE
  [ELOG_BreakbulkTypes].[BreakbulkTypeID] = @Original_BreakbulkTypeID
  SET @RowCount = @@RowCount
GO
