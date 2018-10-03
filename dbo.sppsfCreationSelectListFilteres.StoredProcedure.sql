USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfCreationSelectListFilteres]
  @Filter_SerialNo Int,
  @Filter_SupplierCode NVarChar(9),
  @Filter_PSFStatus Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PSF_HSBCMain].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [PSF_HSBCMain] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [PSF_HSBCMain].[CreatedBy] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [PSF_HSBCMain].[ApprovedBy] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]'
  SET @LGSQL = @LGSQL + '    ON [PSF_HSBCMain].[ModifiedBy] = [HRM_Employees3].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PSF_Status] AS [PSF_Status4]'
  SET @LGSQL = @LGSQL + '    ON [PSF_HSBCMain].[PSFStatus] = [PSF_Status4].[PSFStatus]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PSF_Supplier] AS [PSF_Supplier5]'
  SET @LGSQL = @LGSQL + '    ON [PSF_HSBCMain].[SupplierCode] = [PSF_Supplier5].[SupplierID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PSF_HSBCMain].[SerialNo] = ' + STR(@Filter_SerialNo)
  IF (@Filter_SupplierCode > '') 
    SET @LGSQL = @LGSQL + ' AND [PSF_HSBCMain].[SupplierCode] = ''' + @Filter_SupplierCode + ''''
  IF (@Filter_PSFStatus > 0) 
    SET @LGSQL = @LGSQL + ' AND [PSF_HSBCMain].[PSFStatus] = ' + STR(@Filter_PSFStatus)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[PSF_HSBCMain].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PSF_HSBCMain].[SerialNo] DESC'
                        WHEN 'PaymentRequestNo' THEN '[PSF_HSBCMain].[PaymentRequestNo]'
                        WHEN 'PaymentRequestNo DESC' THEN '[PSF_HSBCMain].[PaymentRequestNo] DESC'
                        WHEN 'OurRefNo' THEN '[PSF_HSBCMain].[OurRefNo]'
                        WHEN 'OurRefNo DESC' THEN '[PSF_HSBCMain].[OurRefNo] DESC'
                        WHEN 'BankVoucherDate' THEN '[PSF_HSBCMain].[BankVoucherDate]'
                        WHEN 'BankVoucherDate DESC' THEN '[PSF_HSBCMain].[BankVoucherDate] DESC'
                        WHEN 'SupplierCode' THEN '[PSF_HSBCMain].[SupplierCode]'
                        WHEN 'SupplierCode DESC' THEN '[PSF_HSBCMain].[SupplierCode] DESC'
                        WHEN 'IRN' THEN '[PSF_HSBCMain].[IRN]'
                        WHEN 'IRN DESC' THEN '[PSF_HSBCMain].[IRN] DESC'
                        WHEN 'InvoiceNumber' THEN '[PSF_HSBCMain].[InvoiceNumber]'
                        WHEN 'InvoiceNumber DESC' THEN '[PSF_HSBCMain].[InvoiceNumber] DESC'
                        WHEN 'InvoiceDate' THEN '[PSF_HSBCMain].[InvoiceDate]'
                        WHEN 'InvoiceDate DESC' THEN '[PSF_HSBCMain].[InvoiceDate] DESC'
                        WHEN 'InvoiceAmount' THEN '[PSF_HSBCMain].[InvoiceAmount]'
                        WHEN 'InvoiceAmount DESC' THEN '[PSF_HSBCMain].[InvoiceAmount] DESC'
                        WHEN 'TotalAmountDisbursed' THEN '[PSF_HSBCMain].[TotalAmountDisbursed]'
                        WHEN 'TotalAmountDisbursed DESC' THEN '[PSF_HSBCMain].[TotalAmountDisbursed] DESC'
                        WHEN 'InterestForDays' THEN '[PSF_HSBCMain].[InterestForDays]'
                        WHEN 'InterestForDays DESC' THEN '[PSF_HSBCMain].[InterestForDays] DESC'
                        WHEN 'InterestAmount' THEN '[PSF_HSBCMain].[InterestAmount]'
                        WHEN 'InterestAmount DESC' THEN '[PSF_HSBCMain].[InterestAmount] DESC'
                        WHEN 'PDNNo' THEN '[PSF_HSBCMain].[PDNNo]'
                        WHEN 'PDNNo DESC' THEN '[PSF_HSBCMain].[PDNNo] DESC'
                        WHEN 'DueDate' THEN '[PSF_HSBCMain].[DueDate]'
                        WHEN 'DueDate DESC' THEN '[PSF_HSBCMain].[DueDate] DESC'
                        WHEN 'PaymentDateToBank' THEN '[PSF_HSBCMain].[PaymentDateToBank]'
                        WHEN 'PaymentDateToBank DESC' THEN '[PSF_HSBCMain].[PaymentDateToBank] DESC'
                        WHEN 'ChequeNoPaidToBank' THEN '[PSF_HSBCMain].[ChequeNoPaidToBank]'
                        WHEN 'ChequeNoPaidToBank DESC' THEN '[PSF_HSBCMain].[ChequeNoPaidToBank] DESC'
                        WHEN 'AmountInWords' THEN '[PSF_HSBCMain].[AmountInWords]'
                        WHEN 'AmountInWords DESC' THEN '[PSF_HSBCMain].[AmountInWords] DESC'
                        WHEN 'TDSAmount' THEN '[PSF_HSBCMain].[TDSAmount]'
                        WHEN 'TDSAmount DESC' THEN '[PSF_HSBCMain].[TDSAmount] DESC'
                        WHEN 'ServiceTax' THEN '[PSF_HSBCMain].[ServiceTax]'
                        WHEN 'ServiceTax DESC' THEN '[PSF_HSBCMain].[ServiceTax] DESC'
                        WHEN 'HSBCToVendor' THEN '[PSF_HSBCMain].[HSBCToVendor]'
                        WHEN 'HSBCToVendor DESC' THEN '[PSF_HSBCMain].[HSBCToVendor] DESC'
                        WHEN 'HSBCInterestDays' THEN '[PSF_HSBCMain].[HSBCInterestDays]'
                        WHEN 'HSBCInterestDays DESC' THEN '[PSF_HSBCMain].[HSBCInterestDays] DESC'
                        WHEN 'HSBCInterestAmountInStatement' THEN '[PSF_HSBCMain].[HSBCInterestAmountInStatement]'
                        WHEN 'HSBCInterestAmountInStatement DESC' THEN '[PSF_HSBCMain].[HSBCInterestAmountInStatement] DESC'
                        WHEN 'CreatedBy' THEN '[PSF_HSBCMain].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[PSF_HSBCMain].[CreatedBy] DESC'
                        WHEN 'CreatedOn' THEN '[PSF_HSBCMain].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[PSF_HSBCMain].[CreatedOn] DESC'
                        WHEN 'ApprovedBy' THEN '[PSF_HSBCMain].[ApprovedBy]'
                        WHEN 'ApprovedBy DESC' THEN '[PSF_HSBCMain].[ApprovedBy] DESC'
                        WHEN 'ApprovedOn' THEN '[PSF_HSBCMain].[ApprovedOn]'
                        WHEN 'ApprovedOn DESC' THEN '[PSF_HSBCMain].[ApprovedOn] DESC'
                        WHEN 'PSFStatus' THEN '[PSF_HSBCMain].[PSFStatus]'
                        WHEN 'PSFStatus DESC' THEN '[PSF_HSBCMain].[PSFStatus] DESC'
                        WHEN 'ModifiedBy' THEN '[PSF_HSBCMain].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[PSF_HSBCMain].[ModifiedBy] DESC'
                        WHEN 'ModifiedOn' THEN '[PSF_HSBCMain].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[PSF_HSBCMain].[ModifiedOn] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        WHEN 'HRM_Employees3_EmployeeName' THEN '[HRM_Employees3].[EmployeeName]'
                        WHEN 'HRM_Employees3_EmployeeName DESC' THEN '[HRM_Employees3].[EmployeeName] DESC'
                        WHEN 'PSF_Status4_Description' THEN '[PSF_Status4].[Description]'
                        WHEN 'PSF_Status4_Description DESC' THEN '[PSF_Status4].[Description] DESC'
                        WHEN 'PSF_Supplier5_SupplierName' THEN '[PSF_Supplier5].[SupplierName]'
                        WHEN 'PSF_Supplier5_SupplierName DESC' THEN '[PSF_Supplier5].[SupplierName] DESC'
                        ELSE '[PSF_HSBCMain].[SerialNo]'
                    END
  EXEC (@LGSQL)

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
