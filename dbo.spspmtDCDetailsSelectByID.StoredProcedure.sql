USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCDetailsSelectByID]
  @LoginID NVarChar(8),
  @ChallanID NVarChar(20),
  @SerialNo Int 
  AS
  SELECT
    [SPMT_DCDetails].* ,
    [SPMT_BillTypes1].[Description] AS SPMT_BillTypes1_Description,
    [SPMT_DCHeader2].[Purpose] AS SPMT_DCHeader2_Purpose,
    [SPMT_ERPUnits3].[Description] AS SPMT_ERPUnits3_Description,
    [SPMT_HSNSACCodes4].[HSNSACCode] AS SPMT_HSNSACCodes4_HSNSACCode 
  FROM [SPMT_DCDetails] 
  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes1]
    ON [SPMT_DCDetails].[BillTypeID] = [SPMT_BillTypes1].[BillType]
  INNER JOIN [SPMT_DCHeader] AS [SPMT_DCHeader2]
    ON [SPMT_DCDetails].[ChallanID] = [SPMT_DCHeader2].[ChallanID]
  LEFT OUTER JOIN [SPMT_ERPUnits] AS [SPMT_ERPUnits3]
    ON [SPMT_DCDetails].[UOM] = [SPMT_ERPUnits3].[UOM]
  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes4]
    ON [SPMT_DCDetails].[BillTypeID] = [SPMT_HSNSACCodes4].[BillType]
    AND [SPMT_DCDetails].[HSNSACCode] = [SPMT_HSNSACCodes4].[HSNSACCode]
  WHERE
  [SPMT_DCDetails].[ChallanID] = @ChallanID
  AND [SPMT_DCDetails].[SerialNo] = @SerialNo
GO
