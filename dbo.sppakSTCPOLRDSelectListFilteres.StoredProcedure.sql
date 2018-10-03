USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSTCPOLRDSelectListFilteres]
  @Filter_SerialNo Int,
  @Filter_ItemNo Int,
  @Filter_UploadNo Int,
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
 ,ItemNo Int NOT NULL
 ,UploadNo Int NOT NULL
 ,DocSerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ', ItemNo'
  SET @LGSQL = @LGSQL + ', UploadNo'
  SET @LGSQL = @LGSQL + ', DocSerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_POLineRecDoc].[SerialNo]'
  SET @LGSQL = @LGSQL + ', [PAK_POLineRecDoc].[ItemNo]'
  SET @LGSQL = @LGSQL + ', [PAK_POLineRecDoc].[UploadNo]'
  SET @LGSQL = @LGSQL + ', [PAK_POLineRecDoc].[DocSerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_POLineRecDoc] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_PO] AS [PAK_PO1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POLineRecDoc].[SerialNo] = [PAK_PO1].[SerialNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_POLine] AS [PAK_POLine2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POLineRecDoc].[SerialNo] = [PAK_POLine2].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_POLineRecDoc].[ItemNo] = [PAK_POLine2].[ItemNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_POLineRec] AS [PAK_POLineRec3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POLineRecDoc].[SerialNo] = [PAK_POLineRec3].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_POLineRecDoc].[ItemNo] = [PAK_POLineRec3].[ItemNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_POLineRecDoc].[UploadNo] = [PAK_POLineRec3].[UploadNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_POLineRecDoc].[SerialNo] = ' + STR(@Filter_SerialNo)
  IF (@Filter_ItemNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_POLineRecDoc].[ItemNo] = ' + STR(@Filter_ItemNo)
  IF (@Filter_UploadNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_POLineRecDoc].[UploadNo] = ' + STR(@Filter_UploadNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[PAK_POLineRecDoc].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PAK_POLineRecDoc].[SerialNo] DESC'
                        WHEN 'ItemNo' THEN '[PAK_POLineRecDoc].[ItemNo]'
                        WHEN 'ItemNo DESC' THEN '[PAK_POLineRecDoc].[ItemNo] DESC'
                        WHEN 'UploadNo' THEN '[PAK_POLineRecDoc].[UploadNo]'
                        WHEN 'UploadNo DESC' THEN '[PAK_POLineRecDoc].[UploadNo] DESC'
                        WHEN 'DocSerialNo' THEN '[PAK_POLineRecDoc].[DocSerialNo]'
                        WHEN 'DocSerialNo DESC' THEN '[PAK_POLineRecDoc].[DocSerialNo] DESC'
                        WHEN 'DocumentID' THEN '[PAK_POLineRecDoc].[DocumentID]'
                        WHEN 'DocumentID DESC' THEN '[PAK_POLineRecDoc].[DocumentID] DESC'
                        WHEN 'DocumentRev' THEN '[PAK_POLineRecDoc].[DocumentRev]'
                        WHEN 'DocumentRev DESC' THEN '[PAK_POLineRecDoc].[DocumentRev] DESC'
                        WHEN 'DocumentDescription' THEN '[PAK_POLineRecDoc].[DocumentDescription]'
                        WHEN 'DocumentDescription DESC' THEN '[PAK_POLineRecDoc].[DocumentDescription] DESC'
                        WHEN 'RevisionNo' THEN '[PAK_POLineRecDoc].[RevisionNo]'
                        WHEN 'RevisionNo DESC' THEN '[PAK_POLineRecDoc].[RevisionNo] DESC'
                        WHEN 'FileName' THEN '[PAK_POLineRecDoc].[FileName]'
                        WHEN 'FileName DESC' THEN '[PAK_POLineRecDoc].[FileName] DESC'
                        WHEN 'ReceiptNo' THEN '[PAK_POLineRecDoc].[ReceiptNo]'
                        WHEN 'ReceiptNo DESC' THEN '[PAK_POLineRecDoc].[ReceiptNo] DESC'
                        WHEN 'DiskFileName' THEN '[PAK_POLineRecDoc].[DiskFileName]'
                        WHEN 'DiskFileName DESC' THEN '[PAK_POLineRecDoc].[DiskFileName] DESC'
                        WHEN 'PAK_PO1_PODescription' THEN '[PAK_PO1].[PODescription]'
                        WHEN 'PAK_PO1_PODescription DESC' THEN '[PAK_PO1].[PODescription] DESC'
                        WHEN 'PAK_POLine2_ItemCode' THEN '[PAK_POLine2].[ItemCode]'
                        WHEN 'PAK_POLine2_ItemCode DESC' THEN '[PAK_POLine2].[ItemCode] DESC'
                        WHEN 'PAK_POLineRec3_UploadNo' THEN '[PAK_POLineRec3].[UploadNo]'
                        WHEN 'PAK_POLineRec3_UploadNo DESC' THEN '[PAK_POLineRec3].[UploadNo] DESC'
                        ELSE '[PAK_POLineRecDoc].[SerialNo],[PAK_POLineRecDoc].[ItemNo],[PAK_POLineRecDoc].[UploadNo],[PAK_POLineRecDoc].[DocSerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_POLineRecDoc].* ,
    [PAK_PO1].[PODescription] AS PAK_PO1_PODescription,
    [PAK_POLine2].[ItemCode] AS PAK_POLine2_ItemCode,
    [PAK_POLineRec3].[UploadNo] AS PAK_POLineRec3_UploadNo 
  FROM [PAK_POLineRecDoc] 
      INNER JOIN #PageIndex
          ON [PAK_POLineRecDoc].[SerialNo] = #PageIndex.SerialNo
          AND [PAK_POLineRecDoc].[ItemNo] = #PageIndex.ItemNo
          AND [PAK_POLineRecDoc].[UploadNo] = #PageIndex.UploadNo
          AND [PAK_POLineRecDoc].[DocSerialNo] = #PageIndex.DocSerialNo
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
