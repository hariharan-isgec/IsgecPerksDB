USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLDetailsSelectListSearch]
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
 ,IRNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (IRNo, SerialNo)
  SELECT [ELOG_IRBLDetails].[IRNo], [ELOG_IRBLDetails].[SerialNo] FROM [ELOG_IRBLDetails]
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
   ( 
         STR(ISNULL([ELOG_IRBLDetails].[IRNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBLDetails].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBLDetails].[StuffingTypeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBLDetails].[StuffingPointID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBLDetails].[ICDCFSID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_IRBLDetails].[OtherICDCFS],'')) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBLDetails].[BreakBulkID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBLDetails].[ChargeTypeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBLDetails].[ChargeCategoryID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBLDetails].[ChargeCodeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBLDetails].[Amount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_IRBLDetails].[Remarks],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'IRNo' THEN [ELOG_IRBLDetails].[IRNo] END,
     CASE @OrderBy WHEN 'IRNo DESC' THEN [ELOG_IRBLDetails].[IRNo] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [ELOG_IRBLDetails].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [ELOG_IRBLDetails].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'StuffingTypeID' THEN [ELOG_IRBLDetails].[StuffingTypeID] END,
     CASE @OrderBy WHEN 'StuffingTypeID DESC' THEN [ELOG_IRBLDetails].[StuffingTypeID] END DESC,
     CASE @OrderBy WHEN 'StuffingPointID' THEN [ELOG_IRBLDetails].[StuffingPointID] END,
     CASE @OrderBy WHEN 'StuffingPointID DESC' THEN [ELOG_IRBLDetails].[StuffingPointID] END DESC,
     CASE @OrderBy WHEN 'ICDCFSID' THEN [ELOG_IRBLDetails].[ICDCFSID] END,
     CASE @OrderBy WHEN 'ICDCFSID DESC' THEN [ELOG_IRBLDetails].[ICDCFSID] END DESC,
     CASE @OrderBy WHEN 'OtherICDCFS' THEN [ELOG_IRBLDetails].[OtherICDCFS] END,
     CASE @OrderBy WHEN 'OtherICDCFS DESC' THEN [ELOG_IRBLDetails].[OtherICDCFS] END DESC,
     CASE @OrderBy WHEN 'BreakBulkID' THEN [ELOG_IRBLDetails].[BreakBulkID] END,
     CASE @OrderBy WHEN 'BreakBulkID DESC' THEN [ELOG_IRBLDetails].[BreakBulkID] END DESC,
     CASE @OrderBy WHEN 'ChargeTypeID' THEN [ELOG_IRBLDetails].[ChargeTypeID] END,
     CASE @OrderBy WHEN 'ChargeTypeID DESC' THEN [ELOG_IRBLDetails].[ChargeTypeID] END DESC,
     CASE @OrderBy WHEN 'ChargeCategoryID' THEN [ELOG_IRBLDetails].[ChargeCategoryID] END,
     CASE @OrderBy WHEN 'ChargeCategoryID DESC' THEN [ELOG_IRBLDetails].[ChargeCategoryID] END DESC,
     CASE @OrderBy WHEN 'ChargeCodeID' THEN [ELOG_IRBLDetails].[ChargeCodeID] END,
     CASE @OrderBy WHEN 'ChargeCodeID DESC' THEN [ELOG_IRBLDetails].[ChargeCodeID] END DESC,
     CASE @OrderBy WHEN 'Amount' THEN [ELOG_IRBLDetails].[Amount] END,
     CASE @OrderBy WHEN 'Amount DESC' THEN [ELOG_IRBLDetails].[Amount] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [ELOG_IRBLDetails].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [ELOG_IRBLDetails].[Remarks] END DESC,
     CASE @OrderBy WHEN 'ELOG_BreakbulkTypes1_Description' THEN [ELOG_BreakbulkTypes1].[Description] END,
     CASE @OrderBy WHEN 'ELOG_BreakbulkTypes1_Description DESC' THEN [ELOG_BreakbulkTypes1].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_ChargeCategories2_Description' THEN [ELOG_ChargeCategories2].[Description] END,
     CASE @OrderBy WHEN 'ELOG_ChargeCategories2_Description DESC' THEN [ELOG_ChargeCategories2].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_ChargeCodes3_Description' THEN [ELOG_ChargeCodes3].[Description] END,
     CASE @OrderBy WHEN 'ELOG_ChargeCodes3_Description DESC' THEN [ELOG_ChargeCodes3].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_ChargeTypes4_Description' THEN [ELOG_ChargeTypes4].[Description] END,
     CASE @OrderBy WHEN 'ELOG_ChargeTypes4_Description DESC' THEN [ELOG_ChargeTypes4].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_ICDCFSs5_Description' THEN [ELOG_ICDCFSs5].[Description] END,
     CASE @OrderBy WHEN 'ELOG_ICDCFSs5_Description DESC' THEN [ELOG_ICDCFSs5].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_IRBL6_SupplierBillNo' THEN [ELOG_IRBL6].[SupplierBillNo] END,
     CASE @OrderBy WHEN 'ELOG_IRBL6_SupplierBillNo DESC' THEN [ELOG_IRBL6].[SupplierBillNo] END DESC,
     CASE @OrderBy WHEN 'ELOG_StuffingPoints7_Description' THEN [ELOG_StuffingPoints7].[Description] END,
     CASE @OrderBy WHEN 'ELOG_StuffingPoints7_Description DESC' THEN [ELOG_StuffingPoints7].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_StuffingTypes8_Description' THEN [ELOG_StuffingTypes8].[Description] END,
     CASE @OrderBy WHEN 'ELOG_StuffingTypes8_Description DESC' THEN [ELOG_StuffingTypes8].[Description] END DESC 

    SET @RecordCount = @@RowCount

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
      INNER JOIN #PageIndex
          ON [ELOG_IRBLDetails].[IRNo] = #PageIndex.IRNo
          AND [ELOG_IRBLDetails].[SerialNo] = #PageIndex.SerialNo
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
