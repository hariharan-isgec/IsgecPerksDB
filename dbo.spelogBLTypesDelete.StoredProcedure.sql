USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLTypesDelete]
  @Original_BLTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_BLTypes]
  WHERE
  [ELOG_BLTypes].[BLTypeID] = @Original_BLTypeID
  SET @RowCount = @@RowCount
GO
