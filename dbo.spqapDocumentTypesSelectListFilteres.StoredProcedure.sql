USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapDocumentTypesSelectListFilteres]
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
 ,DocumentTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DocumentTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QAP_DocumentTypes].[DocumentTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [QAP_DocumentTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DocumentTypeID' THEN '[QAP_DocumentTypes].[DocumentTypeID]'
                        WHEN 'DocumentTypeID DESC' THEN '[QAP_DocumentTypes].[DocumentTypeID] DESC'
                        WHEN 'DocumentName' THEN '[QAP_DocumentTypes].[DocumentName]'
                        WHEN 'DocumentName DESC' THEN '[QAP_DocumentTypes].[DocumentName] DESC'
                        ELSE '[QAP_DocumentTypes].[DocumentTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QAP_DocumentTypes].[DocumentTypeID] ,
		[QAP_DocumentTypes].[DocumentName]  
  FROM [QAP_DocumentTypes] 
    	INNER JOIN #PageIndex
          ON [QAP_DocumentTypes].[DocumentTypeID] = #PageIndex.DocumentTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
