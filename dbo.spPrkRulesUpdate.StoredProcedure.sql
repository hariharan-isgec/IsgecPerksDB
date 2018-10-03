USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkRulesUpdate]
  @PerkID Int,
  @CategoryID Int,
  @EffectiveDate DateTime,
  @PercentageOfBasic Bit,
  @Percentage Decimal(6,2),
  @FixedValue Decimal(10,2),
  @PostedAt NVarChar(20),
  @VehicleType NVarChar(20),
	@InSalary Bit,
  @Original_RuleID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Rules] SET 
   [PerkID] = @PerkID
  ,[CategoryID] = @CategoryID
  ,[EffectiveDate] = @EffectiveDate
  ,[PercentageOfBasic] = @PercentageOfBasic
  ,[Percentage] = @Percentage
  ,[FixedValue] = @FixedValue
  ,[PostedAt] = @PostedAt
  ,[VehicleType] = @VehicleType
	,[InSalary] = @InSalary     
  WHERE
  [RuleID] = @Original_RuleID
  SET @RowCount = @@RowCount
GO
