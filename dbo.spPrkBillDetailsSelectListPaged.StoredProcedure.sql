USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkBillDetailsSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  AttachmentID Int NOT NULL
  )
  INSERT INTO #PageIndex (AttachmentID)
  SELECT [PRK_BillDetails].[AttachmentID] FROM [PRK_BillDetails]
  INNER JOIN [PRK_Applications] AS [PRK_Applications1]
    ON [PRK_BillDetails].[ApplicationID] = [PRK_Applications1].[ApplicationID]
  ORDER BY
     CASE @orderBy WHEN 'AttachmentID' THEN [PRK_BillDetails].[AttachmentID] END,
     CASE @orderBy WHEN 'AttachmentID DESC' THEN [PRK_BillDetails].[AttachmentID] END DESC,
     CASE @orderBy WHEN 'ApplicationID' THEN [PRK_BillDetails].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [PRK_BillDetails].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [PRK_BillDetails].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [PRK_BillDetails].[SerialNo] END DESC,
     CASE @orderBy WHEN 'BillNo' THEN [PRK_BillDetails].[BillNo] END,
     CASE @orderBy WHEN 'BillNo DESC' THEN [PRK_BillDetails].[BillNo] END DESC,
     CASE @orderBy WHEN 'BillDate' THEN [PRK_BillDetails].[BillDate] END,
     CASE @orderBy WHEN 'BillDate DESC' THEN [PRK_BillDetails].[BillDate] END DESC,
     CASE @orderBy WHEN 'Particulars' THEN [PRK_BillDetails].[Particulars] END,
     CASE @orderBy WHEN 'Particulars DESC' THEN [PRK_BillDetails].[Particulars] END DESC,
     CASE @orderBy WHEN 'Quantity' THEN [PRK_BillDetails].[Quantity] END,
     CASE @orderBy WHEN 'Quantity DESC' THEN [PRK_BillDetails].[Quantity] END DESC,
     CASE @orderBy WHEN 'Amount' THEN [PRK_BillDetails].[Amount] END,
     CASE @orderBy WHEN 'Amount DESC' THEN [PRK_BillDetails].[Amount] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_ApplicationID' THEN [PRK_Applications1].[ApplicationID] END,
     CASE @orderBy WHEN 'PRK_Applications1_ApplicationID DESC' THEN [PRK_Applications1].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_EmployeeID' THEN [PRK_Applications1].[EmployeeID] END,
     CASE @orderBy WHEN 'PRK_Applications1_EmployeeID DESC' THEN [PRK_Applications1].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_PerkID' THEN [PRK_Applications1].[PerkID] END,
     CASE @orderBy WHEN 'PRK_Applications1_PerkID DESC' THEN [PRK_Applications1].[PerkID] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_Applied' THEN [PRK_Applications1].[Applied] END,
     CASE @orderBy WHEN 'PRK_Applications1_Applied DESC' THEN [PRK_Applications1].[Applied] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_AppliedOn' THEN [PRK_Applications1].[AppliedOn] END,
     CASE @orderBy WHEN 'PRK_Applications1_AppliedOn DESC' THEN [PRK_Applications1].[AppliedOn] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_Value' THEN [PRK_Applications1].[Value] END,
     CASE @orderBy WHEN 'PRK_Applications1_Value DESC' THEN [PRK_Applications1].[Value] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_UserRemark' THEN [PRK_Applications1].[UserRemark] END,
     CASE @orderBy WHEN 'PRK_Applications1_UserRemark DESC' THEN [PRK_Applications1].[UserRemark] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_Approved' THEN [PRK_Applications1].[Approved] END,
     CASE @orderBy WHEN 'PRK_Applications1_Approved DESC' THEN [PRK_Applications1].[Approved] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_ApprovedValue' THEN [PRK_Applications1].[ApprovedValue] END,
     CASE @orderBy WHEN 'PRK_Applications1_ApprovedValue DESC' THEN [PRK_Applications1].[ApprovedValue] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_ApprovedAmt' THEN [PRK_Applications1].[ApprovedAmt] END,
     CASE @orderBy WHEN 'PRK_Applications1_ApprovedAmt DESC' THEN [PRK_Applications1].[ApprovedAmt] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_ApprovedBy' THEN [PRK_Applications1].[ApprovedBy] END,
     CASE @orderBy WHEN 'PRK_Applications1_ApprovedBy DESC' THEN [PRK_Applications1].[ApprovedBy] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_ApprovedOn' THEN [PRK_Applications1].[ApprovedOn] END,
     CASE @orderBy WHEN 'PRK_Applications1_ApprovedOn DESC' THEN [PRK_Applications1].[ApprovedOn] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_ApproverRemark' THEN [PRK_Applications1].[ApproverRemark] END,
     CASE @orderBy WHEN 'PRK_Applications1_ApproverRemark DESC' THEN [PRK_Applications1].[ApproverRemark] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_Verified' THEN [PRK_Applications1].[Verified] END,
     CASE @orderBy WHEN 'PRK_Applications1_Verified DESC' THEN [PRK_Applications1].[Verified] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_VerifiedValue' THEN [PRK_Applications1].[VerifiedValue] END,
     CASE @orderBy WHEN 'PRK_Applications1_VerifiedValue DESC' THEN [PRK_Applications1].[VerifiedValue] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_VerifiedAmt' THEN [PRK_Applications1].[VerifiedAmt] END,
     CASE @orderBy WHEN 'PRK_Applications1_VerifiedAmt DESC' THEN [PRK_Applications1].[VerifiedAmt] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_VerifiedBy' THEN [PRK_Applications1].[VerifiedBy] END,
     CASE @orderBy WHEN 'PRK_Applications1_VerifiedBy DESC' THEN [PRK_Applications1].[VerifiedBy] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_PostedBy' THEN [PRK_Applications1].[PostedBy] END,
     CASE @orderBy WHEN 'PRK_Applications1_PostedBy DESC' THEN [PRK_Applications1].[PostedBy] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_UpdatedBy' THEN [PRK_Applications1].[UpdatedBy] END,
     CASE @orderBy WHEN 'PRK_Applications1_UpdatedBy DESC' THEN [PRK_Applications1].[UpdatedBy] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_VerifiedOn' THEN [PRK_Applications1].[VerifiedOn] END,
     CASE @orderBy WHEN 'PRK_Applications1_VerifiedOn DESC' THEN [PRK_Applications1].[VerifiedOn] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_VerifierRemark' THEN [PRK_Applications1].[VerifierRemark] END,
     CASE @orderBy WHEN 'PRK_Applications1_VerifierRemark DESC' THEN [PRK_Applications1].[VerifierRemark] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_PaymentMethod' THEN [PRK_Applications1].[PaymentMethod] END,
     CASE @orderBy WHEN 'PRK_Applications1_PaymentMethod DESC' THEN [PRK_Applications1].[PaymentMethod] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_UpdatedInLedger' THEN [PRK_Applications1].[UpdatedInLedger] END,
     CASE @orderBy WHEN 'PRK_Applications1_UpdatedInLedger DESC' THEN [PRK_Applications1].[UpdatedInLedger] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_UpdatedOn' THEN [PRK_Applications1].[UpdatedOn] END,
     CASE @orderBy WHEN 'PRK_Applications1_UpdatedOn DESC' THEN [PRK_Applications1].[UpdatedOn] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_PostedInBaaN' THEN [PRK_Applications1].[PostedInBaaN] END,
     CASE @orderBy WHEN 'PRK_Applications1_PostedInBaaN DESC' THEN [PRK_Applications1].[PostedInBaaN] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_PostedOn' THEN [PRK_Applications1].[PostedOn] END,
     CASE @orderBy WHEN 'PRK_Applications1_PostedOn DESC' THEN [PRK_Applications1].[PostedOn] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_Documents' THEN [PRK_Applications1].[Documents] END,
     CASE @orderBy WHEN 'PRK_Applications1_Documents DESC' THEN [PRK_Applications1].[Documents] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_StatusID' THEN [PRK_Applications1].[StatusID] END,
     CASE @orderBy WHEN 'PRK_Applications1_StatusID DESC' THEN [PRK_Applications1].[StatusID] END DESC,
     CASE @orderBy WHEN 'PRK_Applications1_FinYear' THEN [PRK_Applications1].[FinYear] END,
     CASE @orderBy WHEN 'PRK_Applications1_FinYear DESC' THEN [PRK_Applications1].[FinYear] END DESC 

  SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [PRK_BillDetails].[AttachmentID] = #PageIndex.AttachmentID
  INNER JOIN [PRK_Applications] AS [PRK_Applications1]
    ON [PRK_BillDetails].[ApplicationID] = [PRK_Applications1].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
GO
