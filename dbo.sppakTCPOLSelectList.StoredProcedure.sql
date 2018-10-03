USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_POLine].* ,
    [IDM_WBS1].[Description] AS IDM_WBS1_Description,
    [PAK_PO2].[PODescription] AS PAK_PO2_PODescription,
    [PAK_POLineStatus3].[Description] AS PAK_POLineStatus3_Description 
  FROM [PAK_POLine] 
  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS1]
    ON [PAK_POLine].[ItemElement] = [IDM_WBS1].[WBSID]
  INNER JOIN [PAK_PO] AS [PAK_PO2]
    ON [PAK_POLine].[SerialNo] = [PAK_PO2].[SerialNo]
  LEFT OUTER JOIN [PAK_POLineStatus] AS [PAK_POLineStatus3]
    ON [PAK_POLine].[ItemStatusID] = [PAK_POLineStatus3].[ItemStatusID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [PAK_POLine].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [PAK_POLine].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'ItemNo' THEN [PAK_POLine].[ItemNo] END,
     CASE @OrderBy WHEN 'ItemNo DESC' THEN [PAK_POLine].[ItemNo] END DESC,
     CASE @OrderBy WHEN 'ItemCode' THEN [PAK_POLine].[ItemCode] END,
     CASE @OrderBy WHEN 'ItemCode DESC' THEN [PAK_POLine].[ItemCode] END DESC,
     CASE @OrderBy WHEN 'ItemDescription' THEN [PAK_POLine].[ItemDescription] END,
     CASE @OrderBy WHEN 'ItemDescription DESC' THEN [PAK_POLine].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'ItemQuantity' THEN [PAK_POLine].[ItemQuantity] END,
     CASE @OrderBy WHEN 'ItemQuantity DESC' THEN [PAK_POLine].[ItemQuantity] END DESC,
     CASE @OrderBy WHEN 'ItemUnit' THEN [PAK_POLine].[ItemUnit] END,
     CASE @OrderBy WHEN 'ItemUnit DESC' THEN [PAK_POLine].[ItemUnit] END DESC,
     CASE @OrderBy WHEN 'ItemPrice' THEN [PAK_POLine].[ItemPrice] END,
     CASE @OrderBy WHEN 'ItemPrice DESC' THEN [PAK_POLine].[ItemPrice] END DESC,
     CASE @OrderBy WHEN 'ItemAmount' THEN [PAK_POLine].[ItemAmount] END,
     CASE @OrderBy WHEN 'ItemAmount DESC' THEN [PAK_POLine].[ItemAmount] END DESC,
     CASE @OrderBy WHEN 'ItemElement' THEN [PAK_POLine].[ItemElement] END,
     CASE @OrderBy WHEN 'ItemElement DESC' THEN [PAK_POLine].[ItemElement] END DESC,
     CASE @OrderBy WHEN 'ItemStatusID' THEN [PAK_POLine].[ItemStatusID] END,
     CASE @OrderBy WHEN 'ItemStatusID DESC' THEN [PAK_POLine].[ItemStatusID] END DESC,
     CASE @OrderBy WHEN 'IDM_WBS1_Description' THEN [IDM_WBS1].[Description] END,
     CASE @OrderBy WHEN 'IDM_WBS1_Description DESC' THEN [IDM_WBS1].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_PO2_PODescription' THEN [PAK_PO2].[PODescription] END,
     CASE @OrderBy WHEN 'PAK_PO2_PODescription DESC' THEN [PAK_PO2].[PODescription] END DESC,
     CASE @OrderBy WHEN 'PAK_POLineStatus3_Description' THEN [PAK_POLineStatus3].[Description] END,
     CASE @OrderBy WHEN 'PAK_POLineStatus3_Description DESC' THEN [PAK_POLineStatus3].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
