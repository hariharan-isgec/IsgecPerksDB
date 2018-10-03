USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakDocumentsSelectListFilteres]
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
 ,DocumentNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DocumentNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_Documents].[DocumentNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_Documents] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DocumentNo' THEN '[PAK_Documents].[DocumentNo]'
                        WHEN 'DocumentNo DESC' THEN '[PAK_Documents].[DocumentNo] DESC'
                        WHEN 'DocumentID' THEN '[PAK_Documents].[DocumentID]'
                        WHEN 'DocumentID DESC' THEN '[PAK_Documents].[DocumentID] DESC'
                        WHEN 'DocumentRevision' THEN '[PAK_Documents].[DocumentRevision]'
                        WHEN 'DocumentRevision DESC' THEN '[PAK_Documents].[DocumentRevision] DESC'
                        WHEN 'Description' THEN '[PAK_Documents].[Description]'
                        WHEN 'Description DESC' THEN '[PAK_Documents].[Description] DESC'
                        WHEN 'ExternalDocument' THEN '[PAK_Documents].[ExternalDocument]'
                        WHEN 'ExternalDocument DESC' THEN '[PAK_Documents].[ExternalDocument] DESC'
                        WHEN 'Filename' THEN '[PAK_Documents].[Filename]'
                        WHEN 'Filename DESC' THEN '[PAK_Documents].[Filename] DESC'
                        WHEN 'DisskFile' THEN '[PAK_Documents].[DisskFile]'
                        WHEN 'DisskFile DESC' THEN '[PAK_Documents].[DisskFile] DESC'
                        ELSE '[PAK_Documents].[DocumentNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_Documents].*  
  FROM [PAK_Documents] 
      INNER JOIN #PageIndex
          ON [PAK_Documents].[DocumentNo] = #PageIndex.DocumentNo
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
