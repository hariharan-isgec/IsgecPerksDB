USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfApprovedSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @PSFStatus Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo)
  SELECT [PSF_HSBCMain].[SerialNo] FROM [PSF_HSBCMain]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PSF_HSBCMain].[CreatedBy] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [PSF_HSBCMain].[ApprovedBy] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [PSF_HSBCMain].[ModifiedBy] = [HRM_Employees3].[CardNo]
  INNER JOIN [PSF_Status] AS [PSF_Status4]
    ON [PSF_HSBCMain].[PSFStatus] = [PSF_Status4].[PSFStatus]
  INNER JOIN [PSF_Supplier] AS [PSF_Supplier5]
    ON [PSF_HSBCMain].[SupplierCode] = [PSF_Supplier5].[SupplierID]
 WHERE  
      [PSF_HSBCMain].[PSFStatus] = (@PSFStatus)
   AND ( 
         STR(ISNULL([PSF_HSBCMain].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_HSBCMain].[PaymentRequestNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_HSBCMain].[OurRefNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_HSBCMain].[SupplierCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_HSBCMain].[IRN],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_HSBCMain].[InvoiceNumber],'')) LIKE @KeyWord1
     OR STR(ISNULL([PSF_HSBCMain].[InvoiceAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PSF_HSBCMain].[TotalAmountDisbursed], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PSF_HSBCMain].[InterestForDays], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PSF_HSBCMain].[InterestAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_HSBCMain].[PDNNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_HSBCMain].[ChequeNoPaidToBank],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_HSBCMain].[AmountInWords],'')) LIKE @KeyWord1
     OR STR(ISNULL([PSF_HSBCMain].[TDSAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PSF_HSBCMain].[ServiceTax], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PSF_HSBCMain].[HSBCInterestDays], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PSF_HSBCMain].[HSBCInterestAmountInStatement], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_HSBCMain].[CreatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_HSBCMain].[ApprovedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([PSF_HSBCMain].[PSFStatus], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_HSBCMain].[ModifiedBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [PSF_HSBCMain].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [PSF_HSBCMain].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'PaymentRequestNo' THEN [PSF_HSBCMain].[PaymentRequestNo] END,
     CASE @OrderBy WHEN 'PaymentRequestNo DESC' THEN [PSF_HSBCMain].[PaymentRequestNo] END DESC,
     CASE @OrderBy WHEN 'OurRefNo' THEN [PSF_HSBCMain].[OurRefNo] END,
     CASE @OrderBy WHEN 'OurRefNo DESC' THEN [PSF_HSBCMain].[OurRefNo] END DESC,
     CASE @OrderBy WHEN 'BankVoucherDate' THEN [PSF_HSBCMain].[BankVoucherDate] END,
     CASE @OrderBy WHEN 'BankVoucherDate DESC' THEN [PSF_HSBCMain].[BankVoucherDate] END DESC,
     CASE @OrderBy WHEN 'SupplierCode' THEN [PSF_HSBCMain].[SupplierCode] END,
     CASE @OrderBy WHEN 'SupplierCode DESC' THEN [PSF_HSBCMain].[SupplierCode] END DESC,
     CASE @OrderBy WHEN 'IRN' THEN [PSF_HSBCMain].[IRN] END,
     CASE @OrderBy WHEN 'IRN DESC' THEN [PSF_HSBCMain].[IRN] END DESC,
     CASE @OrderBy WHEN 'InvoiceNumber' THEN [PSF_HSBCMain].[InvoiceNumber] END,
     CASE @OrderBy WHEN 'InvoiceNumber DESC' THEN [PSF_HSBCMain].[InvoiceNumber] END DESC,
     CASE @OrderBy WHEN 'InvoiceDate' THEN [PSF_HSBCMain].[InvoiceDate] END,
     CASE @OrderBy WHEN 'InvoiceDate DESC' THEN [PSF_HSBCMain].[InvoiceDate] END DESC,
     CASE @OrderBy WHEN 'InvoiceAmount' THEN [PSF_HSBCMain].[InvoiceAmount] END,
     CASE @OrderBy WHEN 'InvoiceAmount DESC' THEN [PSF_HSBCMain].[InvoiceAmount] END DESC,
     CASE @OrderBy WHEN 'TotalAmountDisbursed' THEN [PSF_HSBCMain].[TotalAmountDisbursed] END,
     CASE @OrderBy WHEN 'TotalAmountDisbursed DESC' THEN [PSF_HSBCMain].[TotalAmountDisbursed] END DESC,
     CASE @OrderBy WHEN 'InterestForDays' THEN [PSF_HSBCMain].[InterestForDays] END,
     CASE @OrderBy WHEN 'InterestForDays DESC' THEN [PSF_HSBCMain].[InterestForDays] END DESC,
     CASE @OrderBy WHEN 'InterestAmount' THEN [PSF_HSBCMain].[InterestAmount] END,
     CASE @OrderBy WHEN 'InterestAmount DESC' THEN [PSF_HSBCMain].[InterestAmount] END DESC,
     CASE @OrderBy WHEN 'PDNNo' THEN [PSF_HSBCMain].[PDNNo] END,
     CASE @OrderBy WHEN 'PDNNo DESC' THEN [PSF_HSBCMain].[PDNNo] END DESC,
     CASE @OrderBy WHEN 'DueDate' THEN [PSF_HSBCMain].[DueDate] END,
     CASE @OrderBy WHEN 'DueDate DESC' THEN [PSF_HSBCMain].[DueDate] END DESC,
     CASE @OrderBy WHEN 'PaymentDateToBank' THEN [PSF_HSBCMain].[PaymentDateToBank] END,
     CASE @OrderBy WHEN 'PaymentDateToBank DESC' THEN [PSF_HSBCMain].[PaymentDateToBank] END DESC,
     CASE @OrderBy WHEN 'ChequeNoPaidToBank' THEN [PSF_HSBCMain].[ChequeNoPaidToBank] END,
     CASE @OrderBy WHEN 'ChequeNoPaidToBank DESC' THEN [PSF_HSBCMain].[ChequeNoPaidToBank] END DESC,
     CASE @OrderBy WHEN 'AmountInWords' THEN [PSF_HSBCMain].[AmountInWords] END,
     CASE @OrderBy WHEN 'AmountInWords DESC' THEN [PSF_HSBCMain].[AmountInWords] END DESC,
     CASE @OrderBy WHEN 'TDSAmount' THEN [PSF_HSBCMain].[TDSAmount] END,
     CASE @OrderBy WHEN 'TDSAmount DESC' THEN [PSF_HSBCMain].[TDSAmount] END DESC,
     CASE @OrderBy WHEN 'ServiceTax' THEN [PSF_HSBCMain].[ServiceTax] END,
     CASE @OrderBy WHEN 'ServiceTax DESC' THEN [PSF_HSBCMain].[ServiceTax] END DESC,
     CASE @OrderBy WHEN 'HSBCToVendor' THEN [PSF_HSBCMain].[HSBCToVendor] END,
     CASE @OrderBy WHEN 'HSBCToVendor DESC' THEN [PSF_HSBCMain].[HSBCToVendor] END DESC,
     CASE @OrderBy WHEN 'HSBCInterestDays' THEN [PSF_HSBCMain].[HSBCInterestDays] END,
     CASE @OrderBy WHEN 'HSBCInterestDays DESC' THEN [PSF_HSBCMain].[HSBCInterestDays] END DESC,
     CASE @OrderBy WHEN 'HSBCInterestAmountInStatement' THEN [PSF_HSBCMain].[HSBCInterestAmountInStatement] END,
     CASE @OrderBy WHEN 'HSBCInterestAmountInStatement DESC' THEN [PSF_HSBCMain].[HSBCInterestAmountInStatement] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [PSF_HSBCMain].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [PSF_HSBCMain].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [PSF_HSBCMain].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [PSF_HSBCMain].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'ApprovedBy' THEN [PSF_HSBCMain].[ApprovedBy] END,
     CASE @OrderBy WHEN 'ApprovedBy DESC' THEN [PSF_HSBCMain].[ApprovedBy] END DESC,
     CASE @OrderBy WHEN 'ApprovedOn' THEN [PSF_HSBCMain].[ApprovedOn] END,
     CASE @OrderBy WHEN 'ApprovedOn DESC' THEN [PSF_HSBCMain].[ApprovedOn] END DESC,
     CASE @OrderBy WHEN 'PSFStatus' THEN [PSF_HSBCMain].[PSFStatus] END,
     CASE @OrderBy WHEN 'PSFStatus DESC' THEN [PSF_HSBCMain].[PSFStatus] END DESC,
     CASE @OrderBy WHEN 'ModifiedBy' THEN [PSF_HSBCMain].[ModifiedBy] END,
     CASE @OrderBy WHEN 'ModifiedBy DESC' THEN [PSF_HSBCMain].[ModifiedBy] END DESC,
     CASE @OrderBy WHEN 'ModifiedOn' THEN [PSF_HSBCMain].[ModifiedOn] END,
     CASE @OrderBy WHEN 'ModifiedOn DESC' THEN [PSF_HSBCMain].[ModifiedOn] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees3_EmployeeName' THEN [HRM_Employees3].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees3_EmployeeName DESC' THEN [HRM_Employees3].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'PSF_Status4_Description' THEN [PSF_Status4].[Description] END,
     CASE @OrderBy WHEN 'PSF_Status4_Description DESC' THEN [PSF_Status4].[Description] END DESC,
     CASE @OrderBy WHEN 'PSF_Supplier5_SupplierName' THEN [PSF_Supplier5].[SupplierName] END,
     CASE @OrderBy WHEN 'PSF_Supplier5_SupplierName DESC' THEN [PSF_Supplier5].[SupplierName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PSF_HSBCMain].* ,
    [HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
    [HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
    [HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
    [PSF_Status4].[Description] AS PSF_Status4_Description,
    [PSF_Supplier5].[SupplierName] AS PSF_Supplier5_SupplierName 
  FROM [PSF_HSBCMain] 
      INNER JOIN #PageIndex
          ON [PSF_HSBCMain].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PSF_HSBCMain].[CreatedBy] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [PSF_HSBCMain].[ApprovedBy] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [PSF_HSBCMain].[ModifiedBy] = [HRM_Employees3].[CardNo]
  INNER JOIN [PSF_Status] AS [PSF_Status4]
    ON [PSF_HSBCMain].[PSFStatus] = [PSF_Status4].[PSFStatus]
  INNER JOIN [PSF_Supplier] AS [PSF_Supplier5]
    ON [PSF_HSBCMain].[SupplierCode] = [PSF_Supplier5].[SupplierID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
