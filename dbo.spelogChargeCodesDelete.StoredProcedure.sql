USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeCodesDelete]
  @Original_ChargeCategoryID Int,
  @Original_ChargeCodeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_ChargeCodes]
  WHERE
  [ELOG_ChargeCodes].[ChargeCategoryID] = @Original_ChargeCategoryID
  AND [ELOG_ChargeCodes].[ChargeCodeID] = @Original_ChargeCodeID
  SET @RowCount = @@RowCount
GO
