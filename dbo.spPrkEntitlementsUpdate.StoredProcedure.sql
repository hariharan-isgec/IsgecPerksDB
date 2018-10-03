USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkEntitlementsUpdate]
  @EmployeeID Int,
  @PerkID Int,
  @CategoryID Int,
  @EffectiveDate DateTime,
  @PostedAt NVarChar(20),
  @Value Decimal(10,2),
  @VehicleType NVarChar(20),
  @Basic Decimal(10,2),
  @UOM NVarChar(5),
  @ESI Bit,
  @FinYear Int,
  @Original_EntitlementID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Entitlements] SET 
   [EmployeeID] = @EmployeeID
  ,[PerkID] = @PerkID
  ,[CategoryID] = @CategoryID
  ,[EffectiveDate] = @EffectiveDate
  ,[PostedAt] = @PostedAt
  ,[Value] = @Value
  ,[VehicleType] = @VehicleType
  ,[Basic] = @Basic
  ,[UOM] = @UOM
  ,[ESI] = @ESI
  ,[FinYear] = @FinYear
  WHERE
  [EntitlementID] = @Original_EntitlementID
  SET @RowCount = @@RowCount
GO
