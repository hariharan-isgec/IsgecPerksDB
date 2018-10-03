USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeCategoriesInsert]
  @ShipmentModeID Int,
  @LocationCountryID Int,
  @CargoTypeID Int,
  @StuffingTypeID Int,
  @StuffingPointID Int,
  @BreakbulkTypeID Int,
  @ChargeTypeID Int,
  @Description NVarChar(100),
  @Return_ChargeCategoryID Int = null OUTPUT 
  AS
  INSERT [ELOG_ChargeCategories]
  (
   [ShipmentModeID]
  ,[LocationCountryID]
  ,[CargoTypeID]
  ,[StuffingTypeID]
  ,[StuffingPointID]
  ,[BreakbulkTypeID]
  ,[ChargeTypeID]
  ,[Description]
  )
  VALUES
  (
   @ShipmentModeID
  ,@LocationCountryID
  ,@CargoTypeID
  ,@StuffingTypeID
  ,@StuffingPointID
  ,@BreakbulkTypeID
  ,@ChargeTypeID
  ,@Description
  )
  SET @Return_ChargeCategoryID = Scope_Identity()
GO
