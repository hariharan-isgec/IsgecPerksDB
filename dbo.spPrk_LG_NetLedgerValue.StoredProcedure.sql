USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrk_LG_NetLedgerValue]
  @EmployeeID Int,
  @PerkID Int,
  @FinYear Int,
  @NetValue Decimal = 0 OUTPUT  
  AS
  SELECT @NetValue = SUM([PRK_Ledger].[Value])
  FROM [PRK_Ledger] 
  WHERE
      [PRK_Ledger].[EmployeeID] = @EmployeeID 
  AND [PRK_Ledger].[PerkID] = @PerkID 
  AND [PRK_Ledger].[FinYear] = @FinYear

  if(@NetValue is NULL)
    set @NetValue = 0
GO
