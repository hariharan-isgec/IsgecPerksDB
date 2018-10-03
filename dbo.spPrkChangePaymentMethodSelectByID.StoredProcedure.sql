USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkChangePaymentMethodSelectByID]
  @ApplicationID Int
  AS
  SELECT
		[PRK_Applications].[ApplicationID],
		[PRK_Applications].[EmployeeID],
		[PRK_Applications].[PerkID],
		[PRK_Applications].[AppliedOn],
		[PRK_Applications].[Value],
		[PRK_Applications].[ApprovedAmt],
		[PRK_Applications].[PaymentMethod],
		[PRK_Applications].[StatusID],
		[PRK_Applications].[FinYear],
		[PRK_Employees1].[EmployeeID] AS PRK_Employees1_EmployeeID,
		[PRK_Employees1].[CardNo] AS PRK_Employees1_CardNo,
		[PRK_Employees1].[EmployeeName] AS PRK_Employees1_EmployeeName,
		[PRK_Perks2].[PerkID] AS PRK_Perks2_PerkID,
		[PRK_Perks2].[PerkCode] AS PRK_Perks2_PerkCode,
		[PRK_Perks2].[Description] AS PRK_Perks2_Description
  FROM [PRK_Applications] 
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Applications].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Applications].[PerkID] = [PRK_Perks2].[PerkID]
  WHERE
  [PRK_Applications].[ApplicationID] = @ApplicationID
GO
