USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSPOBIDocumentsSelectListFilteres]
  @Filter_SerialNo Int,
  @Filter_BOMNo Int,
  @Filter_ItemNo Int,
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
 ,BOMNo Int NOT NULL
 ,ItemNo Int NOT NULL
 ,DocNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ', BOMNo'
  SET @LGSQL = @LGSQL + ', ItemNo'
  SET @LGSQL = @LGSQL + ', DocNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_POBIDocuments].[SerialNo]'
  SET @LGSQL = @LGSQL + ', [PAK_POBIDocuments].[BOMNo]'
  SET @LGSQL = @LGSQL + ', [PAK_POBIDocuments].[ItemNo]'
  SET @LGSQL = @LGSQL + ', [PAK_POBIDocuments].[DocNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_POBIDocuments] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_PO] AS [PAK_PO1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBIDocuments].[SerialNo] = [PAK_PO1].[SerialNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_POBItems] AS [PAK_POBItems2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBIDocuments].[SerialNo] = [PAK_POBItems2].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_POBIDocuments].[BOMNo] = [PAK_POBItems2].[BOMNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_POBIDocuments].[ItemNo] = [PAK_POBItems2].[ItemNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_POBOM] AS [PAK_POBOM3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_POBIDocuments].[SerialNo] = [PAK_POBOM3].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_POBIDocuments].[BOMNo] = [PAK_POBOM3].[BOMNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_POBIDocuments].[SerialNo] = ' + STR(@Filter_SerialNo)
  IF (@Filter_BOMNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_POBIDocuments].[BOMNo] = ' + STR(@Filter_BOMNo)
  IF (@Filter_ItemNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_POBIDocuments].[ItemNo] = ' + STR(@Filter_ItemNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[PAK_POBIDocuments].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PAK_POBIDocuments].[SerialNo] DESC'
                        WHEN 'BOMNo' THEN '[PAK_POBIDocuments].[BOMNo]'
                        WHEN 'BOMNo DESC' THEN '[PAK_POBIDocuments].[BOMNo] DESC'
                        WHEN 'ItemNo' THEN '[PAK_POBIDocuments].[ItemNo]'
                        WHEN 'ItemNo DESC' THEN '[PAK_POBIDocuments].[ItemNo] DESC'
                        WHEN 'DocNo' THEN '[PAK_POBIDocuments].[DocNo]'
                        WHEN 'DocNo DESC' THEN '[PAK_POBIDocuments].[DocNo] DESC'
                        WHEN 'DocumentID' THEN '[PAK_POBIDocuments].[DocumentID]'
                        WHEN 'DocumentID DESC' THEN '[PAK_POBIDocuments].[DocumentID] DESC'
                        WHEN 'DocumentRevision' THEN '[PAK_POBIDocuments].[DocumentRevision]'
                        WHEN 'DocumentRevision DESC' THEN '[PAK_POBIDocuments].[DocumentRevision] DESC'
                        WHEN 'DocumentName' THEN '[PAK_POBIDocuments].[DocumentName]'
                        WHEN 'DocumentName DESC' THEN '[PAK_POBIDocuments].[DocumentName] DESC'
                        WHEN 'FileName' THEN '[PAK_POBIDocuments].[FileName]'
                        WHEN 'FileName DESC' THEN '[PAK_POBIDocuments].[FileName] DESC'
                        WHEN 'DiskFile' THEN '[PAK_POBIDocuments].[DiskFile]'
                        WHEN 'DiskFile DESC' THEN '[PAK_POBIDocuments].[DiskFile] DESC'
                        WHEN 'CreatedBySupplier' THEN '[PAK_POBIDocuments].[CreatedBySupplier]'
                        WHEN 'CreatedBySupplier DESC' THEN '[PAK_POBIDocuments].[CreatedBySupplier] DESC'
                        WHEN 'PAK_PO1_PODescription' THEN '[PAK_PO1].[PODescription]'
                        WHEN 'PAK_PO1_PODescription DESC' THEN '[PAK_PO1].[PODescription] DESC'
                        WHEN 'PAK_POBItems2_ItemDescription' THEN '[PAK_POBItems2].[ItemDescription]'
                        WHEN 'PAK_POBItems2_ItemDescription DESC' THEN '[PAK_POBItems2].[ItemDescription] DESC'
                        WHEN 'PAK_POBOM3_ItemDescription' THEN '[PAK_POBOM3].[ItemDescription]'
                        WHEN 'PAK_POBOM3_ItemDescription DESC' THEN '[PAK_POBOM3].[ItemDescription] DESC'
                        ELSE '[PAK_POBIDocuments].[SerialNo],[PAK_POBIDocuments].[BOMNo],[PAK_POBIDocuments].[ItemNo],[PAK_POBIDocuments].[DocNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_POBIDocuments].* ,
    [PAK_PO1].[PODescription] AS PAK_PO1_PODescription,
    [PAK_POBItems2].[ItemDescription] AS PAK_POBItems2_ItemDescription,
    [PAK_POBOM3].[ItemDescription] AS PAK_POBOM3_ItemDescription 
  FROM [PAK_POBIDocuments] 
      INNER JOIN #PageIndex
          ON [PAK_POBIDocuments].[SerialNo] = #PageIndex.SerialNo
          AND [PAK_POBIDocuments].[BOMNo] = #PageIndex.BOMNo
          AND [PAK_POBIDocuments].[ItemNo] = #PageIndex.ItemNo
          AND [PAK_POBIDocuments].[DocNo] = #PageIndex.DocNo
  INNER JOIN [PAK_PO] AS [PAK_PO1]
    ON [PAK_POBIDocuments].[SerialNo] = [PAK_PO1].[SerialNo]
  INNER JOIN [PAK_POBItems] AS [PAK_POBItems2]
    ON [PAK_POBIDocuments].[SerialNo] = [PAK_POBItems2].[SerialNo]
    AND [PAK_POBIDocuments].[BOMNo] = [PAK_POBItems2].[BOMNo]
    AND [PAK_POBIDocuments].[ItemNo] = [PAK_POBItems2].[ItemNo]
  INNER JOIN [PAK_POBOM] AS [PAK_POBOM3]
    ON [PAK_POBIDocuments].[SerialNo] = [PAK_POBOM3].[SerialNo]
    AND [PAK_POBIDocuments].[BOMNo] = [PAK_POBOM3].[BOMNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
