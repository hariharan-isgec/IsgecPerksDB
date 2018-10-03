USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBillGSTSelectByID]
  @LoginID NVarChar(8),
  @TABillNo Int,
  @SerialNo Int 
  AS
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
  [TA_BillGST].[TABillNo] = @TABillNo
  AND [TA_BillGST].[SerialNo] = @SerialNo
GO
