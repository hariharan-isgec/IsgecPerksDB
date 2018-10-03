USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmt_LG_ACVouchersSelectListFilteres]
  @Filter_VendorID NVarChar(6),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,VoucherNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'VoucherNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_ACVouchers].[VoucherNo]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_ACVouchers] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_ACVouchers].[CreatedBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_ACVouchers].[PostedBy] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_ACVouchers].[PaidBy] = [aspnet_Users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors4]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_ACVouchers].[VendorID] = [SPMT_Vendors4].[VendorID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_VendorID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_ACVouchers].[VendorID] = ''' + @Filter_VendorID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'VoucherNo' THEN '[SPMT_ACVouchers].[VoucherNo]'
                        WHEN 'VoucherNo DESC' THEN '[SPMT_ACVouchers].[VoucherNo] DESC'
                        WHEN 'VoucherDate' THEN '[SPMT_ACVouchers].[VoucherDate]'
                        WHEN 'VoucherDate DESC' THEN '[SPMT_ACVouchers].[VoucherDate] DESC'
                        WHEN 'VendorID' THEN '[SPMT_ACVouchers].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[SPMT_ACVouchers].[VendorID] DESC'
                        WHEN 'CreatedBy' THEN '[SPMT_ACVouchers].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[SPMT_ACVouchers].[CreatedBy] DESC'
                        WHEN 'CreatedOn' THEN '[SPMT_ACVouchers].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[SPMT_ACVouchers].[CreatedOn] DESC'
                        WHEN 'PostedInBaaN' THEN '[SPMT_ACVouchers].[PostedInBaaN]'
                        WHEN 'PostedInBaaN DESC' THEN '[SPMT_ACVouchers].[PostedInBaaN] DESC'
                        WHEN 'BatchNo' THEN '[SPMT_ACVouchers].[BatchNo]'
                        WHEN 'BatchNo DESC' THEN '[SPMT_ACVouchers].[BatchNo] DESC'
                        WHEN 'BatchDate' THEN '[SPMT_ACVouchers].[BatchDate]'
                        WHEN 'BatchDate DESC' THEN '[SPMT_ACVouchers].[BatchDate] DESC'
                        WHEN 'DocumentNo' THEN '[SPMT_ACVouchers].[DocumentNo]'
                        WHEN 'DocumentNo DESC' THEN '[SPMT_ACVouchers].[DocumentNo] DESC'
                        WHEN 'ChequeNo' THEN '[SPMT_ACVouchers].[ChequeNo]'
                        WHEN 'ChequeNo DESC' THEN '[SPMT_ACVouchers].[ChequeNo] DESC'
                        WHEN 'ChequeDate' THEN '[SPMT_ACVouchers].[ChequeDate]'
                        WHEN 'ChequeDate DESC' THEN '[SPMT_ACVouchers].[ChequeDate] DESC'
                        WHEN 'PostedBy' THEN '[SPMT_ACVouchers].[PostedBy]'
                        WHEN 'PostedBy DESC' THEN '[SPMT_ACVouchers].[PostedBy] DESC'
                        WHEN 'PostedOn' THEN '[SPMT_ACVouchers].[PostedOn]'
                        WHEN 'PostedOn DESC' THEN '[SPMT_ACVouchers].[PostedOn] DESC'
                        WHEN 'PostingRemarks' THEN '[SPMT_ACVouchers].[PostingRemarks]'
                        WHEN 'PostingRemarks DESC' THEN '[SPMT_ACVouchers].[PostingRemarks] DESC'
                        WHEN 'PaidToSupplier' THEN '[SPMT_ACVouchers].[PaidToSupplier]'
                        WHEN 'PaidToSupplier DESC' THEN '[SPMT_ACVouchers].[PaidToSupplier] DESC'
                        WHEN 'PaidOn' THEN '[SPMT_ACVouchers].[PaidOn]'
                        WHEN 'PaidOn DESC' THEN '[SPMT_ACVouchers].[PaidOn] DESC'
                        WHEN 'PaidBy' THEN '[SPMT_ACVouchers].[PaidBy]'
                        WHEN 'PaidBy DESC' THEN '[SPMT_ACVouchers].[PaidBy] DESC'
                        WHEN 'PaidRemarks' THEN '[SPMT_ACVouchers].[PaidRemarks]'
                        WHEN 'PaidRemarks DESC' THEN '[SPMT_ACVouchers].[PaidRemarks] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'SPMT_Vendors4_Description' THEN '[SPMT_Vendors].[Description]'
                        WHEN 'SPMT_Vendors4_Description DESC' THEN '[SPMT_Vendors4].[Description] DESC'
                        ELSE '[SPMT_ACVouchers].[VoucherNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SPMT_ACVouchers].[VoucherNo] ,
		[SPMT_ACVouchers].[VoucherDate] ,
		[SPMT_ACVouchers].[VendorID] ,
		[SPMT_ACVouchers].[CreatedBy] ,
		[SPMT_ACVouchers].[CreatedOn] ,
		[SPMT_ACVouchers].[PostedInBaaN] ,
		[SPMT_ACVouchers].[BatchNo] ,
		[SPMT_ACVouchers].[BatchDate] ,
		[SPMT_ACVouchers].[DocumentNo] ,
		[SPMT_ACVouchers].[ChequeNo] ,
		[SPMT_ACVouchers].[ChequeDate] ,
		[SPMT_ACVouchers].[PostedBy] ,
		[SPMT_ACVouchers].[PostedOn] ,
		[SPMT_ACVouchers].[PostingRemarks] ,
		[SPMT_ACVouchers].[PaidToSupplier] ,
		[SPMT_ACVouchers].[PaidOn] ,
		[SPMT_ACVouchers].[PaidBy] ,
		[SPMT_ACVouchers].[PaidRemarks] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[SPMT_Vendors4].[Description] AS SPMT_Vendors4_Description 
  FROM [SPMT_ACVouchers] 
    	INNER JOIN #PageIndex
          ON [SPMT_ACVouchers].[VoucherNo] = #PageIndex.VoucherNo
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SPMT_ACVouchers].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [SPMT_ACVouchers].[PostedBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [SPMT_ACVouchers].[PaidBy] = [aspnet_Users3].[LoginID]
  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors4]
    ON [SPMT_ACVouchers].[VendorID] = [SPMT_Vendors4].[VendorID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
