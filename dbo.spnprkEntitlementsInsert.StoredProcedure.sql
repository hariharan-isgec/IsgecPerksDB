USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkEntitlementsInsert]
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
  @Return_EntitlementID Int = null OUTPUT 
  AS
  INSERT [PRK_Entitlements]
  (
   [EmployeeID]
  ,[PerkID]
  ,[EffectiveDate]
  ,[FinYear]
  ,[Value]
  ,[UOM]
  ,[CategoryID]
  ,[PostedAt]
  ,[VehicleType]
  ,[Basic]
  ,[ESI]
  ,[WithDriver]
  ,[Description]
  ,[Selected]
  ,[Paid]
  )
  VALUES
  (
   @EmployeeID
  ,@PerkID
  ,@EffectiveDate
  ,@FinYear
  ,@Value
  ,@UOM
  ,@CategoryID
  ,@PostedAt
  ,@VehicleType
  ,@Basic
  ,@ESI
  ,@WithDriver
  ,@Description
  ,@Selected
  ,@Paid 
  )
  SET @Return_EntitlementID = Scope_Identity()
GO
