USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprk_LG_OPBLedger]
  @EmployeeID Int,
  @PerkID Int,
  @FinYear Int 
  AS
  SELECT
		[PRK_Ledger].[DocumentID],
		[PRK_Ledger].[EmployeeID],
		[PRK_Ledger].[PerkID],
		[PRK_Ledger].[TranType],
		[PRK_Ledger].[TranDate],
		[PRK_Ledger].[Value],
		[PRK_Ledger].[UOM],
		[PRK_Ledger].[Amount],
		[PRK_Ledger].[Remarks],
		[PRK_Ledger].[CreatedBy],
		[PRK_Ledger].[FinYear],
		[PRK_Ledger].[PostedInBaaN],
		[PRK_Ledger].[ApplicationID],
		[PRK_Ledger].[PostedOn],
		[PRK_Ledger].[PostedBy],
		[PRK_Ledger].[BatchNo],
		[PRK_Ledger].[VoucherNo],
		[PRK_Ledger].[VoucherLineNo] 
  FROM [PRK_Ledger] 
  WHERE
      [PRK_Ledger].[EmployeeID] = @EmployeeID 
  AND [PRK_Ledger].[PerkID] = @PerkID 
  AND [PRK_Ledger].[FinYear] = @FinYear
  AND [PRK_Ledger].[TranType] = 'OPB'
GO
