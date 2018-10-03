USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprk_LG_NetEntitlementValue]
  @EmployeeID Int,
  @PerkID Int,
  @FinYear Int,
  @NetValue Decimal = 0.00 OUTPUT  
  AS
  SELECT @NetValue = SUM([PRK_Entitlements].[Value])
  FROM [PRK_Entitlements] 
  WHERE
      [PRK_Entitlements].[EmployeeID] = @EmployeeID 
  AND [PRK_Entitlements].[PerkID] = @PerkID 
  AND [PRK_Entitlements].[FinYear] = @FinYear

  if(@NetValue is NULL)
    set @NetValue = 0.00
GO
