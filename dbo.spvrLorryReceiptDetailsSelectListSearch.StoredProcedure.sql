USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLorryReceiptDetailsSelectListSearch]
  @LoginID NVarChar(8),
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
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,MRNNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID, MRNNo, SerialNo)
  SELECT [VR_LorryReceiptDetails].[ProjectID], [VR_LorryReceiptDetails].[MRNNo], [VR_LorryReceiptDetails].[SerialNo] FROM [VR_LorryReceiptDetails]
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [VR_LorryReceiptDetails].[ProjectID] = [IDM_Projects1].[ProjectID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner2]
    ON [VR_LorryReceiptDetails].[SupplierID] = [VR_BusinessPartner2].[BPID]
  INNER JOIN [VR_LorryReceipts] AS [VR_LorryReceipts3]
    ON [VR_LorryReceiptDetails].[ProjectID] = [VR_LorryReceipts3].[ProjectID]
    AND [VR_LorryReceiptDetails].[MRNNo] = [VR_LorryReceipts3].[MRNNo]
 WHERE  
   ( 
         STR(ISNULL([VR_LorryReceiptDetails].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceiptDetails].[GRorLRNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceiptDetails].[SupplierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceiptDetails].[SupplierInvoiceNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_LorryReceiptDetails].[WeightAsPerInvoiceInKG], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_LorryReceiptDetails].[WeightReceived], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceiptDetails].[MaterialForm],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_LorryReceiptDetails].[NoOfPackagesAsPerInvoice], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_LorryReceiptDetails].[NoOfPackagesReceived], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceiptDetails].[CenvatInvoiceReceived],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceiptDetails].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceiptDetails].[ProjectID],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_LorryReceiptDetails].[MRNNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_LorryReceiptDetails].[SupplierName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [VR_LorryReceiptDetails].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [VR_LorryReceiptDetails].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'MRNNo' THEN [VR_LorryReceiptDetails].[MRNNo] END,
     CASE @OrderBy WHEN 'MRNNo DESC' THEN [VR_LorryReceiptDetails].[MRNNo] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [VR_LorryReceiptDetails].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [VR_LorryReceiptDetails].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'GRorLRNo' THEN [VR_LorryReceiptDetails].[GRorLRNo] END,
     CASE @OrderBy WHEN 'GRorLRNo DESC' THEN [VR_LorryReceiptDetails].[GRorLRNo] END DESC,
     CASE @OrderBy WHEN 'GRorLRDate' THEN [VR_LorryReceiptDetails].[GRorLRDate] END,
     CASE @OrderBy WHEN 'GRorLRDate DESC' THEN [VR_LorryReceiptDetails].[GRorLRDate] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [VR_LorryReceiptDetails].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [VR_LorryReceiptDetails].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'SupplierName' THEN [VR_LorryReceiptDetails].[SupplierName] END,
     CASE @OrderBy WHEN 'SupplierName DESC' THEN [VR_LorryReceiptDetails].[SupplierName] END DESC,
     CASE @OrderBy WHEN 'SupplierInvoiceNo' THEN [VR_LorryReceiptDetails].[SupplierInvoiceNo] END,
     CASE @OrderBy WHEN 'SupplierInvoiceNo DESC' THEN [VR_LorryReceiptDetails].[SupplierInvoiceNo] END DESC,
     CASE @OrderBy WHEN 'SupplierInvoiceDate' THEN [VR_LorryReceiptDetails].[SupplierInvoiceDate] END,
     CASE @OrderBy WHEN 'SupplierInvoiceDate DESC' THEN [VR_LorryReceiptDetails].[SupplierInvoiceDate] END DESC,
     CASE @OrderBy WHEN 'WeightAsPerInvoiceInKG' THEN [VR_LorryReceiptDetails].[WeightAsPerInvoiceInKG] END,
     CASE @OrderBy WHEN 'WeightAsPerInvoiceInKG DESC' THEN [VR_LorryReceiptDetails].[WeightAsPerInvoiceInKG] END DESC,
     CASE @OrderBy WHEN 'WeightReceived' THEN [VR_LorryReceiptDetails].[WeightReceived] END,
     CASE @OrderBy WHEN 'WeightReceived DESC' THEN [VR_LorryReceiptDetails].[WeightReceived] END DESC,
     CASE @OrderBy WHEN 'MaterialForm' THEN [VR_LorryReceiptDetails].[MaterialForm] END,
     CASE @OrderBy WHEN 'MaterialForm DESC' THEN [VR_LorryReceiptDetails].[MaterialForm] END DESC,
     CASE @OrderBy WHEN 'NoOfPackagesAsPerInvoice' THEN [VR_LorryReceiptDetails].[NoOfPackagesAsPerInvoice] END,
     CASE @OrderBy WHEN 'NoOfPackagesAsPerInvoice DESC' THEN [VR_LorryReceiptDetails].[NoOfPackagesAsPerInvoice] END DESC,
     CASE @OrderBy WHEN 'NoOfPackagesReceived' THEN [VR_LorryReceiptDetails].[NoOfPackagesReceived] END,
     CASE @OrderBy WHEN 'NoOfPackagesReceived DESC' THEN [VR_LorryReceiptDetails].[NoOfPackagesReceived] END DESC,
     CASE @OrderBy WHEN 'CenvatInvoiceReceived' THEN [VR_LorryReceiptDetails].[CenvatInvoiceReceived] END,
     CASE @OrderBy WHEN 'CenvatInvoiceReceived DESC' THEN [VR_LorryReceiptDetails].[CenvatInvoiceReceived] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [VR_LorryReceiptDetails].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [VR_LorryReceiptDetails].[Remarks] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects1_Description' THEN [IDM_Projects1].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects1_Description DESC' THEN [IDM_Projects1].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner2_BPName' THEN [VR_BusinessPartner2].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner2_BPName DESC' THEN [VR_BusinessPartner2].[BPName] END DESC,
     CASE @OrderBy WHEN 'VR_LorryReceipts3_WayBillFormNo' THEN [VR_LorryReceipts3].[WayBillFormNo] END,
     CASE @OrderBy WHEN 'VR_LorryReceipts3_WayBillFormNo DESC' THEN [VR_LorryReceipts3].[WayBillFormNo] END DESC 

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
  LEFT OUTER  JOIN [VR_BusinessPartner] AS [VR_BusinessPartner2]
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
