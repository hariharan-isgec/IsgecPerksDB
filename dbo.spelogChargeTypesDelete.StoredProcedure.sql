USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeTypesDelete]
  @Original_ChargeTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_ChargeTypes]
  WHERE
  [ELOG_ChargeTypes].[ChargeTypeID] = @Original_ChargeTypeID
  SET @RowCount = @@RowCount
GO
