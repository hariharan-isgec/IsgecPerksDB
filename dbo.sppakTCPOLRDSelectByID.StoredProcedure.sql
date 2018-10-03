USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLRDSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int,
  @ItemNo Int,
  @UploadNo Int,
  @DocSerialNo Int 
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
  WHERE
  [PAK_POLineRecDoc].[SerialNo] = @SerialNo
  AND [PAK_POLineRecDoc].[ItemNo] = @ItemNo
  AND [PAK_POLineRecDoc].[UploadNo] = @UploadNo
  AND [PAK_POLineRecDoc].[DocSerialNo] = @DocSerialNo
GO
