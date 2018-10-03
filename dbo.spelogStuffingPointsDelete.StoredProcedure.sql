USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogStuffingPointsDelete]
  @Original_StuffingPointID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_StuffingPoints]
  WHERE
  [ELOG_StuffingPoints].[StuffingPointID] = @Original_StuffingPointID
  SET @RowCount = @@RowCount
GO
