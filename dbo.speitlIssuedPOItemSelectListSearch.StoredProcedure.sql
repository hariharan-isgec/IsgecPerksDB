USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlIssuedPOItemSelectListSearch]
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
 ,SerialNo Int NOT NULL
 ,ItemLineNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo, ItemLineNo)
  SELECT [EITL_POItemList].[SerialNo], [EITL_POItemList].[ItemLineNo] FROM [EITL_POItemList]
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
   ( 
         STR(ISNULL([EITL_POItemList].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([EITL_POItemList].[ItemLineNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POItemList].[ItemCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POItemList].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POItemList].[UOM],'')) LIKE @KeyWord1
     OR STR(ISNULL([EITL_POItemList].[Quantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([EITL_POItemList].[WeightInKG], 0)) LIKE @KeyWord1
     OR STR(ISNULL([EITL_POItemList].[DocumentLineNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([EITL_POItemList].[VR_ExecutionNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([EITL_POItemList].[QuantityReceipt], 0)) LIKE @KeyWord1
     OR STR(ISNULL([EITL_POItemList].[WeightInKGReceipt], 0)) LIKE @KeyWord1
     OR STR(ISNULL([EITL_POItemList].[MaterialStateID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POItemList].[ReceivedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([EITL_POItemList].[ItemStatusID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [EITL_POItemList].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [EITL_POItemList].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'ItemLineNo' THEN [EITL_POItemList].[ItemLineNo] END,
     CASE @OrderBy WHEN 'ItemLineNo DESC' THEN [EITL_POItemList].[ItemLineNo] END DESC,
     CASE @OrderBy WHEN 'ItemCode' THEN [EITL_POItemList].[ItemCode] END,
     CASE @OrderBy WHEN 'ItemCode DESC' THEN [EITL_POItemList].[ItemCode] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [EITL_POItemList].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [EITL_POItemList].[Description] END DESC,
     CASE @OrderBy WHEN 'UOM' THEN [EITL_POItemList].[UOM] END,
     CASE @OrderBy WHEN 'UOM DESC' THEN [EITL_POItemList].[UOM] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [EITL_POItemList].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [EITL_POItemList].[Quantity] END DESC,
     CASE @OrderBy WHEN 'WeightInKG' THEN [EITL_POItemList].[WeightInKG] END,
     CASE @OrderBy WHEN 'WeightInKG DESC' THEN [EITL_POItemList].[WeightInKG] END DESC,
     CASE @OrderBy WHEN 'DocumentLineNo' THEN [EITL_POItemList].[DocumentLineNo] END,
     CASE @OrderBy WHEN 'DocumentLineNo DESC' THEN [EITL_POItemList].[DocumentLineNo] END DESC,
     CASE @OrderBy WHEN 'ReadyToDespatch' THEN [EITL_POItemList].[ReadyToDespatch] END,
     CASE @OrderBy WHEN 'ReadyToDespatch DESC' THEN [EITL_POItemList].[ReadyToDespatch] END DESC,
     CASE @OrderBy WHEN 'Despatched' THEN [EITL_POItemList].[Despatched] END,
     CASE @OrderBy WHEN 'Despatched DESC' THEN [EITL_POItemList].[Despatched] END DESC,
     CASE @OrderBy WHEN 'VR_ExecutionNo' THEN [EITL_POItemList].[VR_ExecutionNo] END,
     CASE @OrderBy WHEN 'VR_ExecutionNo DESC' THEN [EITL_POItemList].[VR_ExecutionNo] END DESC,
     CASE @OrderBy WHEN 'DespatchDate' THEN [EITL_POItemList].[DespatchDate] END,
     CASE @OrderBy WHEN 'DespatchDate DESC' THEN [EITL_POItemList].[DespatchDate] END DESC,
     CASE @OrderBy WHEN 'QuantityReceipt' THEN [EITL_POItemList].[QuantityReceipt] END,
     CASE @OrderBy WHEN 'QuantityReceipt DESC' THEN [EITL_POItemList].[QuantityReceipt] END DESC,
     CASE @OrderBy WHEN 'WeightInKGReceipt' THEN [EITL_POItemList].[WeightInKGReceipt] END,
     CASE @OrderBy WHEN 'WeightInKGReceipt DESC' THEN [EITL_POItemList].[WeightInKGReceipt] END DESC,
     CASE @OrderBy WHEN 'MaterialStateID' THEN [EITL_POItemList].[MaterialStateID] END,
     CASE @OrderBy WHEN 'MaterialStateID DESC' THEN [EITL_POItemList].[MaterialStateID] END DESC,
     CASE @OrderBy WHEN 'ReceivedBy' THEN [EITL_POItemList].[ReceivedBy] END,
     CASE @OrderBy WHEN 'ReceivedBy DESC' THEN [EITL_POItemList].[ReceivedBy] END DESC,
     CASE @OrderBy WHEN 'ReceivedOn' THEN [EITL_POItemList].[ReceivedOn] END,
     CASE @OrderBy WHEN 'ReceivedOn DESC' THEN [EITL_POItemList].[ReceivedOn] END DESC,
     CASE @OrderBy WHEN 'ItemStatusID' THEN [EITL_POItemList].[ItemStatusID] END,
     CASE @OrderBy WHEN 'ItemStatusID DESC' THEN [EITL_POItemList].[ItemStatusID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'EITL_MaterialState2_Description' THEN [EITL_MaterialState2].[Description] END,
     CASE @OrderBy WHEN 'EITL_MaterialState2_Description DESC' THEN [EITL_MaterialState2].[Description] END DESC,
     CASE @OrderBy WHEN 'EITL_PODocumentList3_DocumentID' THEN [EITL_PODocumentList3].[DocumentID] END,
     CASE @OrderBy WHEN 'EITL_PODocumentList3_DocumentID DESC' THEN [EITL_PODocumentList3].[DocumentID] END DESC,
     CASE @OrderBy WHEN 'EITL_POItemStatus4_Description' THEN [EITL_POItemStatus4].[Description] END,
     CASE @OrderBy WHEN 'EITL_POItemStatus4_Description DESC' THEN [EITL_POItemStatus4].[Description] END DESC,
     CASE @OrderBy WHEN 'EITL_POList5_PONumber' THEN [EITL_POList5].[PONumber] END,
     CASE @OrderBy WHEN 'EITL_POList5_PONumber DESC' THEN [EITL_POList5].[PONumber] END DESC,
     CASE @OrderBy WHEN 'EITL_Units6_Description' THEN [EITL_Units6].[Description] END,
     CASE @OrderBy WHEN 'EITL_Units6_Description DESC' THEN [EITL_Units6].[Description] END DESC 

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
