USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLorryReceiptDetailsSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @Filter_MRNNo Int,
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
 ,ProjectID NVarChar(6) NOT NULL
 ,MRNNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', MRNNo'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_LorryReceiptDetails].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [VR_LorryReceiptDetails].[MRNNo]'
  SET @LGSQL = @LGSQL + ', [VR_LorryReceiptDetails].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [VR_LorryReceiptDetails] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [VR_LorryReceiptDetails].[ProjectID] = [IDM_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner2]'
  SET @LGSQL = @LGSQL + '    ON [VR_LorryReceiptDetails].[SupplierID] = [VR_BusinessPartner2].[BPID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [VR_LorryReceipts] AS [VR_LorryReceipts3]'
  SET @LGSQL = @LGSQL + '    ON [VR_LorryReceiptDetails].[ProjectID] = [VR_LorryReceipts3].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [VR_LorryReceiptDetails].[MRNNo] = [VR_LorryReceipts3].[MRNNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_LorryReceiptDetails].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_MRNNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [VR_LorryReceiptDetails].[MRNNo] = ' + STR(@Filter_MRNNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[VR_LorryReceiptDetails].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[VR_LorryReceiptDetails].[ProjectID] DESC'
                        WHEN 'MRNNo' THEN '[VR_LorryReceiptDetails].[MRNNo]'
                        WHEN 'MRNNo DESC' THEN '[VR_LorryReceiptDetails].[MRNNo] DESC'
                        WHEN 'SerialNo' THEN '[VR_LorryReceiptDetails].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[VR_LorryReceiptDetails].[SerialNo] DESC'
                        WHEN 'GRorLRNo' THEN '[VR_LorryReceiptDetails].[GRorLRNo]'
                        WHEN 'GRorLRNo DESC' THEN '[VR_LorryReceiptDetails].[GRorLRNo] DESC'
                        WHEN 'GRorLRDate' THEN '[VR_LorryReceiptDetails].[GRorLRDate]'
                        WHEN 'GRorLRDate DESC' THEN '[VR_LorryReceiptDetails].[GRorLRDate] DESC'
                        WHEN 'SupplierID' THEN '[VR_LorryReceiptDetails].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[VR_LorryReceiptDetails].[SupplierID] DESC'
                        WHEN 'SupplierName' THEN '[VR_LorryReceiptDetails].[SupplierName]'
                        WHEN 'SupplierName DESC' THEN '[VR_LorryReceiptDetails].[SupplierName] DESC'
                        WHEN 'SupplierInvoiceNo' THEN '[VR_LorryReceiptDetails].[SupplierInvoiceNo]'
                        WHEN 'SupplierInvoiceNo DESC' THEN '[VR_LorryReceiptDetails].[SupplierInvoiceNo] DESC'
                        WHEN 'SupplierInvoiceDate' THEN '[VR_LorryReceiptDetails].[SupplierInvoiceDate]'
                        WHEN 'SupplierInvoiceDate DESC' THEN '[VR_LorryReceiptDetails].[SupplierInvoiceDate] DESC'
                        WHEN 'WeightAsPerInvoiceInKG' THEN '[VR_LorryReceiptDetails].[WeightAsPerInvoiceInKG]'
                        WHEN 'WeightAsPerInvoiceInKG DESC' THEN '[VR_LorryReceiptDetails].[WeightAsPerInvoiceInKG] DESC'
                        WHEN 'WeightReceived' THEN '[VR_LorryReceiptDetails].[WeightReceived]'
                        WHEN 'WeightReceived DESC' THEN '[VR_LorryReceiptDetails].[WeightReceived] DESC'
                        WHEN 'MaterialForm' THEN '[VR_LorryReceiptDetails].[MaterialForm]'
                        WHEN 'MaterialForm DESC' THEN '[VR_LorryReceiptDetails].[MaterialForm] DESC'
                        WHEN 'NoOfPackagesAsPerInvoice' THEN '[VR_LorryReceiptDetails].[NoOfPackagesAsPerInvoice]'
                        WHEN 'NoOfPackagesAsPerInvoice DESC' THEN '[VR_LorryReceiptDetails].[NoOfPackagesAsPerInvoice] DESC'
                        WHEN 'NoOfPackagesReceived' THEN '[VR_LorryReceiptDetails].[NoOfPackagesReceived]'
                        WHEN 'NoOfPackagesReceived DESC' THEN '[VR_LorryReceiptDetails].[NoOfPackagesReceived] DESC'
                        WHEN 'CenvatInvoiceReceived' THEN '[VR_LorryReceiptDetails].[CenvatInvoiceReceived]'
                        WHEN 'CenvatInvoiceReceived DESC' THEN '[VR_LorryReceiptDetails].[CenvatInvoiceReceived] DESC'
                        WHEN 'Remarks' THEN '[VR_LorryReceiptDetails].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[VR_LorryReceiptDetails].[Remarks] DESC'
                        WHEN 'IDM_Projects1_Description' THEN '[IDM_Projects1].[Description]'
                        WHEN 'IDM_Projects1_Description DESC' THEN '[IDM_Projects1].[Description] DESC'
                        WHEN 'VR_BusinessPartner2_BPName' THEN '[VR_BusinessPartner2].[BPName]'
                        WHEN 'VR_BusinessPartner2_BPName DESC' THEN '[VR_BusinessPartner2].[BPName] DESC'
                        WHEN 'VR_LorryReceipts3_WayBillFormNo' THEN '[VR_LorryReceipts3].[WayBillFormNo]'
                        WHEN 'VR_LorryReceipts3_WayBillFormNo DESC' THEN '[VR_LorryReceipts3].[WayBillFormNo] DESC'
                        ELSE '[VR_LorryReceiptDetails].[ProjectID],[VR_LorryReceiptDetails].[MRNNo],[VR_LorryReceiptDetails].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [VR_LorryReceiptDetails].* ,
    [IDM_Projects1].[Description] AS IDM_Projects1_Description,
    [VR_BusinessPartner2].[BPName] AS VR_BusinessPartner2_BPName,
    [VR_LorryReceipts3].[WayBillFormNo] AS VR_LorryReceipts3_WayBillFormNo 
  FROM [VR_LorryReceiptDetails] 
      INNER JOIN #PageIndex
          ON [VR_LorryReceiptDetails].[ProjectID] = #PageIndex.ProjectID
          AND [VR_LorryReceiptDetails].[MRNNo] = #PageIndex.MRNNo
          AND [VR_LorryReceiptDetails].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [VR_LorryReceiptDetails].[ProjectID] = [IDM_Projects1].[ProjectID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner2]
    ON [VR_LorryReceiptDetails].[SupplierID] = [VR_BusinessPartner2].[BPID]
  INNER JOIN [VR_LorryReceipts] AS [VR_LorryReceipts3]
    ON [VR_LorryReceiptDetails].[ProjectID] = [VR_LorryReceipts3].[ProjectID]
    AND [VR_LorryReceiptDetails].[MRNNo] = [VR_LorryReceipts3].[MRNNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
