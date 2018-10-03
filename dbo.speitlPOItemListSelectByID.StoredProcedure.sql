USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOItemListSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int,
  @ItemLineNo Int 
  AS
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
  [EITL_POItemList].[SerialNo] = @SerialNo
  AND [EITL_POItemList].[ItemLineNo] = @ItemLineNo
GO
