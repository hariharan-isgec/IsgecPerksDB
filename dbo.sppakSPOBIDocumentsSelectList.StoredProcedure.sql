USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSPOBIDocumentsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_POBIDocuments].* ,
    [PAK_PO1].[PODescription] AS PAK_PO1_PODescription,
    [PAK_POBItems2].[ItemDescription] AS PAK_POBItems2_ItemDescription,
    [PAK_POBOM3].[ItemDescription] AS PAK_POBOM3_ItemDescription 
  FROM [PAK_POBIDocuments] 
  INNER JOIN [PAK_PO] AS [PAK_PO1]
    ON [PAK_POBIDocuments].[SerialNo] = [PAK_PO1].[SerialNo]
  INNER JOIN [PAK_POBItems] AS [PAK_POBItems2]
    ON [PAK_POBIDocuments].[SerialNo] = [PAK_POBItems2].[SerialNo]
    AND [PAK_POBIDocuments].[BOMNo] = [PAK_POBItems2].[BOMNo]
    AND [PAK_POBIDocuments].[ItemNo] = [PAK_POBItems2].[ItemNo]
  INNER JOIN [PAK_POBOM] AS [PAK_POBOM3]
    ON [PAK_POBIDocuments].[SerialNo] = [PAK_POBOM3].[SerialNo]
    AND [PAK_POBIDocuments].[BOMNo] = [PAK_POBOM3].[BOMNo]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [PAK_POBIDocuments].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [PAK_POBIDocuments].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'BOMNo' THEN [PAK_POBIDocuments].[BOMNo] END,
     CASE @OrderBy WHEN 'BOMNo DESC' THEN [PAK_POBIDocuments].[BOMNo] END DESC,
     CASE @OrderBy WHEN 'ItemNo' THEN [PAK_POBIDocuments].[ItemNo] END,
     CASE @OrderBy WHEN 'ItemNo DESC' THEN [PAK_POBIDocuments].[ItemNo] END DESC,
     CASE @OrderBy WHEN 'DocNo' THEN [PAK_POBIDocuments].[DocNo] END,
     CASE @OrderBy WHEN 'DocNo DESC' THEN [PAK_POBIDocuments].[DocNo] END DESC,
     CASE @OrderBy WHEN 'DocumentID' THEN [PAK_POBIDocuments].[DocumentID] END,
     CASE @OrderBy WHEN 'DocumentID DESC' THEN [PAK_POBIDocuments].[DocumentID] END DESC,
     CASE @OrderBy WHEN 'DocumentRevision' THEN [PAK_POBIDocuments].[DocumentRevision] END,
     CASE @OrderBy WHEN 'DocumentRevision DESC' THEN [PAK_POBIDocuments].[DocumentRevision] END DESC,
     CASE @OrderBy WHEN 'DocumentName' THEN [PAK_POBIDocuments].[DocumentName] END,
     CASE @OrderBy WHEN 'DocumentName DESC' THEN [PAK_POBIDocuments].[DocumentName] END DESC,
     CASE @OrderBy WHEN 'FileName' THEN [PAK_POBIDocuments].[FileName] END,
     CASE @OrderBy WHEN 'FileName DESC' THEN [PAK_POBIDocuments].[FileName] END DESC,
     CASE @OrderBy WHEN 'DiskFile' THEN [PAK_POBIDocuments].[DiskFile] END,
     CASE @OrderBy WHEN 'DiskFile DESC' THEN [PAK_POBIDocuments].[DiskFile] END DESC,
     CASE @OrderBy WHEN 'CreatedBySupplier' THEN [PAK_POBIDocuments].[CreatedBySupplier] END,
     CASE @OrderBy WHEN 'CreatedBySupplier DESC' THEN [PAK_POBIDocuments].[CreatedBySupplier] END DESC,
     CASE @OrderBy WHEN 'PAK_PO1_PODescription' THEN [PAK_PO1].[PODescription] END,
     CASE @OrderBy WHEN 'PAK_PO1_PODescription DESC' THEN [PAK_PO1].[PODescription] END DESC,
     CASE @OrderBy WHEN 'PAK_POBItems2_ItemDescription' THEN [PAK_POBItems2].[ItemDescription] END,
     CASE @OrderBy WHEN 'PAK_POBItems2_ItemDescription DESC' THEN [PAK_POBItems2].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'PAK_POBOM3_ItemDescription' THEN [PAK_POBOM3].[ItemDescription] END,
     CASE @OrderBy WHEN 'PAK_POBOM3_ItemDescription DESC' THEN [PAK_POBOM3].[ItemDescription] END DESC 
  SET @RecordCount = @@RowCount
GO
