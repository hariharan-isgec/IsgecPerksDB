USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlUnitsDelete]
  @Original_UnitID NVarChar(3),
  @RowCount int = null OUTPUT
  AS
  DELETE [EITL_Units]
  WHERE
  [EITL_Units].[UnitID] = @Original_UnitID
  SET @RowCount = @@RowCount
GO
