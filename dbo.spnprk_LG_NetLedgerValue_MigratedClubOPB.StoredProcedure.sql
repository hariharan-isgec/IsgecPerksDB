USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spnprk_LG_NetLedgerValue_MigratedClubOPB]
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
  AND [PRK_Ledger].[TranType] = 'ADJ'
  AND [PRK_Ledger].[Remarks] = 'Migrated Clubbed OPB'

  if(@NetValue is NULL)
    set @NetValue = 0
GO
