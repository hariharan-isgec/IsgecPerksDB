USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLDetailsSelectListFilteres]
  @Filter_IRNo Int,
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
 ,IRNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'IRNo'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_IRBLDetails].[IRNo]'
  SET @LGSQL = @LGSQL + ', [ELOG_IRBLDetails].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_IRBLDetails] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_BreakbulkTypes] AS [ELOG_BreakbulkTypes1]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBLDetails].[BreakBulkID] = [ELOG_BreakbulkTypes1].[BreakbulkTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_ChargeCategories] AS [ELOG_ChargeCategories2]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBLDetails].[ChargeCategoryID] = [ELOG_ChargeCategories2].[ChargeCategoryID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_ChargeCodes] AS [ELOG_ChargeCodes3]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBLDetails].[ChargeCategoryID] = [ELOG_ChargeCodes3].[ChargeCategoryID]'
  SET @LGSQL = @LGSQL + '    AND [ELOG_IRBLDetails].[ChargeCodeID] = [ELOG_ChargeCodes3].[ChargeCodeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_ChargeTypes] AS [ELOG_ChargeTypes4]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBLDetails].[ChargeTypeID] = [ELOG_ChargeTypes4].[ChargeTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_ICDCFSs] AS [ELOG_ICDCFSs5]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBLDetails].[ICDCFSID] = [ELOG_ICDCFSs5].[ICDCFSID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ELOG_IRBL] AS [ELOG_IRBL6]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBLDetails].[IRNo] = [ELOG_IRBL6].[IRNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_StuffingPoints] AS [ELOG_StuffingPoints7]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBLDetails].[StuffingPointID] = [ELOG_StuffingPoints7].[StuffingPointID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_StuffingTypes] AS [ELOG_StuffingTypes8]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBLDetails].[StuffingTypeID] = [ELOG_StuffingTypes8].[StuffingTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_IRNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [ELOG_IRBLDetails].[IRNo] = ' + STR(@Filter_IRNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IRNo' THEN '[ELOG_IRBLDetails].[IRNo]'
                        WHEN 'IRNo DESC' THEN '[ELOG_IRBLDetails].[IRNo] DESC'
                        WHEN 'SerialNo' THEN '[ELOG_IRBLDetails].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[ELOG_IRBLDetails].[SerialNo] DESC'
                        WHEN 'StuffingTypeID' THEN '[ELOG_IRBLDetails].[StuffingTypeID]'
                        WHEN 'StuffingTypeID DESC' THEN '[ELOG_IRBLDetails].[StuffingTypeID] DESC'
                        WHEN 'StuffingPointID' THEN '[ELOG_IRBLDetails].[StuffingPointID]'
                        WHEN 'StuffingPointID DESC' THEN '[ELOG_IRBLDetails].[StuffingPointID] DESC'
                        WHEN 'ICDCFSID' THEN '[ELOG_IRBLDetails].[ICDCFSID]'
                        WHEN 'ICDCFSID DESC' THEN '[ELOG_IRBLDetails].[ICDCFSID] DESC'
                        WHEN 'OtherICDCFS' THEN '[ELOG_IRBLDetails].[OtherICDCFS]'
                        WHEN 'OtherICDCFS DESC' THEN '[ELOG_IRBLDetails].[OtherICDCFS] DESC'
                        WHEN 'BreakBulkID' THEN '[ELOG_IRBLDetails].[BreakBulkID]'
                        WHEN 'BreakBulkID DESC' THEN '[ELOG_IRBLDetails].[BreakBulkID] DESC'
                        WHEN 'ChargeTypeID' THEN '[ELOG_IRBLDetails].[ChargeTypeID]'
                        WHEN 'ChargeTypeID DESC' THEN '[ELOG_IRBLDetails].[ChargeTypeID] DESC'
                        WHEN 'ChargeCategoryID' THEN '[ELOG_IRBLDetails].[ChargeCategoryID]'
                        WHEN 'ChargeCategoryID DESC' THEN '[ELOG_IRBLDetails].[ChargeCategoryID] DESC'
                        WHEN 'ChargeCodeID' THEN '[ELOG_IRBLDetails].[ChargeCodeID]'
                        WHEN 'ChargeCodeID DESC' THEN '[ELOG_IRBLDetails].[ChargeCodeID] DESC'
                        WHEN 'Amount' THEN '[ELOG_IRBLDetails].[Amount]'
                        WHEN 'Amount DESC' THEN '[ELOG_IRBLDetails].[Amount] DESC'
                        WHEN 'Remarks' THEN '[ELOG_IRBLDetails].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ELOG_IRBLDetails].[Remarks] DESC'
                        WHEN 'ELOG_BreakbulkTypes1_Description' THEN '[ELOG_BreakbulkTypes1].[Description]'
                        WHEN 'ELOG_BreakbulkTypes1_Description DESC' THEN '[ELOG_BreakbulkTypes1].[Description] DESC'
                        WHEN 'ELOG_ChargeCategories2_Description' THEN '[ELOG_ChargeCategories2].[Description]'
                        WHEN 'ELOG_ChargeCategories2_Description DESC' THEN '[ELOG_ChargeCategories2].[Description] DESC'
                        WHEN 'ELOG_ChargeCodes3_Description' THEN '[ELOG_ChargeCodes3].[Description]'
                        WHEN 'ELOG_ChargeCodes3_Description DESC' THEN '[ELOG_ChargeCodes3].[Description] DESC'
                        WHEN 'ELOG_ChargeTypes4_Description' THEN '[ELOG_ChargeTypes4].[Description]'
                        WHEN 'ELOG_ChargeTypes4_Description DESC' THEN '[ELOG_ChargeTypes4].[Description] DESC'
                        WHEN 'ELOG_ICDCFSs5_Description' THEN '[ELOG_ICDCFSs5].[Description]'
                        WHEN 'ELOG_ICDCFSs5_Description DESC' THEN '[ELOG_ICDCFSs5].[Description] DESC'
                        WHEN 'ELOG_IRBL6_SupplierBillNo' THEN '[ELOG_IRBL6].[SupplierBillNo]'
                        WHEN 'ELOG_IRBL6_SupplierBillNo DESC' THEN '[ELOG_IRBL6].[SupplierBillNo] DESC'
                        WHEN 'ELOG_StuffingPoints7_Description' THEN '[ELOG_StuffingPoints7].[Description]'
                        WHEN 'ELOG_StuffingPoints7_Description DESC' THEN '[ELOG_StuffingPoints7].[Description] DESC'
                        WHEN 'ELOG_StuffingTypes8_Description' THEN '[ELOG_StuffingTypes8].[Description]'
                        WHEN 'ELOG_StuffingTypes8_Description DESC' THEN '[ELOG_StuffingTypes8].[Description] DESC'
                        ELSE '[ELOG_IRBLDetails].[IRNo],[ELOG_IRBLDetails].[SerialNo]'
                    END
  EXEC (@LGSQL)

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
