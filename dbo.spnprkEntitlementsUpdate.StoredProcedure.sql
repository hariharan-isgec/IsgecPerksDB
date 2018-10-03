USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkEntitlementsUpdate]
  @Original_EntitlementID Int, 
  @EmployeeID Int,
  @PerkID Int,
  @EffectiveDate DateTime,
  @FinYear Int,
  @Value Decimal(10,2),
  @UOM NVarChar(5),
  @CategoryID Int,
  @PostedAt NVarChar(20),
  @VehicleType NVarChar(20),
  @Basic Decimal(10,2),
  @ESI Bit,
  @WithDriver Bit,
  @Description NVarChar(100),
  @Selected Bit,
  @Paid Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Entitlements] SET 
   [EmployeeID] = @EmployeeID
  ,[PerkID] = @PerkID
  ,[EffectiveDate] = @EffectiveDate
  ,[FinYear] = @FinYear
  ,[Value] = @Value
  ,[UOM] = @UOM
  ,[CategoryID] = @CategoryID
  ,[PostedAt] = @PostedAt
  ,[VehicleType] = @VehicleType
  ,[Basic] = @Basic
  ,[ESI] = @ESI
  ,[WithDriver] = @WithDriver
  ,[Description] = @Description 
  ,[Selected] = @Selected
  ,[Paid] = @Paid 
  WHERE
  [EntitlementID] = @Original_EntitlementID
  SET @RowCount = @@RowCount
GO
