USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBillGSTSelectListFilteres]
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
 ,TABillNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TABillNo'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_BillGST].[TABillNo]'
  SET @LGSQL = @LGSQL + ', [TA_BillGST].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [TA_BillGST] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes1]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillGST].[BillType] = [SPMT_BillTypes1].[BillType]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates2]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillGST].[StateID] = [SPMT_ERPStates2].[StateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes3]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillGST].[BillType] = [SPMT_HSNSACCodes3].[BillType]'
  SET @LGSQL = @LGSQL + '    AND [TA_BillGST].[HSNSACCode] = [SPMT_HSNSACCodes3].[HSNSACCode]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN4]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillGST].[IsgecGSTIN] = [SPMT_IsgecGSTIN4].[GSTID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_BillDetails] AS [TA_BillDetails5]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillGST].[TABillNo] = [TA_BillDetails5].[TABillNo]'
  SET @LGSQL = @LGSQL + '    AND [TA_BillGST].[SerialNo] = [TA_BillDetails5].[SerialNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_Bills] AS [TA_Bills6]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillGST].[TABillNo] = [TA_Bills6].[TABillNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN7]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillGST].[BPID] = [VR_BPGSTIN7].[BPID]'
  SET @LGSQL = @LGSQL + '    AND [TA_BillGST].[SupplierGSTIN] = [VR_BPGSTIN7].[GSTIN]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner8]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillGST].[BPID] = [VR_BusinessPartner8].[BPID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TABillNo' THEN '[TA_BillGST].[TABillNo]'
                        WHEN 'TABillNo DESC' THEN '[TA_BillGST].[TABillNo] DESC'
                        WHEN 'SerialNo' THEN '[TA_BillGST].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[TA_BillGST].[SerialNo] DESC'
                        WHEN 'IsgecGSTIN' THEN '[TA_BillGST].[IsgecGSTIN]'
                        WHEN 'IsgecGSTIN DESC' THEN '[TA_BillGST].[IsgecGSTIN] DESC'
                        WHEN 'BillNumber' THEN '[TA_BillGST].[BillNumber]'
                        WHEN 'BillNumber DESC' THEN '[TA_BillGST].[BillNumber] DESC'
                        WHEN 'BillDate' THEN '[TA_BillGST].[BillDate]'
                        WHEN 'BillDate DESC' THEN '[TA_BillGST].[BillDate] DESC'
                        WHEN 'BPID' THEN '[TA_BillGST].[BPID]'
                        WHEN 'BPID DESC' THEN '[TA_BillGST].[BPID] DESC'
                        WHEN 'SupplierGSTIN' THEN '[TA_BillGST].[SupplierGSTIN]'
                        WHEN 'SupplierGSTIN DESC' THEN '[TA_BillGST].[SupplierGSTIN] DESC'
                        WHEN 'SupplierGSTINNo' THEN '[TA_BillGST].[SupplierGSTINNo]'
                        WHEN 'SupplierGSTINNo DESC' THEN '[TA_BillGST].[SupplierGSTINNo] DESC'
                        WHEN 'StateID' THEN '[TA_BillGST].[StateID]'
                        WHEN 'StateID DESC' THEN '[TA_BillGST].[StateID] DESC'
                        WHEN 'BillType' THEN '[TA_BillGST].[BillType]'
                        WHEN 'BillType DESC' THEN '[TA_BillGST].[BillType] DESC'
                        WHEN 'HSNSACCode' THEN '[TA_BillGST].[HSNSACCode]'
                        WHEN 'HSNSACCode DESC' THEN '[TA_BillGST].[HSNSACCode] DESC'
                        WHEN 'AssessableValue' THEN '[TA_BillGST].[AssessableValue]'
                        WHEN 'AssessableValue DESC' THEN '[TA_BillGST].[AssessableValue] DESC'
                        WHEN 'IGSTRate' THEN '[TA_BillGST].[IGSTRate]'
                        WHEN 'IGSTRate DESC' THEN '[TA_BillGST].[IGSTRate] DESC'
                        WHEN 'IGSTAmount' THEN '[TA_BillGST].[IGSTAmount]'
                        WHEN 'IGSTAmount DESC' THEN '[TA_BillGST].[IGSTAmount] DESC'
                        WHEN 'SGSTRate' THEN '[TA_BillGST].[SGSTRate]'
                        WHEN 'SGSTRate DESC' THEN '[TA_BillGST].[SGSTRate] DESC'
                        WHEN 'SGSTAmount' THEN '[TA_BillGST].[SGSTAmount]'
                        WHEN 'SGSTAmount DESC' THEN '[TA_BillGST].[SGSTAmount] DESC'
                        WHEN 'CGSTRate' THEN '[TA_BillGST].[CGSTRate]'
                        WHEN 'CGSTRate DESC' THEN '[TA_BillGST].[CGSTRate] DESC'
                        WHEN 'CGSTAmount' THEN '[TA_BillGST].[CGSTAmount]'
                        WHEN 'CGSTAmount DESC' THEN '[TA_BillGST].[CGSTAmount] DESC'
                        WHEN 'CessRate' THEN '[TA_BillGST].[CessRate]'
                        WHEN 'CessRate DESC' THEN '[TA_BillGST].[CessRate] DESC'
                        WHEN 'CessAmount' THEN '[TA_BillGST].[CessAmount]'
                        WHEN 'CessAmount DESC' THEN '[TA_BillGST].[CessAmount] DESC'
                        WHEN 'TotalGST' THEN '[TA_BillGST].[TotalGST]'
                        WHEN 'TotalGST DESC' THEN '[TA_BillGST].[TotalGST] DESC'
                        WHEN 'TotalAmount' THEN '[TA_BillGST].[TotalAmount]'
                        WHEN 'TotalAmount DESC' THEN '[TA_BillGST].[TotalAmount] DESC'
                        WHEN 'SPMT_BillTypes1_Description' THEN '[SPMT_BillTypes1].[Description]'
                        WHEN 'SPMT_BillTypes1_Description DESC' THEN '[SPMT_BillTypes1].[Description] DESC'
                        WHEN 'SPMT_ERPStates2_Description' THEN '[SPMT_ERPStates2].[Description]'
                        WHEN 'SPMT_ERPStates2_Description DESC' THEN '[SPMT_ERPStates2].[Description] DESC'
                        WHEN 'SPMT_HSNSACCodes3_HSNSACCode' THEN '[SPMT_HSNSACCodes3].[HSNSACCode]'
                        WHEN 'SPMT_HSNSACCodes3_HSNSACCode DESC' THEN '[SPMT_HSNSACCodes3].[HSNSACCode] DESC'
                        WHEN 'SPMT_IsgecGSTIN4_Description' THEN '[SPMT_IsgecGSTIN4].[Description]'
                        WHEN 'SPMT_IsgecGSTIN4_Description DESC' THEN '[SPMT_IsgecGSTIN4].[Description] DESC'
                        WHEN 'TA_Bills6_PurposeOfJourney' THEN '[TA_Bills6].[PurposeOfJourney]'
                        WHEN 'TA_Bills6_PurposeOfJourney DESC' THEN '[TA_Bills6].[PurposeOfJourney] DESC'
                        WHEN 'VR_BPGSTIN7_Description' THEN '[VR_BPGSTIN7].[Description]'
                        WHEN 'VR_BPGSTIN7_Description DESC' THEN '[VR_BPGSTIN7].[Description] DESC'
                        WHEN 'VR_BusinessPartner8_BPName' THEN '[VR_BusinessPartner8].[BPName]'
                        WHEN 'VR_BusinessPartner8_BPName DESC' THEN '[VR_BusinessPartner8].[BPName] DESC'
                        ELSE '[TA_BillGST].[TABillNo],[TA_BillGST].[SerialNo]'
                    END
  EXEC (@LGSQL)

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
