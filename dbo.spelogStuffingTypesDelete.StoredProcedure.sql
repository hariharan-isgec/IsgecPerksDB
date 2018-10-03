USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogStuffingTypesDelete]
  @Original_StuffingTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_StuffingTypes]
  WHERE
  [ELOG_StuffingTypes].[StuffingTypeID] = @Original_StuffingTypeID
  SET @RowCount = @@RowCount
GO
