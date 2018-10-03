USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSTCPOLRDSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_POLineRecDoc].* ,
    [PAK_PO1].[PODescription] AS PAK_PO1_PODescription,
    [PAK_POLine2].[ItemCode] AS PAK_POLine2_ItemCode,
    [PAK_POLineRec3].[UploadNo] AS PAK_POLineRec3_UploadNo 
  FROM [PAK_POLineRecDoc] 
  INNER JOIN [PAK_PO] AS [PAK_PO1]
    ON [PAK_POLineRecDoc].[SerialNo] = [PAK_PO1].[SerialNo]
  INNER JOIN [PAK_POLine] AS [PAK_POLine2]
    ON [PAK_POLineRecDoc].[SerialNo] = [PAK_POLine2].[SerialNo]
    AND [PAK_POLineRecDoc].[ItemNo] = [PAK_POLine2].[ItemNo]
  INNER JOIN [PAK_POLineRec] AS [PAK_POLineRec3]
    ON [PAK_POLineRecDoc].[SerialNo] = [PAK_POLineRec3].[SerialNo]
    AND [PAK_POLineRecDoc].[ItemNo] = [PAK_POLineRec3].[ItemNo]
    AND [PAK_POLineRecDoc].[UploadNo] = [PAK_POLineRec3].[UploadNo]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [PAK_POLineRecDoc].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [PAK_POLineRecDoc].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'ItemNo' THEN [PAK_POLineRecDoc].[ItemNo] END,
     CASE @OrderBy WHEN 'ItemNo DESC' THEN [PAK_POLineRecDoc].[ItemNo] END DESC,
     CASE @OrderBy WHEN 'UploadNo' THEN [PAK_POLineRecDoc].[UploadNo] END,
     CASE @OrderBy WHEN 'UploadNo DESC' THEN [PAK_POLineRecDoc].[UploadNo] END DESC,
     CASE @OrderBy WHEN 'DocSerialNo' THEN [PAK_POLineRecDoc].[DocSerialNo] END,
     CASE @OrderBy WHEN 'DocSerialNo DESC' THEN [PAK_POLineRecDoc].[DocSerialNo] END DESC,
     CASE @OrderBy WHEN 'DocumentID' THEN [PAK_POLineRecDoc].[DocumentID] END,
     CASE @OrderBy WHEN 'DocumentID DESC' THEN [PAK_POLineRecDoc].[DocumentID] END DESC,
     CASE @OrderBy WHEN 'DocumentRev' THEN [PAK_POLineRecDoc].[DocumentRev] END,
     CASE @OrderBy WHEN 'DocumentRev DESC' THEN [PAK_POLineRecDoc].[DocumentRev] END DESC,
     CASE @OrderBy WHEN 'DocumentDescription' THEN [PAK_POLineRecDoc].[DocumentDescription] END,
     CASE @OrderBy WHEN 'DocumentDescription DESC' THEN [PAK_POLineRecDoc].[DocumentDescription] END DESC,
     CASE @OrderBy WHEN 'RevisionNo' THEN [PAK_POLineRecDoc].[RevisionNo] END,
     CASE @OrderBy WHEN 'RevisionNo DESC' THEN [PAK_POLineRecDoc].[RevisionNo] END DESC,
     CASE @OrderBy WHEN 'FileName' THEN [PAK_POLineRecDoc].[FileName] END,
     CASE @OrderBy WHEN 'FileName DESC' THEN [PAK_POLineRecDoc].[FileName] END DESC,
     CASE @OrderBy WHEN 'ReceiptNo' THEN [PAK_POLineRecDoc].[ReceiptNo] END,
     CASE @OrderBy WHEN 'ReceiptNo DESC' THEN [PAK_POLineRecDoc].[ReceiptNo] END DESC,
     CASE @OrderBy WHEN 'DiskFileName' THEN [PAK_POLineRecDoc].[DiskFileName] END,
     CASE @OrderBy WHEN 'DiskFileName DESC' THEN [PAK_POLineRecDoc].[DiskFileName] END DESC,
     CASE @OrderBy WHEN 'PAK_PO1_PODescription' THEN [PAK_PO1].[PODescription] END,
     CASE @OrderBy WHEN 'PAK_PO1_PODescription DESC' THEN [PAK_PO1].[PODescription] END DESC,
     CASE @OrderBy WHEN 'PAK_POLine2_ItemCode' THEN [PAK_POLine2].[ItemCode] END,
     CASE @OrderBy WHEN 'PAK_POLine2_ItemCode DESC' THEN [PAK_POLine2].[ItemCode] END DESC,
     CASE @OrderBy WHEN 'PAK_POLineRec3_UploadNo' THEN [PAK_POLineRec3].[UploadNo] END,
     CASE @OrderBy WHEN 'PAK_POLineRec3_UploadNo DESC' THEN [PAK_POLineRec3].[UploadNo] END DESC 
  SET @RecordCount = @@RowCount
GO
