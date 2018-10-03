USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkBillDetailsSelectByID]
  @AttachmentID Int
  AS
  SELECT
		[PRK_BillDetails].[AttachmentID],
		[PRK_BillDetails].[ApplicationID],
		[PRK_BillDetails].[SerialNo],
		[PRK_BillDetails].[BillNo],
		[PRK_BillDetails].[BillDate],
		[PRK_BillDetails].[Particulars],
		[PRK_BillDetails].[Quantity],
		[PRK_BillDetails].[Amount],
		[PRK_Applications1].[ApplicationID] AS PRK_Applications1_ApplicationID,
		[PRK_Applications1].[EmployeeID] AS PRK_Applications1_EmployeeID,
		[PRK_Applications1].[PerkID] AS PRK_Applications1_PerkID,
		[PRK_Applications1].[Applied] AS PRK_Applications1_Applied,
		[PRK_Applications1].[AppliedOn] AS PRK_Applications1_AppliedOn,
		[PRK_Applications1].[Value] AS PRK_Applications1_Value,
		[PRK_Applications1].[UserRemark] AS PRK_Applications1_UserRemark,
		[PRK_Applications1].[Approved] AS PRK_Applications1_Approved,
		[PRK_Applications1].[ApprovedValue] AS PRK_Applications1_ApprovedValue,
		[PRK_Applications1].[ApprovedAmt] AS PRK_Applications1_ApprovedAmt,
		[PRK_Applications1].[ApprovedBy] AS PRK_Applications1_ApprovedBy,
		[PRK_Applications1].[ApprovedOn] AS PRK_Applications1_ApprovedOn,
		[PRK_Applications1].[ApproverRemark] AS PRK_Applications1_ApproverRemark,
		[PRK_Applications1].[Verified] AS PRK_Applications1_Verified,
		[PRK_Applications1].[VerifiedValue] AS PRK_Applications1_VerifiedValue,
		[PRK_Applications1].[VerifiedAmt] AS PRK_Applications1_VerifiedAmt,
		[PRK_Applications1].[VerifiedBy] AS PRK_Applications1_VerifiedBy,
		[PRK_Applications1].[PostedBy] AS PRK_Applications1_PostedBy,
		[PRK_Applications1].[UpdatedBy] AS PRK_Applications1_UpdatedBy,
		[PRK_Applications1].[VerifiedOn] AS PRK_Applications1_VerifiedOn,
		[PRK_Applications1].[VerifierRemark] AS PRK_Applications1_VerifierRemark,
		[PRK_Applications1].[PaymentMethod] AS PRK_Applications1_PaymentMethod,
		[PRK_Applications1].[UpdatedInLedger] AS PRK_Applications1_UpdatedInLedger,
		[PRK_Applications1].[UpdatedOn] AS PRK_Applications1_UpdatedOn,
		[PRK_Applications1].[PostedInBaaN] AS PRK_Applications1_PostedInBaaN,
		[PRK_Applications1].[PostedOn] AS PRK_Applications1_PostedOn,
		[PRK_Applications1].[Documents] AS PRK_Applications1_Documents,
		[PRK_Applications1].[StatusID] AS PRK_Applications1_StatusID,
		[PRK_Applications1].[FinYear] AS PRK_Applications1_FinYear 
  FROM [PRK_BillDetails] 
  INNER JOIN [PRK_Applications] AS [PRK_Applications1]
    ON [PRK_BillDetails].[ApplicationID] = [PRK_Applications1].[ApplicationID]
  WHERE
  [PRK_BillDetails].[AttachmentID] = @AttachmentID
GO
