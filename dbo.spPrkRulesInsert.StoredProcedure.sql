USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkRulesInsert]
  @PerkID Int,
  @CategoryID Int,
  @EffectiveDate DateTime,
  @PercentageOfBasic Bit,
  @Percentage Decimal(6,2),
  @FixedValue Decimal(10,2),
  @PostedAt NVarChar(20),
  @VehicleType NVarChar(20),
  @InSalary Bit,
  @RuleID Int = null OUTPUT
  AS
  INSERT [PRK_Rules]
  (
   [PerkID]
  ,[CategoryID]
  ,[EffectiveDate]
  ,[PercentageOfBasic]
  ,[Percentage]
  ,[FixedValue]
  ,[PostedAt]
  ,[VehicleType]
	,[InSalary]
  )
  VALUES
  (
   @PerkID
  ,@CategoryID
  ,@EffectiveDate
  ,@PercentageOfBasic
  ,@Percentage
  ,@FixedValue
  ,@PostedAt
  ,@VehicleType
	,@InSalary
  )
  SET @RuleID = Scope_Identity()
GO
