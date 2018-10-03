USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlIssuedPOItemSelectListFilteres]
  @Filter_SerialNo Int,
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
 ,SerialNo Int NOT NULL
 ,ItemLineNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ', ItemLineNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[EITL_POItemList].[SerialNo]'
  SET @LGSQL = @LGSQL + ', [EITL_POItemList].[ItemLineNo]'
  SET @LGSQL = @LGSQL + ' FROM [EITL_POItemList] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [EITL_POItemList].[ReceivedBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [EITL_MaterialState] AS [EITL_MaterialState2]'
  SET @LGSQL = @LGSQL + '    ON [EITL_POItemList].[MaterialStateID] = [EITL_MaterialState2].[StateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [EITL_PODocumentList] AS [EITL_PODocumentList3]'
  SET @LGSQL = @LGSQL + '    ON [EITL_POItemList].[SerialNo] = [EITL_PODocumentList3].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [EITL_POItemList].[DocumentLineNo] = [EITL_PODocumentList3].[DocumentLineNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [EITL_POItemStatus] AS [EITL_POItemStatus4]'
  SET @LGSQL = @LGSQL + '    ON [EITL_POItemList].[ItemStatusID] = [EITL_POItemStatus4].[StatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [EITL_POList] AS [EITL_POList5]'
  SET @LGSQL = @LGSQL + '    ON [EITL_POItemList].[SerialNo] = [EITL_POList5].[SerialNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [EITL_Units] AS [EITL_Units6]'
  SET @LGSQL = @LGSQL + '    ON [EITL_POItemList].[UOM] = [EITL_Units6].[UnitID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [EITL_POItemList].[SerialNo] = ' + STR(@Filter_SerialNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[EITL_POItemList].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[EITL_POItemList].[SerialNo] DESC'
                        WHEN 'ItemLineNo' THEN '[EITL_POItemList].[ItemLineNo]'
                        WHEN 'ItemLineNo DESC' THEN '[EITL_POItemList].[ItemLineNo] DESC'
                        WHEN 'ItemCode' THEN '[EITL_POItemList].[ItemCode]'
                        WHEN 'ItemCode DESC' THEN '[EITL_POItemList].[ItemCode] DESC'
                        WHEN 'Description' THEN '[EITL_POItemList].[Description]'
                        WHEN 'Description DESC' THEN '[EITL_POItemList].[Description] DESC'
                        WHEN 'UOM' THEN '[EITL_POItemList].[UOM]'
                        WHEN 'UOM DESC' THEN '[EITL_POItemList].[UOM] DESC'
                        WHEN 'Quantity' THEN '[EITL_POItemList].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[EITL_POItemList].[Quantity] DESC'
                        WHEN 'WeightInKG' THEN '[EITL_POItemList].[WeightInKG]'
                        WHEN 'WeightInKG DESC' THEN '[EITL_POItemList].[WeightInKG] DESC'
                        WHEN 'DocumentLineNo' THEN '[EITL_POItemList].[DocumentLineNo]'
                        WHEN 'DocumentLineNo DESC' THEN '[EITL_POItemList].[DocumentLineNo] DESC'
                        WHEN 'ReadyToDespatch' THEN '[EITL_POItemList].[ReadyToDespatch]'
                        WHEN 'ReadyToDespatch DESC' THEN '[EITL_POItemList].[ReadyToDespatch] DESC'
                        WHEN 'Despatched' THEN '[EITL_POItemList].[Despatched]'
                        WHEN 'Despatched DESC' THEN '[EITL_POItemList].[Despatched] DESC'
                        WHEN 'VR_ExecutionNo' THEN '[EITL_POItemList].[VR_ExecutionNo]'
                        WHEN 'VR_ExecutionNo DESC' THEN '[EITL_POItemList].[VR_ExecutionNo] DESC'
                        WHEN 'DespatchDate' THEN '[EITL_POItemList].[DespatchDate]'
                        WHEN 'DespatchDate DESC' THEN '[EITL_POItemList].[DespatchDate] DESC'
                        WHEN 'QuantityReceipt' THEN '[EITL_POItemList].[QuantityReceipt]'
                        WHEN 'QuantityReceipt DESC' THEN '[EITL_POItemList].[QuantityReceipt] DESC'
                        WHEN 'WeightInKGReceipt' THEN '[EITL_POItemList].[WeightInKGReceipt]'
                        WHEN 'WeightInKGReceipt DESC' THEN '[EITL_POItemList].[WeightInKGReceipt] DESC'
                        WHEN 'MaterialStateID' THEN '[EITL_POItemList].[MaterialStateID]'
                        WHEN 'MaterialStateID DESC' THEN '[EITL_POItemList].[MaterialStateID] DESC'
                        WHEN 'ReceivedBy' THEN '[EITL_POItemList].[ReceivedBy]'
                        WHEN 'ReceivedBy DESC' THEN '[EITL_POItemList].[ReceivedBy] DESC'
                        WHEN 'ReceivedOn' THEN '[EITL_POItemList].[ReceivedOn]'
                        WHEN 'ReceivedOn DESC' THEN '[EITL_POItemList].[ReceivedOn] DESC'
                        WHEN 'ItemStatusID' THEN '[EITL_POItemList].[ItemStatusID]'
                        WHEN 'ItemStatusID DESC' THEN '[EITL_POItemList].[ItemStatusID] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'EITL_MaterialState2_Description' THEN '[EITL_MaterialState2].[Description]'
                        WHEN 'EITL_MaterialState2_Description DESC' THEN '[EITL_MaterialState2].[Description] DESC'
                        WHEN 'EITL_PODocumentList3_DocumentID' THEN '[EITL_PODocumentList3].[DocumentID]'
                        WHEN 'EITL_PODocumentList3_DocumentID DESC' THEN '[EITL_PODocumentList3].[DocumentID] DESC'
                        WHEN 'EITL_POItemStatus4_Description' THEN '[EITL_POItemStatus4].[Description]'
                        WHEN 'EITL_POItemStatus4_Description DESC' THEN '[EITL_POItemStatus4].[Description] DESC'
                        WHEN 'EITL_POList5_PONumber' THEN '[EITL_POList5].[PONumber]'
                        WHEN 'EITL_POList5_PONumber DESC' THEN '[EITL_POList5].[PONumber] DESC'
                        WHEN 'EITL_Units6_Description' THEN '[EITL_Units6].[Description]'
                        WHEN 'EITL_Units6_Description DESC' THEN '[EITL_Units6].[Description] DESC'
                        ELSE '[EITL_POItemList].[SerialNo],[EITL_POItemList].[ItemLineNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[EITL_POItemList].[SerialNo] ,
		[EITL_POItemList].[ItemLineNo] ,
		[EITL_POItemList].[ItemCode] ,
		[EITL_POItemList].[Description] ,
		[EITL_POItemList].[UOM] ,
		[EITL_POItemList].[Quantity] ,
		[EITL_POItemList].[WeightInKG] ,
		[EITL_POItemList].[DocumentLineNo] ,
		[EITL_POItemList].[ReadyToDespatch] ,
		[EITL_POItemList].[Despatched] ,
		[EITL_POItemList].[VR_ExecutionNo] ,
		[EITL_POItemList].[DespatchDate] ,
		[EITL_POItemList].[QuantityReceipt] ,
		[EITL_POItemList].[WeightInKGReceipt] ,
		[EITL_POItemList].[MaterialStateID] ,
		[EITL_POItemList].[ReceivedBy] ,
		[EITL_POItemList].[ReceivedOn] ,
		[EITL_POItemList].[ItemStatusID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[EITL_MaterialState2].[Description] AS EITL_MaterialState2_Description,
		[EITL_PODocumentList3].[DocumentID] AS EITL_PODocumentList3_DocumentID,
		[EITL_POItemStatus4].[Description] AS EITL_POItemStatus4_Description,
		[EITL_POList5].[PONumber] AS EITL_POList5_PONumber,
		[EITL_Units6].[Description] AS EITL_Units6_Description 
  FROM [EITL_POItemList] 
    	INNER JOIN #PageIndex
          ON [EITL_POItemList].[SerialNo] = #PageIndex.SerialNo
          AND [EITL_POItemList].[ItemLineNo] = #PageIndex.ItemLineNo
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [EITL_POItemList].[ReceivedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [EITL_MaterialState] AS [EITL_MaterialState2]
    ON [EITL_POItemList].[MaterialStateID] = [EITL_MaterialState2].[StateID]
  LEFT OUTER JOIN [EITL_PODocumentList] AS [EITL_PODocumentList3]
    ON [EITL_POItemList].[SerialNo] = [EITL_PODocumentList3].[SerialNo]
    AND [EITL_POItemList].[DocumentLineNo] = [EITL_PODocumentList3].[DocumentLineNo]
  LEFT OUTER JOIN [EITL_POItemStatus] AS [EITL_POItemStatus4]
    ON [EITL_POItemList].[ItemStatusID] = [EITL_POItemStatus4].[StatusID]
  INNER JOIN [EITL_POList] AS [EITL_POList5]
    ON [EITL_POItemList].[SerialNo] = [EITL_POList5].[SerialNo]
  LEFT OUTER JOIN [EITL_Units] AS [EITL_Units6]
    ON [EITL_POItemList].[UOM] = [EITL_Units6].[UnitID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
