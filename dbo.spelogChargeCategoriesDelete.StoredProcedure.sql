USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeCategoriesDelete]
  @Original_ChargeCategoryID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_ChargeCategories]
  WHERE
  [ELOG_ChargeCategories].[ChargeCategoryID] = @Original_ChargeCategoryID
  SET @RowCount = @@RowCount
GO
