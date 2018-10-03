USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeCategoriesUpdate]
  @Original_ChargeCategoryID Int, 
  @ShipmentModeID Int,
  @LocationCountryID Int,
  @CargoTypeID Int,
  @StuffingTypeID Int,
  @StuffingPointID Int,
  @BreakbulkTypeID Int,
  @ChargeTypeID Int,
  @Description NVarChar(100),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_ChargeCategories] SET 
   [ShipmentModeID] = @ShipmentModeID
  ,[LocationCountryID] = @LocationCountryID
  ,[CargoTypeID] = @CargoTypeID
  ,[StuffingTypeID] = @StuffingTypeID
  ,[StuffingPointID] = @StuffingPointID
  ,[BreakbulkTypeID] = @BreakbulkTypeID
  ,[ChargeTypeID] = @ChargeTypeID
  ,[Description] = @Description
  WHERE
  [ChargeCategoryID] = @Original_ChargeCategoryID
  SET @RowCount = @@RowCount
GO
