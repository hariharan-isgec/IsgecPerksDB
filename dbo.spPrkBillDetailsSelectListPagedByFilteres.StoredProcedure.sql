USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkBillDetailsSelectListPagedByFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  AttachmentID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (AttachmentID) ' + 
               'SELECT [PRK_BillDetails].[AttachmentID] FROM [PRK_BillDetails] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Applications] AS [PRK_Applications1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_BillDetails].[ApplicationID] = [PRK_Applications1].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AttachmentID' THEN '[PRK_BillDetails].[AttachmentID]'
                        WHEN 'AttachmentID DESC' THEN '[PRK_BillDetails].[AttachmentID] DESC'
                        WHEN 'ApplicationID' THEN '[PRK_BillDetails].[ApplicationID]'
                        WHEN 'ApplicationID DESC' THEN '[PRK_BillDetails].[ApplicationID] DESC'
                        WHEN 'SerialNo' THEN '[PRK_BillDetails].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PRK_BillDetails].[SerialNo] DESC'
                        WHEN 'BillNo' THEN '[PRK_BillDetails].[BillNo]'
                        WHEN 'BillNo DESC' THEN '[PRK_BillDetails].[BillNo] DESC'
                        WHEN 'BillDate' THEN '[PRK_BillDetails].[BillDate]'
                        WHEN 'BillDate DESC' THEN '[PRK_BillDetails].[BillDate] DESC'
                        WHEN 'Particulars' THEN '[PRK_BillDetails].[Particulars]'
                        WHEN 'Particulars DESC' THEN '[PRK_BillDetails].[Particulars] DESC'
                        WHEN 'Quantity' THEN '[PRK_BillDetails].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[PRK_BillDetails].[Quantity] DESC'
                        WHEN 'Amount' THEN '[PRK_BillDetails].[Amount]'
                        WHEN 'Amount DESC' THEN '[PRK_BillDetails].[Amount] DESC'
                        WHEN 'PRK_Applications1_ApplicationID' THEN '[PRK_Applications1].[ApplicationID]'
                        WHEN 'PRK_Applications1_ApplicationID DESC' THEN '[PRK_Applications1].[ApplicationID] DESC'
                        WHEN 'PRK_Applications1_EmployeeID' THEN '[PRK_Applications1].[EmployeeID]'
                        WHEN 'PRK_Applications1_EmployeeID DESC' THEN '[PRK_Applications1].[EmployeeID] DESC'
                        WHEN 'PRK_Applications1_PerkID' THEN '[PRK_Applications1].[PerkID]'
                        WHEN 'PRK_Applications1_PerkID DESC' THEN '[PRK_Applications1].[PerkID] DESC'
                        WHEN 'PRK_Applications1_Applied' THEN '[PRK_Applications1].[Applied]'
                        WHEN 'PRK_Applications1_Applied DESC' THEN '[PRK_Applications1].[Applied] DESC'
                        WHEN 'PRK_Applications1_AppliedOn' THEN '[PRK_Applications1].[AppliedOn]'
                        WHEN 'PRK_Applications1_AppliedOn DESC' THEN '[PRK_Applications1].[AppliedOn] DESC'
                        WHEN 'PRK_Applications1_Value' THEN '[PRK_Applications1].[Value]'
                        WHEN 'PRK_Applications1_Value DESC' THEN '[PRK_Applications1].[Value] DESC'
                        WHEN 'PRK_Applications1_UserRemark' THEN '[PRK_Applications1].[UserRemark]'
                        WHEN 'PRK_Applications1_UserRemark DESC' THEN '[PRK_Applications1].[UserRemark] DESC'
                        WHEN 'PRK_Applications1_Approved' THEN '[PRK_Applications1].[Approved]'
                        WHEN 'PRK_Applications1_Approved DESC' THEN '[PRK_Applications1].[Approved] DESC'
                        WHEN 'PRK_Applications1_ApprovedValue' THEN '[PRK_Applications1].[ApprovedValue]'
                        WHEN 'PRK_Applications1_ApprovedValue DESC' THEN '[PRK_Applications1].[ApprovedValue] DESC'
                        WHEN 'PRK_Applications1_ApprovedAmt' THEN '[PRK_Applications1].[ApprovedAmt]'
                        WHEN 'PRK_Applications1_ApprovedAmt DESC' THEN '[PRK_Applications1].[ApprovedAmt] DESC'
                        WHEN 'PRK_Applications1_ApprovedBy' THEN '[PRK_Applications1].[ApprovedBy]'
                        WHEN 'PRK_Applications1_ApprovedBy DESC' THEN '[PRK_Applications1].[ApprovedBy] DESC'
                        WHEN 'PRK_Applications1_ApprovedOn' THEN '[PRK_Applications1].[ApprovedOn]'
                        WHEN 'PRK_Applications1_ApprovedOn DESC' THEN '[PRK_Applications1].[ApprovedOn] DESC'
                        WHEN 'PRK_Applications1_ApproverRemark' THEN '[PRK_Applications1].[ApproverRemark]'
                        WHEN 'PRK_Applications1_ApproverRemark DESC' THEN '[PRK_Applications1].[ApproverRemark] DESC'
                        WHEN 'PRK_Applications1_Verified' THEN '[PRK_Applications1].[Verified]'
                        WHEN 'PRK_Applications1_Verified DESC' THEN '[PRK_Applications1].[Verified] DESC'
                        WHEN 'PRK_Applications1_VerifiedValue' THEN '[PRK_Applications1].[VerifiedValue]'
                        WHEN 'PRK_Applications1_VerifiedValue DESC' THEN '[PRK_Applications1].[VerifiedValue] DESC'
                        WHEN 'PRK_Applications1_VerifiedAmt' THEN '[PRK_Applications1].[VerifiedAmt]'
                        WHEN 'PRK_Applications1_VerifiedAmt DESC' THEN '[PRK_Applications1].[VerifiedAmt] DESC'
                        WHEN 'PRK_Applications1_VerifiedBy' THEN '[PRK_Applications1].[VerifiedBy]'
                        WHEN 'PRK_Applications1_VerifiedBy DESC' THEN '[PRK_Applications1].[VerifiedBy] DESC'
                        WHEN 'PRK_Applications1_PostedBy' THEN '[PRK_Applications1].[PostedBy]'
                        WHEN 'PRK_Applications1_PostedBy DESC' THEN '[PRK_Applications1].[PostedBy] DESC'
                        WHEN 'PRK_Applications1_UpdatedBy' THEN '[PRK_Applications1].[UpdatedBy]'
                        WHEN 'PRK_Applications1_UpdatedBy DESC' THEN '[PRK_Applications1].[UpdatedBy] DESC'
                        WHEN 'PRK_Applications1_VerifiedOn' THEN '[PRK_Applications1].[VerifiedOn]'
                        WHEN 'PRK_Applications1_VerifiedOn DESC' THEN '[PRK_Applications1].[VerifiedOn] DESC'
                        WHEN 'PRK_Applications1_VerifierRemark' THEN '[PRK_Applications1].[VerifierRemark]'
                        WHEN 'PRK_Applications1_VerifierRemark DESC' THEN '[PRK_Applications1].[VerifierRemark] DESC'
                        WHEN 'PRK_Applications1_PaymentMethod' THEN '[PRK_Applications1].[PaymentMethod]'
                        WHEN 'PRK_Applications1_PaymentMethod DESC' THEN '[PRK_Applications1].[PaymentMethod] DESC'
                        WHEN 'PRK_Applications1_UpdatedInLedger' THEN '[PRK_Applications1].[UpdatedInLedger]'
                        WHEN 'PRK_Applications1_UpdatedInLedger DESC' THEN '[PRK_Applications1].[UpdatedInLedger] DESC'
                        WHEN 'PRK_Applications1_UpdatedOn' THEN '[PRK_Applications1].[UpdatedOn]'
                        WHEN 'PRK_Applications1_UpdatedOn DESC' THEN '[PRK_Applications1].[UpdatedOn] DESC'
                        WHEN 'PRK_Applications1_PostedInBaaN' THEN '[PRK_Applications1].[PostedInBaaN]'
                        WHEN 'PRK_Applications1_PostedInBaaN DESC' THEN '[PRK_Applications1].[PostedInBaaN] DESC'
                        WHEN 'PRK_Applications1_PostedOn' THEN '[PRK_Applications1].[PostedOn]'
                        WHEN 'PRK_Applications1_PostedOn DESC' THEN '[PRK_Applications1].[PostedOn] DESC'
                        WHEN 'PRK_Applications1_Documents' THEN '[PRK_Applications1].[Documents]'
                        WHEN 'PRK_Applications1_Documents DESC' THEN '[PRK_Applications1].[Documents] DESC'
                        WHEN 'PRK_Applications1_StatusID' THEN '[PRK_Applications1].[StatusID]'
                        WHEN 'PRK_Applications1_StatusID DESC' THEN '[PRK_Applications1].[StatusID] DESC'
                        WHEN 'PRK_Applications1_FinYear' THEN '[PRK_Applications1].[FinYear]'
                        WHEN 'PRK_Applications1_FinYear DESC' THEN '[PRK_Applications1].[FinYear] DESC'
                        ELSE '[PRK_BillDetails].[AttachmentID]'
                    END
  EXEC (@LGSQL)

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
  END
GO
