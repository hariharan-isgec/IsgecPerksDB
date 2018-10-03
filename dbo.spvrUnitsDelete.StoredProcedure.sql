USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUnitsDelete]
  @Original_UnitID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_Units]
  WHERE
  [VR_Units].[UnitID] = @Original_UnitID
  SET @RowCount = @@RowCount
GO
