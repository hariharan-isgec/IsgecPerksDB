USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spPrk_LG_ClosingLedger]
  @EmployeeID Int,
  @PerkID Int,
  @FinYear Int 
  AS
  SELECT
		[PRK_Ledger].*  
  FROM [PRK_Ledger] 
  WHERE
      [PRK_Ledger].[EmployeeID] = @EmployeeID 
  AND [PRK_Ledger].[PerkID] = @PerkID 
  AND [PRK_Ledger].[FinYear] = @FinYear
  AND [PRK_Ledger].[TranType] = 'ADJ' 
  AND [PRK_Ledger].[Remarks] = 'Auto Generated Closing'
GO
