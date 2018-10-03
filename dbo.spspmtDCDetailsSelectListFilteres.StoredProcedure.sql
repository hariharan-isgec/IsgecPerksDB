USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCDetailsSelectListFilteres]
  @Filter_ChallanID NVarChar(20),
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
 ,ChallanID NVarChar(20) NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ChallanID'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_DCDetails].[ChallanID]'
  SET @LGSQL = @LGSQL + ', [SPMT_DCDetails].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_DCDetails] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCDetails].[BillTypeID] = [SPMT_BillTypes1].[BillType]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_DCHeader] AS [SPMT_DCHeader2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCDetails].[ChallanID] = [SPMT_DCHeader2].[ChallanID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ERPUnits] AS [SPMT_ERPUnits3]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCDetails].[UOM] = [SPMT_ERPUnits3].[UOM]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes4]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCDetails].[BillTypeID] = [SPMT_HSNSACCodes4].[BillType]'
  SET @LGSQL = @LGSQL + '    AND [SPMT_DCDetails].[HSNSACCode] = [SPMT_HSNSACCodes4].[HSNSACCode]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ChallanID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_DCDetails].[ChallanID] = ''' + @Filter_ChallanID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ChallanID' THEN '[SPMT_DCDetails].[ChallanID]'
                        WHEN 'ChallanID DESC' THEN '[SPMT_DCDetails].[ChallanID] DESC'
                        WHEN 'SerialNo' THEN '[SPMT_DCDetails].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[SPMT_DCDetails].[SerialNo] DESC'
                        WHEN 'ItemDescription' THEN '[SPMT_DCDetails].[ItemDescription]'
                        WHEN 'ItemDescription DESC' THEN '[SPMT_DCDetails].[ItemDescription] DESC'
                        WHEN 'BillTypeID' THEN '[SPMT_DCDetails].[BillTypeID]'
                        WHEN 'BillTypeID DESC' THEN '[SPMT_DCDetails].[BillTypeID] DESC'
                        WHEN 'HSNSACCode' THEN '[SPMT_DCDetails].[HSNSACCode]'
                        WHEN 'HSNSACCode DESC' THEN '[SPMT_DCDetails].[HSNSACCode] DESC'
                        WHEN 'UOM' THEN '[SPMT_DCDetails].[UOM]'
                        WHEN 'UOM DESC' THEN '[SPMT_DCDetails].[UOM] DESC'
                        WHEN 'Quantity' THEN '[SPMT_DCDetails].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[SPMT_DCDetails].[Quantity] DESC'
                        WHEN 'Price' THEN '[SPMT_DCDetails].[Price]'
                        WHEN 'Price DESC' THEN '[SPMT_DCDetails].[Price] DESC'
                        WHEN 'AssessableValue' THEN '[SPMT_DCDetails].[AssessableValue]'
                        WHEN 'AssessableValue DESC' THEN '[SPMT_DCDetails].[AssessableValue] DESC'
                        WHEN 'IGSTRate' THEN '[SPMT_DCDetails].[IGSTRate]'
                        WHEN 'IGSTRate DESC' THEN '[SPMT_DCDetails].[IGSTRate] DESC'
                        WHEN 'IGSTAmount' THEN '[SPMT_DCDetails].[IGSTAmount]'
                        WHEN 'IGSTAmount DESC' THEN '[SPMT_DCDetails].[IGSTAmount] DESC'
                        WHEN 'SGSTRate' THEN '[SPMT_DCDetails].[SGSTRate]'
                        WHEN 'SGSTRate DESC' THEN '[SPMT_DCDetails].[SGSTRate] DESC'
                        WHEN 'SGSTAmount' THEN '[SPMT_DCDetails].[SGSTAmount]'
                        WHEN 'SGSTAmount DESC' THEN '[SPMT_DCDetails].[SGSTAmount] DESC'
                        WHEN 'CGSTRate' THEN '[SPMT_DCDetails].[CGSTRate]'
                        WHEN 'CGSTRate DESC' THEN '[SPMT_DCDetails].[CGSTRate] DESC'
                        WHEN 'CGSTAmount' THEN '[SPMT_DCDetails].[CGSTAmount]'
                        WHEN 'CGSTAmount DESC' THEN '[SPMT_DCDetails].[CGSTAmount] DESC'
                        WHEN 'CessRate' THEN '[SPMT_DCDetails].[CessRate]'
                        WHEN 'CessRate DESC' THEN '[SPMT_DCDetails].[CessRate] DESC'
                        WHEN 'CessAmount' THEN '[SPMT_DCDetails].[CessAmount]'
                        WHEN 'CessAmount DESC' THEN '[SPMT_DCDetails].[CessAmount] DESC'
                        WHEN 'TotalGST' THEN '[SPMT_DCDetails].[TotalGST]'
                        WHEN 'TotalGST DESC' THEN '[SPMT_DCDetails].[TotalGST] DESC'
                        WHEN 'TotalAmount' THEN '[SPMT_DCDetails].[TotalAmount]'
                        WHEN 'TotalAmount DESC' THEN '[SPMT_DCDetails].[TotalAmount] DESC'
                        WHEN 'SPMT_BillTypes1_Description' THEN '[SPMT_BillTypes1].[Description]'
                        WHEN 'SPMT_BillTypes1_Description DESC' THEN '[SPMT_BillTypes1].[Description] DESC'
                        WHEN 'SPMT_DCHeader2_Purpose' THEN '[SPMT_DCHeader2].[Purpose]'
                        WHEN 'SPMT_DCHeader2_Purpose DESC' THEN '[SPMT_DCHeader2].[Purpose] DESC'
                        WHEN 'SPMT_ERPUnits3_Description' THEN '[SPMT_ERPUnits3].[Description]'
                        WHEN 'SPMT_ERPUnits3_Description DESC' THEN '[SPMT_ERPUnits3].[Description] DESC'
                        WHEN 'SPMT_HSNSACCodes4_HSNSACCode' THEN '[SPMT_HSNSACCodes4].[HSNSACCode]'
                        WHEN 'SPMT_HSNSACCodes4_HSNSACCode DESC' THEN '[SPMT_HSNSACCodes4].[HSNSACCode] DESC'
                        ELSE '[SPMT_DCDetails].[ChallanID],[SPMT_DCDetails].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SPMT_DCDetails].* ,
    [SPMT_BillTypes1].[Description] AS SPMT_BillTypes1_Description,
    [SPMT_DCHeader2].[Purpose] AS SPMT_DCHeader2_Purpose,
    [SPMT_ERPUnits3].[Description] AS SPMT_ERPUnits3_Description,
    [SPMT_HSNSACCodes4].[HSNSACCode] AS SPMT_HSNSACCodes4_HSNSACCode 
  FROM [SPMT_DCDetails] 
      INNER JOIN #PageIndex
          ON [SPMT_DCDetails].[ChallanID] = #PageIndex.ChallanID
          AND [SPMT_DCDetails].[SerialNo] = #PageIndex.SerialNo
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
