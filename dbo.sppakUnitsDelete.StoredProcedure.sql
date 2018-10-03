USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakUnitsDelete]
  @Original_UnitID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_Units]
  WHERE
  [PAK_Units].[UnitID] = @Original_UnitID
  SET @RowCount = @@RowCount
GO
