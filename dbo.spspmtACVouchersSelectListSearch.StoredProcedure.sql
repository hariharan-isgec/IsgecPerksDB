USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtACVouchersSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,VoucherNo Int NOT NULL
  )
  INSERT INTO #PageIndex (VoucherNo)
  SELECT [SPMT_ACVouchers].[VoucherNo] FROM [SPMT_ACVouchers]
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SPMT_ACVouchers].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [SPMT_ACVouchers].[PostedBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [SPMT_ACVouchers].[PaidBy] = [aspnet_Users3].[LoginID]
  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors4]
    ON [SPMT_ACVouchers].[VendorID] = [SPMT_Vendors4].[VendorID]
 WHERE  
   ( 
         STR(ISNULL([SPMT_ACVouchers].[VoucherNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_ACVouchers].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_ACVouchers].[CreatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_ACVouchers].[BatchNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_ACVouchers].[DocumentNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_ACVouchers].[ChequeNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_ACVouchers].[PostedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_ACVouchers].[PostingRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_ACVouchers].[PaidBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_ACVouchers].[PaidRemarks],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'VoucherNo' THEN [SPMT_ACVouchers].[VoucherNo] END,
     CASE @orderBy WHEN 'VoucherNo DESC' THEN [SPMT_ACVouchers].[VoucherNo] END DESC,
     CASE @orderBy WHEN 'VoucherDate' THEN [SPMT_ACVouchers].[VoucherDate] END,
     CASE @orderBy WHEN 'VoucherDate DESC' THEN [SPMT_ACVouchers].[VoucherDate] END DESC,
     CASE @orderBy WHEN 'VendorID' THEN [SPMT_ACVouchers].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [SPMT_ACVouchers].[VendorID] END DESC,
     CASE @orderBy WHEN 'CreatedBy' THEN [SPMT_ACVouchers].[CreatedBy] END,
     CASE @orderBy WHEN 'CreatedBy DESC' THEN [SPMT_ACVouchers].[CreatedBy] END DESC,
     CASE @orderBy WHEN 'CreatedOn' THEN [SPMT_ACVouchers].[CreatedOn] END,
     CASE @orderBy WHEN 'CreatedOn DESC' THEN [SPMT_ACVouchers].[CreatedOn] END DESC,
     CASE @orderBy WHEN 'PostedInBaaN' THEN [SPMT_ACVouchers].[PostedInBaaN] END,
     CASE @orderBy WHEN 'PostedInBaaN DESC' THEN [SPMT_ACVouchers].[PostedInBaaN] END DESC,
     CASE @orderBy WHEN 'BatchNo' THEN [SPMT_ACVouchers].[BatchNo] END,
     CASE @orderBy WHEN 'BatchNo DESC' THEN [SPMT_ACVouchers].[BatchNo] END DESC,
     CASE @orderBy WHEN 'BatchDate' THEN [SPMT_ACVouchers].[BatchDate] END,
     CASE @orderBy WHEN 'BatchDate DESC' THEN [SPMT_ACVouchers].[BatchDate] END DESC,
     CASE @orderBy WHEN 'DocumentNo' THEN [SPMT_ACVouchers].[DocumentNo] END,
     CASE @orderBy WHEN 'DocumentNo DESC' THEN [SPMT_ACVouchers].[DocumentNo] END DESC,
     CASE @orderBy WHEN 'ChequeNo' THEN [SPMT_ACVouchers].[ChequeNo] END,
     CASE @orderBy WHEN 'ChequeNo DESC' THEN [SPMT_ACVouchers].[ChequeNo] END DESC,
     CASE @orderBy WHEN 'ChequeDate' THEN [SPMT_ACVouchers].[ChequeDate] END,
     CASE @orderBy WHEN 'ChequeDate DESC' THEN [SPMT_ACVouchers].[ChequeDate] END DESC,
     CASE @orderBy WHEN 'PostedBy' THEN [SPMT_ACVouchers].[PostedBy] END,
     CASE @orderBy WHEN 'PostedBy DESC' THEN [SPMT_ACVouchers].[PostedBy] END DESC,
     CASE @orderBy WHEN 'PostedOn' THEN [SPMT_ACVouchers].[PostedOn] END,
     CASE @orderBy WHEN 'PostedOn DESC' THEN [SPMT_ACVouchers].[PostedOn] END DESC,
     CASE @orderBy WHEN 'PostingRemarks' THEN [SPMT_ACVouchers].[PostingRemarks] END,
     CASE @orderBy WHEN 'PostingRemarks DESC' THEN [SPMT_ACVouchers].[PostingRemarks] END DESC,
     CASE @orderBy WHEN 'PaidToSupplier' THEN [SPMT_ACVouchers].[PaidToSupplier] END,
     CASE @orderBy WHEN 'PaidToSupplier DESC' THEN [SPMT_ACVouchers].[PaidToSupplier] END DESC,
     CASE @orderBy WHEN 'PaidOn' THEN [SPMT_ACVouchers].[PaidOn] END,
     CASE @orderBy WHEN 'PaidOn DESC' THEN [SPMT_ACVouchers].[PaidOn] END DESC,
     CASE @orderBy WHEN 'PaidBy' THEN [SPMT_ACVouchers].[PaidBy] END,
     CASE @orderBy WHEN 'PaidBy DESC' THEN [SPMT_ACVouchers].[PaidBy] END DESC,
     CASE @orderBy WHEN 'PaidRemarks' THEN [SPMT_ACVouchers].[PaidRemarks] END,
     CASE @orderBy WHEN 'PaidRemarks DESC' THEN [SPMT_ACVouchers].[PaidRemarks] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @orderBy WHEN 'SPMT_Vendors4_Description' THEN [SPMT_Vendors4].[Description] END,
     CASE @orderBy WHEN 'SPMT_Vendors4_Description DESC' THEN [SPMT_Vendors4].[Description] END DESC 

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
