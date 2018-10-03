USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkEntitlementsInsert]
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
  @EntitlementID Int = null OUTPUT
  AS
  INSERT [PRK_Entitlements]
  (
   [EmployeeID]
  ,[PerkID]
  ,[CategoryID]
  ,[EffectiveDate]
  ,[PostedAt]
  ,[Value]
  ,[VehicleType]
  ,[Basic]
  ,[UOM]
  ,[ESI]
  ,[FinYear]
  )
  VALUES
  (
   @EmployeeID
  ,@PerkID
  ,@CategoryID
  ,@EffectiveDate
  ,@PostedAt
  ,@Value
  ,@VehicleType
  ,@Basic
  ,@UOM
  ,@ESI
  ,@FinYear
  )
  SET @EntitlementID = Scope_Identity()
GO
