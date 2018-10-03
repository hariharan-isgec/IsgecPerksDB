USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakUnitSetsDelete]
  @Original_UnitSetID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_UnitSets]
  WHERE
  [PAK_UnitSets].[UnitSetID] = @Original_UnitSetID
  SET @RowCount = @@RowCount
GO
