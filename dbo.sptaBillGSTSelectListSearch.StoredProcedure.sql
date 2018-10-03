USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBillGSTSelectListSearch]
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
 ,TABillNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (TABillNo, SerialNo)
  SELECT [TA_BillGST].[TABillNo], [TA_BillGST].[SerialNo] FROM [TA_BillGST]
  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes1]
    ON [TA_BillGST].[BillType] = [SPMT_BillTypes1].[BillType]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates2]
    ON [TA_BillGST].[StateID] = [SPMT_ERPStates2].[StateID]
  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes3]
    ON [TA_BillGST].[BillType] = [SPMT_HSNSACCodes3].[BillType]
    AND [TA_BillGST].[HSNSACCode] = [SPMT_HSNSACCodes3].[HSNSACCode]
  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN4]
    ON [TA_BillGST].[IsgecGSTIN] = [SPMT_IsgecGSTIN4].[GSTID]
  INNER JOIN [TA_BillDetails] AS [TA_BillDetails5]
    ON [TA_BillGST].[TABillNo] = [TA_BillDetails5].[TABillNo]
    AND [TA_BillGST].[SerialNo] = [TA_BillDetails5].[SerialNo]
  INNER JOIN [TA_Bills] AS [TA_Bills6]
    ON [TA_BillGST].[TABillNo] = [TA_Bills6].[TABillNo]
  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN7]
    ON [TA_BillGST].[BPID] = [VR_BPGSTIN7].[BPID]
    AND [TA_BillGST].[SupplierGSTIN] = [VR_BPGSTIN7].[GSTIN]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner8]
    ON [TA_BillGST].[BPID] = [VR_BusinessPartner8].[BPID]
 WHERE  
   ( 
         STR(ISNULL([TA_BillGST].[TABillNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillGST].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillGST].[IsgecGSTIN], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillGST].[BillNumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillGST].[BPID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillGST].[SupplierGSTIN], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillGST].[SupplierGSTINNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillGST].[StateID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillGST].[BillType], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillGST].[HSNSACCode],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillGST].[AssessableValue], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillGST].[IGSTRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillGST].[IGSTAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillGST].[SGSTRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillGST].[SGSTAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillGST].[CGSTRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillGST].[CGSTAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillGST].[CessRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillGST].[CessAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillGST].[TotalGST], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_BillGST].[TotalAmount], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'TABillNo' THEN [TA_BillGST].[TABillNo] END,
     CASE @OrderBy WHEN 'TABillNo DESC' THEN [TA_BillGST].[TABillNo] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [TA_BillGST].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [TA_BillGST].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'IsgecGSTIN' THEN [TA_BillGST].[IsgecGSTIN] END,
     CASE @OrderBy WHEN 'IsgecGSTIN DESC' THEN [TA_BillGST].[IsgecGSTIN] END DESC,
     CASE @OrderBy WHEN 'BillNumber' THEN [TA_BillGST].[BillNumber] END,
     CASE @OrderBy WHEN 'BillNumber DESC' THEN [TA_BillGST].[BillNumber] END DESC,
     CASE @OrderBy WHEN 'BillDate' THEN [TA_BillGST].[BillDate] END,
     CASE @OrderBy WHEN 'BillDate DESC' THEN [TA_BillGST].[BillDate] END DESC,
     CASE @OrderBy WHEN 'BPID' THEN [TA_BillGST].[BPID] END,
     CASE @OrderBy WHEN 'BPID DESC' THEN [TA_BillGST].[BPID] END DESC,
     CASE @OrderBy WHEN 'SupplierGSTIN' THEN [TA_BillGST].[SupplierGSTIN] END,
     CASE @OrderBy WHEN 'SupplierGSTIN DESC' THEN [TA_BillGST].[SupplierGSTIN] END DESC,
     CASE @OrderBy WHEN 'SupplierGSTINNo' THEN [TA_BillGST].[SupplierGSTINNo] END,
     CASE @OrderBy WHEN 'SupplierGSTINNo DESC' THEN [TA_BillGST].[SupplierGSTINNo] END DESC,
     CASE @OrderBy WHEN 'StateID' THEN [TA_BillGST].[StateID] END,
     CASE @OrderBy WHEN 'StateID DESC' THEN [TA_BillGST].[StateID] END DESC,
     CASE @OrderBy WHEN 'BillType' THEN [TA_BillGST].[BillType] END,
     CASE @OrderBy WHEN 'BillType DESC' THEN [TA_BillGST].[BillType] END DESC,
     CASE @OrderBy WHEN 'HSNSACCode' THEN [TA_BillGST].[HSNSACCode] END,
     CASE @OrderBy WHEN 'HSNSACCode DESC' THEN [TA_BillGST].[HSNSACCode] END DESC,
     CASE @OrderBy WHEN 'AssessableValue' THEN [TA_BillGST].[AssessableValue] END,
     CASE @OrderBy WHEN 'AssessableValue DESC' THEN [TA_BillGST].[AssessableValue] END DESC,
     CASE @OrderBy WHEN 'IGSTRate' THEN [TA_BillGST].[IGSTRate] END,
     CASE @OrderBy WHEN 'IGSTRate DESC' THEN [TA_BillGST].[IGSTRate] END DESC,
     CASE @OrderBy WHEN 'IGSTAmount' THEN [TA_BillGST].[IGSTAmount] END,
     CASE @OrderBy WHEN 'IGSTAmount DESC' THEN [TA_BillGST].[IGSTAmount] END DESC,
     CASE @OrderBy WHEN 'SGSTRate' THEN [TA_BillGST].[SGSTRate] END,
     CASE @OrderBy WHEN 'SGSTRate DESC' THEN [TA_BillGST].[SGSTRate] END DESC,
     CASE @OrderBy WHEN 'SGSTAmount' THEN [TA_BillGST].[SGSTAmount] END,
     CASE @OrderBy WHEN 'SGSTAmount DESC' THEN [TA_BillGST].[SGSTAmount] END DESC,
     CASE @OrderBy WHEN 'CGSTRate' THEN [TA_BillGST].[CGSTRate] END,
     CASE @OrderBy WHEN 'CGSTRate DESC' THEN [TA_BillGST].[CGSTRate] END DESC,
     CASE @OrderBy WHEN 'CGSTAmount' THEN [TA_BillGST].[CGSTAmount] END,
     CASE @OrderBy WHEN 'CGSTAmount DESC' THEN [TA_BillGST].[CGSTAmount] END DESC,
     CASE @OrderBy WHEN 'CessRate' THEN [TA_BillGST].[CessRate] END,
     CASE @OrderBy WHEN 'CessRate DESC' THEN [TA_BillGST].[CessRate] END DESC,
     CASE @OrderBy WHEN 'CessAmount' THEN [TA_BillGST].[CessAmount] END,
     CASE @OrderBy WHEN 'CessAmount DESC' THEN [TA_BillGST].[CessAmount] END DESC,
     CASE @OrderBy WHEN 'TotalGST' THEN [TA_BillGST].[TotalGST] END,
     CASE @OrderBy WHEN 'TotalGST DESC' THEN [TA_BillGST].[TotalGST] END DESC,
     CASE @OrderBy WHEN 'TotalAmount' THEN [TA_BillGST].[TotalAmount] END,
     CASE @OrderBy WHEN 'TotalAmount DESC' THEN [TA_BillGST].[TotalAmount] END DESC,
     CASE @OrderBy WHEN 'SPMT_BillTypes1_Description' THEN [SPMT_BillTypes1].[Description] END,
     CASE @OrderBy WHEN 'SPMT_BillTypes1_Description DESC' THEN [SPMT_BillTypes1].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPStates2_Description' THEN [SPMT_ERPStates2].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPStates2_Description DESC' THEN [SPMT_ERPStates2].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_HSNSACCodes3_HSNSACCode' THEN [SPMT_HSNSACCodes3].[HSNSACCode] END,
     CASE @OrderBy WHEN 'SPMT_HSNSACCodes3_HSNSACCode DESC' THEN [SPMT_HSNSACCodes3].[HSNSACCode] END DESC,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN4_Description' THEN [SPMT_IsgecGSTIN4].[Description] END,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN4_Description DESC' THEN [SPMT_IsgecGSTIN4].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_Bills6_PurposeOfJourney' THEN [TA_Bills6].[PurposeOfJourney] END,
     CASE @OrderBy WHEN 'TA_Bills6_PurposeOfJourney DESC' THEN [TA_Bills6].[PurposeOfJourney] END DESC,
     CASE @OrderBy WHEN 'VR_BPGSTIN7_Description' THEN [VR_BPGSTIN7].[Description] END,
     CASE @OrderBy WHEN 'VR_BPGSTIN7_Description DESC' THEN [VR_BPGSTIN7].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner8_BPName' THEN [VR_BusinessPartner8].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner8_BPName DESC' THEN [VR_BusinessPartner8].[BPName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [TA_BillGST].* ,
    [SPMT_BillTypes1].[Description] AS SPMT_BillTypes1_Description,
    [SPMT_ERPStates2].[Description] AS SPMT_ERPStates2_Description,
    [SPMT_HSNSACCodes3].[HSNSACCode] AS SPMT_HSNSACCodes3_HSNSACCode,
    [SPMT_IsgecGSTIN4].[Description] AS SPMT_IsgecGSTIN4_Description,
    [TA_Bills6].[PurposeOfJourney] AS TA_Bills6_PurposeOfJourney,
    [VR_BPGSTIN7].[Description] AS VR_BPGSTIN7_Description,
    [VR_BusinessPartner8].[BPName] AS VR_BusinessPartner8_BPName 
  FROM [TA_BillGST] 
      INNER JOIN #PageIndex
          ON [TA_BillGST].[TABillNo] = #PageIndex.TABillNo
          AND [TA_BillGST].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes1]
    ON [TA_BillGST].[BillType] = [SPMT_BillTypes1].[BillType]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates2]
    ON [TA_BillGST].[StateID] = [SPMT_ERPStates2].[StateID]
  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes3]
    ON [TA_BillGST].[BillType] = [SPMT_HSNSACCodes3].[BillType]
    AND [TA_BillGST].[HSNSACCode] = [SPMT_HSNSACCodes3].[HSNSACCode]
  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN4]
    ON [TA_BillGST].[IsgecGSTIN] = [SPMT_IsgecGSTIN4].[GSTID]
  INNER JOIN [TA_BillDetails] AS [TA_BillDetails5]
    ON [TA_BillGST].[TABillNo] = [TA_BillDetails5].[TABillNo]
    AND [TA_BillGST].[SerialNo] = [TA_BillDetails5].[SerialNo]
  INNER JOIN [TA_Bills] AS [TA_Bills6]
    ON [TA_BillGST].[TABillNo] = [TA_Bills6].[TABillNo]
  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN7]
    ON [TA_BillGST].[BPID] = [VR_BPGSTIN7].[BPID]
    AND [TA_BillGST].[SupplierGSTIN] = [VR_BPGSTIN7].[GSTIN]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner8]
    ON [TA_BillGST].[BPID] = [VR_BusinessPartner8].[BPID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
