USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentSizesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,DocumentSizeID NVarChar(2) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DocumentSizeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_DocumentSizes].[DocumentSizeID]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_DocumentSizes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DocumentSizeID' THEN '[IDM_DocumentSizes].[DocumentSizeID]'
                        WHEN 'DocumentSizeID DESC' THEN '[IDM_DocumentSizes].[DocumentSizeID] DESC'
                        WHEN 'Description' THEN '[IDM_DocumentSizes].[Description]'
                        WHEN 'Description DESC' THEN '[IDM_DocumentSizes].[Description] DESC'
                        ELSE '[IDM_DocumentSizes].[DocumentSizeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[IDM_DocumentSizes].[DocumentSizeID] ,
		[IDM_DocumentSizes].[Description]  
  FROM [IDM_DocumentSizes] 
    	INNER JOIN #PageIndex
          ON [IDM_DocumentSizes].[DocumentSizeID] = #PageIndex.DocumentSizeID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
