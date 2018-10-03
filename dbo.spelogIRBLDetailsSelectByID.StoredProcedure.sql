USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLDetailsSelectByID]
  @LoginID NVarChar(8),
  @IRNo Int,
  @SerialNo Int 
  AS
  SELECT
    [ELOG_IRBLDetails].* ,
    [ELOG_BreakbulkTypes1].[Description] AS ELOG_BreakbulkTypes1_Description,
    [ELOG_ChargeCategories2].[Description] AS ELOG_ChargeCategories2_Description,
    [ELOG_ChargeCodes3].[Description] AS ELOG_ChargeCodes3_Description,
    [ELOG_ChargeTypes4].[Description] AS ELOG_ChargeTypes4_Description,
    [ELOG_ICDCFSs5].[Description] AS ELOG_ICDCFSs5_Description,
    [ELOG_IRBL6].[SupplierBillNo] AS ELOG_IRBL6_SupplierBillNo,
    [ELOG_StuffingPoints7].[Description] AS ELOG_StuffingPoints7_Description,
    [ELOG_StuffingTypes8].[Description] AS ELOG_StuffingTypes8_Description 
  FROM [ELOG_IRBLDetails] 
  LEFT OUTER JOIN [ELOG_BreakbulkTypes] AS [ELOG_BreakbulkTypes1]
    ON [ELOG_IRBLDetails].[BreakBulkID] = [ELOG_BreakbulkTypes1].[BreakbulkTypeID]
  LEFT OUTER JOIN [ELOG_ChargeCategories] AS [ELOG_ChargeCategories2]
    ON [ELOG_IRBLDetails].[ChargeCategoryID] = [ELOG_ChargeCategories2].[ChargeCategoryID]
  LEFT OUTER JOIN [ELOG_ChargeCodes] AS [ELOG_ChargeCodes3]
    ON [ELOG_IRBLDetails].[ChargeCategoryID] = [ELOG_ChargeCodes3].[ChargeCategoryID]
    AND [ELOG_IRBLDetails].[ChargeCodeID] = [ELOG_ChargeCodes3].[ChargeCodeID]
  LEFT OUTER JOIN [ELOG_ChargeTypes] AS [ELOG_ChargeTypes4]
    ON [ELOG_IRBLDetails].[ChargeTypeID] = [ELOG_ChargeTypes4].[ChargeTypeID]
  LEFT OUTER JOIN [ELOG_ICDCFSs] AS [ELOG_ICDCFSs5]
    ON [ELOG_IRBLDetails].[ICDCFSID] = [ELOG_ICDCFSs5].[ICDCFSID]
  INNER JOIN [ELOG_IRBL] AS [ELOG_IRBL6]
    ON [ELOG_IRBLDetails].[IRNo] = [ELOG_IRBL6].[IRNo]
  LEFT OUTER JOIN [ELOG_StuffingPoints] AS [ELOG_StuffingPoints7]
    ON [ELOG_IRBLDetails].[StuffingPointID] = [ELOG_StuffingPoints7].[StuffingPointID]
  LEFT OUTER JOIN [ELOG_StuffingTypes] AS [ELOG_StuffingTypes8]
    ON [ELOG_IRBLDetails].[StuffingTypeID] = [ELOG_StuffingTypes8].[StuffingTypeID]
  WHERE
  [ELOG_IRBLDetails].[IRNo] = @IRNo
  AND [ELOG_IRBLDetails].[SerialNo] = @SerialNo
GO
