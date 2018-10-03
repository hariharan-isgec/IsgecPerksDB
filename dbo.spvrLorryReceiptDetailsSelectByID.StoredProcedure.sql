USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLorryReceiptDetailsSelectByID]
  @LoginID NVarChar(8),
  @ProjectID NVarChar(6),
  @MRNNo Int,
  @SerialNo Int 
  AS
  SELECT
    [VR_LorryReceiptDetails].* ,
    [IDM_Projects1].[Description] AS IDM_Projects1_Description,
    [VR_BusinessPartner2].[BPName] AS VR_BusinessPartner2_BPName,
    [VR_LorryReceipts3].[WayBillFormNo] AS VR_LorryReceipts3_WayBillFormNo 
  FROM [VR_LorryReceiptDetails] 
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [VR_LorryReceiptDetails].[ProjectID] = [IDM_Projects1].[ProjectID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner2]
    ON [VR_LorryReceiptDetails].[SupplierID] = [VR_BusinessPartner2].[BPID]
  INNER JOIN [VR_LorryReceipts] AS [VR_LorryReceipts3]
    ON [VR_LorryReceiptDetails].[ProjectID] = [VR_LorryReceipts3].[ProjectID]
    AND [VR_LorryReceiptDetails].[MRNNo] = [VR_LorryReceipts3].[MRNNo]
  WHERE
  [VR_LorryReceiptDetails].[ProjectID] = @ProjectID
  AND [VR_LorryReceiptDetails].[MRNNo] = @MRNNo
  AND [VR_LorryReceiptDetails].[SerialNo] = @SerialNo
GO
