USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogCargoTypesDelete]
  @Original_CargoTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_CargoTypes]
  WHERE
  [ELOG_CargoTypes].[CargoTypeID] = @Original_CargoTypeID
  SET @RowCount = @@RowCount
GO
